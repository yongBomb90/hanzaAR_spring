package bit.team42.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import bit.team42.domain.Criteria;
import bit.team42.domain.PageMaker;
import bit.team42.domain.QReplyVO;
import bit.team42.service.QReplyService;

@RestController
@RequestMapping("/replies")
public class QReplyController {

	private static final Logger logger = LoggerFactory.getLogger(PlayController.class);

	@Inject
	private QReplyService service;

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody QReplyVO vo) {

		ResponseEntity<String> entity = null;
		try {
			service.addReply(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/all/{qno}", method = RequestMethod.GET)
	public ResponseEntity<List<QReplyVO>> list(@PathVariable("qno") Integer qno) {

		ResponseEntity<List<QReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<>(service.listReply(qno), HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "/{qrno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> update(@PathVariable("qrno") Integer qrno, @RequestBody QReplyVO vo) {

		ResponseEntity<String> entity = null;
		try {
			vo.setQrno(qrno);
			service.modifyReply(vo);

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/{qrno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("qrno") Integer qrno) {

		ResponseEntity<String> entity = null;
		try {
			service.removeReply(qrno);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/{qno}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("qno") Integer qno,
			@PathVariable("page") Integer page) {

		ResponseEntity<Map<String, Object>> entity = null;

		try {
			Criteria cri = new Criteria();
			cri.setPage(page);

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);

			Map<String, Object> map = new HashMap<String, Object>();
			List<QReplyVO> list = service.listReplyPage(qno, cri);

			map.put("list", list);

			int replyCount = service.count(qno);
			pageMaker.setTotalCount(replyCount);

			map.put("pageMaker", pageMaker);

			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
