package com.novocozy.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.novocozy.domain.ProductImgVO;
import com.novocozy.domain.ProductVO;
import com.novocozy.service.ProductService;
import com.novocozy.service.UserService;
import com.novocozy.util.FileUploadUtil;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	UserService us;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	
	@RequestMapping(value = "admin/productWrite", method = RequestMethod.POST)
	public String productWrite(@ModelAttribute ProductVO productVo, Model model, @RequestParam("files") MultipartFile[] files) throws Exception {

		String imgUploadPath = uploadPath + "/" + "images";
		String ymdPath = FileUploadUtil.calcPath(imgUploadPath);
		
	    List<ProductImgVO> imgList = new ArrayList<>();
	    boolean isFileUploaded = false;
	    
	    for (MultipartFile file : files) {
	        if (file != null && !file.isEmpty()) {
	            String fileName = FileUploadUtil.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
	            ProductImgVO imgVO = new ProductImgVO();
	            imgVO.setImg_name(fileName);
	            imgVO.setImg_url("/images" + ymdPath + "/" + fileName);
	            imgList.add(imgVO);
	            isFileUploaded = true;
	        } 
	    }
	    	if (!isFileUploaded) {
	    	    ProductImgVO defaultImgVO = new ProductImgVO();
	    	    defaultImgVO.setImg_name("default.png");
	    	    defaultImgVO.setImg_url("/images/none.png");
	    	    imgList.add(defaultImgVO);
	    	}
		
		productService.createProduct(productVo, imgList);
		
		return "redirect:/admin/product-management";
	}
	
	@RequestMapping(value = "admin/product-management", method = RequestMethod.GET)
	public String productList(Model model, 
								@RequestParam(value="page", defaultValue="1") int page,
								@RequestParam(value="pageSize", defaultValue="8") int pageSize) throws Exception {
		
		int totalCount = productService.countList(); 
		int totalPages = (int) Math.ceil((double) totalCount / pageSize);
		int startPage = (page - 1) / 10 * 10 + 1; 
		int endPage = Math.min(startPage + 9, totalPages); 
		int offset = (page - 1) * pageSize; 
		
		List<ProductVO> productList = productService.productList(offset, pageSize);
		
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("startPage", startPage); 
		model.addAttribute("endPage", endPage);
		model.addAttribute("page", page);
		model.addAttribute("productList", productList);
		
		return "admin/product-management";
	}
	
	@RequestMapping(value = "admin/productdetail", method = RequestMethod.GET)
	public String productDetail(Model model, @RequestParam("product_num") int product_num) throws Exception {
		
	    ProductVO detail = productService.productDetail(product_num);
	    model.addAttribute("productdetail", detail);
	    
	    return "admin/productdetail";
	}
	
	@RequestMapping(value = "admin/productupdate", method = RequestMethod.GET)
	public String productUpdateForm(Model model, @RequestParam("product_num") int product_num) throws Exception {
	    ProductVO update = productService.productDetail(product_num);
	    model.addAttribute("productupdate", update);

	    String completeImagePath = "/images" + update.getImgList().get(0).getImg_url();
	    model.addAttribute("completeImagePath", completeImagePath);

	    return "admin/productupdate";
	}

	@RequestMapping(value = "admin/productupdate.do", method = RequestMethod.POST)
	public String productUpdate(@ModelAttribute ProductVO productVo, @RequestParam("files") MultipartFile[] files, HttpServletRequest req) throws Exception {

			String imgUploadPath = uploadPath + "/" + "images";
			String ymdPath = FileUploadUtil.calcPath(imgUploadPath);
			
			List<ProductImgVO> imgList = new ArrayList<>();
			
			for (MultipartFile file : files) {
				if (file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {
				String fileName = FileUploadUtil.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
				
				ProductImgVO imgVO = new ProductImgVO();
				imgVO.setProduct_num(productVo.getProduct_num());
				imgVO.setImg_name(fileName);
				imgVO.setImg_url("/images" + ymdPath + "/" + fileName);
				
				imgList.add(imgVO);
				}
			}
			
			productService.productUpdate(productVo, imgList);
			
			return "redirect:/admin/product-management";
	}
	
	
	@RequestMapping(value = "admin/productdelete", method = RequestMethod.POST)
	public String productDelete(@RequestParam int product_num) throws Exception {
		
		productService.productDelete(product_num);
		
		return "redirect:/admin/product-management";
	}
	
	
	@RequestMapping(value = "productmaindetail", method = RequestMethod.GET)
	public String productMainDetail(Model model, @RequestParam("product_num") int product_num) throws Exception { 
	ProductVO detail = productService.productDetail(product_num);
	model.addAttribute("productmaindetail", detail);
	
	return "/category/product/detail"; 
	}
	
	
	@RequestMapping(value = "productCoffeeList", method = RequestMethod.GET)
	public String productCoffeeList(Model model) throws Exception {
	    List<ProductVO> update = productService.productCoffeeList();
	    model.addAttribute("productCoffeeList", update);
	    return "/category/product/coffee";
	}
	
	@RequestMapping(value = "productFoodList", method = RequestMethod.GET)
	public String productFoodList(Model model) throws Exception {
	    List<ProductVO> update = productService.productFoodList();
	    model.addAttribute("productFoodList", update);
	    return "/category/product/food";
	}
	
	@RequestMapping(value = "productGoodsList", method = RequestMethod.GET)
	public String productGoodsList(Model model) throws Exception {
	    List<ProductVO> update = productService.productGoodsList();
	    model.addAttribute("productGoodsList", update);
	    return "/category/product/goods";
	}	
	
	@RequestMapping(value = "productMachineList", method = RequestMethod.GET)
	public String productMachineList(Model model) throws Exception {
	    List<ProductVO> update = productService.productMachineList();
	    model.addAttribute("productMachineList", update);
	    return "/category/product/machine";
	}
}
