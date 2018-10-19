package com.etc.huangchong.service.impl;

import java.util.List;

import com.etc.huangchong.dao.HomestayDao;
import com.etc.huangchong.dao.impl.HomestayDaoImpl;
import com.etc.huangchong.entity.Homestay;
import com.etc.huangchong.service.HomestayService;

public class HomestayServiceImpl implements HomestayService {
	HomestayDao hd=new HomestayDaoImpl();
	@Override
	public List<Homestay> getQueryHomestay() {
		List<Homestay> list=hd.queryHomestay();
		return list;
	}
	@Override
	public boolean getHomestayUpdate(Homestay homestay) {
		// TODO Auto-generated method stub
		return hd.homestayUpdate(homestay);
	}
	@Override
	public boolean getHomestayDel(int id) {
		// TODO Auto-generated method stub
		return hd.homestaydel(id);
	}
	@Override
	public boolean getHomestayAdd(Homestay h, int id) {
		// TODO Auto-generated method stub
		return hd.homestayAdd(h, id);
	}
	@Override
	public boolean getHomestayBatchDel(String sql) {
		// TODO Auto-generated method stub
		return hd.homestayBatchDel(sql);
	}
	@Override
	public Homestay getSingleHomestay(int id) {
		// TODO Auto-generated method stub
		return hd.singleHomestay(id);
	}
	@Override
	public List<Homestay> getQueryLandlordHomestay(int userId) {
		// TODO Auto-generated method stub
		return hd.queryLandlordHomestay(userId);
	}
	@Override
	public List<Homestay> getQueryLandlordHomestay(int userId, int accomStatus) {
		// TODO Auto-generated method stub
		return hd.queryLandlordHomestay(userId, accomStatus);
	}
	

}
