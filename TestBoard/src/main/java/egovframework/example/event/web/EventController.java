package egovframework.example.event.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;
import java.util.List;

import egovframework.example.board.service.SampleVO;
import egovframework.example.calendar.web.ScreenController;
import egovframework.example.event.service.EventService;
import egovframework.example.event.service.EventVO;

@Controller
public class EventController {

		
		private static final Logger log = LoggerFactory.getLogger(EventController.class);

	    @Autowired
	    private EventService eventService;
	    
	    @RequestMapping(value = "/getEvent.do", method = RequestMethod.GET)
	    public String getProductDetail(@RequestParam("id") String id, Model model) {
	    	log.debug("checkcontroller::"+id);
	    	EventVO product = eventService.getProductById(id);
	    	log.debug("check::product::"+product.getImagePath());
	    	
	        model.addAttribute("event", product);
	        return "/event/eventDetail";
	    }
	    
	    @RequestMapping(value = "/showEvent.do")
	    public String showEvent() {
	        return "/event/eventList";
	    }
	    	    
	
}
