package com.pqh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pqh.pojo.Products;
import com.pqh.service.ProService;
import com.sun.java.browser.net.ProxyService;

@Controller
public class IndexController {
	@Autowired
	private ProService proService;
	
	//跳转到首页
	@RequestMapping("index.html")
	public String goIndex(Model model) {
		List<Products> productLists=proService.findProductsAll();
		//System.out.println(productLists);//拿到数据
		model.addAttribute("productLists", productLists);
		return "index";
	}
	//跳转到首页
		@RequestMapping("index1.html")
		public String goIndex1(Model model) {
			List<Products> productLists=proService.findProductsAll();
			//System.out.println(productLists);//拿到数据
			model.addAttribute("productLists", productLists);
			return "index1";
		}
	
	//跳转到登录页面
	@RequestMapping("login.html")
	public String login() {
		
		
		return "login";
	}
	//跳转到注册页面
	@RequestMapping("regist.html")
	public String regist() {
		return "regist";
	}
	
	@RequestMapping("/about.html")
	public String aboutIndex() {
		return "about";
	}
	@RequestMapping("/specials.html")
	public String specialsIndex() {
		return "specials";
	}
	@RequestMapping("/new.html")
	public String newIndex() {
		return "new";
	}
	@RequestMapping("/contact.html")
	public String contactIndex() {
		return "contact";
	}
}
