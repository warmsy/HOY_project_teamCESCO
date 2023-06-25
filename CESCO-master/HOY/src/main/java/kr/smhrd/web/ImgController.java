package kr.smhrd.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.smhrd.mapper.mychMapper;

@Controller
public class ImgController {
	int max_size = 1000 * 1024 * 1024;
	@Inject
	private mychMapper mychmapper;

	private static final Logger logger = LoggerFactory.getLogger(ImgController.class);

	// xml에 설정된 리소스 참조
	// bean의 id가 uploadPath인 태그를 참조

	@Resource(name = "uploadPath")
	String uploadPath;

	/*
	 * // 업로드 흐름 : 업로드 버튼클릭 => 임시디렉토리에 업로드=> 지정된 디렉토리에 저장 => 파일정보가 file에 저장
	 * 
	 * @RequestMapping(value="/upload/uploadForm", method=RequestMethod.GET) public
	 * void uplodaForm(){ // upload/uploadForm.jsp(업로드 페이지)로 포워딩 }
	 */

	@RequestMapping(value = "/test.do", method = RequestMethod.POST)
	public ModelAndView uplodaForm(@RequestParam("mc_seq") int mc_seq, @RequestParam("mb_id") String mb_id,
			MultipartFile file, ModelAndView mav) throws Exception {

		logger.info("파일이름 :" + file.getOriginalFilename());
		logger.info("파일크기 : " + file.getSize());
		logger.info("컨텐트 타입 : " + file.getContentType());

		String savedName = file.getOriginalFilename();

	        File target = new File(uploadPath, savedName);

	        // 임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
	        //FileCopyUtils.copy(바이트배열, 파일객체)
	    FileCopyUtils.copy(file.getBytes(), target);

		//uploadFile 메서드를 사용해 랜덤의 uuid를 생성해 파일이름에 주입
		savedName = uploadFile(savedName, file.getBytes());

		mav.setViewName("upload/uploadResult");
		mav.addObject("savedName", savedName);

		System.out.println(mc_seq + "mc_seq11");
		System.out.println(mb_id + "mb_id11");
		System.out.println(savedName);

		mychmapper.subinsert(mc_seq, mb_id, savedName);

		String url = "http://127.0.0.1:5000/tospring";
		String sb = "";
		try {
			HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
			String line = null;
			while ((line = br.readLine()) != null) {
				sb = sb + line + "\n";
			}
			br.close();
//			System.out.println("2222" + sb.toString());
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mav.addObject("test1", sb.toString()); // "test1"는 jsp파일에서 받을때 이름,
		// sb.toString은 value값(여기에선 test)
		mav.addObject("fail", false);
		mav.setViewName("test"); // jsp파일 이름

		return mav; // uploadResult.jsp(결과화면)로 포워딩
	}

	
	 //파일명 랜덤 생성 메서드 
	private String uploadFile(String originalName, byte[] fileData) throws Exception{
	 
	 // uuid 생성
	UUID uuid = UUID.randomUUID();
	 
	 //savedName 변수에 uuid + 원래 이름 추가 
	String savedName = uuid.toString()+"_"+originalName; //uploadPath경로의 savedName 파일에 대한 file 객체 생성
	 File target = new File(uploadPath, savedName); //fileData의 내용을 target에 복사함
	 FileCopyUtils.copy(fileData, target);
	 
	 return savedName; }
	 
	 }