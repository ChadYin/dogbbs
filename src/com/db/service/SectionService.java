package com.db.service;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.db.model.Section;

@Scope("singleton")
@Service("sectionService")
public interface SectionService {

	List<Section> sectionlist();

	boolean addsection(Section section);

}
