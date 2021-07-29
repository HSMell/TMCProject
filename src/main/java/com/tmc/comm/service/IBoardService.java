package com.tmc.comm.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.tmc.comm.dao.BoardDto;

public interface IBoardService {
	public int insertPost(
			@Param("board_num") String board_num, 
			@Param("user_id") String user_id, 
			@Param("post_title") String post_title, 
			@Param("post_content") String post_content, 
			List<MultipartFile> fileList);
	
	public List<BoardDto> boardList();
}
