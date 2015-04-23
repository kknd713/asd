package com.wanggang.enity;
/**
 * 
 * 常用联系人关系
 *
 */
public class Relational {
	private int id;          
	private Users friend;                 
	private Users users; 
	
	
	
	

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Users getFriend() {
		return friend;
	}
	public void setFriend(Users friend) {
		this.friend = friend;
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public Relational(int id, Users friend, Users users) {
		super();
		this.id = id;
		this.friend = friend;
		this.users = users;
	}
	public Relational() {
		super();
	}
	
	
}
