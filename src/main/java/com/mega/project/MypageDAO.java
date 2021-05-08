package com.mega.project;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component //스프링에 이 클래스를 싱글톤으로 만들어달라고 셋팅
		   //싱글톤: 객체 하나만 생성 후 그 주소값을 계속 가져다 사용
		   //MypageDAO dao = new MypageDAO();
public class MypageDAO {
	
	@Autowired
	SqlSessionTemplate my; //myBatis를 사용하는 싱글톤! (주소를 주입)
	
	//최근 본 상품 추가 (create)
	public void create(MypageVO bag) throws Exception {
		my.insert("mypage.insert", bag);
		//myBatis의 insert 기능
		//namespace가 mypage인 매퍼(mapper)에서, id가 'insert'인 기능 수행
	}
	//최근 본 상품 조회 (read) => userid에 해당하는 pnum,liked,time2
	public List<MypageVO> read(String userid){
		//리턴타입이 List
		return my.selectList("mypage.select", userid);
		//myBatis의 selectList 기능
		// namespace가 mypage인 매퍼의 id가 select인 기능 수행
	}
	//찜한 상품 조회 (read) => userid에 해당하는 pnum,liked,time2
	public List<MypageVO> read2(String userid){
		//리턴타입이 List
		return my.selectList("mypage.select2", userid);
		//myBatis의 selectList 기능
		// namespace가 mypage인 매퍼의 id가 select인 기능 수행
	}
	//찜한 상품 업데이트 (update)//
	public void update(MypageVO bag) throws Exception {
		my.update("mypage.update", bag);
		// namespace가 mypage인 매퍼의 id가 update인 기능 수행
	}
	//찜한 상품 삭제 (delete)
	public int delete(MypageVO bag) {
		//리턴 타입이 int
		return my.delete("mypage.delete", bag);
		// namespace가 mypage인 매퍼의 id가 delete인 기능 수행
	}
	//중복체크(최근 본 상품 -> 이미 조회한 적 있으면, 업데이트 하지 않음)
	public MypageVO check(MypageVO bag) {
		//리턴 타입이 MypageVO
		return my.selectOne("mypage.check", bag);
	}
	//상품 정보 가져오기 (selectOne)
//	public MypageVO recentSelect(String pnum) {
//		return my.selectOne("mypage.recentselect", pnum);
//	}
	
}
