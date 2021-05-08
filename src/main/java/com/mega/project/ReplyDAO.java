package com.mega.project;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ReplyDAO {
	
	// myBatis 싱클톤 주소를 주입!
	@Autowired
	SqlSessionTemplate my;
	
	public void rcreate(ReplyVO rvo) throws Exception {
		// myBatis에 실행시킬 예정
		rvo.setRid(rvo.getQid());
		my.insert("reply.rinsert", rvo);
	}
	
	public void rdelete(String rid) throws Exception {
		my.delete("reply.rdelete", rid);
	}
	
	public int rupdate(ReplyVO rvo) throws Exception {
		return my.update("reply.rupdate", rvo);
	}
	
	public List<QnaVO> rselectList() throws Exception {
		List<QnaVO> list = my.selectList("reply.join");
		
		int i = 0;
		String str = "";
		for (QnaVO qnaVO : list) {
			str = qnaVO.getQdate();
			str = str.substring(0, 10);
			qnaVO.setQdate(str);
			list.set(i, qnaVO);
			i++;
		}
		
		return list;
	}
	
}
