package kr.smhrd.web;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.smhrd.mapper.ChallengesVO;
import kr.smhrd.mapper.ChatVO;
import kr.smhrd.mapper.MemberVO;
import kr.smhrd.mapper.MyCalendarVO;
import kr.smhrd.mapper.MychallengesVO;
import kr.smhrd.mapper.chMapper;
import kr.smhrd.mapper.chatMapper;
import kr.smhrd.mapper.memberMapper;
import kr.smhrd.mapper.mychMapper;
import kr.smhrd.mapper.staticsMapper;


@Controller
public class WebControl {

	@Inject
	private memberMapper mapper;
	   
	@Inject
	private chatMapper chat_mapper;
	
	@Inject
	private chMapper chmapper;
	
	// mychallenge 정보
	@Inject
	private mychMapper mychmapper;

	@Inject
	private staticsMapper stmapper;



	
	@RequestMapping("/first.do")
	public String first() {
		return "first";
	}
	
	   @RequestMapping("/main.do")
	   public String main(){ 
	       return "main";   
	   }
	
	   // calendar 로 넘어가는 ajax 컨트롤러
		@RequestMapping("/MyCalenderAjax.do")
		public @ResponseBody List<MyCalendarVO> MyCalenderAjax(HttpSession session){
			MemberVO vo = (MemberVO)session.getAttribute("mb_vo");
			List<MyCalendarVO> list=mapper.MyCalendarAjax(vo);
//			global_id = vo.getMb_id();
			return list;
		}
	   
		 // 감정통계치로 넘어가는 ajax 컨트롤러
		@RequestMapping("/countingemotionsAjax.do")
		public @ResponseBody MyCalendarVO countingemotionsAjax(HttpSession session){
			MemberVO vo = (MemberVO)session.getAttribute("mb_vo");
			MyCalendarVO cvo=stmapper.countingemotionsAjax(vo);
			return cvo;
		}
		// @ResponseBody > 리턴값 그대로를 호출된 곳으로 보내주는 역할!
	   
	   @RequestMapping("/challenge.do")
	   public String challenge(){ 
	       return "challenge";   
	   }
	   
	  
	   @RequestMapping("/index.do")
	   public String index(){ 
	       return "index";   
	   }
	   
	   @RequestMapping("/statics.do")
	   public String statics(HttpSession session,Model model){
		   MemberVO vo = (MemberVO)session.getAttribute("mb_vo");
		   List<MychallengesVO> list1 = mychmapper.selectch(vo.getMb_id());
		   List<MychallengesVO> list2 = mychmapper.selectch(vo.getMb_id());
//		   for(int i = 0 ; i <list.size(); i++) {
//			   int ch_seq= list.get(i).getCh_seq();
//			   list.get(i).setSuc_num(mychmapper.selectcountsuc(ch_seq));
//			   list.get(i).setCh_num(mychmapper.selectcountch(ch_seq));
//		   }
		   list2 = mychmapper.staticsch(vo.getMb_id());
		   list1 = mychmapper.staticsch__(vo.getMb_id());
		   
		   model.addAttribute("list1", list1);
		   model.addAttribute("list2", list2);
	       return "statics";   
	   }
	   // 리스트라는 이름으로 statics에 값 던져주기!
	   
	   @RequestMapping("/chat.do")
	   public String chat(){ 
	       return "chat";   }
	   
	   @RequestMapping("/person.do")
	   public String person(){ 
	       return "person";   }
	   
	   @RequestMapping("/reperson.do")
	   public String reperson(){ 
	       return "reperson";   }
	   
	   @RequestMapping("/ch_exercise_done2.do")
	   public String ch_exercise_done2(){ 
	       return "ch_exercise_done2";   
	   }
	   
	 
	   
	   @RequestMapping("/ch_user_ing.do")
	   public String ch_user_ing(){ 
		   return "ch_user_ing";   
	   }
	   
//	   @RequestMapping("/ch_ing_list.do")
//	   public String ch_ing_list(){ 
//		   return "ch_ing_list";   
//	   }
	   
	   @RequestMapping("/ch_ing_list_insert.do")
	   public String ch_ing_list_insert(@RequestParam("ch_seq")int ch_seq, @RequestParam("mb_id")String mb_id,Model model){ 
		   mychmapper.insertch(ch_seq, mb_id);
//		   global_id=mb_id;

		   return "redirect:/ch_ing_list.do";
		   }
	   
	   @RequestMapping("/ch_ing_list.do")
	   public void ch_ing_list(Model model,HttpSession session){ 
		   MemberVO vo = (MemberVO)session.getAttribute("mb_vo");
		   List<MychallengesVO> list = mychmapper.selectch(vo.getMb_id());
		   
		   model.addAttribute("list", list);   
	   }
	   
