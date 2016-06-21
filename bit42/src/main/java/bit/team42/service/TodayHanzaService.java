package bit.team42.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import bit.team42.domain.HanzaVO;
import bit.team42.persistence.HanzaDAO;

public class TodayHanzaService {

	@Inject
	private HanzaDAO dao;
	
	private List<HanzaVO> list = new ArrayList<>();
	private Date today = new Date();
	
	public TodayHanzaService(HanzaDAO dao) {
		this.dao=dao;
		 calc();
		
	}
	public void calc(){
		System.out.println("랜덤화");
		list = new ArrayList<>();
		for(int z = 0; z<10; z++){
			int markerid = (int) ((Math.random()*1000)+1);
			list.add(dao.selrandom(markerid).get(0));	
		}
	}
	
	public List<HanzaVO> getlist(Date curday){
		boolean check = false;
		int year = today.getYear()-curday.getYear();
		int month = today.getMonth()-curday.getMonth();
		int day = today.getDate()-curday.getDate();
		System.out.println("년도 " + year);
		System.out.println("달 " + month);
		System.out.println("날 " + day);
		if(year < 0){
			check = true;
		}else if( month < 0){
			check = true;
		}else if(day < 0){
			check = true;
		}else{
			check = false;
		}
		if(check){
			calc();
			today = curday;
		}
		
		System.out.println(list);
		return list;
	}
}
