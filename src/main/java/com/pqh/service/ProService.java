package com.pqh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pqh.mapper.ProductMapper;
import com.pqh.pojo.Products;

@Service
public class ProService {
	@Autowired
	private ProductMapper productMapper;

	public List<Products> findProductsAll() {
		
		return productMapper.findProductsAll();
	}

	public Products findProductsById(Integer productId) {
		
		return productMapper.findProductsById(productId);
	}
	
}
