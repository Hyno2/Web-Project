package com.javalex.ex.Crawling;

public class CompanyDTO {
	private String title;
    private String company;
    private String date;
    private String condition;
    private String update;
    private String companyurl;

// 생성자
public CompanyDTO(String title, String company, String date, String condition, String update, String companyurl) {
    this.title = title;
    this.company = company;
    this.date = date;
    this.condition = condition;
    this.update = update;
    this.companyurl = companyurl;
}
// getter setter

public String getTitle() {
	return title;
}

public void setTitle(String title) {
	this.title = title;
}

public String getCompany() {
	return company;
}

public void setCompany(String company) {
	this.company = company;
}

public String getDate() {
	return date;
}

public void setDate(String date) {
	this.date = date;
}

public String getCondition() {
	return condition;
}

public void setCondition(String condition) {
	this.condition = condition;
}

public String getUpdate() {
	return update;
}

public void setUpdate(String update) {
	this.update = update;
}

public String getCompanyurl() {
	return companyurl;
}

public void setCompanyurl(String companyurl) {
	this.companyurl = companyurl;
}



}