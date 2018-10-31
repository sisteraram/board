package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	
	private long bno;
	private int views;
	private String title, writer, content, del;
	private Date regdate, updatedate;
	
	private List<BoardAttachVO> attachList;
}
