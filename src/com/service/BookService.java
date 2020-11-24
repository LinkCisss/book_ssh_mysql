package com.service;

import java.util.List;
import java.util.Objects;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.BookDao;
import com.entity.Book;

@Service	// 注解为service层spring管理bean
@Transactional	// 注解此类所有方法加入spring事务, 具体设置默认
public class BookService {

	@Resource	
	private BookDao bookDao;
	
	
	/**
	 * 通过名称搜索
	 * @param category
	 * @param page
	 * @param size
	 * @return
	 */
	@SuppressWarnings("JavadocReference")
	public List<Book> getList(String name, int page, int size) {
		return bookDao.getList(name, page, size);
	}
	
	/**
	 * 分类数量
	 * @return 无记录返回空集合
	 */
	public long getTotal(String name){
		return bookDao.getTotal(name);
	}
	
	/**
	 * 通过分类搜索
	 * @param categoryid
	 * @param page
	 * @param size
	 * @return
	 */
	public List<Book> getCategoryList(int categoryid, int page, int size) {
		return bookDao.getCategoryList(categoryid, page, size);
	}
	
	/**
	 * 分类数量
	 * @return 无记录返回空集合
	 */
	public long getCategoryTotal(int categoryid){
		return bookDao.getCategoryTotal(categoryid);
	}
	
	/**
	 * 获取特卖列表
	 * @return 无记录返回空集合
	 */
	public List<Book> getSpecialList(int type, int page, int size){
		return bookDao.getSpecialList(type, page, size);
	}
	
	/**
	 * 获取特卖列表
	 * @return 无记录返回空集合
	 */
	public long getSpecialTotal(int type){
		return bookDao.getSpecialTotal(type);
	}

	/**
	 * 通过id获取
	 * @param bookid
	 * @return
	 */
	public Book get(int bookid) {
		Book book = bookDao.get(Book.class, bookid);
		// 只显示前70个字符
		if(Objects.nonNull(book) && book.getIntro().length() > 70) {
			book.setIntro(book.getIntro().substring(0, 70) + "...");
		}
		return book;
	}

	/**
	 * 图书列表
	 * @param status
	 * @return
	 */
	public List<Book> getList(int status, int page, int rows) {
		return bookDao.getList(status, page, rows);
	}

	/**
	 * 总数
	 * @return
	 */
	public long getTotal(int status) {
		return bookDao.getTotal(status);
	}

	/**
	 * 添加
	 * @param book
	 */
	public Integer add(Book book) {
		return bookDao.save(book);
	}

	/**
	 * 修改
	 * @param book
	 * @return 
	 */
	public boolean update(Book book) {
		return bookDao.update(book);
	}

	/**
	 * 删除
	 * @param book
	 */
	public boolean delete(Book book) {
		return bookDao.delete(book);
	}

	
	
}