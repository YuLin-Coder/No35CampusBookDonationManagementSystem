package xyz.zrxjuly.pojo;

/**
 * 用户实体类.
 * 
 * @author zhangrongxiang
 *
 */
public class User {

	/** 唯一标识 **/
	private String u_id;

	/** 登录账号 **/
	private String u_account;

	/** 用户名 **/
	private String u_name;

	/** 唯一标识 **/
	private String u_pwd;

	/** 班级 **/
	private String u_class;

	/** 性别 **/
	private String u_sex;

	/** 手机号 **/
	private String u_phone;

	/** 邮箱 **/
	private String u_email;

	/** 角色：0-管理员；1-普通用户 **/
	private int u_role;

	public String getu_id() {
		return u_id;
	}

	public void setu_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_account() {
		return u_account;
	}

	public void setU_account(String u_account) {
		this.u_account = u_account;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_pwd() {
		return u_pwd;
	}

	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}

	public String getU_class() {
		return u_class;
	}

	public void setU_class(String u_class) {
		this.u_class = u_class;
	}

	public String getU_sex() {
		return u_sex;
	}

	public void setU_sex(String u_sex) {
		this.u_sex = u_sex;
	}

	public String getU_phone() {
		return u_phone;
	}

	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public int getU_role() {
		return u_role;
	}

	public void setU_role(int u_role) {
		this.u_role = u_role;
	}

	@Override
	public String toString() {
		return "User [u_id=" + u_id + ", u_account=" + u_account + ", u_name=" + u_name + ", u_pwd=" + u_pwd
				+ ", u_class=" + u_class + ", u_sex=" + u_sex + ", u_phone=" + u_phone + ", u_email=" + u_email
				+ ", u_role=" + u_role + "]";
	}

}
