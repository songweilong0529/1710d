package com.bw.service;

import java.util.List;

import com.bw.bean.Goods;
import com.bw.bean.contion;

public interface GoodsService {

	List<Goods> listGoods(contion con);

	List<Goods> seleb();

	List<Goods> selek();

	void add(Goods g);

	Goods toupdate(String gid);

	void update(Goods g);

	void dele(String gid);

	void deles(String gid);

	List<Goods> xq(String gid);

}
