
// 
function search() { 
    var textBox1=document.getElementById('search_job').value;
    var textBox2=document.getElementById('search_location').value;
	window.open("https://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=search&searchword="
	+encodeURIComponent(textBox1+textBox2));
} 