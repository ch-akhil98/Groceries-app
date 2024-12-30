package com.app.service;

import java.util.List;

import com.app.beans.ProductBean;

public interface ProductService {

	public List<ProductBean> getAllProducts();

	public List<ProductBean> getAllProductsByType(String type);

	public List<ProductBean> searchAllProducts(String search);

	public byte[] getImage(String prodId);

	public ProductBean getProductDetails(String prodId);

	public double getProductPrice(String prodId);

	public boolean sellNProduct(String prodId, int n);

	public int getProductQuantity(String prodId);
}
