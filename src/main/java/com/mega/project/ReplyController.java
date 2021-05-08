package com.mega.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReplyController {

	@Autowired
	ReplyDAO rdao;

	@Autowired
	QnaDAO dao;
	
//	@RequestMapping("rall")
//	public void rall(Model model) throws Exception {
//		List<ReplyVO> rlist = rdao.rselectList();
//		model.addAttribute("rlist", rlist);
//		System.out.println(rlist.get(0).getQid());
//	}
	
	@RequestMapping("rinsert")
	public void rinsert(ReplyVO rvo, Model model) throws Exception {
		//컨트롤러에 있는 메서드에 변수를 선언하면, 
		//스프링이 객체를 생성해준다.
		//MemberDAO dao = new MemberDAO();
		
		model.addAttribute("rvo", rvo);
		
		System.out.println("입력한 답글 >> " + rvo.getReply());

		rdao.rcreate(rvo);
		
		System.out.println("컨트롤러에서 받은 댓글 내용 : " + rvo.getReply());		
		//JDBC프로그램 절차 4단계
	}
	
	@RequestMapping("rupdate")
	public void rupdate(ReplyVO rvo, Model model) throws Exception{
		model.addAttribute("rvo", rvo);
		
		rdao.rupdate(rvo);
	}
	
	@RequestMapping("rdelete")
	public void rdelete(String rid) throws Exception {
		System.out.println("delete, rid : " + rid);
		rdao.rdelete(rid);
	}
	

}
