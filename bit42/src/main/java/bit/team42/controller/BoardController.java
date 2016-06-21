package bit.team42.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.inject.Inject;
import javax.rmi.ssl.SslRMIClientSocketFactory;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.env.SystemEnvironmentPropertySource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
import bit.team42.domain.BoardVO;
import bit.team42.domain.Criteria;
import bit.team42.domain.FileVO;
import bit.team42.domain.GoodCountVO;
import bit.team42.domain.MemberVO;
import bit.team42.domain.PageMaker;
import bit.team42.domain.ReplyVO;
import bit.team42.domain.SearchCriteria;
import bit.team42.service.GoodCountService;
import bit.team42.service.MemberService;
import bit.team42.service.ReplyService;
import bit.team42.service.boardService;
import bit.team42.service.fileService;


@Controller
@RequestMapping("/board/*")
public class BoardController {

   private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
   
   private static final String filepath = "C:\\board\\";
   
   
   @Inject
   private boardService service;

   @Inject
   private fileService fserivce;
   
   @Inject
   private ReplyService rservice;
   
   @Inject
   private MemberService mservice;
   
   @Inject
   private GoodCountService gservice;
   
   private static Map<String, MediaType> mediaMap;
   
   static{
      mediaMap = new HashMap<String, MediaType>();
      mediaMap.put("image/jpeg",MediaType.IMAGE_JPEG);
      mediaMap.put("image/gif",MediaType.IMAGE_GIF );
      mediaMap.put("image/png",MediaType.IMAGE_PNG);
   }
   
   @RequestMapping(value = "/register/{pno}", method = RequestMethod.GET)
   public String registerGET(@PathVariable (value ="pno") int pno,Model model, HttpServletRequest req) throws Exception {
     logger.info("register.........");
     HttpSession temp = req.getSession();
      
      MemberVO user = (MemberVO)temp.getAttribute("login");
      
      String userid = user.getUserid();
      logger.info("register......... " + userid);
   
      model.addAttribute("MemberVO",mservice.readOne(userid));

      model.addAttribute("pno", pno);
      
     logger.info("userid : " + userid);
      return "board/register";
   }
   

