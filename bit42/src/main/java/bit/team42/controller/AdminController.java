package bit.team42.controller;



import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;

import javax.inject.Inject;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import bit.team42.domain.Criteria;
import bit.team42.domain.HanzaSearchType;
import bit.team42.domain.HanzaVO;
import bit.team42.domain.MarkerVO;
import bit.team42.domain.MemberVO;
import bit.team42.domain.PageMaker;
import bit.team42.domain.SearchCriteria;
import bit.team42.service.ChildService;
import bit.team42.service.HanzaService;
import bit.team42.service.MarkerService;
import bit.team42.service.MemberService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Inject
	private MemberService service;
	
	@Inject
	private MarkerService Markservice;
	
	@Inject
	HanzaService hservice;
	
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value="/member/register", method=RequestMethod.GET)
	   public void registerGet()throws Exception{

	      logger.info("register Get.....................");

	   }



	   
	   @RequestMapping(value="/member/register", method=RequestMethod.POST)
	   public ResponseEntity<String> registerPost(MemberVO vo, Model model,RedirectAttributes rttr){
	      logger.info("register POST.....................");
	      try {
	         service.register(vo);
	         logger.info("register::::::"+(vo));
	      } catch (Exception e) {
	         e.printStackTrace();
	         rttr.addFlashAttribute("register", "fail");
	         return new ResponseEntity<String>("fail", HttpStatus.FAILED_DEPENDENCY);
	      }
	      
	      rttr.addFlashAttribute("result", "success");
	      
	      return new ResponseEntity<String>("success", HttpStatus.OK);
	      
	   }

	   
	   @RequestMapping(value = "/member/update", method = RequestMethod.GET)
	   public void updateGet(@RequestParam("userid")String userid, Model model,@ModelAttribute("cri")SearchCriteria cri)throws Exception{
	      
	      
		   logger.info(""+cri.getPage());
	      logger.info("update Get...............");
	      logger.info(""+service.readOne(userid));
	      
	      model.addAttribute("MemberVO",service.readOne(userid));
	      
	   }
	   
	   @RequestMapping(value="/member/update", method=RequestMethod.POST)
	   public  ResponseEntity<String> updatePost(MemberVO vo, Model model,RedirectAttributes rttr,SearchCriteria cri){

	      try {
	         rttr.addAttribute("page", cri.getPage());
	         rttr.addAttribute("pageNum", cri.getPageNum());
	         rttr.addAttribute("searchType", cri.getSearchType());
	         rttr.addAttribute("keyword", cri.getKeyword());
	         rttr.addAttribute("sdate", cri.getSdate());
	         
	         logger.info("sdate modify"+cri.getSdate());
	         service.update(vo);
	      } catch (Exception e) {
	       
	         e.printStackTrace();

	         return new ResponseEntity<String>("fail", HttpStatus.FAILED_DEPENDENCY);
	      }
	      
	      
	      return new ResponseEntity<String>("success", HttpStatus.OK);
	      
	   }
	   
	   @RequestMapping(value = "/member/remove", method = RequestMethod.GET)
	   public void removeGet(@RequestParam("userid")String userid, Model model)throws Exception{
	      
	      logger.info("remove Get...............");
	      model.addAttribute("MemberVO",service.readOne(userid));
	      
	   }
	   
	   @RequestMapping(value="/member/remove", method=RequestMethod.POST)
	   public String removePost(@RequestParam("userid")String userid, Model model,RedirectAttributes rttr,SearchCriteria cri){
	      logger.info("remove Post.....................");

	         try {
	            
	            service.delete(userid);
	            
	         } catch (Exception e) {
	            e.printStackTrace();
	            rttr.addFlashAttribute("remove", "fail");
	            return "redirect:/admin/member/update";
	         }
	         rttr.addAttribute("page", cri.getPage());
	         rttr.addAttribute("pageNum", cri.getPageNum());
	         rttr.addAttribute("searchType", cri.getSearchType());
	         rttr.addAttribute("keyword", cri.getKeyword());
	         rttr.addAttribute("sdate", cri.getSdate());
	         logger.info("sdate modify"+cri.getSdate());
	         rttr.addFlashAttribute("result", "success");
	      
	         return "redirect:/admin/member/list";
	   }
	   @RequestMapping(value="/member/remove", method=RequestMethod.DELETE)
	   public ResponseEntity<String> removedel(@RequestParam("userid")String userid, Model model,RedirectAttributes rttr,SearchCriteria cri){
	      logger.info("remove Post.....................");
	         logger.info(""+cri.getPage());
	         try {
	            
	            service.delete(userid);
	            
	         } catch (Exception e) {
	            e.printStackTrace();
	            return new ResponseEntity<String>("fail", HttpStatus.FAILED_DEPENDENCY);
	         }
	         
	         return new ResponseEntity<String>("success", HttpStatus.OK);
	   }
	   
	   
	   
	   
	   @RequestMapping(value = "/member/list", method = RequestMethod.GET)
	   public void list(@ModelAttribute("cri")SearchCriteria cri, Model model,RedirectAttributes rttr)throws Exception{
	      
	      logger.info("listPage GET..........................");
	      logger.info(cri.toString());
	      
	   
	      
	      model.addAttribute("list",service.listSearchCri(cri));
	      logger.info("list:::::::::::::::::" + service.listSearchCri(cri));
	      
	      PageMaker pageMaker = new PageMaker();
	      
	      pageMaker.setCri(cri);
	      
	      
	   
	      pageMaker.setTotalCount(service.listSearchCount(cri));
	      
	      model.addAttribute("pageMaker", pageMaker);
	      
	   
	   }
	   
	   
	   @RequestMapping(value ="/member/read", method = RequestMethod.GET)
	   public void read(Model model,@RequestParam("userid")String userid,@ModelAttribute("cri")SearchCriteria cri)throws Exception{
	      
	      logger.info("read  GET.........................");
	      
	      model.addAttribute("MemberVO",service.readOne(userid));
	      
	   }
	   
	   
	   @RequestMapping(value ="/member/idchecker", method = RequestMethod.GET)
	   public ResponseEntity<String>  idchecker(Model model,@RequestParam("userid")String userid)throws Exception{
	      
	      if(service.readOne(userid)==null){
	         return new ResponseEntity<String>("possible", HttpStatus.OK);
	      }else{
	         return new ResponseEntity<String>("impossible", HttpStatus.OK);   
	      }
	   }

	
	
	
	
	///////////////////////////////////////////////////////////////////////////////member//////////////////////////////////
	
	@RequestMapping(value = "/marker/register", method = RequestMethod.GET)
	public void registerGET() throws Exception {
		logger.info("....registerGET......");
	}

	@RequestMapping(value = "/marker/register", method = RequestMethod.POST)
	public ResponseEntity<String> registerPOST(@RequestParam("files") MultipartFile[] files) throws Exception {
		logger.info("....registerPOST......");

		for (MultipartFile multipartFile : files) {
			String randomname = multipartFile.getOriginalFilename();

			
			String Path = randomname;

			FileCopyUtils.copy(multipartFile.getInputStream(),
					new FileOutputStream(new File("C:\\team42\\marker\\" + randomname)));

			MarkerVO vo = new MarkerVO();

			vo.setMarkerpath(Path);

			logger.info("....insertFile......");

			Markservice.insertFile(vo);
		}

		return new ResponseEntity<String>("success", HttpStatus.OK);

	}


	@RequestMapping(value = "/marker/list", method = RequestMethod.GET)
	public void listAll(Criteria cri, Model model) throws Exception{
		logger.info("list All.....");
		model.addAttribute("list", Markservice.listCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(Markservice.listCountCriteria(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value = "/marker/read", method = RequestMethod.GET)
	public void read(@RequestParam("markerid")int markerid,@ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		logger.info("read Marker.....");
		model.addAttribute(Markservice.readFile(markerid));
	}
	@RequestMapping(value = "/marker/{markerid}", method = RequestMethod.GET)
	public ResponseEntity<MarkerVO> hanzaread(@PathVariable("markerid")int markerid) throws Exception{
		logger.info("read Marker.....");
		MarkerVO str = Markservice.readFile(markerid);
		return new ResponseEntity<MarkerVO>(str, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/marker/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("markerid")int markerid, Criteria cri, RedirectAttributes rttr) throws Exception{
		logger.info("remove Marker.....");
		Markservice.removeFile(markerid);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addFlashAttribute("msg","success");
		
		return "redirect:/admin/marker/list";
	}
	
	@RequestMapping(value = "/marker/modify", method = RequestMethod.GET)
	public void modifyGET(int markerid,@ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		logger.info("modifyGET Marker.....");
		model.addAttribute(Markservice.readFile(markerid));
	}
	
	@RequestMapping(value = "/marker/modify", method = RequestMethod.POST)
	   public ResponseEntity<String> modifyPOST(MarkerVO vo, Criteria cri, RedirectAttributes rttr, MultipartFile files) throws Exception{
	      logger.info("modifyPOST Marker.....");
	      
	      rttr.addAttribute("page", cri.getPage());
	      rttr.addAttribute("pageNum", cri.getPageNum());
	      rttr.addFlashAttribute("msg","SUCCESS");
	      
	      String fileName = files.getOriginalFilename();

	      FileCopyUtils.copy(files.getInputStream(),
	            new FileOutputStream(new File("C:\\team42\\marker\\" + fileName)));
	      vo.setMarkerpath(fileName);
	      logger.info("fileName:"+fileName);
	      Markservice.modifyFile(vo);
	      return new ResponseEntity<String>("success", HttpStatus.OK);

	   }
	
	@ResponseBody
	@RequestMapping(value = "/marker/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName){
		logger.info("delete file: " + fileName);
	      File file = new File("C:\\team42\\marker\\"+fileName);
	      logger.info("파일 유무 "+file.exists());
	     
	      if(file.exists() == true){
	         file.deleteOnExit();
	         logger.info("파일 제거 "+file.delete());
	      }
	      return new ResponseEntity<String>("deleted",HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value = "/marker/downmarker", method = RequestMethod.GET)
	public  ResponseEntity<byte[]> downmarker(String fileName){
			try {
			logger.info(""+fileName);
			InputStream in = new FileInputStream("C:\\team42\\marker\\"+fileName);
			logger.info(""+in);
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_PNG);
			ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
			return entity;
		} catch (Exception e) {
			return new ResponseEntity<byte[]>("fail".getBytes(),HttpStatus.OK);
		}		
	}
	
	
/////////////////////////////////////////////////////////////marker//////////////////////////////////////////////////////
	
	
	
	@RequestMapping(value = "hanza/{grade},{page}", method = RequestMethod.GET)
	public String HanzaHome(Model model,HanzaVO vo,Criteria cri){
		logger.info(""+cri);
		PageMaker pagemaker=hservice.gradetotal(vo, cri);
		List<HanzaVO> list = hservice.selbygrade(vo,pagemaker.getCri());
		model.addAttribute("list",list);
		model.addAttribute("pagemaker",pagemaker);
		model.addAttribute("past",list.get(0).getGrade());
		return "admin/hanza/hazalist";
		
	}
	@RequestMapping(value = "hanza/read/{hanza}", method = RequestMethod.GET)
	public String selbyhanza(Model model,HanzaVO vo){
		logger.info("read방식 "+vo);
		model.addAttribute("vo",hservice.selbyhanza(vo.getHanza()));
		return "Hanzaread";
		
	}
	@RequestMapping(value = "hanza/read/{hanza}", method = RequestMethod.DELETE)
	public  ResponseEntity<String>  DELETE(Model model,HanzaVO vo){
		logger.info("DELETE방식 "+vo);
		hservice.delete(vo.getHanza());
		return new ResponseEntity<String>(vo.getHanza()+"is delete", HttpStatus.OK);
		
	}
	@RequestMapping(value = "hanza/insert", method = RequestMethod.POST)
	public ResponseEntity<String> insert(Model model,HanzaVO vo){
		logger.info("insert방식 POST"+vo);
		try {
			hservice.insert(vo);
		} catch (Exception e) {
			return new ResponseEntity<String>("한자가 있습니다", HttpStatus.FAILED_DEPENDENCY);
		}
		return new ResponseEntity<String>("sucesss", HttpStatus.OK);
	}
	
	
	@RequestMapping(value = "hanza/modify", method = RequestMethod.POST)
	public ResponseEntity<String> insertPUT(Model model,HanzaVO vo){
		logger.info("modify POST 방식 "+vo);
		hservice.update(vo);
		return new ResponseEntity<String>("sucesss", HttpStatus.OK);
	}
	
	
	@RequestMapping(value = "hanza/modify/{hanza}", method = RequestMethod.GET)
	public ResponseEntity<HanzaVO> Gmodify(Model model,HanzaVO vo){
		model.addAttribute("vo",hservice.selbyhanza(vo.getHanza()));
		logger.info("수정한자"+hservice.selbyhanza(vo.getHanza()));
		HanzaVO mvo =hservice.selbyhanza(vo.getHanza());
		return new ResponseEntity<HanzaVO>(mvo, HttpStatus.OK);
	}
	@RequestMapping(value = "hanza/searchlist/{page}", method = RequestMethod.GET)
	public String search(Model model,HanzaSearchType searchtype,Criteria cri){
		logger.info("searchtype  "+searchtype);
		PageMaker pagemaker = hservice.searchcnt(searchtype, cri);
		searchtype.setPage(pagemaker.getCri().getPage());
		List<HanzaVO> list = hservice.searchlist(searchtype);
		model.addAttribute("searchvo",searchtype);
		model.addAttribute("pagemaker",pagemaker);
		model.addAttribute("list",list);
		return "admin/hanza/searchlist";
	}
	
	
	

}
