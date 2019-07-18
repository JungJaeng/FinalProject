package web.dto;

import java.io.File;

public class Sightseeing {

	private String contenttypeid; // 관광명소타입
	private int contentid; // 관광명소id
	private String add1; // 주소
	private String add2; // 상세주소
	private String cat1; // 대분류
	private String createdtime; // 등록날짜
	private File firstimage; // 원본이미지
	private File firstimage2; // 썸네일이미지
	private String mapx; // x좌표
	private String mapy; // y좌표
	private int mlevel; // map level응답
	private String modifiedtime; // 수정일
	private int sigungucode; // 시군구 코드
	private String title; // 관광명소 이름
	private int zipcode; // 우편번호
	private int resultCode; //응답코드
	private String resultMsg; // 응답메시지
	private int numOfRows; // 한페이지 결과 수
	private int pageNo; // 페이지번호
	private int totalCount; // 전체 결과 수
	 
	
	@Override
	public String toString() {
		return "Sightseeing [contenttypeid=" + contenttypeid + ", contentid=" + contentid + ", add1=" + add1 + ", add2="
				+ add2 + ", cat1=" + cat1 + ", createdtime=" + createdtime + ", firstimage=" + firstimage
				+ ", firstimage2=" + firstimage2 + ", mapx=" + mapx + ", mapy=" + mapy + ", mlevel=" + mlevel
				+ ", modifiedtime=" + modifiedtime + ", sigungucode=" + sigungucode + ", title=" + title + ", zipcode="
				+ zipcode + ", resultCode=" + resultCode + ", resultMsg=" + resultMsg + ", numOfRows=" + numOfRows
				+ ", pageNo=" + pageNo + ", totalCount=" + totalCount + "]";
	}
	
	public String getContenttypeid() {
		return contenttypeid;
	}
	public void setContenttypeid(String contenttypeid) {
		this.contenttypeid = contenttypeid;
	}
	public int getContentid() {
		return contentid;
	}
	public void setContentid(int contentid) {
		this.contentid = contentid;
	}
	public String getAdd1() {
		return add1;
	}
	public void setAdd1(String add1) {
		this.add1 = add1;
	}
	public String getAdd2() {
		return add2;
	}
	public void setAdd2(String add2) {
		this.add2 = add2;
	}
	public String getCat1() {
		return cat1;
	}
	public void setCat1(String cat1) {
		this.cat1 = cat1;
	}
	public String getCreatedtime() {
		return createdtime;
	}
	public void setCreatedtime(String createdtime) {
		this.createdtime = createdtime;
	}
	public File getFirstimage() {
		return firstimage;
	}
	public void setFirstimage(File firstimage) {
		this.firstimage = firstimage;
	}
	public File getFirstimage2() {
		return firstimage2;
	}
	public void setFirstimage2(File firstimage2) {
		this.firstimage2 = firstimage2;
	}
	public String getMapx() {
		return mapx;
	}
	public void setMapx(String mapx) {
		this.mapx = mapx;
	}
	public String getMapy() {
		return mapy;
	}
	public void setMapy(String mapy) {
		this.mapy = mapy;
	}
	public int getMlevel() {
		return mlevel;
	}
	public void setMlevel(int mlevel) {
		this.mlevel = mlevel;
	}
	public String getModifiedtime() {
		return modifiedtime;
	}
	public void setModifiedtime(String modifiedtime) {
		this.modifiedtime = modifiedtime;
	}
	public int getSigungucode() {
		return sigungucode;
	}
	public void setSigungucode(int sigungucode) {
		this.sigungucode = sigungucode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getZipcode() {
		return zipcode;
	}
	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}
	public int getResultCode() {
		return resultCode;
	}
	public void setResultCode(int resultCode) {
		this.resultCode = resultCode;
	}
	public String getResultMsg() {
		return resultMsg;
	}
	public void setResultMsg(String resultMsg) {
		this.resultMsg = resultMsg;
	}
	public int getNumOfRows() {
		return numOfRows;
	}
	public void setNumOfRows(int numOfRows) {
		this.numOfRows = numOfRows;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	
	
}
