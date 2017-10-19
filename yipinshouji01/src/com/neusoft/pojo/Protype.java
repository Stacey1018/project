package com.neusoft.pojo;

public class Protype {
	private int id;
	private String type;
	private int leafnode;
	private int fathernode;
	
	
	public int getLeafnode() {
		return leafnode;
	}
	public void setLeafnode(int leafnode) {
		this.leafnode = leafnode;
	}
	public int getFathernode() {
		return fathernode;
	}
	public void setFathernode(int fathernode) {
		this.fathernode = fathernode;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "Protype [id=" + id + ", type=" + type + ", leafnode=" + leafnode + ", fathernode=" + fathernode + "]";
	}
	
	
}
