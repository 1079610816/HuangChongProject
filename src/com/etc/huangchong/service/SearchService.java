package com.etc.huangchong.service;

import java.util.List;

import com.etc.huangchong.entity.Homestay;
import com.etc.huangchong.util.PageData;

public interface SearchService {

	List<Homestay> getQuerySearch(String accomArea);
	PageData<Homestay> getQuerySearchPage(int page,int pageSize,String accomArea);
}
