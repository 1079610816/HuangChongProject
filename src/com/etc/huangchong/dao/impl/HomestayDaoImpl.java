package com.etc.huangchong.dao.impl;

import java.util.List;

import com.etc.huangchong.dao.HomestayDao;
import com.etc.huangchong.entity.Homestay;
import com.etc.huangchong.util.BaseDao;

public class HomestayDaoImpl implements HomestayDao {

	@Override
	public List<Homestay> queryHomestay() {
		String sql="SELECT accommodation.accomId,accommodation.accomTitle,accommodation.accomIntro,accommodation.accomArea,accommodation.accomAddress,accomStatus, accommodation.peopleSum,users.userName FROM accommodation ,users WHERE accommodation.userId = users.userId";
		List<Homestay> list=(List<Homestay>)BaseDao.select(sql, Homestay.class);
		return list;
	}

	@Override
	public boolean homestayUpdate(Homestay homestay) {
		String sql="UPDATE accommodation SET accomTitle = ?, accomIntro = ?, accomArea = ?, accomAddress = ?, accomStatus = ?, peopleSum = ? WHERE accomId = ?";
		
		return BaseDao.execute(sql, homestay.getAccomTitle(),homestay.getAccomIntro(),homestay.getAccomArea(),homestay.getAccomAddress(),homestay.getAccomStatus(),homestay.getPeopleSum(),homestay.getAccomId())>0;
	}

}
