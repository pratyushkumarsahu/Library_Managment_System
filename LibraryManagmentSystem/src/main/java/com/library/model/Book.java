package com.library.model;

public class Book { 
	private String title ;
	private String genre ;
	private int authorId;
	private boolean featured;
	
	public Book (String title,String genre,int authorId,boolean featured) {
		this.title = title;
		this.authorId = authorId;
		this.genre = genre;
		this.featured = featured;
	}
	
	public String getTitle() {return title;}
	public String genre()  {return genre;}
	public int authorId() {return authorId;}
	public boolean featured() {return featured;}
	

}
