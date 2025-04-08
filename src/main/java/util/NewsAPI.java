package util;

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
        this.section = "105";
    }

    public NewsAPI(String section) {
        if (section == null) this.section = "105";
        else this.section = section;
    }

    public List<HashMap<String,String>> newsList() throws IOException {
        String url = "https://news.naver.com/section/" + section;
        Document doc;

        doc = Jsoup.connect(url).get();

        Elements articles = doc.getElementsByClass("sa_list").first().getElementsByTag("li");

        List<HashMap<String,String>> newsList = new ArrayList<>();
        Element thumb, content;

        for (Element article : articles) {
            HashMap<String,String> map = new HashMap<>();

            thumb = article.getElementsByClass("sa_thumb_inner").first();
            map.put("link",thumb.getElementsByTag("a").attr("href"));
            map.put("img",thumb.getElementsByTag("img").attr("src"));

            content = article.getElementsByClass("sa_text").first();
            map.put("title",content.getElementsByTag("a").first().text());
            map.put("press",content.getElementsByClass("sa_text_press").text());

            Document doc2 = Jsoup.connect(map.get("link")).get();
            map.put("o_link",doc2.getElementsByAttributeValue("data-clk","are.ori").attr("href"));
            map.put("date",doc2.getElementsByAttribute("data-date-time").attr("data-date-time").substring(5,16));
            newsList.add(map);
        }
        return newsList;
    }
}