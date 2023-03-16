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
package egovframework.example.calendar.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import egovframework.example.board.service.SampleDefaultVO;
import egovframework.example.board.service.SampleVO;
import egovframework.example.board.service.TestBoardService;
import egovframework.example.board.service.impl.TestBoardMapper;
import egovframework.example.calendar.service.ProductService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * @Class Name : EgovSampleServiceImpl.java
 * @Description : Sample Business Implement Class
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

@Service("ProductService")
public class ProductServiceImpl extends EgovAbstractServiceImpl implements ProductService {

	private static final Logger LOGGER = LoggerFactory.getLogger(ProductServiceImpl.class);


	// TODO mybatis 사용
	@Resource(name="ProductMapper")
	private ProductMapper productMapper;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	/**
	 * 글 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 * 
	 * */
	@Override
	public EgovMap selectProductImgList(HashMap<String,Object> map) throws Exception {
		return productMapper.selectProductImgList(map);
	}
	
	@Override
	public ArrayList<HashMap<String,Object>> selectProductImgList(SampleDefaultVO searchVO) throws Exception {
		return productMapper.selectProductList(searchVO);
	}
	
	@Override
	public int addProduct(HashMap<String,Object> map) throws Exception {
		return productMapper.addProduct(map);
	}
	 

	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception

	@Override
	public int selectBoardSampleListTotCnt(SampleDefaultVO searchVO) {
		return testBoardMapper.selectBoardSampleListTotCnt(searchVO);
	}
	
		 */
	@Override
	public int selectProductListTotCnt(SampleDefaultVO searchVO) {
		return productMapper.selectProductListTotCnt(searchVO);
	}
	
}
