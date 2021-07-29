package com.tmc.comm.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tmc.comm.service.IBoardService;


@Controller
public class BoardController {

	@Autowired
	IBoardService bService; 
	
	@RequestMapping("/")
	 public String root(Model model) throws Exception {
		
		model.addAttribute("boardList", bService.boardList());
		
		return "/board/board";
	   }
	
	 @RequestMapping("/postwrite")
	   public String boardadd(HttpServletRequest req) {	               
	         return "/board/postwrite";
	   }  	 
	 
	 @ResponseBody
	 @RequestMapping("/requestupload")
	 public String requestupload2(@RequestParam("article_file") List<MultipartFile> fileList,HttpServletRequest req) {
	  
		 String board_num = req.getParameter("boardNum");
		 String user_id = req.getParameter("user_id");
		 String post_content = req.getParameter("text_content");
		 String post_title= req.getParameter("text_title");
	
		 String result = "";
		 int resultint = bService.insertPost(board_num, user_id, post_title, post_content, fileList);
		  
		 if(resultint == 0) {
			 result = "redirect:/postwrite";
			 } else {
				 result = "redirect:/";   
			 }      
		  
		 return result;
		 }
}
