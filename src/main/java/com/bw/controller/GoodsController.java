package com.bw.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bw.bean.Goods;
import com.bw.bean.contion;
import com.bw.service.GoodsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class GoodsController {

	@Autowired
	private GoodsService service;
	
	@RequestMapping("listGoods.do")
	public String listGoods(Model m,contion con) {
		if(con.getPageNum()==null) {con.setPageNum(1);}
		PageHelper.startPage(con.getPageNum(),3);
		List<Goods> list=service.listGoods(con);
		PageInfo<Goods> page=new PageInfo<Goods>(list);
		
		m.addAttribute("page", page);
		m.addAttribute("con", con);
		m.addAttribute("list", list);
		
		return "list";
	}
	@ResponseBody
	@RequestMapping("seleb.do")
	public Object seleb() {
		List<Goods> list=service.seleb();
		return list;
	}
	@ResponseBody
	@RequestMapping("selek.do")
	public Object selek() {
		List<Goods> list=service.selek();
		return list;
	}
	
	@RequestMapping("add.do")
	public String add(Goods g,MultipartFile myFile,HttpServletRequest request) throws IllegalStateException, IOException {
		String realName = myFile.getOriginalFilename();
		String endName = realName.substring(realName.lastIndexOf("."));
		String startName = UUID.randomUUID().toString();
	    String realPath = request.getRealPath("/load/");
	    File file=new File(realPath+startName+endName);
	    myFile.transferTo(file);
	    g.setImage(startName+endName);
	    service.add(g);
	    
	    return "redirect:/listGoods.do";
	}
	
	@ResponseBody
	@RequestMapping("toupdate.do")
	public Object toupdate(String gid) {
	 Goods g=service.toupdate(gid);
	 return g;
	}
	
	@RequestMapping("update.do")
	public String update(Goods g,MultipartFile myFile,HttpServletRequest request) throws IllegalStateException, IOException {
		String realName = myFile.getOriginalFilename();
		String endName = realName.substring(realName.lastIndexOf("."));
		String startName = UUID.randomUUID().toString();
	    String realPath = request.getRealPath("/load/");
	    File file=new File(realPath+startName+endName);
	    myFile.transferTo(file);
	    g.setImage(startName+endName);
	    service.update(g);
	    
	    return "redirect:/listGoods.do";
	}
	
	@RequestMapping("dele.do")
	public String dele(String gid) {
		service.dele(gid);
	    return "redirect:/listGoods.do";
	}
	
	@RequestMapping("deles.do")
	public String deles(String gid) {
		service.deles(gid);
	    return "redirect:/listGoods.do";
	}
	
	@RequestMapping("xq.do")
	public String xq(Model m,String gid) {
		List<Goods> list=service.xq(gid);
		m.addAttribute("list",list);
		return "xq";
	}
}
