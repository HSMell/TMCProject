package com.tmc.comm.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tmc.comm.dao.BoardDto;
import com.tmc.comm.dao.IBoardDao;

@Service
public class BoardService implements IBoardService{
	@Value("${fileUploadPath}")
	String fileUploadPath;
	 
	@Autowired
	private IBoardDao boardDao;
	
	public int insertPost(String board_num, String user_id, String post_title, String post_content, List<MultipartFile> fileList) {
		int result = 0;
		int postResult = 0;
		int fileResult = 0;
  
		try {
			if(fileList.size()>0 &&!"".equals(fileList.get(0).getOriginalFilename())) {
				String post_num = boardDao.getMaxPostNo();
	         
				postResult = boardDao.insertPost(post_num, board_num, user_id, post_title, post_content);         
            
				System.out.println("fileUploadPath ::::::::::::::::" + fileUploadPath);
            
	            //파일 실제 경로
	            String realPath = fileUploadPath + "upload\\post\\";              
	             
	             
	             //경로 상에 폴더가 없으면 만들기           
	            File dir = new File(realPath);
	             if(!dir.exists()) {
	                  dir.mkdirs();
	                  }           
	               
	                //파일 넣기
	             for (MultipartFile mf : fileList) {
					//실제 파일 이름
					String original_file_name = mf.getOriginalFilename();

					//시간 + 실제 파일 이름
					String save_file_name = System.currentTimeMillis() + original_file_name;
					  
					
					//파일 저장 경로                 
					String savePath = realPath + save_file_name;
					  
					// DB저장 경로
					String dbPath = "/upload/post/";
					  
					// 파일 저장
					File o_file = new File(savePath);               
					mf.transferTo(o_file);         
					   
					String file_num = boardDao.getMaxFileNo(post_num);
					//String file_num = postDao.getMaxFileNo(post_num).equals(null) ? "F0000001" : postDao.getMaxFileNo(post_num);
					   
					fileResult = boardDao.insertFile(file_num, dbPath, post_num, save_file_name, original_file_name);
	               }         
		         }
		      
		      }
		      //파일관련 에러 반환
		      catch (IOException io) {
		         System.out.println(io.getMessage());
		      }
		      catch (Exception e) {
		         System.out.println(e.getMessage());
		      }
		      
		      if(postResult==0||fileResult==0) {
		         result = 0;
		      }
		      else
		         result = 1;
		      
		      return result;
	   }
	
	public List<BoardDto> boardList(){
	      
	      List<BoardDto> boardList = boardDao.boardList();
	      return boardList;
	   }
}
