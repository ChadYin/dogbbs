package com.db.dao;

import java.util.List;

import com.db.model.Section;

public interface SectionDao {

	List<Section> sectionlist();

	boolean addsection(Section section);

}
