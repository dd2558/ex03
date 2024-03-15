package org.zerock.service;

import static org.junit.Assert.assertNotNull;

import java.lang.ProcessHandle.Info;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private BoardService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		
	BoardVO board = new BoardVO();
	board.setTitle("새로 작성하는글 ser");
	board.setContent("새로 작성하는 내용 ser");
	board.setWriter("newbie ser");
	
	service.register(board);
	log.info("생성된 게시물의 번호: " + board.getBno() );
	}
	

	@Test
	public void testGetList() { // 작성된 리스트 반환
	  service.getList(new Criteria(2,10)).forEach(board->log.info(board)); }

	
	@Test
	public void testGet() {
		log.info(service.get(1L));
	}
	
	@Test
	public void testDelete() {
		//게시물 번호 존재 여부 확인
		log.info("Remove Result = " + service.remove(2L));
	}
	
	@Test
	public void testUpdate() {
		BoardVO board = service.get(1L);
		if(board == null) {
			return;
		}
			
		board.setTitle("제목을 수정합니다");
		log.info("Modify Result : " + service.modify(board));
	}
	
}
