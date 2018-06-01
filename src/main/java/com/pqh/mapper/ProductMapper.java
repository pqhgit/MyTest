package com.pqh.mapper;

import java.util.List;

import com.pqh.pojo.Products;

public interface ProductMapper {

	List<Products> findProductsAll();

	Products findProductsById(Integer productId);

}
