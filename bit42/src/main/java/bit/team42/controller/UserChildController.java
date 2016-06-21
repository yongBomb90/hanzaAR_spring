package bit.team42.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
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

import bit.team42.domain.ChildCriteria;
import bit.team42.domain.ChildVO;
import bit.team42.domain.Criteria;
import bit.team42.domain.MemberVO;
import bit.team42.service.ChildService;
import bit.team42.service.MemberService;
import bit.team42.service.fileService;

@Controller
@RequestMapping("/user/child/*")
public class UserChildController {

   private static final Logger logger = LoggerFactory.getLogger(UserChildController.class);

   @Inject
   private ChildService service;
   
   @Inject
   private MemberService mService;
   
   
   @RequestMapping(value = "/register", method = RequestMethod.GET)
   public void registerGET(ChildVO child, Model model,HttpServletRequest req) throws Exception {
      logger.info("reg GEt ");
      logger.info(""+child);
      HttpSession temp = req.getSession();

      MemberVO user = (MemberVO) temp.getAttribute("login");

      String userid = user.getUserid();
      
      model.addAttribute("MemberVO", mService.readOne(userid));

      
   }

   @RequestMapping(value = "/register", method = RequestMethod.POST)
   public ResponseEntity<String> registerPOST(ChildVO child, MultipartFile file,HttpServletRequest req) throws Exception {
      
	  HttpSession temp = req.getSession();
      MemberVO user = (MemberVO)temp.getAttribute("login");
      
      if (file != null) {
         UUID uid = UUID.randomUUID();
         String randomname = uid.toString() + "_" + file.getOriginalFilename();
         String Path = "C:\\team42\\child\\" + randomname;
         logger.info("4444register Page....POST  vo ::: " + child.toString());
         FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(new File("C:\\team42\\child\\" + randomname)));
         BufferedImage sourceImg = ImageIO.read(new File("C:\\team42\\child\\" + randomname));
         BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
         logger.info("Image");
         ImageIO.write(destImg, "png", new FileOutputStream(new File("C:\\team42\\child\\" + "_s_" + randomname)));
         logger.info(""+Path);
         child.setImgpath(randomname); 
         child.setS_imgpath("_s_" + randomname);
      }
      service.regist(child,user.getUserid());

      return new ResponseEntity<String>("success", HttpStatus.OK);

   }

   

   @RequestMapping(value = "/read", method = RequestMethod.GET)
   public void read(@RequestParam("cno") int cno,@ModelAttribute("cri")Criteria cri, Model model) throws Exception {
      model.addAttribute(service.read(cno));
      model.addAttribute("Cri", cri);
      logger.info("Cri ::"+cri);
   }
   

   
   @RequestMapping(value = "/modify", method = RequestMethod.POST)
   public ResponseEntity<String> modifys(ChildVO child, MultipartFile file,HttpServletRequest req) throws Exception {
      
      logger.info("modifys.....");
      HttpSession temp = req.getSession();
      MemberVO user = (MemberVO)temp.getAttribute("login");
   
      
   
      logger.info("UPDATE USER::::::::::::::" + user);
      UUID uid = UUID.randomUUID();
      if (file != null) {
         String randomname = uid.toString() + "_" + file.getOriginalFilename();
         String Path = "C:\\team42\\child\\" + randomname;
         logger.info(""+Path);
         FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(new File("C:\\team42\\child\\" + randomname)));
         BufferedImage sourceImg = ImageIO.read(new File("C:\\team42\\child\\" + randomname));
         BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
         ImageIO.write(destImg, "png", new FileOutputStream(new File("C:\\team42\\child\\" + "_s_" + randomname)));// �꽟�꽕�씪
                                                                                       // �깮�꽦

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
      logger.info("modifys::::::::::::::::::::POST");
      try {
         logger.info(""+fileName);
         InputStream in = new FileInputStream("C:\\team42\\child\\" + fileName);
         logger.info(""+in);
         HttpHeaders headers = new HttpHeaders();
         headers.setContentType(MediaType.IMAGE_PNG);
         ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
         return entity;
      } catch (Exception e) {
         return new ResponseEntity<byte[]>("fail".getBytes(), HttpStatus.OK);
      }

   }
   
   
   @RequestMapping(value = "/remove", method = RequestMethod.DELETE)
   public ResponseEntity<String> remove(@RequestParam("cno") int cno,HttpServletRequest req)  {
      HttpSession temp = req.getSession();
      MemberVO user = (MemberVO)temp.getAttribute("login");
      try {
         service.remove(cno,user.getUserid());
      } catch (Exception e) {
         // TODO Auto-generated catch block
         return new ResponseEntity<String>("fail", HttpStatus.FAILED_DEPENDENCY);
         
      }

      return new ResponseEntity<String>("success", HttpStatus.OK);
   }

   

   @RequestMapping(value = "/list/{page}", method = RequestMethod.GET)
   public String choice(Model model,HttpServletRequest req,ChildCriteria cri)throws Exception{
      HttpSession temp = req.getSession();
      MemberVO user = (MemberVO)temp.getAttribute("login");
      String userid = user.getUserid();
      cri = service.userchildlistcnt(userid,cri);
      if(cri == null){
         return "redirect:/login";
      }
      List<ChildVO> list = service.userchildlist(userid,cri);
      model.addAttribute("MemberVO",mService.readOne(userid));
      model.addAttribute("list",list);
      model.addAttribute("cri",cri);
      return "user/child/childlist";
   }
   

   
   @RequestMapping(value = "/choice", method = RequestMethod.POST)
   public ResponseEntity<String> choice(Model model,HttpServletRequest req,ChildVO vo, HttpSession session)throws Exception{
      
      logger.info("aaa");
      logger.info("choice post~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
      HttpSession temp = req.getSession();
      ChildVO child = (ChildVO)temp.getAttribute("clogin");
      logger.info("choice" + child);
      logger.info("첫번째 ::::::::::::::::::"+child);
      //String userid = child.getUserid();
      
      mService.choiceUpdate(vo);
      
     
      ChildVO cvo = service.read(vo.getCno());
      session.setAttribute("clogin", cvo);
      
      
      ChildVO childchoice = (ChildVO)temp.getAttribute("clogin");
      logger.info("첫번째 :::::2번째"+childchoice);
      
      return new ResponseEntity<String>("success", HttpStatus.OK);
   }
   
   
}