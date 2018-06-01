package com.pqh.controller;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pqh.pojo.User;
import com.pqh.service.UserService;
import com.pqh.tool.VerifyCode;
import com.pqh.tool.EmailSpringTool;
import com.pqh.tool.EmailTool;

@Controller
public class ToregistController {
	@Autowired
	private UserService userService;
	@RequestMapping("regist")
    public String toRegist(User user, Model model, String valistr, HttpSession session, HttpServletResponse response) {
		System.out.println(user.getUsername()+user.getEmail());
		User u=userService.checkUserByUserName(user.getUsername());
		if (u != null){
            model.addAttribute("errorInfo", "用户名已被占用");           
            return "regist";
        }	
		String va = (String) session.getAttribute("code");
        if (! va.toUpperCase().equals(valistr.toUpperCase())){
            model.addAttribute("errorInfo", "验证码不正确");
            return "regist";
        }
		userService.saveUser(user);
		
		try {
            EmailTool.send(user.getEmail(), user.getId(), "0");

           return "redirect:registSuccess?email="+user.getEmail();

       }catch (MessagingException e){
           e.printStackTrace();
           model.addAttribute("errorInfo", "验证邮件发送失败");
           return "regist";
       }catch (Exception e){
           e.printStackTrace();
           return null;
       }

	}
	
	//ajax验证用户名是否存在
	@RequestMapping("/ajaxCheckUsername")
	public void ajaxCheckUsername(String username,HttpServletResponse response) {
		response.setContentType("html/css;charset=utf-8");
		//System.out.println(username+"check");//拿到username
		if("".equals(username)||username == null){
            try {
                response.getWriter().write(" ");
            } catch (IOException e) {
                e.printStackTrace();
            }
            return;
        }
		if (userService.checkUserByUserName(username)!=null) {
			 try {
	                response.getWriter().write("用户名已存在");
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	    }else{
	            try {
	                response.getWriter().write("恭喜，用户名可以使用");
	            } catch (IOException e) {
	                e.printStackTrace();
	            }			
	    }		
	}
	 @RequestMapping("/registSuccess")
	    public void registSuccess(HttpServletResponse response, String email){
	        // 定时刷新
	        response.setContentType("text/html;charset=utf-8");
	        try {
	            response.getWriter().write("<h1 style='color:red; text-align:center'>注册成功，请去邮箱完成帐号激活之后才可以登录...</h1>");
	            String type= EmailSpringTool.sibltEmail(email);
	            response.setHeader("refresh", "3;url=/goEmailView?type="+type);

	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	 @RequestMapping("activeUser")
	    @ResponseBody
	    public void activeUser(String userId, String activecode, HttpServletResponse response){
	        //userService.saveUser(userId);
	        // 定时刷新
	        response.setContentType("text/html;charset=utf-8");
	        try {
	            response.getWriter().write("激活成功，3秒之后回到登录界面进行登录...");
	            response.setHeader("refresh", "3;url=/login.html");

	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	 @RequestMapping("goEmailView")
	    public String goEmailView(String type){

	        if (type.equals("qq")){
	            return "redirect:https://mail.qq.com/cgi-bin/loginpage";

	        }else if (type.equals("163")){
	            return "redirect:http://mail.163.com/";
	        }else if (type.equals("126")){
	            return "redirect:http://mail.126.com/";
	        }else {
	            return "login";
	        }
	    }
	//验证码发送
	 @RequestMapping("/verifyCode")
	    public void verifyCode(HttpServletResponse response, HttpSession session){
	        response.setDateHeader("Expires", -1);
	        response.setHeader("Cache-Control", "no-cache");

	        VerifyCode vc = new VerifyCode();
	        try {
	            vc.drawImage(response.getOutputStream());
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        String code = vc.getCode();
	        session.setAttribute("code", code);
	        System.out.println(code);

	    }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
