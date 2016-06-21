package bit.team42.domain;

public class MarkerVO {
	
	private Integer markerid;
	private String markerpath;
	
	public Integer getMarkerid() {
		return markerid;
	}
	
	public void setMarkerid(Integer markerid) {
		this.markerid = markerid;
	}
	
	public String getMarkerpath() {
		return markerpath;
	}
	
	public void setMarkerpath(String markerpath) {
		this.markerpath = markerpath;
	}
	
	@Override
	public String toString() {
		return "MarkerVO [markerid=" + markerid + ", markerpath=" + markerpath + "]";
	}
	
	
	
	
	
}
