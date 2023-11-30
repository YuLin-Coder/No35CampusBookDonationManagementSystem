package xyz.zrxjuly.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import xyz.zrxjuly.pojo.User;
import xyz.zrxjuly.service.IUserService;

/**
 * 登录
 * 
 * @author zhangrongxiang
 *
 */
@Controller("loginController")
public class LoginController {
	@Resource
	private IUserService userService;
	
	/** 
	 * 用户登录：成功-首页；失败-跳转到login.jsp 
	 * @author zhangrongxiang
	 */
	@RequestMapping("user_index")
	public String user_index(User user, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws IOException, ServletException {
		
		User userinfo = userService.selectUser(user);
		if (userinfo != null) {
			session.setAttribute("userinfo", userinfo);
			if (user.getU_role() == 0) {
				// 角色：0-管理员
				return "admin/index";
			}
		} else {
			request.setAttribute("msg", "账号或密码不正确！");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			//response.sendRedirect("login.jsp");
		}
		return "index";
	}
	
	/** 用户注销登录 
	 * @throws IOException 
	 */
	@RequestMapping("user_logout")
	public void user_logout(HttpServletResponse response, HttpSession session) throws IOException {
//		User user = (User) session.getAttribute("userinfo");
//		System.out.println(user.toString());
		session.removeAttribute("userinfo");
		response.sendRedirect("login.jsp");
	}
}
