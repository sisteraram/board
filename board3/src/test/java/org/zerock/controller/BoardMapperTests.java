package org.zerock.controller;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	
	@Setter(onMethod_=@Autowired)
	private BoardService service;
	
	@Test
	@Transactional
	@Rollback(false)
	public void testRegister() {
		List<BoardAttachVO> attachList = new ArrayList<>();
		BoardAttachVO attach = new BoardAttachVO();
		BoardVO vo = new BoardVO();
		attach.setBno(vo.getBno());
		attach.setFileName("hdfadsfaf");
		attach.setFileType(true);
		attach.setUploadPath("cccccccc");
		attach.setUuid("dfdfqefdafadfadf");
		attachList.add(attach);
		vo.setTitle("되라고");
		vo.setWriter("user02");
		vo.setContent("좀");
		vo.setAttachList(attachList);
		
		service.register(vo);
	}
}
