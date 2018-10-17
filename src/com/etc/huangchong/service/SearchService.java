package com.etc.huangchong.service;

import java.util.List;

import com.etc.huangchong.entity.Homestay;

public interface SearchService {

	List<Homestay> getQuerySearch(String accomArea);
}
