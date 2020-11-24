package com.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.entity.Book;
import com.entity.Category;
import com.service.BookService;
import com.service.CategoryService;
import com.service.UserService;
import com.util.PageUtil;

@Namespace("/index")
@Results({
	@Result(name="index",location="/index/index.jsp"),
	@Result(name="about",location="/index/about.jsp"),
	@Result(name="category",location="/index/category.jsp"),
	@Result(name="special",location="/index/special.jsp"),
	@Result(name="new",location="/index/new.jsp"),
	@Result(name="sale",location="/index/sale.jsp"),
	@Result(name="login",location="/index/login.jsp"),
	@Result(name="register",location="/index/register.jsp"),
	@Result(name="detail",location="/index/detail.jsp"),
	@Result(name="right",location="/index/right.jsp"),
	@Result(name="search",location="/index/search.jsp"),
})	
public class IndexAction extends BaseAction{

	private int bookid;
	private int categoryid;
	private int flag;
	private Book book;
	private String searchName;
	
	private List<Book> bookList;
	private List<Book> specialList;
	private List<Book> newList;
	private List<Book> saleList;
	private List<Category> categoryList;
	
	@Resource
	private UserService userService;
	@Resource
	private BookService bookService;
	@Resource
	private CategoryService categoryService;
	

	/**
	 * 首页
	 * @return
	 */
	@Action("index")
	public String index(){
		categoryList = categoryService.getList();
		saleList = bookService.getSpecialList(Book.type_sale, 1, 2);
		specialList = bookService.getSpecialList(Book.type_special, 1, 2);
		newList = bookService.getSpecialList(Book.type_new, 1, 6);
		flag = 1;
		return "index";
	}
	
	/**
	 * 简介
	 * @return
	 */
	@Action("about")
	public String about(){
		categoryList = categoryService.getList();
		saleList = bookService.getSpecialList(Book.type_sale, 1, 2);
		flag = 2;
		return "about";
	}
	
	/**
	 * 精品推荐
	 * @return
	 */
	@Action("special")
	public String special(){
		categoryList = categoryService.getList();
		saleList = bookService.getSpecialList(Book.type_sale, 1, 2);
		specialList = bookService.getSpecialList(Book.type_special, page, 3);
		pageTool = PageUtil.getPageTool(super.getRequest(), bookService.getSpecialTotal(Book.type_special), page, 3);
		flag = 3;
		return "special";
	}
	
	/**
	 * 最新出版
	 * @return
	 */
	@Action("new")
	public String news(){
		categoryList = categoryService.getList();
		saleList = bookService.getSpecialList(Book.type_sale, 1, 2);
		newList = bookService.getSpecialList(Book.type_new, page,3);
		pageTool = PageUtil.getPageTool(super.getRequest(), bookService.getSpecialTotal(Book.type_new), page, 3);
		flag = 4;
		return "new";
	}
	
	/**
	 * 优惠促销
	 * @return
	 */
	@Action("sale")
	public String sale(){
		categoryList = categoryService.getList();
		saleList = bookService.getSpecialList(Book.type_sale, 1, 2);
		saleList = bookService.getSpecialList(Book.type_sale, page, 3);
		pageTool = PageUtil.getPageTool(super.getRequest(), bookService.getSpecialTotal(Book.type_sale), page, 3);
		flag = 5;
		return "sale";
	}
	
	/**
	 * 类目搜索
	 * @return
	 */
	@Action("category")
	public String category(){
		categoryList = categoryService.getList();
		saleList = bookService.getSpecialList(Book.type_sale, 1, 2);
		bookList = bookService.getCategoryList(categoryid, page, 12);
		pageTool = PageUtil.getPageTool(super.getRequest(), bookService.getCategoryTotal(categoryid), page, 12);
		return "category";
	}
	
	/**
	 * 名称搜索
	 * @return
	 */
	@Action("search")
	public String search(){
		categoryList = categoryService.getList();
		saleList = bookService.getSpecialList(Book.type_sale, 1, 2);
		if (searchName!=null && !searchName.trim().isEmpty()) {
			bookList = bookService.getList(searchName, page, 12);
			pageTool = PageUtil.getPageTool(super.getRequest(), bookService.getTotal(searchName), page, 12);
		}
		return "search";
	}
	
	/**
	 * 详情
	 * @return
	 */
	@Action("detail")
	public String detail(){
		categoryList = categoryService.getList();
		saleList = bookService.getSpecialList(Book.type_sale, 1, 2);
		categoryList = categoryService.getList();
		saleList = bookService.getSpecialList(Book.type_sale, 1, 2);
		book = bookService.get(bookid);
		return "detail";
	}


	
	public List<Book> getBookList() {
		return bookList;
	}

	public void setBookList(List<Book> bookList) {
		this.bookList = bookList;
	}

	public List<Book> getSpecialList() {
		return specialList;
	}

	public void setSpecialList(List<Book> specialList) {
		this.specialList = specialList;
	}

	public List<Book> getNewList() {
		return newList;
	}

	public void setNewList(List<Book> newList) {
		this.newList = newList;
	}

	public List<Book> getSaleList() {
		return saleList;
	}

	public void setSaleList(List<Book> saleList) {
		this.saleList = saleList;
	}

	public List<Category> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public int getBookid() {
		return bookid;
	}

	public void setBookid(int bookid) {
		this.bookid = bookid;
	}

	public int getCategoryid() {
		return categoryid;
	}

	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	
}
