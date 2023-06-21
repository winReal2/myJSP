package fileupload;

public class FileDto {
	//form에서 넘어온 값을 dto호출 > dao 삽입
	private String idx;
	private String name;
	private String title;
	private String cate;
	private String ofile;
	private String sfile;
	private String postdate;
	
	public FileDto() {
		// TODO Auto-generated constructor stub
	}
	
	//생성자
	public FileDto(String idx, String name, String title, String cate, String ofile, String sfile, String postdate) {
		super();
		this.idx = idx;
		this.name = name;
		this.title = title;
		this.cate = cate;
		this.ofile = ofile;
		this.sfile = sfile;
		this.postdate = postdate;
	}


	//세터게터
	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCate() {
		return cate;
	}

	public void setCate(String cate) {
		this.cate = cate;
	}

	public String getOfile() {
		return ofile;
	}

	public void setOfile(String ofile) {
		this.ofile = ofile;
	}

	public String getSfile() {
		return sfile;
	}

	public void setSfile(String sfile) {
		this.sfile = sfile;
	}

	public String getPostdate() {
		return postdate;
	}

	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}

}
