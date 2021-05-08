package com.mega.project;

import java.util.Date;

public class MypageVO {
	private String userid; //유저 아이디
	int pnum; //최근본상품 (상품번호)
	private String liked; //찜 (T/F) => (1/0)
	private Date time2; //최근 본 상품을 시간순으로 정렬하기 위한 time
	
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
	public Date getTime2() {
		return time2;
	}
	public void setTime2(Date time2) {
		this.time2 = time2;
	}
	@Override
	public String toString() {
		return "MypageVO [userid=" + userid + ", pnum=" + pnum + ", liked=" + liked + ", time2=" +  time2 +"]";
	}


}