	   @RequestMapping("/ch_done.do")
	   public void ch_done(@RequestParam("mc_seq")int mc_seq, Model model){ 
		   List<MychallengesVO> list = mychmapper.selectsub(mc_seq);
		   model.addAttribute("list", list);  
	   }
	   

	   
	   @RequestMapping("/ch_kind.do")
	   public void ch_kind(@RequestParam("kind")String kind, Model model){ 
		   List<ChallengesVO> list = null;
		   if (kind.equals("exercise")) {
			   list = chmapper.kind1();
		   } else if (kind.equals("self")) {
			   list = chmapper.kind2();
		   } else {
			   list = chmapper.kind3();
		   }
		   model.addAttribute("list", list);
//		   return "redirect:/ch_kind.do";
	   }
	   
	   @RequestMapping("/ch_ing.do")
	   public void ch_ing(@RequestParam("seq")int seq, Model model,HttpSession session){ 
		   List<ChallengesVO> list = chmapper.contents(seq);
		   // session에 저장된 아이디, 가져온 seq를 가지고 mychallenges에 success가 0인 결과 확인
		   // 하나라도 나온다면 이미 시도중인 과제이므로 doing에 넘겨줄값을 설정
		   
		   model.addAttribute("list", list);
		   
		   MemberVO vo = (MemberVO)session.getAttribute("mb_vo");
		   int mych = mychmapper.selectcountmych(vo.getMb_id(),seq);
		   model.addAttribute("doing", mych);   
	   }
	   
	   
	   
	   
	   
	@RequestMapping("/chattest.do")
	public String chattest() {
		return "chattest";
	}
	@CrossOrigin("*")
	@RequestMapping("/chat_index.do")
	public String chat_index() {
		return "chat_index";
	}

	@RequestMapping("/chat_admin.do")
	public String chat_admin() {
		return "chat_admin";
	}

	@RequestMapping("/ch_exercise.do")
	public String ch_exercise() {
		return "ch_exercise";
	}

	@RequestMapping("/challenge2.do")
	public String challenge2() {
		return "challenge2";
	}

	@RequestMapping("/ch_exercise_ing.do")
	public String ch_exercise_ing() {
		return "ch_exercise_ing";
	}

	@RequestMapping("/ch_exercise_done.do")
	public String ch_exercise_done() {
		return "ch_exercise_done";
	}

	@RequestMapping("/ch_exercise_checked.do")
	public String ch_exercise_checked() {
		return "ch_exercise_checked";
	}
	
	
	
	
//	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
//	public ModelAndView Test() {
//		ModelAndView mav = new ModelAndView();
//
//		String url = "http://127.0.0.1:5000/tospring";
//		String sb = "";
//		try {
//			HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
//
//			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
//
//			String line = null;
//
//			while ((line = br.readLine()) != null) {
//				sb = sb + line + "\n";
//			}
////				System.out.println("========br======" + sb.toString());
////				if (sb.toString().contains("ok")) {
////					System.out.println("test");
////					
////				}
//			br.close();
//
//			 System.out.println("1111" + sb.toString());
//		} catch (MalformedURLException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		mav.addObject("test1", sb.toString()); // "test1"는 jsp파일에서 받을때 이름,
//		// sb.toString은 value값(여기에선 test)
//		mav.addObject("fail", false);
//		mav.setViewName("test"); // jsp파일 이름
//		return mav;
//
//	}

	/*
	 * public String CurrentDateTime(){
	 * 
	 * // 포맷 정의 DateTimeFormatter formatter =
	 * DateTimeFormatter.ofPattern("yyyy/MM/dd"); // 포맷 적용 String formatedNow =
	 * now.format(formatter); // 결과 출력 System.out.println(formatedNow); //
	 * 2021/06/17
	 * 
	 * }
	 */

