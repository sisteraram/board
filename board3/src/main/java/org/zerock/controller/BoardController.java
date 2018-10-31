package org.zerock.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.PageParam;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@AllArgsConstructor
@RequestMapping("/board/*")
@Log4j
public class BoardController {
	
	private BoardService service;
	
	@GetMapping("/list")
	public void listGET(@ModelAttribute("pageObj") PageParam param, Model model) {
		param.setTotal(service.count(param));
		model.addAttribute("list", service.getList(param));
	}
	
	@GetMapping("/register")
	public void registerGET() {
		
	}
	
	@PostMapping("/register")
	public String registerPOST(BoardVO vo, RedirectAttributes rttr) {
		
		log.info("-----------------------------------------");
		if(vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> log.info(attach));
		}
		log.info("-----------------------------------------");
		
		service.register(vo);
		rttr.addFlashAttribute("result", vo.getBno());
		
		return "redirect:/board/list";
	}
	
	@GetMapping({"/read", "/modify"})
	public void readGET(@ModelAttribute("pageObj") PageParam param, BoardVO vo, Model model) {
		
		model.addAttribute("board",service.read(vo));
	}
	
	@PostMapping("/modify")
	public String modifyPOST(@ModelAttribute("pageObj") PageParam param, BoardVO vo, RedirectAttributes rttr) {
		
		rttr.addFlashAttribute("result", service.modify(vo) == 1? "SUCCESS":"FAIL");
		
		return "redirect:/board/list";
	}
	
	@PostMapping("/delete")
	public String deletePOST(BoardVO vo, RedirectAttributes rttr) {
		
		rttr.addFlashAttribute("result", service.delete(vo) == 1? "SUCCESS":"FAIL");
		
		return "redirect:/board/list";
	}
	
}
