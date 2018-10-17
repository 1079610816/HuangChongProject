package com.etc.huangchong.dao.impl;

import java.util.List;

import com.etc.huangchong.dao.SearchDao;
import com.etc.huangchong.entity.Homestay;
import com.etc.huangchong.util.BaseDao;
import com.etc.huangchong.util.PageData;

public class SearchDaoImpl implements SearchDao {

	private BaseDao bd = new BaseDao();
	@Override
	public List<Homestay> querySearch(String accomArea) {
		// TODO Auto-generated method stub
		String sql = "select a.accomId,a.accomTitle,a.accomIntro,a.accomArea,a.accomAddress,a.accomStatus,a.houseType,a.price,u.userName,COUNT(c.accomId) as commentsum from accommodation as a inner join users as u on a.userId=u.userId left join comment as c on a.accomId=c.accomId where a.accomArea=? group by a.accomId";
		return (List<Homestay>)bd.select(sql, Homestay.class, accomArea);
	}

	@Override
	public PageData querySearchPage(int page, int pageSize,String accomArea) {
		// TODO Auto-generated method stub
		String sql = "select a.accomId,a.accomTitle,a.accomIntro,a.accomArea,a.accomAddress,a.accomStatus,a.houseType,a.price,u.userName,COUNT(c.accomId) as commentsum from accommodation as a inner join users as u on a.userId=u.userId left join comment as c on a.accomId=c.accomId where a.accomArea=? group by a.accomId";
		return bd.getPage(sql, page, pageSize, Homestay.class, accomArea);
	}
}
