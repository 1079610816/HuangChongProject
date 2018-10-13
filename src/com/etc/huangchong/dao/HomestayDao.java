package com.etc.huangchong.dao;

import java.util.List;

import com.etc.huangchong.entity.Homestay;

public interface HomestayDao {
	//得到所有民宿信息
	List<Homestay> queryHomestay();
	boolean homestayUpdate(Homestay homestay);
	boolean homestaydel(int id);
}
