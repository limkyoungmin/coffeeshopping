package com.novocozy.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.novocozy.domain.CartVO;
import com.novocozy.domain.OrderDetailVO;
import com.novocozy.domain.OrderItemVO;
import com.novocozy.domain.OrderVO;
import com.novocozy.domain.UserVO;
import com.novocozy.service.CartService;
import com.novocozy.service.OrderService;
import com.novocozy.service.UserService;

@Controller
@RequestMapping
public class OrderController {

	@Autowired
	OrderService os;

	@Autowired
	UserService us;

	@Autowired
	CartService cs;

	@RequestMapping(value = "/order/order", method = RequestMethod.GET)
	public String order(Locale locale, Model model) {
		return "/order/order";
	}

	/* 장바구니에서 주문으로 상품이동, 체크값만 넘기기 selectCartNums부분 사용 */
	@RequestMapping(value = "/order/orderView", method = RequestMethod.POST)
	public String orderView(HttpSession session, Model model,
			@RequestParam(name = "selectedCartNums", required = false) List<Integer> selectedCartNums)
			throws Exception {
		String users_id = (String) session.getAttribute("user");
		UserVO userVO = us.getUserInfo(users_id);

		List<CartVO> cartList = cs.cartList(users_id);
		List<OrderItemVO> orderItemList = new ArrayList<>();

		if (!cartList.isEmpty()) {
			for (int i = 0; i < cartList.size(); i++) {
				CartVO cartVO = cartList.get(i);
				OrderItemVO item = new OrderItemVO();
				item.setCart_num(cartVO.getCart_num());
				item.setUsers_id(cartVO.getUsers_id());
				item.setProduct_num(cartVO.getProduct_num());
				item.setProductVO(cartVO.getProductVO());
				item.setProduct_count(cartVO.getProduct_count());
				item.setImgList(cartVO.getImgList());
				item.setIndex(i + 1);
				orderItemList.add(item); // 상품을 리스트에 추가
			}
		}

		if (selectedCartNums != null && !selectedCartNums.isEmpty()) {
			List<OrderItemVO> selectedOrderItemList = new ArrayList<>();
			for (Integer cartNum : selectedCartNums) {
				for (OrderItemVO item : orderItemList) {
					if (item.getCart_num() == cartNum) {
						selectedOrderItemList.add(item);
						break;
					}
				}
			}
			model.addAttribute("orderList", selectedOrderItemList);
		} else {
			model.addAttribute("orderList", orderItemList);
		}
		model.addAttribute("user", userVO);
		return "/order/order";
	}
	
	@RequestMapping(value = "/insertOrder", method = RequestMethod.POST)
	public String insertOrder(@RequestBody Map<String, Object> requestData) throws Exception {
		System.out.println(requestData);
	    
		/* 주문에서 가져온 주문자 정보 풀기(JSON)*/
	    Map<String, Object> orderdetailData = (Map<String, Object>) requestData.get("orderdetailData");
	    String users_id = (String) orderdetailData.get("users_id");
	    String order_name = (String) orderdetailData.get("order_name");
	    String order_zonecode = (String) orderdetailData.get("order_zonecode");
	    String order_address = (String) orderdetailData.get("order_address");
	    String order_addressdetail = (String) orderdetailData.get("order_addressdetail");
	    String order_phone = (String) orderdetailData.get("order_phone");
	    String order_deliverymsg = (String) orderdetailData.get("order_deliverymsg");
	    String order_buyer_name = (String) orderdetailData.get("order_buyer_name");
	    String order_buyer_phone = (String) orderdetailData.get("order_buyer_phone");
	    String order_buyer_email = (String) orderdetailData.get("order_buyer_email");
	    
	    /* 주문에서 가져온 상품 정보 풀기(JSON)*/
	    List<Map<String, Object>> orderDetails = (List<Map<String, Object>>) requestData.get("orderDetails");
	    List<OrderDetailVO> orderDetailVOList = new ArrayList<>();
	    
	    for (Map<String, Object> detail : orderDetails) {
	        String product_name = (String) detail.get("product_name");
	        int product_price = (int) detail.get("product_price");
	        int product_count = (int) detail.get("product_count");
	        int product_num = (int) detail.get("product_num");
	        
	        OrderDetailVO orderDetailVO = new OrderDetailVO();
	        orderDetailVO.setProduct_name(product_name);
	        orderDetailVO.setProduct_price(product_price);
	        orderDetailVO.setProduct_count(product_count);
	        orderDetailVO.setProduct_num(product_num);
	        
	        orderDetailVOList.add(orderDetailVO);
	    }
	    /* 주문자 정보 OrderVO에 세팅해주기 근데 이게 여기서하는게 맞나...*/
	    OrderVO orderVO = new OrderVO();
	    orderVO.setUsers_id(users_id);
	    orderVO.setOrder_name(order_name);
	    orderVO.setOrder_zonecode(order_zonecode);
	    orderVO.setOrder_address(order_address);
	    orderVO.setOrder_addressdetail(order_addressdetail);
	    orderVO.setOrder_phone(order_phone);
	    orderVO.setOrder_deliverymsg(order_deliverymsg);
	    orderVO.setOrder_buyer_name(order_buyer_name);
	    orderVO.setOrder_buyer_phone(order_buyer_phone);
	    orderVO.setOrder_buyer_email(order_buyer_email);
	    
	    // 서비스 호출
	    os.insertOrder(orderVO, orderDetailVOList);
	    
	    return "/order/ordercomplete";
	}
	
	@RequestMapping(value = "/order/ordercomplete", method = RequestMethod.GET)
	public String ordercomplete(Locale locale, Model model) {
		return "/order/ordercomplete";
	}
}
