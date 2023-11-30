package xyz.zrxjuly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import xyz.zrxjuly.dao.IUserDao;
import xyz.zrxjuly.pojo.User;
import xyz.zrxjuly.service.IUserService;

@Service("userService")
public class UserServiceImpl implements IUserService {
	@Resource
	private IUserDao userDao;

	@Override
	public User getUserById(int userId) {
		return this.userDao.selectByPrimaryKey(userId);
	}

	@Override
	public User selectUser(User user) {
		return userDao.selectUser(user);
	}

	@Override
	public void editPwd(User user) {
		userDao.editPwd(user);
	}

	@Override
	public void editUserInfo(User user) {
		userDao.editUserInfo(user);
	}

	@Override
	public List<User> getAllUser() {
		return userDao.getAllUser();
	}

	@Override
	public int adminDelUserByUserId(String u_id) {
		return userDao.adminDelUserByUserId(u_id);
	}

	@Override
	public User adminGetUserById(String u_id) {
		return userDao.adminGetUserById(u_id);
	}
}
