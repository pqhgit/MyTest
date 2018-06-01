package com.pqh.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pqh.service.UserService;
import com.pqh.vo.Result;


@Controller
public class TologinController {
	@Autowired
	private UserService userService;
	@RequestMapping("/login")
	@ResponseBody
	public Result toLogin( String username, String password,
    		HttpSession session,HttpServletRequest request){
        Result result = userService.findUserByUserName(username,password);
        System.out.println(username+password);
        if(result.getStatus()==1) {
			session.setAttribute("username", username);
			request.getSession().setAttribute("username", username);
		}
       return result;
        
	}
}

