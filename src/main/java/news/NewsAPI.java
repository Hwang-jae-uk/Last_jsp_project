package news;

import dto.NewsDTO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class NewsAPI {
    public List<NewsDTO> selectNews() {
        List<NewsDTO> newsList = new ArrayList<>();
        try {
            String url = "https://news.daum.net/tech";
            Document doc = Jsoup.connect(url).get();
            Elements articles = doc.select(".list_news2 li"); // 대충 다움 뉴스의 리스트 선택자 예시

            int no = 1;
            for (Element article : articles) {
                NewsDTO dto = new NewsDTO();
                dto.setNo(no++);
                String link = article.selectFirst("a").attr("href");

                dto.setContents(link); // 링크 주소를 콘텐츠로

                newsList.add(dto);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return newsList;
    }
}
