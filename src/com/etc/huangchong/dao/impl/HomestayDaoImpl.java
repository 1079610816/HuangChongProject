package com.etc.huangchong.dao.impl;

import java.util.List;

import com.etc.huangchong.dao.HomestayDao;
import com.etc.huangchong.entity.Homestay;
import com.etc.huangchong.util.BaseDao;

public class HomestayDaoImpl implements HomestayDao {

	@Override
	public List<Homestay> queryHomestay() {
		String sql="SELECT accommodation.accomId,accommodation.accomTitle,accommodation.accomIntro,accommodation.accomArea,accommodation.accomAddress,accomStatus, accommodation.houseType,accommodation.price,users.userName FROM accommodation ,users WHERE accommodation.userId = users.userId";
		List<Homestay> list=(List<Homestay>)BaseDao.select(sql, Homestay.class);
		return list;
	}

	@Override
	public boolean homestayUpdate(Homestay homestay) {
		String sql="UPDATE accommodation SET accomTitle = ?, accomIntro = ?, accomArea = ?, accomAddress = ?, accomStatus = ?, houseType = ?, price=? WHERE accomId = ?";
		
		return BaseDao.execute(sql, homestay.getAccomTitle(),homestay.getAccomIntro(),homestay.getAccomArea(),homestay.getAccomAddress(),homestay.getAccomStatus(),homestay.getHouseType(),homestay.getPrice(),homestay.getAccomId())>0;
	}

	@Override
	public boolean homestaydel(int id) {
		String sql="delete from accommodation where accomId = ?";
		return BaseDao.execute(sql, id)>0;
	}

	@Override
	public boolean homestayAdd(Homestay h, int userId) {
		String sql="insert into accommodation values(null,?,?,?,?,?,?,?,?)";
		return BaseDao.execute(sql, h.getAccomTitle(),h.getAccomIntro(),h.getAccomArea(),h.getAccomAddress(),h.getAccomStatus(),h.getHouseType(),userId,h.getPrice())>0;
	}

	@Override
	public boolean homestayBatchDel(String sql) {
		
		return BaseDao.execute(sql)>0;
	}

	@Override
	public Homestay singleHomestay(int id) {
		String sql="select * from accommodation where accomId = ?";
		List<Homestay> list=(List<Homestay>)BaseDao.select(sql, Homestay.class, id);
		return list.get(0);
	}

	@Override
	public List<Homestay> queryLandlordHomestay(int userId) {
		// TODO Auto-generated method stub
		String sql="SELECT accomId,accomTitle,accomIntro,accomArea,accomAddress,accomStatus, houseType,price FROM accommodation WHERE  userId=?";
		List<Homestay> list=(List<Homestay>)BaseDao.select(sql, Homestay.class, userId);
		return list;
	}

	@Override
	public List<Homestay> queryLandlordHomestay(int userId, int accomStatus) {
		// TODO Auto-generated method stub
		String sql="SELECT accomId,accomTitle,accomIntro,accomArea,accomAddress,accomStatus, houseType,price FROM accommodation WHERE userId=? and accomStatus=?";
		List<Homestay> list=(List<Homestay>)BaseDao.select(sql, Homestay.class, userId,accomStatus);
		return list;
	}

	

}
