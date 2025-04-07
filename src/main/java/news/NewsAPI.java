package news;

import dto.NewsDTO;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import java.util.*;

public class NewsAPI {

    public List<NewsDTO> getNews(String theme) {
        List<NewsDTO> newsList = new ArrayList<>();
        String url = "https://news.daum.net/"+theme;
        try {
            Document doc = Jsoup.connect(url).get();
            Elements list = doc.getElementsByClass(".list_newsheadline2 li");

            for (int i = 0; i <= list.size(); i++) {
                NewsDTO dto = new NewsDTO();
                dto.setTitle(list.get(i).getElementsByClass("tit_txt").text());
                dto.setLink(list.get(i).getElementsByTag("a").attr("href"));
                dto.setName(list.get(i).getElementsByClass("txt_info").text());

                newsList.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();  // 예외 발생 시 출력
        }
        return newsList;
    }
}