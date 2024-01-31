/**
 * File Name: searchResult.js
 */

function search() { 
    var textBox=document.getElementById('search_result').value;
	location.href="https://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=search&searchword="
	+encodeURIComponent(textBox);
} 
