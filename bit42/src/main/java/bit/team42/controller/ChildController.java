package bit.team42.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.imgscalr.Scalr;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import bit.team42.domain.ChildVO;
import bit.team42.domain.Criteria;
import bit.team42.domain.HanzaTotaVO;
import bit.team42.domain.HanzaVO;
import bit.team42.domain.MemberVO;
import bit.team42.domain.PageMaker;
import bit.team42.domain.SearchCriteria;
import bit.team42.service.ChildService;
import bit.team42.service.HanzaService;
import bit.team42.service.MemberService;
import bit.team42.service.fileService;

@Controller
@RequestMapping("/admin/child/*")
public class ChildController {

   private static final Logger logger = LoggerFactory.getLogger(ChildController.class);

   @Inject
   private ChildService service;

   @Inject
   private MemberService mservice;

   @Inject
   private fileService fserivce;
   
   @Inject
   private HanzaService hservice;

   @RequestMapping(value = "/register", method = RequestMethod.GET)
   public void registerGET(ChildVO child, Model model,HanzaVO vo,Criteria cri) throws Exception {

      
      //MemberVO user = (MemberVO) temp.getAttribute("login");

      
   }

   @RequestMapping(value = "/register", method = RequestMethod.POST)
   public ResponseEntity<String> registerPOST(ChildVO child, MultipartFile file,HttpServletRequest req) throws Exception {
      logger.info("========================");
      HttpSession temp = req.getSession();
      MemberVO user = (MemberVO)temp.getAttribute("login");
      
      logger.info("111register Page....POST");
      logger.info("2222register Page....POST  VO   " + child.toString());
   
      child.setS_imgpath("defaultimg.jpg");
      if (file != null) {
         UUID uid = UUID.randomUUID();
         String randomname = uid.toString() + "_" + file.getOriginalFilename();
         String Path = "C:\\team42\\child\\" + randomname;
         logger.info("4444register Page....POST  vo ::: " + child.toString());
         FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(new File("C:\\team42\\child\\" + randomname)));
         BufferedImage sourceImg = ImageIO.read(new File("C:\\team42\\child\\" + randomname));
         BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_EXACT, 100);
         logger.info("Image");
         ImageIO.write(destImg, "png", new FileOutputStream(new File("C:\\team42\\child\\" + "_s_" + randomname)));// 섬네일
                                                                              // 생성
         logger.info(Path);
         child.setImgpath(randomname); // 파일의 경로를 사용자가 입력하지 않으니까 파일 생성시 줬던
                                 // 경로+이름을 세터로 VO에게 전달
         child.setS_imgpath("_s_" + randomname); // 세터로 VO에게 파일 경로 전달
      }
      
      logger.info(child.getUserid());
      service.regist(child,child.getUserid());

      return new ResponseEntity<String>("success", HttpStatus.OK);

   }

   @RequestMapping(value = "/list", method = RequestMethod.GET)
   public void listAll(Model model,@ModelAttribute("cri")SearchCriteria cri) throws Exception {
      logger.info("show list..get..");
      logger.info(cri.toString());

      model.addAttribute("list", service.listSearchCri(cri));
      
      PageMaker pagemaker = new PageMaker();
      
      pagemaker.setCri(cri);
      
      pagemaker.setTotalCount(service.listSearchCount(cri));
      
      model.addAttribute("pageMaker", pagemaker);
   }

   @RequestMapping(value = "/Uread", method = RequestMethod.GET)
   public ResponseEntity<ChildVO> readU(@RequestParam("cno") int cno, Model model) throws Exception {
      ChildVO vo = service.read(cno);
      
      return new ResponseEntity<ChildVO>(vo, HttpStatus.OK);
      
   }
   
   @RequestMapping(value = "/read", method = RequestMethod.GET)
   public void read(@RequestParam("cno") int cno,@ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception {
      model.addAttribute(service.read(cno));
      model.addAttribute("Cri", cri);
      logger.info("Cri ::"+cri);
   }

   @RequestMapping(value = "/modify", method = RequestMethod.GET)
   public void modifyGET(int cno, Model model,int page,@ModelAttribute("cri")SearchCriteria cri) throws Exception {

      logger.info("modify컨트롤러");
      model.addAttribute("ChildVO", service.read(cno));
      model.addAttribute("Page", page);
      
   }

   @RequestMapping(value = "/remove", method = RequestMethod.DELETE)
   public ResponseEntity<String> remove(@RequestParam("cno") int cno, HttpServletRequest req,ChildVO vo)  {
      HttpSession temp = req.getSession();
      logger.info("remove에 들어옴.........");
      
      String userid = vo.getUserid();
      logger.info(userid);
      MemberVO user = (MemberVO)temp.getAttribute("login");
      logger.info("remove: "+cno+"::"+user);
      try {
         service.remove(cno,userid);
         return new ResponseEntity<String>("success", HttpStatus.OK);
      } catch (Exception e) {
         // TODO Auto-generated catch block
         return new ResponseEntity<String>("fail", HttpStatus.FAILED_DEPENDENCY);
         
      }
      
   }

   
   @RequestMapping(value = "/modifys", method = RequestMethod.POST)
   public ResponseEntity<String> modifys(ChildVO child, MultipartFile file,HttpServletRequest req,RedirectAttributes rttr,SearchCriteria cri) throws Exception {
      
      logger.info("modifys.....");
      HttpSession temp = req.getSession();
      MemberVO user = (MemberVO)temp.getAttribute("login");
   
        rttr.addAttribute("page", cri.getPage());
         rttr.addAttribute("pageNum", cri.getPageNum());
         rttr.addAttribute("searchType", cri.getSearchType());
         rttr.addAttribute("keyword", cri.getKeyword());
         rttr.addAttribute("sdate", cri.getSdate());
           
   
      logger.info("UPDATE USER::::::::::::::" + user);
      UUID uid = UUID.randomUUID();
      if (file != null) {
         String randomname = uid.toString() + "_" + file.getOriginalFilename();
         String Path = "C:\\team42\\child\\" + randomname;
         logger.info(""+Path);
         FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(new File("C:\\team42\\child\\" + randomname)));
         BufferedImage sourceImg = ImageIO.read(new File("C:\\team42\\child\\" + randomname));
         BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
         ImageIO.write(destImg, "png", new FileOutputStream(new File("C:\\team42\\child\\" + "_s_" + randomname)));// 섬네일
                                                                                       // 생성

         child.setImgpath(randomname);

         child.setS_imgpath("_s_" + randomname);
      }
      logger.info("sImage?  " + child.getS_imgpath());
      logger.info("Image?  " + child.getImgpath());
      service.modify(child);

      return new ResponseEntity<String>("success", HttpStatus.OK);

   }

   @ResponseBody
   @RequestMapping(value = "/downimg", method = RequestMethod.GET)
   public ResponseEntity<byte[]> downimg(String fileName) {
      logger.info("downimg::::::::::::::::::::POST");
      try {
         logger.info("filename1::"+fileName);
         InputStream in = null;
         logger.info("fileName2::"+fileName);
         
         in = new FileInputStream("C:\\team42\\child\\" + fileName);
         logger.info(""+in);
         
         
         HttpHeaders headers = new HttpHeaders();
         headers.setContentType(MediaType.IMAGE_PNG);
         logger.info("인풋스트림 ::"+in);
         ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
         return entity;
         
      } catch (Exception e) {
         return new ResponseEntity<byte[]>("fail".getBytes(), HttpStatus.OK);
      }

   }

   @ResponseBody                                                   //놀이 페이지에서 던져주는
   @RequestMapping(value = "/stateup/{clevel},{deep}", method = RequestMethod.GET)//아이의 급수와 단계를 받기위해 
   public ResponseEntity<String> stateup(HttpServletRequest req, ChildVO cvo) {   
      HttpSession session = req.getSession();                  //세션으로 멤버의아이정보를 받음
      ChildVO vo = (ChildVO) session.getAttribute("clogin");      //clogin으로 아이의 값을 저장
      if(vo.getClevel() == cvo.getClevel()){                  //이전의 아이급수와 현재아이 급수와 비교
         if(vo.getDeep() == cvo.getDeep()){                  //이전의 아이단계와 현재아이의 단계를 비교
            vo = service.stateup(session);                  //아이의 급수와 단계를 업데이트
         }
      }
      if(vo == null){                                    //
         session.setAttribute("clogin", vo);
         return new ResponseEntity<String>("fail", HttpStatus.FAILED_DEPENDENCY);
      }else{
         return new ResponseEntity<String>("success", HttpStatus.OK);   
      }
      
      
   }
   @RequestMapping(value = "/test", method = RequestMethod.GET)
   public String read(Model model,HttpServletRequest req) throws Exception {
      HttpSession temp = req.getSession();
      MemberVO user = (MemberVO)temp.getAttribute("login");
      String userid = user.getUserid();
      model.addAttribute("MemberVO",mservice.readOne(userid));
      model.addAttribute("list",service.useridlist(userid));
      return "user/child/childlist";
   }
   
   @RequestMapping(value = "/gradestotal", method = RequestMethod.GET)
    public ResponseEntity<List<HanzaTotaVO>> gradestotal(){
       List<HanzaTotaVO> list = new ArrayList<>();
       list = service.childtotacnt();
       return new ResponseEntity<List<HanzaTotaVO>>(list, HttpStatus.OK);
   }
}