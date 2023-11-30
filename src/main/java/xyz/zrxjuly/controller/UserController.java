package xyz.zrxjuly.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import xyz.zrxjuly.pojo.Book;
import xyz.zrxjuly.pojo.User;
import xyz.zrxjuly.service.IBookService;
import xyz.zrxjuly.service.IUserService;

/**
 * 用户端
 * @author zhangrongxiang
 *
 */
@Controller("userController")
@RequestMapping("/user")
public class UserController {
	@Resource
	private IUserService userService;

	@Resource
	private IBookService bookService;

	@RequestMapping("main")
	public String toMain(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// request.getRequestDispatcher("user_index").forward(request,response);

		return "user/user_index";
	}

	/** 进入用户首页 **/
	@RequestMapping("user_index")
	public String user_index(HttpServletRequest request, Model model) {
		int userId = Integer.parseInt(request.getParameter("id"));
		User user = userService.getUserById(userId);
		model.addAttribute("user", user);
		return "index";
	}

	/** 我的主页 **/
	@RequestMapping("user_profile")
	public String user_profile(Model model, HttpSession session) {
		User user = (User) session.getAttribute("userinfo");
		String u_id = user.getu_id();
		// 查询待审核的图书
		int check_0 = bookService.selectBookCheck_0(u_id);
		// 查询审核通过的图书
		int check_1 = bookService.selectBookCheck_1(u_id);
		// 查询审核未通过的图书
		int check_2 = bookService.selectBookCheck_2(u_id);
		// 查询捐赠成功的图书
		int check_3 = bookService.selectBookCheck_3(u_id);
		// 查询最近一次捐赠成功的图书详情.
		Book book = bookService.selectBookDonateSuccess(u_id);
		model.addAttribute("check_0", check_0);
		model.addAttribute("check_1", check_1);
		model.addAttribute("check_2", check_2);
		model.addAttribute("check_3", check_3);
		model.addAttribute("book", book);
		return "user/profile";
	}

	@RequestMapping("book_donation")
	public String book_donation() {
		return "user/book_donation";
	}

	/** 捐赠图书信息 **/
	@RequestMapping("donation_submit")
	@ResponseBody
	public JSONObject donation_submit(Book book, HttpSession session) {
		JSONObject json = new JSONObject();
		User user = (User) session.getAttribute("userinfo");
		String u_id = user.getu_id();
		book.setU_id(u_id);
		int bookSubmit = bookService.addBook(book);
		if (bookSubmit > 0) {
			json.put("msg", "success");
		} else {
			json.put("msg", "error");
		}
		return json;
	}

	/** 跳转到修改密码页面 **/
	@RequestMapping("toEditPwd")
	public String toEditPwd() {
		return "user/edit_pwd";
	}

	/** 修改密码 **/
	@RequestMapping("editPwd")
	@ResponseBody
	public JSONObject editPwd(String old_pwd, String u_pwd, HttpSession session) {
		JSONObject json = new JSONObject();
		User user = (User) session.getAttribute("userinfo");
		if (old_pwd.equalsIgnoreCase(user.getU_pwd())) {
			user.setU_pwd(u_pwd);
			userService.editPwd(user);
			json.put("msg", "success");
		} else {
			json.put("msg", "error");
		}
		return json;
	}
	
	/** 用户从iframe子页面跳转到login.jsp(重新打开一个页面) **/
	@RequestMapping("toLogin")
	public void toLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.getSession().removeAttribute("userinfo");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<script>");
		out.println("window.open ('" + request.getContextPath() + "/login.jsp','_top')");
		out.println("</script>");
		out.println("</html>");
	}
	
	/** 跳转到个人信息查看页面 **/
	@RequestMapping("showUserInfo")
	public String showUserInfo() {
		return "user/userinfo";
	} 
	
	/** 跳转到个人信息修改页面 **/
	@RequestMapping("toEditUserInfo")
	public String toEditUserInfo() {
		return "user/edit_userinfo";
	} 
	
	/** 修改个人信息 **/
	@RequestMapping("editUserInfo")
	@ResponseBody
	public JSONObject editUserInfo(User user) {
		JSONObject json = new JSONObject();
		if (user != null) {
			userService.editUserInfo(user);
			json.put("msg", "success");
		} else {
			json.put("msg", "error");
		}
		return json;
	}
	
	/** 捐赠记录 **/
	@RequestMapping("donation_history")
	public String donation_history(HttpSession session, Model model) {
		User user = (User) session.getAttribute("userinfo");
		String u_id = user.getu_id();
		List<Book> bookList = bookService.getDonationBookByUserId(u_id);
		model.addAttribute("bookList", bookList);
		return "user/book_history";
	}
	
	/** 待审核的图书 **/
	@RequestMapping("toBookCheck_0")
	public String toBookCheck_0(HttpSession session, Model model) {
		User user = (User) session.getAttribute("userinfo");
		String u_id = user.getu_id();
		List<Book> bookList = bookService.getBookCheck_0(u_id);
		model.addAttribute("bookList", bookList);
		return "user/book_check0";
	}
	
	/** 通过审核的图书 **/
	@RequestMapping("toBookCheck_1")
	public String toBookCheck_1(HttpSession session, Model model) {
		User user = (User) session.getAttribute("userinfo");
		String u_id = user.getu_id();
		List<Book> bookList = bookService.getBookCheck_1(u_id);
		model.addAttribute("bookList", bookList);
		return "user/book_check1";
	}
	
	/** 未通过审核的图书 **/
	@RequestMapping("toBookCheck_2")
	public String toBookCheck_2(HttpSession session, Model model) {
		User user = (User) session.getAttribute("userinfo");
		String u_id = user.getu_id();
		List<Book> bookList = bookService.getBookCheck_2(u_id);
		model.addAttribute("bookList", bookList);
		return "user/book_check2";
	}
	
	/** 删除待审核图书信息 **/
	@RequestMapping("deleteCheck0")
	@ResponseBody
	public JSONObject deleteCheck0(String b_id) {
		JSONObject json = new JSONObject();
		if (b_id != null) {
			bookService.deleteCheck0(b_id);
			json.put("msg", "success");
		} else {
			json.put("msg", "error");
		}
		return json;
	}
	
	/** 转到编辑图书页面 **/
	@RequestMapping("toEditCheck0")
	public String toEditCheck0(String b_id, Model model) {
		Book book = bookService.getBookCheck0(b_id);
		model.addAttribute("book", book);
		return "user/edit_book";
	} 
	
	/** 编辑图书 **/
	@RequestMapping("editBookInfo")
	@ResponseBody
	public JSONObject editBookInfo(Book book) {
		JSONObject json = new JSONObject();
		if (book != null) {
			bookService.editBookInfo(book);
			json.put("msg", "success");
		} else {
			json.put("msg", "error");
		}
		return json;
	}
	
}
