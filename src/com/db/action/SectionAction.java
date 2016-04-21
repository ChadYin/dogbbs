package com.db.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.db.model.Section;
import com.db.service.SectionService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Scope("request")
@Controller("sectionAction")
@SuppressWarnings("serial")
public class SectionAction extends ActionSupport {
	private int flag;
	private Section section;

	@Autowired
	@Qualifier("sectionServiceImpl")
	private SectionService sectionService;

	public String sectionlist() throws Exception {
		List<Section> sectionlist = sectionService.sectionlist();
		ActionContext.getContext().put("sectionlist", sectionlist);
		ActionContext.getContext().put("flag", flag);
		return SUCCESS;
	}

	public String addsection() throws Exception {
		if (sectionService.addsection(section)) {
			return SUCCESS;
		} else {
			return INPUT;
		}

	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public Section getSection() {
		return section;
	}

	public void setSection(Section section) {
		this.section = section;
	}

	public SectionService getSectionService() {
		return sectionService;
	}

	public void setSectionService(SectionService sectionService) {
		this.sectionService = sectionService;
	}

}