   @RequestMapping(value="/register/{pno}", method=RequestMethod.POST)
   public ResponseEntity<String> registerPOST(@RequestParam("files") MultipartFile[] files, @PathVariable (value ="pno") int pno, BoardVO vo){
      
      try {   
         logger.info("regPOST");         
            if(pno == 0){//부모글
               service.insertBoard(vo);
            }
            logger.info("regPOST");
               
            if(pno > 0){//답글
               service.reinsert(vo);
            }
            logger.info("regPOST");
                  
            int bno=0;
            bno = service.getmax();
            
            logger.info("regPOST");
               
            for (MultipartFile multipartFile : files) {
               UUID uid = UUID.randomUUID();
               String randomname = uid.toString()+"_"+ multipartFile.getOriginalFilename();
               Calendar cal = Calendar.getInstance();
               
               
               String yearPath = File.separator+cal.get(Calendar.YEAR);   
               String monthPath =File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);  
               String datePath =File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
               String inputpath = yearPath + monthPath+datePath;
               
               File savedPath = new File(filepath + inputpath);
               savedPath.mkdirs();
               
               String serverpath = savedPath+"\\"+randomname;
               
               FileCopyUtils.copy(multipartFile.getInputStream(), 
                     new FileOutputStream(new File(serverpath)));
               
               String dbpath = inputpath+"\\"+randomname;
               
               FileVO fvo = new FileVO();
               fvo.setBno(bno);
               fvo.setFilename(multipartFile.getOriginalFilename());
               fvo.setFilepath(dbpath);
               String obj = makesmallimg(multipartFile,uid,inputpath,serverpath);
               
                  if(obj != null){                     
                     fvo.setThumpath(obj);
                  }
               fserivce.insertFile(fvo);
            }
         }catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("fail", HttpStatus.FAILED_DEPENDENCY);
         } 
      return new ResponseEntity<String>("success", HttpStatus.OK);
      
   }

   @RequestMapping(value = "/read", method = RequestMethod.GET)
   public void selectOne(@RequestParam("bno") int bno, Model model, HttpServletRequest req, @ModelAttribute("cri")Criteria cri) throws Exception {
      
      
         HttpSession temp = req.getSession();
         
         MemberVO user = (MemberVO)temp.getAttribute("login");
         
         String userid = user.getUserid();
      
         model.addAttribute("MemberVO",mservice.readOne(userid));
         
         logger.info("-------" + userid );
         
      
      model.addAttribute("BoardVO", service.selectOne(bno));
      model.addAttribute("FileVO", fserivce.selectOne(bno));
      model.addAttribute("ReplyVO", rservice.replySelectOne(bno));
      model.addAttribute("GoodCountVO", gservice.selectCount(bno));
}
   
   @RequestMapping(value = "/read", method = RequestMethod.POST)
   public void selectOnePost(ReplyVO vo, Model model) throws Exception {
	   logger.info(vo.toString());
      rservice.replyInsert(vo);
      logger.info(vo.toString());
   }

   @RequestMapping(value = "/goodCount", method = RequestMethod.POST)
   public ResponseEntity<String> goodCount(GoodCountVO vo) throws Exception {
	   logger.info(""+vo);
      gservice.updateCount(vo);
         return new ResponseEntity<String>("success", HttpStatus.OK); 
   }
   
   @RequestMapping(value = "/modify", method = RequestMethod.GET)
   public void modifyGET(int bno, Model model, @ModelAttribute("cri") Criteria cri) throws Exception {
	   logger.info("board modify........");

      model.addAttribute("BoardVO", service.selectOne(bno));
      model.addAttribute("FileVO", fserivce.selectOne(bno));
   }

   @RequestMapping(value = "/modify", method = RequestMethod.POST)
   public ResponseEntity<String> modifyPOST( @RequestParam("files")MultipartFile[] files, BoardVO vo, Criteria cri, RedirectAttributes rttr) throws Exception {
      try {   

         rttr.addAttribute("page", cri.getPage());
         rttr.addAttribute("pageNum", cri.getPageNum());
            service.updateBoard(vo);
            
            if(files.length>0){
            	  logger.info("::file delete ");
                  fserivce.deleteFile(vo.getBno());
                  
                  for (MultipartFile multipartFile : files) {
                     
                     UUID uid = UUID.randomUUID();
                     String randomname = uid.toString()+"_"+ multipartFile.getOriginalFilename();
                     Calendar cal = Calendar.getInstance();

                     String yearPath = File.separator+cal.get(Calendar.YEAR);
                     String monthPath =File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
                     String datePath =File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));                
                     String inputpath = yearPath + monthPath+datePath;
                     
                     File savedPath = new File(filepath + inputpath);
                     savedPath.mkdirs();
                     
                     String serverpath = savedPath+"\\"+randomname;
                     
                     FileCopyUtils.copy(multipartFile.getInputStream(), 
                           new FileOutputStream(new File(serverpath)));
                     
                     String dbpath = inputpath+"\\"+randomname;
                     
                     FileVO fvo = new FileVO();
                     fvo.setBno(vo.getBno());
                     fvo.setFilename(multipartFile.getOriginalFilename());
                     fvo.setFilepath(dbpath);
                     String obj = makesmallimg(multipartFile,uid,inputpath,serverpath);
                     
                        if(obj != null){                           
                           fvo.setThumpath(obj);
                        }
                     fserivce.insertFile(fvo);
               }
            }
            
         }catch (Exception e) {
            e.printStackTrace();
         } 
      
      return new ResponseEntity<String>("success", HttpStatus.OK);
   }

   @RequestMapping(value = "/remove", method = RequestMethod.POST)
   public String remove(@RequestParam("bno") int bno, RedirectAttributes rttr, Criteria cri) throws Exception {
      
      fserivce.deleteFile(bno);
      rservice.replyDeleteBoard(bno);
      gservice.deleteCount(bno);
      service.deleteBoard(bno);

      rttr.addAttribute("page", cri.getPage());
      rttr.addAttribute("pageNum", cri.getPageNum());
      rttr.addFlashAttribute("result", "success");
      return "redirect:/board/list";
   }

   @RequestMapping(value = "/replyremove/{rno}", method = RequestMethod.DELETE)
   public ResponseEntity<String> replyRemove(@PathVariable("rno") int rno) throws Exception {
	   logger.info(".....replyRemove....  rno : " + rno);
      rservice.replyDelete(rno);
      return new ResponseEntity<String>("success", HttpStatus.OK);
   }

   @RequestMapping(value = "/replyupdate", method = {RequestMethod.POST})
   public ResponseEntity<String> replyUpdate( ReplyVO vo){
      
         try {
         rservice.replyUpdate(vo);
      } catch (Exception e) {
         e.printStackTrace();
         return new ResponseEntity<String>("false", HttpStatus.OK);
      }
      
      return new ResponseEntity<String>("success", HttpStatus.OK);
   }
   
   @RequestMapping(value="/list", method = RequestMethod.GET)
   public void listCri(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
      logger.info("list===================");
      PageMaker maker = new PageMaker();
      maker.setCri(cri);
      maker.setTotalCount(service.listSearchCount(cri));
      
      model.addAttribute("list", service.listSearchCriteria(cri));
      model.addAttribute("maker", maker);
   }

   @RequestMapping(value = "/down", method=RequestMethod.GET)
   public ResponseEntity<byte[]>downloadAjax(String filename,String name) throws Exception{
	   logger.info("-------get---------");
	   logger.info("filename : " + filename);
      logger.info("name: "+(name));
      String filePath = "C:\\board"+filename;
          InputStream in = new FileInputStream(filePath);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.add("Content-Disposition",
                  "attachment; fileName = \"" + new String(name.getBytes("UTF-8"), "ISO-8859-1") + "\"");
        ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
        
        return entity;
   }
   @RequestMapping(value = "/down", method=RequestMethod.POST)
   public ResponseEntity<byte[]>pdownloadAjax(String filename,String name) throws Exception{
      logger.info("-------post---------");
      logger.info("C:\\board"+filename);
      logger.info("name"+(name));
      String filePath = "C:\\board"+filename;
          InputStream in = new FileInputStream(filePath);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.add("Content-Disposition",
                  "attachment; fileName = \"" + new String(filePath.getBytes("UTF-8"), "ISO-8859-1") + "\"");
        ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
        
        return entity;
   }

   

   public String makesmallimg(MultipartFile file, UUID uid, String inputpath, String serverpath) throws IOException{
     String media = file.getContentType();
     logger.info(media);
     if(mediaMap.get(media)!= null){
        String sname = uid+"_s_"+file.getOriginalFilename();
        String path = filepath +inputpath+"\\"+sname;
        String returnpath = inputpath+"\\"+sname;
        BufferedImage sourceImg = ImageIO.read(new File(serverpath));
         BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,100);
         ImageIO.write(destImg, "png",new FileOutputStream(new File(path)));
         return returnpath;
     }
     return null;
   }
   
   
 

}