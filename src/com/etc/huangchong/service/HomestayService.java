package com.etc.huangchong.service;

import java.util.List;

import com.etc.huangchong.entity.Homestay;

public interface HomestayService {
	List<Homestay> getQueryHomestay();

	boolean getHomestayUpdate(Homestay homestay);

	boolean getHomestayDel(int id);

	boolean getHomestayAdd(Homestay h, int id);

	boolean getHomestayBatchDel(String sql);

	Homestay getSingleHomestay(int id);

	/**
	 * 查询某个房东的发布全部房屋
	 * 
	 * @param userId
	 *            房东
	 * @return List<Homestay>房屋集合
	 */
	List<Homestay> getQueryLandlordHomestay(int userId);

	/**
	 * 查询某个房东在某个状态发布的房屋
	 * 
	 * @param userId
	 *            房东
	 * @param accomStatus
	 *            发布状态
	 * @return List<Homestay>房屋集合
	 */
	List<Homestay> getQueryLandlordHomestay(int userId, int accomStatus);
	/**
	 * 发布房屋
	 * @param h 房屋对象
	 * @return true成功  false失败
	 */
	boolean relHouse(Homestay h);
	/**
	 * 查询房屋Id
	 * @param h 房屋对象
	 * @return 房屋Id
	 */
	int selAccomId(Homestay h);
}
