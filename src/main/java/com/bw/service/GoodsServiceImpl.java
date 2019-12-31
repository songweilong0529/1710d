package com.bw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bw.bean.Goods;
import com.bw.bean.contion;
import com.bw.dao.GoodsDao;

@Service("service")
public class GoodsServiceImpl implements GoodsService{

	@Autowired
	private GoodsDao dao;

	@Override
	public List<Goods> listGoods(contion con) {
		return dao.listGoods(con);
	}

	@Override
	public List<Goods> seleb() {
		return dao.seleb();
	}

	@Override
	public List<Goods> selek() {
		return dao.selek();
	}

	@Override
	public void add(Goods g) {
		dao.add(g);
		
	}

	@Override
	public Goods toupdate(String gid) {
		return dao.toupdate(gid);
	}

	@Override
	public void update(Goods g) {
		dao.update(g);
		
	}

	@Override
	public void dele(String gid) {
		dao.dele(gid);
	}

	@Override
	public void deles(String gid) {
		dao.deles(gid);
		
	}

	@Override
	public List<Goods> xq(String gid) {
		return dao.xq(gid);
	}
}
