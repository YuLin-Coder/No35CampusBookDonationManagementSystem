package xyz.zrxjuly.service;

import java.util.List;

import xyz.zrxjuly.pojo.User;

public interface IUserService {
	public User getUserById(int userId);
	
	/** 查询用户信息 **/
	public User selectUser(User user);
	
	/** 修改密码 **/
	public void editPwd(User user);
	
	/** 修改个人信息 **/
	public void editUserInfo(User user);
	
	/** 管理员-查询所有用户信息 **/
	public List<User> getAllUser();
	
	/** 管理员-删除用户信息 **/
	public int adminDelUserByUserId(String u_id);
	
	/** 管理员-获取用户信息 **/
	public User adminGetUserById(String u_id);
	
	
}
