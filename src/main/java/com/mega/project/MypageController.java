package com.mega.project;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller //이 클래스가 컨트롤러임을 나타냄
// 클라이언트의 요청이 들어오면 제어하는 역할; 컨트롤러
public class MypageController {

	@Autowired //받아주는 기능 설정, 싱글톤으로 생성한 객체가 있으면 그 주소를 받아 사용
	MypageDAO dao; // MypageDAO의 객체(dao) 생성
	
	@Autowired
	ProductDAO dao2; // ProductDAO의 객체(dao2) 생성 : 상품 관련
	
	/*
	 * //String으로 넘어온 상품번호들을 스플릿으로 나눠서 다시 배열에 담기
	 * 
	 * @RequestMapping("mypageproduct")
	 * 
	 * @ResponseBody public List<ProductVO> list(String sum) { System.out.println(
	 * sum); String[] result = null; if (sum.length() > 0) { result =
	 * sum.split(" "); } System.out.println(result[0]);
	 * 
	 * String[] list = new String[result.length-1]; for (int i = 0; i < list.length;
	 * i++) { list[i] = result[i+1]; System.out.println(i+"번째: "+list[i]); }
	 * 
	 * List<ProductVO> list1 = new ArrayList<ProductVO>(); for(int i = 0; i <
	 * list.length; i++) { ProductVO bag = dao2.recentSelect2(list[i]);
	 * list1.add(bag); } System.out.println(list1.get(0));
	 * System.out.println(list1.get(1)); return list1; }
	 */
	
	// 최근 본 상품 넣기
	@RequestMapping("my_insert") //요청에 대해 어떤 컨트롤러와 메서드가 처리를 할지 매핑
	//클라이언트가 가상주소;URL(my_insert)로 입력값을 보내면, 받아서 아래 메서드로 처리함.
	//메서드 내에 viewName을 별도로 설정하지 않으면, URL을 viewName으로 인식
	public void insert(MypageVO mypageVO) throws Exception {
		//입력값을 받아서 VO에 넣는 경우, 클래스 이름 첫글자를 소문자로 바꿔 객체를 생성하면,
		// views아래 my_insert.jsp에서 사용할 수 있다. => MypageVO mypageVO
		MypageVO check = dao.check(mypageVO); //최근 본 상품에 이미 있는지 확인
		if (check == null) { //id & pnum에 해당하는 row가 DB에 없으면(null), create실행
			dao.create(mypageVO); //입력값(mypageVO)을 dao의 create로 보냄
			System.out.println("my_insert!!");
		} else { //id & pnum에 해당하는 row가 DB에 있으면, 이미 추가된게 있으므로 아무 작업 하지않음.
			System.out.println("이미 추가됨 (중복)");
		}
	}
	
