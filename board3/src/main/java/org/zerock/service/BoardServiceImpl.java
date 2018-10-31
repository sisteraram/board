package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardVO;
import org.zerock.domain.PageParam;
import org.zerock.mapper.BoardAttachMapper;
import org.zerock.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private BoardAttachMapper attachMapper;
	
	
	@Override
	public List<BoardVO> getList(PageParam param) {

		return mapper.getList(param);
	}
	
	@Override
	public void register(BoardVO vo) {
		log.info("register...." + vo);
		
		mapper.register(vo);
		if(vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
			return;
		}
		vo.getAttachList().forEach(attach ->{
			
			attach.setBno(vo.getBno());
			attachMapper.insert(attach);
			
		});
	}

	@Override
	public BoardVO read(BoardVO vo) {

		return mapper.read(vo);
	}

	@Override
	public int modify(BoardVO vo) {

		return mapper.modify(vo);
	}

	@Override
	public int delete(BoardVO vo) {

		return mapper.delete(vo);
	}

	@Override
	public int count(PageParam param) {
		
		return mapper.count(param);
	}

}
