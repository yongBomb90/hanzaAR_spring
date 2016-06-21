package bit.team42.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bit.team42.domain.Criteria;
import bit.team42.domain.HanzaSearchType;
import bit.team42.domain.HanzaTotaVO;
import bit.team42.domain.HanzaVO;
import bit.team42.domain.PageMaker;
import bit.team42.service.HanzaService;

@Controller
@RequestMapping("/hanza")
public class HanzaController {
	
	private static final Logger logger = LoggerFactory.getLogger(HanzaController.class);
	
   @Inject
   HanzaService hservice;
   
   @RequestMapping(value = "/{grade},{page}", method = RequestMethod.GET)
   public String HanzaHome(Model model,HanzaVO vo,Criteria cri){
      //hanza
      logger.info(""+cri);
      PageMaker pagemaker= new PageMaker();
      pagemaker=hservice.gradetotal(vo, cri);
      List<HanzaVO> list = new ArrayList<HanzaVO>();
      list = hservice.selbygrade(vo,pagemaker.getCri());
      model.addAttribute("list",list);
      model.addAttribute("pagemaker",pagemaker);
      model.addAttribute("past",list.get(0).getGrade());
      model.addAttribute("depth",cri.getPage());
      return "hanza/hazalist";
      
   }
   
   @RequestMapping(value = "gradedepth/{grade},{page}", method = RequestMethod.GET)
   public ResponseEntity<List<HanzaVO>> gradedepth(Model model,HanzaVO vo,Criteria cri){
      logger.info(""+cri);
      PageMaker pagemaker=hservice.gradetotal(vo, cri);
      List<HanzaVO> list = new ArrayList<HanzaVO>();
      
      list = hservice.selbygrade(vo,pagemaker.getCri());
      return new ResponseEntity<List<HanzaVO>>(list, HttpStatus.OK);
   }
   
   @RequestMapping(value = "gradecnt/{grade}", method = RequestMethod.GET)
   public ResponseEntity<Integer> gradecnt(HanzaVO vo){
      int cnt = hservice.gradecnt(vo);
      return new ResponseEntity<Integer>(cnt, HttpStatus.OK);
   }
   @RequestMapping(value = "/read/{hanza}", method = RequestMethod.GET)
   public ResponseEntity<HanzaVO> selbyhanza(Model model,HanzaVO vo){
      logger.info("read "+vo);
      HanzaVO mvo = new HanzaVO();
      mvo =hservice.selbyhanza(vo.getHanza());
      return new ResponseEntity<HanzaVO>(mvo, HttpStatus.OK);
      
   }
   
   @RequestMapping(value = "/searchlist/{page}", method = RequestMethod.GET)
   public String search(Model model,HanzaSearchType searchtype,Criteria cri){
      logger.info("searchtype  "+searchtype);
      PageMaker pagemaker = new PageMaker();
      pagemaker = hservice.searchcnt(searchtype, cri);
      searchtype.setPage(pagemaker.getCri().getPage());
      List<HanzaVO> list = new ArrayList<HanzaVO>();
      list = hservice.searchlist(searchtype);
      
      model.addAttribute("searchvo",searchtype);
      model.addAttribute("pagemaker",pagemaker);
      model.addAttribute("list",list);
      return "hanza/searchlist";
   }
   @RequestMapping(value = "/marker/{grade},{markerid}", method = RequestMethod.GET)
   public ResponseEntity<HanzaVO> searchmarker(Model model,HanzaVO vo){
      HanzaVO mvo = hservice.selbymarker(vo);
      return new ResponseEntity<HanzaVO>(mvo, HttpStatus.OK);
   }
   @RequestMapping(value = "/random", method = RequestMethod.GET)
   public ResponseEntity<List<HanzaVO>> random(){
      List<HanzaVO> list = new ArrayList<>();
      list = hservice.selbyrandom();
       return new ResponseEntity<List<HanzaVO>>(list, HttpStatus.OK);
   }
   
   @RequestMapping(value = "/gradestotal", method = RequestMethod.GET)
   public ResponseEntity<List<HanzaTotaVO>> gradestotal(){
       List<HanzaTotaVO> list = new ArrayList<>();
       list = hservice.hanzatotacnt();
       return new ResponseEntity<List<HanzaTotaVO>>(list, HttpStatus.OK);
   }
   
}