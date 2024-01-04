package net.daum.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class TestBoardVO {

	private int bno;
	private String bname;
	private String btitle;
	private String bcont;
	private int bhit;
	private Date bdate;
	
	
}
