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
	window.open("https://www.saramin.co.kr/zf_user/search?searchType=search&searchword=%EC%84%9C%EB%B9%84%EC%8A%A4+%EB%B0%8F+%ED%8C%90%EB%A7%A4%EC%97%85&company_cd=0%2C1%2C2%2C3%2C4%2C5%2C6%2C7%2C9%2C10&loc_mcd=104000%2C111000&panel_type=&search_optional_item=y&search_done=y&panel_count=y&preview=y");
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