	// 최근 본 상품 조회
	@RequestMapping("recent_select") //요청에 대해 어떤 컨트롤러와 메서드가 처리를 할지 매핑
	//클라이언트가 가상주소;URL(recent_select)로 입력값을 보내면, 받아서 아래 메서드로 처리함
	public void select(String userid, Model model) throws Exception {
		System.out.println(userid); //아이디 확인
		
		//아이디에 해당하는 방문페이지 정보(페이지 넘버, 찜, 방문날짜) 출력
		//1. 읽어온 값(userid, pnum, liked, time2)의 리턴타입이 List이므로  mp리스트로 받아준다.
		List<MypageVO> mp = dao.read(userid);

		//2. mp리스트에 있는 "pnum"값들을 담을 pnumList라는 리스트 객체 생성 >> 넘버에 해당하는 상품 정보를 추출하기 위한 key
		List<String> pnumList = new ArrayList<String>(); //From List to Array
		
		for(int i = 0; i<mp.size(); i++) {
			pnumList.add(Integer.toString(mp.get(i).getPnum()));
		}
		
		//위에서 구한 pnumList를 통해 상품DAO에 접근하여 상품정보들을 출력한다.
		//3. pnumList에 들어있는 값들로 상품테이블에서 정보 가져와서
		//	sp리스트에 담아준다.
		List<ProductVO> sp = new ArrayList<ProductVO>();
		for (int i = 0; i < mp.size(); i++) {
			sp.add(dao2.recentSelect2(pnumList.get(i))) ;
			//리턴값이 ProductVO
		}

		//방문페이지들의 정보를 담을 리스트 생성
		List<testVO> list2 = new ArrayList<testVO>();
		
		//1. testVO타입의 변수 list를 생성하고,
		//	방문페이지 정보를 담고있는 리스트 mp에서 필요한 데이터와 상품정보를 담고있는 리스트 sp에서 필요한 데이터 추출
		//2. 추출한 데이터를 담고있는 bag(list)을 리스트(List<testVO> list2 = new ArrayList<testVO>();)에 담는다.
		for (int i = 0; i < pnumList.size(); i++) {
			testVO list = new testVO();
			list.setUserid(mp.get(i).getUserid()); //userid
			list.setTime2((java.util.Date)mp.get(i).getTime2()); //time2
			list.setPnum(mp.get(i).getPnum()); //pnum
			list.setPname(sp.get(i).getPname());
			list.setPrice(sp.get(i).getPrice());
			list.setPtype(sp.get(i).getPtype());
			list.setPlacetype(sp.get(i).getPlacetype());
			list.setRoomimg(sp.get(i).getRoomimg());
			list.setPinfo(sp.get(i).getPinfo());
			list.setDstatue(sp.get(i).getDstatue());
			list2.add(list);
		}
		
		model.addAttribute("list2",list2);// 방문페이지들의 정보를 담고 있는 리스트를 모델로 전송
	}
	
	
	// 찜한 상품 조회 => 최근방문이랑 비슷한 방법
	@RequestMapping("liked_select") 
	public void select2(String userid, Model model) throws Exception{ 
		System.out.println(userid);
		//아이디로 방문페이지 정보(페이지 넘버, 찜, 방문날짜) 출력
		List<MypageVO> mp = dao.read(userid);//방문페이지 정보(userid, pnum, liked, time2)를 담고 있는 리스트
			
		//상품정보의 내용(아래 리스트 sp에서 pnum으로 사용됨)을 추출하기 위해 필요한 pnum값들을 담은 리스트
		List<String> pnumList = new ArrayList<String>(); 
		for(int i = 0; i<mp.size(); i++) {
			pnumList.add(Integer.toString(mp.get(i).getPnum()));
		}
			
		//위에서 구한 pnum리스트를 통해 상품DAO로 접근하여 상품정보들을 출력한다.
		List<ProductVO> sp = new ArrayList<ProductVO>();
		for (int i = 0; i < mp.size(); i++) {
			sp.add(dao2.recentSelect2(pnumList.get(i))) ; //상품페이지에 해당하는 상품정보 추출
		}

		//찜한상품 확인
		List<testVO> list3 = new ArrayList<testVO>();
		 
		for (int i = 0; i < pnumList.size(); i++) {
			testVO list = new testVO();
			//조건 필요!!
			//찜이 1인 상품만 담을 수 있도록 설정
			if(mp.get(i).getLiked().equals("1")) {
				list.setUserid(mp.get(i).getUserid());
				list.setTime2((java.util.Date)mp.get(i).getTime2());
				list.setPnum(mp.get(i).getPnum());
				list.setLiked(mp.get(i).getLiked());
				list.setPname(sp.get(i).getPname());
				list.setPrice(sp.get(i).getPrice());
				list.setPtype(sp.get(i).getPtype());
				list.setPlacetype(sp.get(i).getPlacetype());
				list.setRoomimg(sp.get(i).getRoomimg());
				list.setPinfo(sp.get(i).getPinfo());
				list.setDstatue(sp.get(i).getDstatue());
				list3.add(list);
			}
		}
		//lis는 vo에서 받아올 수 없어서 model로 받아줌
		model.addAttribute("list3", list3); 
	} 
	// 찜한상품 업데이트 (liked = 1) 
	@RequestMapping("basket")
	public void update(MypageVO mypageVO) throws Exception {
		System.out.println("담기성공");
		dao.update(mypageVO);
	}
	
	/*
	 * @RequestMapping("liked")
	 * 
	 * @ResponseBody public String liked(@RequestParam(value = "userid") String
	 * userid) throws Exception { System.out.println(userid); return "success"; }
	 */
	
	@RequestMapping("mydelete")
	public void delete(MypageVO mypageVO) throws Exception{
		dao.delete(mypageVO);
	}

	

}