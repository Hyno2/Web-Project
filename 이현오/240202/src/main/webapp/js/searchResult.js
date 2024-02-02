/**
 * File Name: searchResult.js
 */
// index 상단 검색하기 
function search() { 
    var textBox=document.getElementById('search_result').value;
	window.open("https://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=search&searchword="
	+encodeURIComponent(textBox));
} 

// index 서비스 및 판매업 지원하기 버튼
function serviceAndSellSearch(){
	window.open("https://www.saramin.co.kr/zf_user/search?keydownAccess=&searchType=search&searchword=서비스+및+판매업&panel_type=&search_optional_item=y&search_done=y&panel_count=y&preview=y");
}

// index 제조 및 건설업 지원하기 버튼
function manufactAndconstructSearch(){
	window.open("https://www.saramin.co.kr/zf_user/search?keydownAccess=&searchType=search&searchword=제조+및+건설업&panel_type=&search_optional_item=y&search_done=y&panel_count=y&preview=y");
}

// index 사무 및 전문직 지원하기 버튼
function officeAndproSearch(){
	window.open("https://www.saramin.co.kr/zf_user/search?keydownAccess=&searchType=search&searchword=사무+및+전문직&panel_type=&search_optional_item=y&search_done=y&panel_count=y&preview=y");
}

// index 교육 및 의료업 지원하기 버튼
function eduAndmediSearch(){
	window.open("https://www.saramin.co.kr/zf_user/search?keydownAccess=&searchType=search&searchword=교육+및+의료업&panel_type=&search_optional_item=y&search_done=y&panel_count=y&preview=y");
}