	/*
	 * public String CurrentDateTime() { // 현재 날짜 구하기 LocalDate now_date =
	 * LocalDate.now(); // 현재 시간 LocalTime now_time = LocalTime.now(); // 현재시간 출력
	 * //System.out.println(now); // 06:20:57.008731300 // 포맷 정의하기
	 * //DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH시 mm분 ss초");
	 * DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH시 mm분"); // 포맷
	 * 적용하기 String formatedNow = now_time.format(formatter); // 포맷 적용된 현재 시간 출력
	 * System.out.println(formatedNow); // 06시 20분 57초
	 * 
	 * return formatedNow; }
	 */

	
	@RequestMapping(value = "/apicall.do", produces = "application/text; charset=UTF-8")
	public @ResponseBody String apicall(HttpServletRequest request, HttpSession session) {
		HttpsURLConnection connection = null;
		String query = request.getParameter("query");
//		String id = request2.getParameter("mb_id");
		String id = ((MemberVO)session.getAttribute("mb_vo")).getMb_id();
		/*chatMapper cm = new chatMapper() {

			@Override
			public void insert_botchatting(ChatVO vo_chat) {
				// TODO Auto-generated method stub
				
			}

			@Override
			public void insert_userchatting(ChatVO vo_chat) {
				// TODO Auto-generated method stub
				
			}

			@Override
			public void insert_botchatting(ChatVO mb_id, ChatVO query) {
				// TODO Auto-generated method stub
				query = query;
			}
			
			
		};*/
		System.out.println(id);
		try {
			// Create connection
			System.out.println("시작");
//		    URL url = new URL("https://builder.pingpong.us/api/builder/615d0e4ee4b0438b8856e133/chat/simulator?query="+query);
			System.out.println(query);
			String urlParameters = "{\"request\": {\"query\": \"" + query + "\"}}";
			
			URL url = new URL(
					"https://builder.pingpong.us/api/builder/615d0e4ee4b0438b8856e133/integration/v0.2/custom/123456789");
			connection = (HttpsURLConnection) url.openConnection();
			// 요청 메소드에 따라서 GET,DELETE, PUT 등으로 변경하시면 됩니다.
			connection.setRequestMethod("POST");
			// Content-Type 또한 요청 받는 데이터 타입이 Json이면 json타입으로 선언해주시면 되고
			// 개발 환경에 따라 설정해주시면 됩니다.
			connection.setRequestProperty("Content-Type", "application/json");
			connection.setRequestProperty("Authorization", "Basic a2V5OjQ0NTZhNTI4YTlmZGI5NmFkYzRlNTNhNjU3N2E5NmQy");
			connection.setRequestProperty("Accept", "application/json");
//		    connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36");
			// 필요하시다면 넣어주셔도 되고 저의 경우는 필요없는 값이라 제외하였습니다.
			connection.setDoOutput(true);
			connection.setRequestProperty("charset", "UTF-8");
			connection.setUseCaches(false);
			connection.setConnectTimeout(10000);
			connection.setReadTimeout(10000);
			try (OutputStream os = connection.getOutputStream()) {
				byte[] input = urlParameters.getBytes("utf-8");
				os.write(input, 0, input.length);
			}
//		    DataOutputStream wr = new DataOutputStream(connection.getOutputStream());
//	        wr.writeBytes(urlParameters);
//	        wr.flush();
//	        wr.close();

//		    //Get Response  
//		    InputStream is = connection.getInputStream();
//		    //요청 결과 (response)를 BufferedReader로 받습니다.
//		    BufferedReader rd = new BufferedReader(new InputStreamReader(is));
//		    // 자바 5 이상은 StringBuffer 를 이용해서 결과 값을 읽습니다.
			BufferedReader reader;
			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {

				reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			} else {
				reader = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
			}
			StringBuilder results = new StringBuilder();
			String line;
			while ((line = reader.readLine()) != null) {
				results.append(line);
			}
			JsonParser parser = new JsonParser();
			JsonElement el = parser.parse(results.toString());
			JsonObject object = el.getAsJsonObject();
				String bot_chatting = object.get("response").getAsJsonObject().get("replies").getAsJsonArray().get(0).getAsJsonObject().get("text").getAsString();
			ChatVO cvo = new ChatVO(id, query,bot_chatting);
			chat_mapper.insert_userChatting(cvo);
			chat_mapper.insert_botChatting(cvo);
//		    StringBuilder response = new StringBuilder(); 
//		    String line;
//		    while ((line = rd.readLine()) != null) {
//		      response.append(line);
//		      response.append('\r');
//		    }
//		    rd.close();
			// cm.insert_botchatting(" ","results.toString()");
			
			System.out.println(results.toString() + "이거디비로//" + query + id);
			return results.toString();
//		    }
//		    else {
//		    	System.out.println("여기까지옴");
//		    	System.out.println(connection.getResponseCode());
//		    	return ""+connection.getResponseCode();
//		    }

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (connection != null) {
				// 에러와 관계없이 모든 로직이 끝나면 connection 객체 (HttpURLConnection)를
				// disconnect 하여 모든 연결을 종료합니다.
				connection.disconnect();
			}

		}

	}
	   
//	   @RequestMapping(value = "/ch_exercise_done2.do", method = RequestMethod.GET)
//		public ModelAndView ch_exercise_done2() {
//			ModelAndView mav = new ModelAndView();
//			
//			String url = "http://127.0.0.1:5000/tospring";
//			String sb = "";
//			try {
//				HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
//				
//
//				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
//
//				String line = null;
//
//				while ((line = br.readLine()) != null) {
//					sb = sb + line + "\n";
//				}
////				System.out.println("========br======" + sb.toString());
////				if (sb.toString().contains("ok")) {
////					System.out.println("test");
////					
////				}
//				br.close();
//
//				//System.out.println("1111" + sb.toString());
//			} catch (MalformedURLException e) {
//				e.printStackTrace();
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			mav.addObject("test1", sb.toString()); // "test1"는 jsp파일에서 받을때 이름, 
//	        						//sb.toString은 value값(여기에선 test)
//			mav.addObject("fail", false);
//			mav.setViewName("ch_exercise_done2");   // jsp파일 이름
//			return mav;
//
//	   }
	
	
	   
	   

}
