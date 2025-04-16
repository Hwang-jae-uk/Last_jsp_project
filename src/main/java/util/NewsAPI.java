package util;

import com.google.gson.Gson;
import org.jsoup.HttpStatusException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import weather.Item;
import weather.Root;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class NewsAPI {
    private String section;

    public NewsAPI() {
    }

    public NewsAPI(String section) {
        this.section = section;
    }

    public List<HashMap<String,String>> newsList(int i) throws IOException, HttpStatusException {
        String url = "https://news.naver.com/"
                + (section == null ? "" : "breakingnews/" )
                + "section/105/" + (section == null ? "" : section);
        List<HashMap<String, String>> newsList = new ArrayList<>();
        Document doc;
        doc = Jsoup.connect(url).get();

        Elements articles = doc.select(".sa_list").select("li");
        Element thumb, content;
        int counter = 0;
        for (Element article : articles) {
            if (counter >= i) break;
            try {
                HashMap<String, String> map = new HashMap<>();

                thumb = article.select(".sa_thumb_inner").getFirst();
                map.put("link", thumb.getElementsByTag("a").attr("href"));
                map.put("img", thumb.select("img").attr("data-src"));

                content = article.getElementsByClass("sa_text").getFirst();
                map.put("title", content.select("a").getFirst().text());
                map.put("press", content.getElementsByClass("sa_text_press").text());

                Document doc2 = Jsoup.connect(map.get("link")).get();
                map.put("o_link", doc2.getElementsByAttributeValue("data-clk", "are.ori").attr("href"));
                map.put("date", doc2.getElementsByAttribute("data-date-time").attr("data-date-time").substring(5, 16));
                map.put("p_link", doc2.getElementById("ct").select("a").getFirst().attr("href"));
                newsList.add(map);
                counter++;
            } catch (Exception ignored) {
            }
        }
        return newsList;
    }
    public List<weather.Item> weather() throws IOException, NullPointerException {
        LocalDateTime now = LocalDateTime.now();
        // 날짜 포맷: yyyyMMdd
        String baseDate = now.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        // 시간 포맷: HH00 (정시)
        String baseTime = now.format(DateTimeFormatter.ofPattern("HH")) + "00";

        baseTime = String.valueOf(Integer.parseInt(baseTime)-100);

        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst"); /*URL*/
        urlBuilder.append("?").append(URLEncoder.encode("serviceKey", "UTF-8")).append("=7A%2Fkol6QOz7jdmu7b3D2DE3mAV3KtguRlCUtSzJua%2FSaDYgzopHzx4NszovzTawflMpXdGtMHY6BsxFkkmgvXw%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8")); /*요청자료형식(XML/JSON) Default: XML*/
        urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(baseDate, "UTF-8")); /*‘21년 6월 28일 발표*/
        urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode(baseTime, "UTF-8")); /*06시 발표(정시단위) */
        urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode("98", "UTF-8")); /*예보지점의 X 좌표값*/
        urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode("76", "UTF-8")); /*예보지점의 Y 좌표값*/

        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn;

        try {
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-type", "application/json");
            BufferedReader rd;

            if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
            } else {
                rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
            }

            StringBuilder sb = new StringBuilder();
            String line;

            while ((line = rd.readLine()) != null) {sb.append(line);}
            rd.close();
            conn.disconnect();

            Gson gson = new Gson();
            Root root = gson.fromJson(sb.toString(), Root.class);

            List<Item> items = root.response.body.items.item;
            List<Item> filtered = items.stream().filter(item -> item.getCategory().equals("PTY") || item.getCategory().equals("T1H") || item.getCategory().equals("WSD") || item.getCategory().equals("REH")).toList();
            return filtered;
        } catch (Exception ignored) {
            return null;
        }
    }
}