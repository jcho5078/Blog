package com.jcho5078.blog.controller;

import java.io.File;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jcho5078.blog.dao.UserDAO;
import com.jcho5078.blog.service.BoardService;
import com.jcho5078.blog.vo.BoardVO;
import com.jcho5078.blog.vo.CommVO;

@Controller
public class BoardController {
	
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private BoardService boardService;
	
	//HomeController에 메인화면 게시글 출력란 존재.
	
	//게시글 조회
	@RequestMapping(value="board/readboard", method = RequestMethod.GET)
	public String selectBoard(Model model, BoardVO vo, Principal principal) throws Exception {
		
		if(principal != null) {//유저가 조회했을 경우
		
			String id = principal.getName();
			String name = userDAO.getName(id).getName();
			
			model.addAttribute("UserId", id);
			model.addAttribute("writer", name);
		}else {
			model.addAttribute("writer", null);
		}
		model.addAttribute("bdnum", vo.getBdnum());
		model.addAttribute("viewBoard", boardService.selectBoard(vo.getBdnum()));
		model.addAttribute("CommentList", boardService.CommList(vo.getBdnum()));
		model.addAttribute("countComm", boardService.countComm(vo.getBdnum()));
		
		List<Map<String, Object>> fileList = boardService.viewFile(vo.getBdnum());
		System.out.println("응애: "+ fileList);//리스트를 출력해 확인해보면, hashMap의 각 요소의 키에 접근하기 위해서는 대문자로 접근해야함.
		model.addAttribute("fileList", fileList);
		
		return "board/boardView";
	}
	
	//게시글 작성
	@RequestMapping(value = "board/insert")
	public String insertBoard(BoardVO vo, Principal principal, MultipartHttpServletRequest fileRequest,
			@RequestParam String title, @RequestParam String content, HttpServletRequest request) throws Exception {
		
		String am_pw = request.getParameter("am_pw");
		String am_writer = request.getParameter("am_writer");
		String writer = request.getParameter("writer");
		
		if(principal == null) {//비회원 글쓰기
			System.out.println("principle is null!!");
			
			vo.setWriter(am_writer);
			vo.setPw(am_pw);
			vo.setIsuser(0);
		}else {//회원 글쓰기
			
			vo.setIsuser(1);
			vo.setWriter(writer);
			vo.setPw("user");
		}
		
		vo.setTitle(title);
		vo.setContent(content);
		
		boardService.insertBoard(vo, fileRequest);
		
		System.out.println("냥: "+vo.getBdnum());
		
		String url = "redirect:/board/readboard?bdnum="+vo.getBdnum();
		
		return url;
	}
	
	//게시글 삭제(유저)
	@RequestMapping(value = "board/deleteUser", method = RequestMethod.POST)
	public String deleteBoardUser(BoardVO vo) {
		
		boardService.deleteBoardUser(vo);
		
		return "redirect:/";
	}
	
	//게시글 삭제(게스트)
	@RequestMapping(value = "board/delete", method = RequestMethod.POST)
	public String deleteBoard(BoardVO vo) {
		
		boardService.deleteBoard(vo);
		
		return "redirect:/";
	}
	
	//댓글 입력 (게시글 댓글 카운트 이 메소드에 넣기)
	@RequestMapping(value = "board/insertComm", method = RequestMethod.POST)
	public String insertComm(CommVO vo, Principal principal) {
		
		String id = principal.getName();
		String name = userDAO.getName(id).getName();
		
		if(vo.getWriter() == null) {
			System.out.println("게스트");
		}else {
			System.out.println("유저");
			vo.setWriter(name);//jstl의 foreach에서 가져온 값은 같아보여도 다르기에 JAVA의 값으로 DB에 삽입.
		}
		
		boardService.insertBoardCommCount(vo.getBdnum());

		boardService.insertComm(vo);
		
		String url = "redirect:/board/readboard?bdnum="+vo.getBdnum();
		
		return url;
	}
	
	//댓글삭제(게스트)
	@RequestMapping(value = "board/deleteComm", method = RequestMethod.POST)
	public String deleteComm(CommVO vo) {
		
		boardService.deleteComm(vo);
		String url = "redirect:/board/readboard?bdnum="+vo.getBdnum();
		
		return url;
	}
	
	//댓글삭제(유저)
	@RequestMapping(value = "board/deleteCommUser", method = RequestMethod.POST)
	public String deleteCommUser(CommVO vo, @RequestParam String writer, Principal principal) {
		
		String id = principal.getName();
		String name = userDAO.getName(id).getName();
		name = name.trim();
		System.out.println("현재 유저: "+ name);		
		
		vo.setWriter(name);
		
		boardService.deleteCommUser(vo);
		
		String url = "redirect:/board/readboard?bdnum="+vo.getBdnum();
		
		return url;
	}
	
	//파일 다운로드
	@RequestMapping(value = "board/fileDownload")
	public void downloadFile(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception {
		
		Map<String, Object> result = boardService.downloadFile(map);//받아온 hashMap에서 데이터를 뽑아 새로운 Map객체에 저장
		
		String storedFileName = (String) result.get("STORE_FILE_NAME");
		String originFileName = (String) result.get("ORIGIN_FILE_NAME");
		
		//파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환.
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\uploads\\" + storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
}
