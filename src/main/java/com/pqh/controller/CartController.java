package com.pqh.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pqh.pojo.Products;
import com.pqh.service.ProService;
import com.pqh.tool.MapRemoveNullUtil;
import com.pqh.service.CartService;

@Controller
public class CartController {
	@Autowired
	private ProService proService;
	@Autowired
    private CartService cartService;
	
	
	
	@RequestMapping("cart")
	public String cartController() {
		return "cart";
	}
	//添加商品到购物车
	@RequestMapping("/addToCart")
	public String cartController  (Integer productId,String username,Model model,HttpSession httpSession ) {
		//System.out.println(productId+username);//拿到数据
		Products product=proService.findProductsById(productId);
		//System.out.println(product);//拿到数据
		Map<Products,Integer> cart = (Map<Products,Integer>)cartService.insertCartInfo(product, httpSession);
		MapRemoveNullUtil.removeNullEntry(cart);
		model.addAttribute("cart",cart);
		return "cart";
	}
	
	//删除购物车中单条商品
	@RequestMapping("removeCartProduct")
	public String removeCartProduct(Integer productId,Model model,HttpSession httpSession,HttpServletRequest request) {
		
		
		Products product = proService.findProductsById(productId);
		Map<Products,Integer> cart = (Map<Products,Integer>)cartService.removeCartInfo(product, httpSession);
		httpSession.setAttribute("Cart", cart);
		model.addAttribute("cart",cart);
        model.addAttribute("cartSize", cart.size());
		return "cart";
	}
	//编辑购物车商品数量
	@RequestMapping("editCartProduct")
	public String editCartProduct(HttpServletRequest request, HttpSession httpSession, Model model) {
		String productId = request.getParameter("productId");
		int id=Integer.parseInt(productId);
		String bnum = request.getParameter("bnum");
		Products product = proService.findProductsById(id);
		cartService.editCartInfo(product, bnum, httpSession);
		return "redirect:/cart";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
