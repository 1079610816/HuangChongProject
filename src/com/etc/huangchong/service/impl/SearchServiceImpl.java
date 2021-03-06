package com.etc.huangchong.service.impl;

import java.util.List;

import com.etc.huangchong.dao.SearchDao;
import com.etc.huangchong.dao.impl.SearchDaoImpl;
import com.etc.huangchong.entity.Homestay;
import com.etc.huangchong.service.SearchService;
import com.etc.huangchong.util.PageData;

public class SearchServiceImpl implements SearchService {

	private SearchDao sd = new SearchDaoImpl();
	@Override
	public List<Homestay> getQuerySearch(String accomArea) {
		// TODO Auto-generated method stub
		return sd.querySearch(accomArea);
	}
	@Override
	public PageData<Homestay> getQuerySearchPage(int page, int pageSize, String accomArea) {
		// TODO Auto-generated method stub
		return sd.querySearchPage(page, pageSize, accomArea);
	}

}
