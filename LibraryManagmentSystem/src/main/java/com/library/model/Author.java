package com.library.model;

public class Author {
	private int id;
	private String name;
	private String bio;
	
	
	public Author(String name,String bio) {
		this.name = name;
		this.bio = bio;
	}
	public String getNmae() {return name;}
	public String getBio() {return bio;}

}
