package com.mega.project;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class QnaDAO {
	
	// myBatis 싱클톤 주소를 주입!
	@Autowired
	SqlSessionTemplate my;
	
	public void qcreate(QnaVO bag) throws Exception {
		// myBatis에 실행시킬 예정
		my.insert("qna.insert", bag);
		// mapper로 넘김.
	}
	
	public int qupdate(QnaVO bag) throws Exception {
		return my.update("qna.update", bag);
	}
	
	public QnaVO qselect(QnaVO bag) throws Exception {
		return my.selectOne("qna.select", bag);
	}
	
	public List<QnaVO> qselectid (QnaVO bag) throws Exception {
		List<QnaVO> idlist = my.selectList("qna.selectid", bag);
		
		int i = 0; // 카운트 시작
		String str = ""; // 리스트에 저장
		for (QnaVO qnaVO : idlist) { // foreach
			str = qnaVO.getQdate(); // VO에서 꺼내온 Qdate값을 str에 저장
			str = str.substring(0, 10); // 저장되어있는 것들을 index0부터 10개 저장
			qnaVO.setQdate(str); // 저장되어있는것을 다시 넣어줌.
			idlist.set(i, qnaVO); // list에
			i++;
		}

		return idlist;
	}

	public List<QnaVO> qselectlist() throws Exception {
		List<QnaVO> list = my.selectList("qna.qall");

		int i = 0; // 카운트 시작
		String str = ""; // 리스트에 저장
		for (QnaVO qnaVO : list) { // foreach
			str = qnaVO.getQdate(); // VO에서 꺼내온 Qdate값을 str에 저장
			str = str.substring(0, 10); // 저장되어있는 것들을 index0부터 10개 저장
			qnaVO.setQdate(str); // 저장되어있는것을 다시 넣어줌.
			list.set(i, qnaVO); // list에
			i++;
		}

		return list; 
	}
	
	public void qdelete(String qid) throws Exception {
		my.delete("qna.delete",qid);
	}
	
	public void adelete(String qid) throws Exception {
		System.out.println("받았는지 확인 >> " + qid);
		
		my.delete("qna.adelete",qid);
	}
}
