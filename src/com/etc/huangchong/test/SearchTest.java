package com.etc.huangchong.test;

import java.util.List;

import com.etc.huangchong.dao.SearchDao;
import com.etc.huangchong.dao.impl.SearchDaoImpl;
import com.etc.huangchong.entity.Homestay;

public class SearchTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SearchDao sd = new SearchDaoImpl();
		List<Homestay> list = sd.querySearch("厦门");
		list.forEach(System.out::println);

	}

}
