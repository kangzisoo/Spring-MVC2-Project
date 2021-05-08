package com.mega.project;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QnaController {

	@Autowired
	QnaDAO dao;

	@Autowired
	ReplyDAO rdao;

	@RequestMapping("qall")
	public void qall(QnaVO bag, Model model, HttpSession session) throws Exception {
		System.out.println("어디까지 됐는지 확인");

		bag.setUserid((String)session.getAttribute("userid"));
		
		List<QnaVO> idlist = dao.qselectid(bag);
		
		//System.out.println(idlist.get(0).getQid());
		
		model.addAttribute("idlist", idlist);
		
		//System.out.println("돌아왔니? >> " + idlist.get(0).getReply());

//		List<QnaVO> list = rdao.rselectList();
//
//		System.out.println(list.get(0).getQid());
//
//		model.addAttribute("list", list);
//
//		System.out.println("돌아왔니? >> " + list.get(0).getReply());

	}

	@RequestMapping("admin")
	public void all(ReplyVO rvo, Model model) throws Exception {

		List<QnaVO> list = rdao.rselectList();

		System.out.println(list.get(0).getQid());
		System.out.println("어드민 시간 >> " + list.get(0).getQdate());
		model.addAttribute("list", list);

		System.out.println("돌아왔니? >> " + list.get(0).getReply());

	}

	@RequestMapping("qinsert")
	public void qinsert(QnaVO bag, Model model) throws Exception {
		// public void insert(String id, String pw, String name, String tel) {

//		QnaVO bag2 = dao.select(bag);
//		model.addAttribute("bag2", bag2);

		System.out.println(bag.getQid());
		System.out.println(bag.getQtype());
		System.out.println(bag.getQtitle());
		System.out.println(bag.getQcontents());
		System.out.println(bag.getQdate());
		System.out.println(bag.getUserid());
		// 컨트롤러에 있는 메서드에 변수를 선언하면,
		// 스프링이 객체를 생성해준다.
		// MemberDAO dao = new MemberDAO();
		dao.qcreate(bag);

		System.out.println("컨트롤러에서 받은 id: " + bag.getQid());
		System.out.println("컨트롤러에서 받은 type: " + bag.getQtype());
		System.out.println("컨트롤러에서 받은 title: " + bag.getQtitle());
		System.out.println("컨트롤러에서 받은 contents: " + bag.getQcontents());
		System.out.println("컨트롤러에서 받은 date: " + bag.getQdate());

		// JDBC프로그램 절차 4단계

	}

	@RequestMapping("qupdate")
	public void qupdate(QnaVO bag, Model model) throws Exception {
//		QnaVO bag2 = dao.select(bag);
		model.addAttribute("bag", bag);

		System.out.println("컨트롤러에서 받은 id: " + bag.getQid());
		System.out.println("컨트롤러에서 받은 type: " + bag.getQtype());
		System.out.println("컨트롤러에서 받은 title: " + bag.getQtitle());
		System.out.println("컨트롤러에서 받은 contents: " + bag.getQcontents());

		dao.qupdate(bag);

	}

	@RequestMapping("qdelete")
	public String qdelete(String qid) throws Exception {
		System.out.println("delete qid : " + qid);

		dao.qdelete(qid);

		return "redirect:qall";
	}

	@RequestMapping("adelete")
	public String adelete(String qid) throws Exception {
		System.out.println("adelete qid : " + qid);

		dao.adelete(qid);

		return "redirect:admin";
	}

}
