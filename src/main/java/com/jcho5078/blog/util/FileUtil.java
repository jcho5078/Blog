package com.jcho5078.blog.util;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.jcho5078.blog.vo.BoardVO;

@Component(value = "FileUtil")
public class FileUtil {
	
	private static final String filePath = "C://uploads//";
	
	public List<Map<String, Object>> parseInsertFileInfo(BoardVO bdvo, 
			MultipartHttpServletRequest fileRequest) throws Exception{
		
		Iterator<String> iterator = fileRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originFileName = null;
		String originFileExtension = null;
		String storedFileName = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;
		
		int bdnum = bdvo.getBdnum();
		
		File file = new File(filePath);
		
		if(file.exists() == false) {
			file.mkdirs();//
		}
		
		while (iterator.hasNext()) {
			multipartFile = fileRequest.getFile(iterator.next());
			
			if(multipartFile.isEmpty() == false) {
				originFileName = multipartFile.getOriginalFilename();
				originFileExtension = originFileName.substring(originFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originFileExtension;
				
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("bdnum", bdnum);
				listMap.put("origin_file_name", originFileName);
				listMap.put("store_file_name", storedFileName);
				listMap.put("file_size", multipartFile.getSize());//sql문 요소 이름 그대로의 속성 이름으로 넣는다.
				list.add(listMap);
			}
		}
		
		System.out.println("앙: "+ list);
		
		return list;
	}

	private String getRandomString() {//저장되는 파일이름에 넣기위한 랜덤 문자열 생성
		
		return UUID.randomUUID().toString().replaceAll("-", "");//replaceAll()을 이용해 파일이름에 들어가서는 안될 특수문자 삭제
	}
}
