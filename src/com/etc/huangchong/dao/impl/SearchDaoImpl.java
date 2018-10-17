package com.etc.huangchong.dao.impl;

import java.util.List;

import com.etc.huangchong.dao.SearchDao;
import com.etc.huangchong.entity.Homestay;
import com.etc.huangchong.util.BaseDao;

public class SearchDaoImpl implements SearchDao {

	private BaseDao bd = new BaseDao();
	@Override
	public List<Homestay> querySearch(String accomArea) {
		// TODO Auto-generated method stub
		String sql = "select accommodation.accomId,accommodation.accomTitle,accommodation.accomIntro,accommodation.accomArea,accommodation.accomAddress,accommodation.accomStatus,accommodation.houseType,accommodation.price,users.userName FROM accommodation,users WHERE accommodation.userId=users.userId AND accommodation.accomArea=? ";
		return (List<Homestay>)bd.select(sql, Homestay.class, accomArea);
	}

}
