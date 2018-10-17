package com.etc.huangchong.dao;

import java.util.List;

import com.etc.huangchong.entity.Homestay;

public interface SearchDao {
	/**
	 * 根据地区搜索房源
	 * @param accomArea
	 * @return
	 */
	List<Homestay> querySearch(String accomArea);
	

}
