/*---------------------------------------------------------------------
    File Name: lodaCSVData.js
---------------------------------------------------------------------*/

function loadCSV(callback) {	
	
    d3.csv("./CSV/CorpName.csv?random=" + Math.random()).then(function(data) {
        //console.log(data);
        callback(data);
    }).catch(function(error) {
        // 오류 처리
        console.error('Error reading CSV:', error);
    });
}

function firstRowSelectReceiveId(data , idSelector) {
    var element = d3.select(idSelector);
	var row = data[0]; // CSV 파일에서 가져온 텍스트
    
    if (element.attr('id') === 'postingFirstLink') {
        var value1 = row.postingUrl;
        element.attr('href', value1); 
    } else if(element.attr('id') === 'firstCorpImage' ){
		var imagePath = row.imgUrl;
		element.attr('src', imagePath);
	} else if(element.attr('id') === 'firstCorpName'){
		var text = row.corpName;
		element.text(text);
		
	}    
}

function secondRowSelectReceiveId(data , idSelector) {
    var element = d3.select(idSelector);
	var row = data[1]; // CSV 파일에서 가져온 텍스트
    
    if (element.attr('id') === 'postingSecondLink') {
        var value1 = row.postingUrl;
        element.attr('href', value1); 
    } else if(element.attr('id') === 'secondCorpImage' ){
		var imagePath = row.imgUrl;
		element.attr('src', imagePath);
	} else if(element.attr('id') === 'secondCorpName'){
		var text = row.corpName;
		element.text(text);
		
	}    
}

function thirdRowSelectReceiveId(data , idSelector) {
    var element = d3.select(idSelector);
	var row = data[2]; // CSV 파일에서 가져온 텍스트
    
    if (element.attr('id') === 'postingThirdLink') {
        var value1 = row.postingUrl;
        element.attr('href', value1); 
    } else if(element.attr('id') === 'thirdCorpImage' ){
		var imagePath = row.imgUrl;
		element.attr('src', imagePath);
	} else if(element.attr('id') === 'thirdCorpName'){
		var text = row.corpName;
		element.text(text);
		
	}    
}

function fourthRowSelectReceiveId(data , idSelector) {
    var element = d3.select(idSelector);
	var row = data[3]; // CSV 파일에서 가져온 텍스트
    
    if (element.attr('id') === 'postingFourthLink') {
        var value1 = row.postingUrl;
        element.attr('href', value1); 
    } else if(element.attr('id') === 'fourthCorpImage' ){
		var imagePath = row.imgUrl;
		element.attr('src', imagePath);
	} else if(element.attr('id') === 'fourthCorpName'){
		var text = row.corpName;
		element.text(text);
		
	}    
}

function fifthRowSelectReceiveId(data , idSelector) {
    var element = d3.select(idSelector);
	var row = data[4]; // CSV 파일에서 가져온 텍스트
    
    if (element.attr('id') === 'postingFifthLink') {
        var value1 = row.postingUrl;
        element.attr('href', value1); 
    } else if(element.attr('id') === 'fifthCorpImage' ){
		var imagePath = row.imgUrl;
		element.attr('src', imagePath);
	} else if(element.attr('id') === 'fifthCorpName'){
		var text = row.corpName;
		element.text(text);
		
	}    
}

function sixthRowSelectReceiveId(data , idSelector) {
    var element = d3.select(idSelector);
	var row = data[5]; // CSV 파일에서 가져온 텍스트
    
    if (element.attr('id') === 'postingSixthLink') {
        var value1 = row.postingUrl;
        element.attr('href', value1); 
    } else if(element.attr('id') === 'sixthCorpImage' ){
		var imagePath = row.imgUrl;
		element.attr('src', imagePath);
	} else if(element.attr('id') === 'sixthCorpName'){
		var text = row.corpName;
		element.text(text);
		
	}    
}

function seventhRowSelectReceiveId(data , idSelector) {
    var element = d3.select(idSelector);
	var row = data[6]; // CSV 파일에서 가져온 텍스트
    
    if (element.attr('id') === 'postingSeventhLink') {
        var value1 = row.postingUrl;
        element.attr('href', value1); 
    } else if(element.attr('id') === 'seventhCorpImage' ){
		var imagePath = row.imgUrl;
		element.attr('src', imagePath);
	} else if(element.attr('id') === 'seventhCorpName'){
		var text = row.corpName;
		element.text(text);
		
	}    
}

function eighthRowSelectReceiveId(data , idSelector) {
    var element = d3.select(idSelector);
	var row = data[7]; // CSV 파일에서 가져온 텍스트
    
    if (element.attr('id') === 'eighthRowSelectReceiveId') {
        var value1 = row.postingUrl;
        element.attr('href', value1); 
    } else if(element.attr('id') === 'eighthCorpImage' ){
		var imagePath = row.imgUrl;
		element.attr('src', imagePath);
	} else if(element.attr('id') === 'eighthCorpName'){
		var text = row.corpName;
		element.text(text);
		
	}    
}