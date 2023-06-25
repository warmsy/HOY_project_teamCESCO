package kr.smhrd.web;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.smhrd.mapper.MemberVO;
import kr.smhrd.mapper.MyCalendarVO;
import kr.smhrd.mapper.memberMapper;

@Controller
public class MemberController {

	@Inject
	private memberMapper mapper;
	private static Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//회원가입 
	
	@RequestMapping("/gojoin.do")
	public String gojoin() {
		return "join";
		// 여기서 인터페이스 메소드를 실행시켜야 값이들어감 ㅇㅋ?
	} // 오...오키..!
	// 아무것도 없는 페이지에서 처음 조인 실행시킬 ㄷ때 가지고 가는 값이 없어서 gojoin으로 만들어줌
	


	@RequestMapping("/join.do")
	public String join(MemberVO vo) {
		mapper.insertMember(vo);
		return "login";
		// 여기서 인터페이스 메소드를 실행시켜야 값이들어감 ㅇㅋ?
	} // 오...오키..!
	// join에서 값을 입력받으면 membervo에 저장하고 login페이지로 들어감

	@RequestMapping("/gologin.do")
	public String login() {
		return "login";
	}
	

		
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest request) {
	logger.info("memberLogin"+new Date());
		System.out.println(vo.getMb_id());
		System.out.println(vo.getMb_pwd());
		System.out.println(vo.getMb_nickname());
		
		HttpSession session = request.getSession();
		System.out.println("세션아이디 : " + session.getId());
		
		//세션유효시간
		session.setMaxInactiveInterval(3600);
		System.out.println("세션유효시간" + session.getMaxInactiveInterval());
		//아이디 비번 일치 확인
		MemberVO mb_vo = mapper.login(vo);
		
		// 불일치할 경우
		if(mb_vo == null) {
			return "login";
		}
		//일치하면
		session.setAttribute("mb_vo", mb_vo);				
	
		return "redirect:/main.do";
	}
	
//	@RequestMapping("/MyCalenderAjax.do")
//	public @ResponseBody List<MyCalendarVO> MyCalenderAjax(HttpSession session){
//		MemberVO vo = (MemberVO)session.getAttribute("mb_vo");
//		List<MyCalendarVO> list=mapper.MyCalendarAjax(vo);
////		global_id = vo.getMb_id();
//		return list;
//	}
	@RequestMapping(value="/reperson.do", method = RequestMethod.POST)
	public String update(MemberVO vo) {
		mapper.updateMember(vo);
		return "login";
		// 여기서 인터페이스 메소드를 실행시켜야 값이들어감 ㅇㅋ?
	}

	
//	@RequestMapping("/join.do")
//	public int checkId(HttpServletRequest req) throws Exception{
//		
//		String mb_id = req.getParameter("mb_id");
//		String idCheck = mapper.checkId(mb_id);
//		
//		int result =0; // id 존재하지않은 경우
//		
//		if(idCheck != null) {
//			result = 1;
//		}
//		return result;
//	}
//	
	

	
	
	
	
	
	
	
	
	
	
}
