package xyz.zrxjuly.pojo;

import java.sql.Date;

/**
 * 捐赠图书实体类
 * @author zhangrongxiang
 *
 */
public class Book {
	
	/** 唯一标识 **/
	private String b_id;
	
	/** 用户唯一标识 **/
	private String u_id;
	
	/** 图书名称 **/
	private String b_name;
	
	/** 图书作者 **/
	private String b_author;
	
	/** 出版社 **/
	private String b_publish;
	
	/** 出版日期 **/
	private Date b_pdate;
	
	/** 审核日期 **/
	private Date b_checkdate;
	
	/** 捐赠日期 **/
	private Date b_date;
	
	/** 图书审核：0-未审核；1-审核通过；2-审核失败；3-捐赠成功 **/
	private int b_check;

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public String getB_author() {
		return b_author;
	}

	public void setB_author(String b_author) {
		this.b_author = b_author;
	}

	public String getB_publish() {
		return b_publish;
	}

	public void setB_publish(String b_publish) {
		this.b_publish = b_publish;
	}

	public Date getB_pdate() {
		return b_pdate;
	}

	public void setB_pdate(Date b_pdate) {
		this.b_pdate = b_pdate;
	}

	public Date getB_checkdate() {
		return b_checkdate;
	}

	public void setB_checkdate(Date b_checkdate) {
		this.b_checkdate = b_checkdate;
	}

	public Date getB_date() {
		return b_date;
	}

	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}

	public int getB_check() {
		return b_check;
	}

	public void setB_check(int b_check) {
		this.b_check = b_check;
	}

	@Override
	public String toString() {
		return "Book [b_id=" + b_id + ", u_id=" + u_id + ", b_name=" + b_name + ", b_author=" + b_author
				+ ", b_publish=" + b_publish + ", b_pdate=" + b_pdate + ", b_checkdate=" + b_checkdate + ", b_date="
				+ b_date + ", b_check=" + b_check + "]";
	}

}
