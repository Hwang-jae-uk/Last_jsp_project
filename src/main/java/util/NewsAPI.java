package util;

import org.jsoup.HttpStatusException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
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
        Document doc;
        List<HashMap<String, String>> newsList = new ArrayList<>();
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
}