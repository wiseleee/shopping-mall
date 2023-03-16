/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.calendar.web;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.Map.Entry;

import egovframework.example.board.service.SampleDefaultVO;
import egovframework.example.board.service.SampleVO;
import egovframework.example.board.service.TestBoardService;
import egovframework.example.calendar.service.ProductService;
import egovframework.example.cmmn.EgovSampleExcepHndlr;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;


import javax.annotation.Resource;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.fasterxml.jackson.databind.ObjectMapper;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @Class Name : EgovSampleController.java
 * @Description : EgovSample Controller Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */


@Controller
public class CalendarController {
	
	private static final Logger log = LoggerFactory.getLogger(CalendarController.class);

	@Resource(name = "ProductService")
	private ProductService productService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	
    @RequestMapping(value = "/calendar.do")
    public String showCalender() {
        return "/calendar/calendar";
    }  
    
    
    @RequestMapping(value = "/showProductDetail.do")
    public String showProductDetail() {
        return "/calendar/productDetailSlide";
    }  
    
    @RequestMapping(value = "/showProductList.do")
    public String showProductList() {
        return "/calendar/productList";
    }
    
    @RequestMapping(value = "/getProductList.do")
    public String getProductList(@ModelAttribute("searchVO") SampleDefaultVO searchVO,ModelMap model) {
    	
    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

    	HashMap<String, Object> map = new HashMap<String, Object>();
    	try {
    		
			ArrayList<HashMap<String,Object>> proList = productService.selectProductImgList(searchVO);
			log.debug("check::getProductList:::"+proList);
			model.addAttribute("resultList",proList);
			log.debug("check::searchVO::"+searchVO);
			int totCnt = productService.selectProductListTotCnt(searchVO);
			log.debug("check::totCnt:::"+totCnt);
			log.debug("check::paginationInfo:::"+paginationInfo);
			paginationInfo.setTotalRecordCount(totCnt);
			model.addAttribute("paginationInfo", paginationInfo);
	    		    
	    	
		} catch (Exception e) {
			model.addAttribute("resultList",e.getMessage());			
			e.printStackTrace();
		}

    	
    	
        return "/calendar/productList";
    }
    
    
    @GetMapping(value = "/getScreenList.do")
    public String getScreenList(@ModelAttribute("searchVO") SampleDefaultVO searchVO , ModelMap model) {

    	HashMap<String, Object> map = new HashMap<String, Object>();
    	try {
    	
			ArrayList<HashMap<String,Object>> proList = productService.selectProductImgList(searchVO);
			log.debug("check::getProductList:::"+proList);
			model.addAttribute("resultList",proList);
	    		    
	    	
		} catch (Exception e) {
			model.addAttribute("resultList",e.getMessage());			
			e.printStackTrace();
		}

    	
    	
        return "/calendar/screenList";
    }
    
    /**
    @RequestMapping(value = "/getProduct.do")
    public String getProduct(String subId) {
    	log.debug("check:::id:::"+subId);
    	HashMap<String,Object> map = new HashMap<String,Object>();
    	map.put("subId", subId);
    	ModelMap model = new ModelMap();
		try {
			ArrayList<HashMap<String,Object>> imgList =  productService.selectProductImgList(map);
			model.addAttribute("resultList",imgList);
			log.debug("check::::"+imgList);
		} catch (Exception e) {
			model.addAttribute("error",e.getMessage());			
			model.addAttribute("errorCode",-1);			
		}
    	
        return "/calendar/productDetail";
    }  
    */
    @RequestMapping(value = "/getProduct.do")
    public String getProduct( String id , ModelMap model) {

    	HashMap<String,Object> map = new HashMap<String,Object>();
    	map.put("id", id);    	
		try {
			EgovMap imgMap =  productService.selectProductImgList(map);
			model.addAttribute("result",imgMap);
			log.debug("check::::"+imgMap);
		} catch (Exception e) {
			model.addAttribute("error",e.getMessage());			
			model.addAttribute("errorCode",-1);			
		}
    	
        return "/calendar/productDetail";
    }
    
    @PostMapping(value = "/saveProduct.do")
    public String saveProduct(@RequestBody String formData)  {
    	ModelAndView mav = new ModelAndView();
		/*
		 * JSONObject json = new JSONObject(formData); log.debug("json check::::"+json);
		 */
    	ObjectMapper mapper = new ObjectMapper();
        try {
			HashMap<String,Object> changeMap = mapper.readValue(formData, 
													new TypeReference<HashMap<String, Object>>(){});			
			// map:::::{quantity=1, size=230, price=90}
			UUID uuid = UUID.randomUUID();
			log.debug("check:::::"+uuid);
			changeMap.put("pid",uuid.toString());
			double price=Double.parseDouble(changeMap.get("price").toString());
			changeMap.put("price",price);
			int quantity=Integer.parseInt(changeMap.get("quantity").toString());
			int size=Integer.parseInt(changeMap.get("size").toString());
			double totalPrice=price*quantity;
			log.debug("totalPrice:::::"+totalPrice);
			changeMap.put("totalPrice", totalPrice);
			log.debug("changeMap:::::"+changeMap);
			int result =productService.addProduct(changeMap);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
		}    	
    	//log.debug("check::::"+price);
    	
        return "/calendar/productList";
    }


	
    
}
