/*---------------------------------------------------------------------
    File Name: Corporation.java
---------------------------------------------------------------------*/

package com.javalex.ex.Crawling;

public class Corporation {
	private int number;
	private String corpName;
	private String postingUrl;
	
	
	public Corporation(int number, String corpName, String postingUrl) {
        this.number = number;
        this.corpName = corpName;
        this.postingUrl = postingUrl;
    }

	public String getCorpUrl() {
		return postingUrl;
	}

	public void setCorpUrl(String corpUrl) {
		this.postingUrl = corpUrl;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getCorpName() {
		return corpName;
	}

	public void setCorpName(String corpName) {
		this.corpName = corpName;
	}

}
