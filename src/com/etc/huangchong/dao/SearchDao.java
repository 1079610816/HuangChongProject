package com.etc.huangchong.dao;

import java.util.List;

import com.etc.huangchong.entity.Homestay;
import com.etc.huangchong.util.PageData;

public interface SearchDao {
	/**
	 * 根据地区搜索房源
	 * @param accomArea
	 * @return
	 */
	List<Homestay> querySearch(String accomArea);
	/**
	 * 分页实现
	 * @param page
	 * @param pageSize
	 * @param accomArea
	 * @return
	 */
	PageData querySearchPage(int page ,int pageSize,String accomArea);
	

}
