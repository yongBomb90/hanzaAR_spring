package bit.team42.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.team42.domain.HanzaVO;
import bit.team42.domain.MarkerVO;
import bit.team42.service.MarkerService;

@Controller
@RequestMapping("/img")
public class ImageController {
	
	private static final Logger logger = LoggerFactory.getLogger(ImageController.class);
	
	@Inject
	private MarkerService Markservice;
	
	@ResponseBody
	@RequestMapping(value = "/marker/{id}", method = RequestMethod.GET)
	public  ResponseEntity<byte[]> downmarker(@PathVariable int id){
			try {
			logger.info(""+id);
			MarkerVO marker = Markservice.readFile(id);
			InputStream in = new FileInputStream("C:\\team42\\marker\\"+marker.getMarkerpath());
			logger.info(""+in);
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_PNG);
			ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
			return entity;
		} catch (Exception e) {
			return new ResponseEntity<byte[]>("fail".getBytes(),HttpStatus.OK);
		}		
	}
	@ResponseBody
	@RequestMapping(value = "/hanzabimg/{hanza}", method = RequestMethod.GET)
	public  void backhanzaimg(HanzaVO vo,HttpServletResponse res){
		BufferedImage image= new BufferedImage(150,150,BufferedImage.TYPE_INT_RGB);
		Graphics g =image.getGraphics();
		g.setFont(new Font("Fontid", 0, 150));
		int cr =(int)(Math.random()*255);
		int cg =(int)(Math.random()*255);
		int cb =(int)(Math.random()*255);
		g.setColor(new Color(cr,cg,cb));
		g.fillRect(0,0,150,150);
		g.setColor(new Color(cg,cb,cr));
		g.drawString(vo.getHanza(),0,130);
		try {
			ImageIO.write(image,"jpeg",res.getOutputStream());
					} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
			
	}
	@ResponseBody
	@RequestMapping(value = "/hanzaimgbb/{hanza}", method = RequestMethod.GET)
	public  void hanzaimg(HanzaVO vo,HttpServletResponse res){
		BufferedImage image= new BufferedImage(150,250,BufferedImage.TYPE_INT_RGB);
		Graphics g =image.getGraphics();
		g.setFont(new Font("Fontid", 0, 150));
		g.setColor(new Color(0,0,0));
		g.fillRect(0,0,150,250);
		g.setColor(new Color(255,255,255));
		g.drawString(vo.getHanza(),0,170);
		try {
			ImageIO.write(image,"jpeg",res.getOutputStream());
					} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
			
	}
	@ResponseBody
	@RequestMapping(value = "/hanzaimgwb/{hanza}", method = RequestMethod.GET)
	public  void hanzawimg(HanzaVO vo,HttpServletResponse res){
		BufferedImage image= new BufferedImage(150,250,BufferedImage.TYPE_INT_RGB);
		Graphics g =image.getGraphics();
		g.setFont(new Font("Fontid", 0, 150));
		g.setColor(new Color(255,255,255));
		g.fillRect(0,0,150,250);
		g.setColor(new Color(0,0,0));
		g.drawString(vo.getHanza(),0,170);
		try {
			ImageIO.write(image,"jpeg",res.getOutputStream());
					} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
			
	}
	@ResponseBody
	@RequestMapping(value = "/printimgwb/{hanza}", method = RequestMethod.GET)
	public  void printimgwb(HanzaVO vo,HttpServletResponse res){
		BufferedImage image= new BufferedImage(150,150,BufferedImage.TYPE_INT_RGB);
		Graphics g =image.getGraphics();
		g.setFont(new Font("Fontid", 0, 150));
		g.setColor(new Color(255,255,255));
		g.fillRect(0,0,150,150);
		g.setColor(new Color(0,0,0));
		g.drawString(vo.getHanza(),0,130);
		try {
			ImageIO.write(image,"jpeg",res.getOutputStream());
					} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
			
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/playhanzabimg/{hanza}", method = RequestMethod.GET)
	public  void playhanzabimg(HanzaVO vo,HttpServletResponse res){
		BufferedImage image= new BufferedImage(180,150,BufferedImage.TYPE_INT_RGB);
		Graphics g =image.getGraphics();
		g.setFont(new Font("hanza", 0, 150));
		int cr =(int)(Math.random()*255);
		int cg =(int)(Math.random()*255);
		int cb =(int)(Math.random()*255);
		g.setColor(new Color(cr,cg,cb));
		g.fillRect(0,0,200,150);
		g.setColor(new Color(cg,cb,cr));
		g.drawString(vo.getHanza(),15,130);
		try {
			ImageIO.write(image,"jpeg",res.getOutputStream());
					} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
			
	}
	
}
