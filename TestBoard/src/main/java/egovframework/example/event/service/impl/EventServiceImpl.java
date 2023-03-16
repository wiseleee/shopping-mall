package egovframework.example.event.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.board.service.SampleVO;
import egovframework.example.calendar.web.ScreenController;
import egovframework.example.event.service.EventService;
import egovframework.example.event.service.EventVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("EventService")
public class EventServiceImpl extends EgovAbstractServiceImpl implements EventService {
	
	private static final Logger log = LoggerFactory.getLogger(EventServiceImpl.class);

	@Resource(name="EventMapper")
	private EventMapper eventMapper;
    
    @Override
    public EventVO getProductById(String id) {
    	log.debug("check1:::"+id);
        return eventMapper.selectProductById(id);
    }
	
}
