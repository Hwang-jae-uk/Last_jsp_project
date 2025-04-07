package news;

import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import dto.NewsDTO;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.Element;

public class NewsAPI {
    public List<NewsDTO> getNews() {
        List<NewsDTO> NewsList = new ArrayList<>();
        try {

            String urlString = "https://news.daum.net/tech";
            URL url = new URL(urlString);
            InputStream inputStream = url.openStream();

            // 2. XML 파싱 준비
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document doc = builder.parse(inputStream);
            NewsDTO dto = null;

            doc.getDocumentElement().normalize();
            Element article = doc.getElementById("article");
            Node node = article.getAttributeNode(".list_newsheadline2");
            NodeList nodeList = node.getChildNodes();


            for (int i = 0; i < nodeList.getLength(); i++) {
                Element element = (Element) nodeList.item(i);
                dto = new NewsDTO();
                dto.setNo(i + 1);
                dto.setName(element.getAttribute("name"));
                dto.setTitle(element.getAttribute("title"));
                dto.setContents(element.getAttribute("contents"));
                dto.setImg(element.getAttribute("img"));
                dto.setRegistDt(element.getAttribute("registDt"));
                NewsList.add(dto);
            }
            inputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return NewsList;
    }
}