package com.etc.huangchong.service;

import java.util.List;

import com.etc.huangchong.entity.Homestay;

public interface HomestayService {
	List<Homestay> getQueryHomestay();
	boolean getHomestayUpdate(Homestay homestay);
}
