/*---------------------------------------------------------------------
File Name: CorpimfoCrawl.java
---------------------------------------------------------------------*/

package com.javalex.ex.Crawling;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.io.BufferedWriter;
import java.io.FileWriter;

import java.util.ArrayList;
import java.util.List;

public class CorpImfoCrawl extends Corporation {

public CorpImfoCrawl(int number, String corpName, String postingUrl) {
    super(number, corpName, postingUrl);
}

public static void main(String[] args) {
    CorpImfoCrawl.crawlAndSaveData();
}

public static void crawlAndSaveData() {
	// 크롤링할 웹	URL
    String url = "https://www.saramin.co.kr/zf_user/jobs/list/domestic?loc_mcd=111000%2C104000&panel_type=&search_optional_item=n&search_done=y&panel_count=y&preview=y";
    String saraminUrl="https://www.saramin.co.kr";
    
// 필요없는 이미지를 거르기 위해 16개 / 실제로 저장하는 이미지는 8개
    int imageCount = 16;
    int saveCorpName = 8;
    int count = 0;
// 가져온 결과를 저장할 리스트
    List<Corporation> saraminCrawlCorp = new ArrayList<>();

	try {
		// 웹 페이지를 가져옴
		Document doc = Jsoup.connect(url).get();
		// ul 태그의 list_product.list_grand 선택자
		Elements title = doc.select("#grand_container > div:nth-child(2) > ul");
//        System.out.println(title);
        
        Elements postingUrls = title.select("a");
        
		 //span 태그 class="corp"
		Elements corpNames = doc.select("ul.list_product.list_grand span.corp");
		
		// title 아래 img 태그 선택            
        Elements imgElements = title.select("img");
                                          
        for (int i = 0; i < Math.min(saveCorpName, postingUrls.size()); i++) {
            Element postingUrl = postingUrls.get(i);
            String Url = saraminUrl+postingUrl.attr("href");
            String corpName = i < corpNames.size() ? corpNames.get(i).text() : "";
            System.out.println(Url);
            System.out.println(corpName);

            saraminCrawlCorp.add(new CorpImfoCrawl(count++, corpName, Url));
            if (saveCorpName == count) {
                break;
            }
        }

        List<String> imgUrls = new ArrayList<>();

        for (int i = 0; i < Math.min(imageCount, imgElements.size()); i++) {
	// img 태그 선택
            Element imgElement = imgElements.get(i);
	// 이미지 태그의 src 속성을 가져옴
            String imgUrl = imgElement.attr("src");

	// 이미지의 절대 경로를 구성
            String absoluteImgUrl = imgUrl.startsWith("http") ? imgUrl : url + imgUrl;
//            System.out.println(absoluteImgUrl);
            
            //필요없는 이미지 저장안함
            if (!absoluteImgUrl.equals("https://www.saramin.co.kr/zf_user/jobs/list/domestic?loc_mcd=111000%2C104000&panel_type=&search_optional_item=n&search_done=y&panel_count=y&preview=y//www.saraminimage.co.kr/common/bul_sri_star.png")) {
	    // 이미지 다운로드 및 파일에 저장
                
                imgUrls.add(absoluteImgUrl);
                saveCropNameToCSV(saraminCrawlCorp, imgUrls, "D:\\work_jsp\\web_project\\src\\main\\webapp\\CSV\\CorpName.csv");
            }
        }          
    } catch (IOException e) {
        e.printStackTrace();
    }
}

private static void saveCropNameToCSV(List<Corporation> corpList, List<String> imgUrls, String filePath) {
    try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
        writer.write("number,corpName,postingUrl,imgUrl\n");

        for (int i = 0; i < corpList.size(); i++) {
            Corporation corporation = corpList.get(i);
            String imgUrl = i < imgUrls.size() ? imgUrls.get(i) : "";
            String line = String.format("%d,%s,%s,%s\n", corporation.getNumber(), corporation.getCorpName(), corporation.getCorpUrl(), imgUrl);
            writer.write(line);
        }
    } catch (IOException e) {
        e.printStackTrace();
    }
}
}
