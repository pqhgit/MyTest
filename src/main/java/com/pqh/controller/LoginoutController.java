package com.pqh.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pqh.pojo.Products;
import com.pqh.service.ProService;

@Controller
public class LoginoutController {
	@Autowired
	private ProService proService;
	@RequestMapping("loginout")
	public String logout(HttpSession session,Model model ) {
		session.invalidate();
		List<Products> productLists=proService.findProductsAll();
		//System.out.println(productLists);//拿到数据
		model.addAttribute("productLists", productLists);
		return "index";
	}
}
