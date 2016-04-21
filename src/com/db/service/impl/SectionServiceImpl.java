package com.db.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.db.dao.SectionDao;
import com.db.model.Section;
import com.db.service.SectionService;

@Scope("singleton")
@Service("sectionServiceImpl")
public class SectionServiceImpl implements SectionService{
	
	@Autowired
	private SqlSessionTemplate SqlSessionTemplate;

	@Override
	public List<Section> sectionlist() {
		SectionDao sectionDao = SqlSessionTemplate.getMapper(SectionDao.class);
		return sectionDao.sectionlist();
	}

	@Override
	public boolean addsection(Section section) {
		SectionDao sectionDao = SqlSessionTemplate.getMapper(SectionDao.class);
		return sectionDao.addsection(section);
	}

}
