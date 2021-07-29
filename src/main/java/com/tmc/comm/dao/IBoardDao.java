package com.tmc.comm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface IBoardDao {

	public int insertPost(@Param("post_num") String post_num, 
			@Param("board_num") String board_num, 
			@Param("user_id") String user_id,
			@Param("post_title") String post_title, 
			@Param("post_content") String post_content
			);
	
	public int insertFile(@Param("file_num") String file_num, 
			@Param("file_path") String file_path, 
			@Param("post_num") String post_num,
			@Param("save_file_name") String save_file_name,
			@Param("original_file_name") String original_file_name);
	
	public String getMaxPostNo();
	
	public String getMaxFileNo(@Param("post_num") String post_num);
	
	public List<BoardDto> boardList();
}
