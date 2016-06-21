package bit.team42.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import bit.team42.domain.BoardVO;
import bit.team42.domain.ChildCriteria;
import bit.team42.domain.ChildVO;
import bit.team42.domain.Criteria;
import bit.team42.domain.HanzaSearchType;
import bit.team42.domain.HanzaVO;
import bit.team42.domain.MemberVO;
import bit.team42.domain.MobileCriteria;
import bit.team42.domain.MsgVO;
import bit.team42.domain.SearchCriteria;
import bit.team42.dto.LoginDTO;
import bit.team42.service.ChildService;
import bit.team42.service.HanzaService;
import bit.team42.service.MemberService;
import bit.team42.service.MsgService;

@Controller
@RequestMapping("/msg")
public class MsgController {
	
	private static final Logger logger = LoggerFactory.getLogger(MobileController.class);

	
	@Inject
	private MemberService mservice;

	@Inject
	private ChildService cservice;
	
	@Inject
	private MsgService service;
	
	@RequestMapping(value = "makerlist/{cno}", method = RequestMethod.GET)
	public ResponseEntity<List<Integer>> makerlist(MsgVO vo) throws Exception {
		List<Integer> list = service.markerlist(vo);
		if(list == null){
			return new ResponseEntity<List<Integer>>(list, HttpStatus.FAILED_DEPENDENCY);
		}
		return new ResponseEntity<List<Integer>>(list, HttpStatus.OK);
	}
	
	@RequestMapping(value = "{page}", method = RequestMethod.GET)
	public String msg(Model model, HttpServletRequest req, ChildCriteria cri) throws Exception {
		HttpSession temp = req.getSession();
		MemberVO user = (MemberVO) temp.getAttribute("login");
		String userid = user.getUserid();
		cri = cservice.userchildlistcnt(userid, cri);
		if (cri == null) {
			return "redirect:/login";
		}
		List<ChildVO> list = cservice.userchildlist(userid, cri);
		model.addAttribute("MemberVO", mservice.readOne(userid));
		model.addAttribute("list", list);
		model.addAttribute("cri", cri);
		return "msg/msg";
	}
	@RequestMapping(value = "/reg", method = RequestMethod.POST)
	public ResponseEntity<String> POSTmsg( MultipartFile file,  MsgVO vo){
		System.out.println("ssss");
		System.out.println(vo);
		if(file!=null){
		System.out.println("파일이름::"+file.getOriginalFilename());
		System.out.println("컨텐트::"+file.getContentType());
		vo.setFiletype(file.getContentType());
		String orgfilename = file.getOriginalFilename();
		vo.setFilename(orgfilename);
		UUID uid = UUID.randomUUID();
		String pathname = uid.toString()+"_"+file.getOriginalFilename();
		File savedPath = new File("C:\\team42\\msg\\" + pathname);
		 try {
			FileCopyUtils.copy(file.getInputStream(), 
			         new FileOutputStream(savedPath));
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("fail", HttpStatus.FAILED_DEPENDENCY);
		} 
        vo.setSavename(pathname);
        }
		service.insertMsg(vo);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(){
		return "msg/read";
		
	}
	@RequestMapping(value = "/read/{cno},{markerid}", method = RequestMethod.GET)
	public ResponseEntity<MsgVO> readmarker( MsgVO vo){
		MsgVO result = new MsgVO();
		System.out.println(vo);
		try {
			result = service.selectbymarker(vo);
			return new ResponseEntity<MsgVO>(result, HttpStatus.OK);
			
		} catch (Exception e) {
			return new ResponseEntity<MsgVO>(result, HttpStatus.FAILED_DEPENDENCY);
		}
	}
	@ResponseBody
	@RequestMapping(value = "/image", method = RequestMethod.GET)
	public  ResponseEntity<byte[]> image(String fileName){
			try {
			System.out.println(fileName);
			InputStream in = new FileInputStream("C:\\team42\\msg\\"+fileName);
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_PNG);
			ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
			return entity;
		} catch (Exception e) {
			return new ResponseEntity<byte[]>("fail".getBytes(),HttpStatus.OK);
		}		
	}
	@ResponseBody
	@RequestMapping(value = "/video", method = RequestMethod.GET)
	public  ResponseEntity<byte[]> video(String fileName){
		
		try {
			System.out.println(fileName);
			InputStream in = new FileInputStream("C:\\team42\\msg\\"+fileName);
			HttpHeaders headers = new HttpHeaders();
			ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
			return entity;
		} catch (Exception e) {
			return new ResponseEntity<byte[]>("fail".getBytes(),HttpStatus.OK);
		}	
				
	}
	@ResponseBody
	@RequestMapping(value = "/audio", method = RequestMethod.GET)
	public  ResponseEntity<byte[]> audio(String fileName){
		
		try {
			System.out.println(fileName);
			InputStream in = new FileInputStream("C:\\team42\\msg\\"+fileName);
			HttpHeaders headers = new HttpHeaders();
			ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
			return entity;
		} catch (Exception e) {
			return new ResponseEntity<byte[]>("fail".getBytes(),HttpStatus.OK);
		}	
				
	}
	@ResponseBody
	@RequestMapping(value = "/down", method = RequestMethod.GET)
	public  ResponseEntity<byte[]> down(String fileName,String name){
		    String filePath = "C:\\team42\\msg\\"+fileName;
	          InputStream in;
	          ResponseEntity<byte[]> entity;
	          HttpHeaders headers = new HttpHeaders();
		        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		 
			try {
				in = new FileInputStream(filePath);
				     headers.add("Content-Disposition",
			                  "attachment; fileName = \"" + new String(name.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			         entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
			     
			} catch (Exception e) {
				entity = new ResponseEntity<byte[]>(null, headers, HttpStatus.FAILED_DEPENDENCY);
				
				e.printStackTrace();
			}
	          
	        return entity;
	   }
	@RequestMapping(value = "/list/{cno},{page}", method = RequestMethod.GET)
	public String childlist( MsgVO vo, MobileCriteria cri, Model model){
		try {
			cri = service.selectbycnocnt(vo,cri);
			List<MsgVO> list = service.selectbycno(vo,cri);
			model.addAttribute("list",list);
			model.addAttribute("pagemaker",cri);
			model.addAttribute("past",vo.getCno());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "msg/list";
	}
	@RequestMapping(value = "/del/{mno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> childlist( MsgVO vo){
		try {
			service.delete(vo);
		} catch (Exception e) {
			return new ResponseEntity<String>("fail",HttpStatus.FAILED_DEPENDENCY);
		}
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}
}
