package egovframework.example.event.service.impl;

import egovframework.example.event.service.EventVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("EventMapper")
public interface EventMapper {

	EventVO selectProductById(String id);
}
