package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.PageParam;

public interface BoardService {
	
public List<BoardVO> getList(PageParam param);
	
	public void register(BoardVO vo);
	
	public BoardVO read(BoardVO vo);
	
	public int modify(BoardVO vo);
	
	public int delete(BoardVO vo);
	
	public int count(PageParam param);
}
