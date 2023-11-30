package xyz.zrxjuly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import xyz.zrxjuly.dao.IBookDao;
import xyz.zrxjuly.pojo.Book;
import xyz.zrxjuly.service.IBookService;

@Service("bookService")
public class BookServiceImpl implements IBookService {
	@Resource
	private IBookDao bookDao;
	
	@Override
	public int selectBookCheck_0(String u_id) {
		return bookDao.selectBookCheck_0(u_id);
	}

	@Override
	public int selectBookCheck_1(String u_id) {
		return bookDao.selectBookCheck_1(u_id);
	}

	@Override
	public int selectBookCheck_2(String u_id) {
		return bookDao.selectBookCheck_2(u_id);
	}

	@Override
	public int selectBookCheck_3(String u_id) {
		return bookDao.selectBookCheck_3(u_id);
	}

	@Override
	public Book selectBookDonateSuccess(String u_id) {
		return bookDao.selectBookDonateSuccess(u_id);
	}

	@Override
	public int addBook(Book book) {
		return bookDao.addBook(book);
	}

	@Override
	public List<Book> getDonationBookByUserId(String u_id) {
		return bookDao.getDonationBookByUserId(u_id);
	}

	@Override
	public List<Book> getBookCheck_0(String u_id) {
		return bookDao.getBookCheck_0(u_id);
	}

	@Override
	public List<Book> getBookCheck_1(String u_id) {
		return bookDao.getBookCheck_1(u_id);
	}

	@Override
	public List<Book> getBookCheck_2(String u_id) {
		return bookDao.getBookCheck_2(u_id);
	}

	@Override
	public void deleteCheck0(String b_id) {
		bookDao.deleteCheck0(b_id);
	}

	@Override
	public Book getBookCheck0(String b_id) {
		return bookDao.getBookCheck0(b_id);
	}

	@Override
	public void editBookInfo(Book book) {
		bookDao.editBookInfo(book);
	}

	@Override
	public List<Book> adminGetBookCheck_0() {
		return bookDao.adminGetBookCheck_0();
	}

	@Override
	public List<Book> adminGetBookCheck_1() {
		return bookDao.adminGetBookCheck_1();
	}

	@Override
	public List<Book> adminGetBookCheck_2() {
		return bookDao.adminGetBookCheck_2();
	}

	@Override
	public void adminCheck_0Success(String b_id) {
		bookDao.adminCheck_0Success(b_id);
	}

	@Override
	public void adminCheck_3Success(String b_id) {
		bookDao.adminCheck_3Success(b_id);
	}

	@Override
	public void adminCheckNo(String b_id) {
		bookDao.adminCheckNo(b_id);
	}

	@Override
	public List<Book> getDonationBook() {
		return bookDao.getDonationBook();
	}

}
