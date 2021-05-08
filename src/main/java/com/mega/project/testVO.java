package com.mega.project;

public class testVO {
	String userid;
	int pnum;
	String liked;
	java.util.Date time2; //최근 본 시간
	String pname; //이름
	String price; //가격
	String ptype; //매물종류
	String placetype; //땡세권
	String roomimg; //메인이미지
	String pinfo; //정보
	String dstatue; //거래상태
	
	public String getPtype() {
		return ptype;
	}
	public void setPtype(String ptype) {
		this.ptype = ptype;
	}
	public String getPlacetype() {
		return placetype;
	}
	public void setPlacetype(String placetype) {
		this.placetype = placetype;
	}
	public String getRoomimg() {
		return roomimg;
	}
	public void setRoomimg(String roomimg) {
		this.roomimg = roomimg;
	}
	public String getPinfo() {
		return pinfo;
	}
	public void setPinfo(String pinfo) {
		this.pinfo = pinfo;
	}
	public String getDstatue() {
		return dstatue;
	}
	public void setDstatue(String dstatue) {
		this.dstatue = dstatue;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getLiked() {
		return liked;
	}
	public void setLiked(String liked) {
		this.liked = liked;
	}
	public java.util.Date getTime2() {
		return time2;
	}
	public void setTime2(java.util.Date time2) {
		this.time2 = time2;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "testVO [userid=" + userid + ", pnum=" + pnum + ", liked=" + liked + ", time2=" + time2 + ", pname="
				+ pname + ", price=" + price + "]";
	}
	
	
}
