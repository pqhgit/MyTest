package com.pqh.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.pqh.pojo.Products;
import com.pqh.tool.MapRemoveNullUtil;

@Service
public class CartService {

	public Object insertCartInfo(Products product, HttpSession httpSession) {
		Object cartObj = httpSession.getAttribute("Cart");
		Map<Products,Integer> cart = null;
		 if(cartObj!=null){
	            cart = (Map<Products,Integer>)cartObj;
	        }else {
	            cart = new HashMap<Products, Integer>();
	            httpSession.setAttribute("Cart", cart);
	        }
		 if(cart.containsKey(product)){
	            //说明之前已经购买过
	            cart.put(product, cart.get(product)+1);
	        }else{//第一次购买该种商品
	            cart.put(product, 1);
	        }
		return cart;
	}

	public Object removeCartInfo(Products product, HttpSession httpSession) {
		 Map<Products,Integer> cart = (Map<Products,Integer>)httpSession.getAttribute("Cart");
		 cart.remove(product);
		 MapRemoveNullUtil.removeNullEntry(cart);
		return cart;
	}

	public void editCartInfo(Products product, String bnum, HttpSession httpSession) {
		 Map<Products,Integer> cart = (Map<Products,Integer>)httpSession.getAttribute("Cart");
		 cart.put(product, Integer.parseInt(bnum));
		 httpSession.setAttribute("Cart", cart);
		
	}

}
