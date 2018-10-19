package com.etc.huangchong.dao;

import java.util.List;

import com.etc.huangchong.entity.Homestay;

public interface HomestayDao {
	//得到所有民宿信息
	List<Homestay> queryHomestay();
	boolean homestayUpdate(Homestay homestay);
	boolean homestaydel(int id);
	boolean homestayAdd(Homestay h,int userId);
	boolean homestayBatchDel(String sql);
	Homestay singleHomestay(int id);
	/**
	 * 查询某个房东的发布全部房屋
	 * 
	 * @param userId  房东
	 * @return List<Homestay>房屋集合
	 */
	List<Homestay> queryLandlordHomestay(int userId);
	/**
	 * 查询某个房东在某个状态发布的房屋
	 * @param userId 房东
	 * @param accomStatus 发布状态
	 * @return List<Homestay>房屋集合
	 */
	List<Homestay> queryLandlordHomestay(int userId,int accomStatus);
}
