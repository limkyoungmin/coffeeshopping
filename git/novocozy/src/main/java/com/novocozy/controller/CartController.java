package com.novocozy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.novocozy.domain.CartVO;
import com.novocozy.domain.UserVO;
import com.novocozy.service.CartService;
import com.novocozy.service.UserService;

@Controller
@RequestMapping
public class CartController {
	
	@Autowired
	CartService cs;
	
	@Autowired
	UserService us;
	
	/* 장바구니 추가*/
	@ResponseBody
	@RequestMapping(value = "/addcart", method = RequestMethod.POST)
	public int addcart(HttpSession session, CartVO cartVO) throws Exception {
	    String users_id = (String) session.getAttribute("user");
	    UserVO userVO = us.getUserInfo(users_id);
	    cartVO.setUsers_id(userVO.getUsers_id());
	    if(cs.cartMemCheck(cartVO) != 0) {
	        return 2;
	    }
	    cs.cartInsert(cartVO);
	    return 1;
	}	
	
	/* 구매하기 누를 경우 장바구니 창으로 바로 이동 */
	@ResponseBody
	@RequestMapping(value = "/buyDirect", method = RequestMethod.POST)
	public int buyDirect(HttpSession session, CartVO cartVO) throws Exception {
	    String users_id = (String) session.getAttribute("user");
	    UserVO userVO = us.getUserInfo(users_id);
	    cartVO.setUsers_id(userVO.getUsers_id());
	    if(cs.cartMemCheck(cartVO) != 0) {
	        return 2;
	    }
	    cs.cartInsert(cartVO);
	    return 1;
	}	

	@RequestMapping(value = "/order/cart", method = RequestMethod.GET)
	public String cartView(HttpSession session, CartVO cartVO, Model model) throws Exception {
			String users_id = (String) session.getAttribute("user");
			UserVO userVO = us.getUserInfo(users_id);
			//System.out.println(userId);
			cartVO.setUsers_id(userVO.getUsers_id());
			model.addAttribute("cart", cs.cartList(users_id));
			model.addAttribute("cartUser", us.getUserInfo(users_id));
	    return "/order/cart";
	  }
	
	/* 한가지 상품 삭제*/
	@ResponseBody
	@RequestMapping(value="/order/cartDelete", method = RequestMethod.POST)
		public int cartDelete(@RequestParam("cart_num") int cart_num,HttpSession session,CartVO cartVO, Model model) throws Exception{
		cs.cartDelete(cart_num);
		return 1;
	  }
	
	/* 전체 상품 삭제*/
	@ResponseBody
	@RequestMapping(value="/order/cartDeleteAll", method = RequestMethod.POST)
	public String cartDeleteAll(HttpSession session, CartVO cartVO, Model model) throws Exception{
		String users_id = (String) session.getAttribute("user");
		UserVO userVO = us.getUserInfo(users_id);
		cartVO.setUsers_id(userVO.getUsers_id());
		int deletedItemCount = cs.cartDeleteAll(users_id);
		return String.valueOf(deletedItemCount);
	}

}
