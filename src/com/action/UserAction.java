package com.action;

import java.util.List;
import java.util.Objects;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.entity.Book;
import com.entity.Category;
import com.entity.Indent;
import com.entity.Users;
import com.service.BookService;
import com.service.CategoryService;
import com.service.IndentService;
import com.service.UserService;
import com.util.SafeUtil;

@Namespace("/index")
@Results({
	@Result(name="login",location="/index/login.jsp"),
	@Result(name="register",location="/index/register.jsp"),
	@Result(name="cart",location="/index/cart.jsp"),
	@Result(name="order",location="/index/order.jsp"),
	@Result(name="my",location="/index/my.jsp"),
	@Result(name="index",location="index.action",type="redirect"),
})
public class UserAction extends BaseAction{
	
	private static final String indentKey = "indent";
	
	private int flag;
	private int bookid;
	private Users user;
	private Indent indent;

	private List<Book> saleList;
	private List<Category> categoryList;
	private List<Indent> indentList;
	
	@Resource
	private UserService userService;
	@Resource
	private BookService bookService;
	@Resource
	private IndentService indentService;
	@Resource
	private CategoryService categoryService;

	
	/**
	 * 注册用户
	 * @return
	 */
	@Action("register")
	public String register(){
		flag = 7;
		if (user.getUsername().isEmpty()) {
			getRequest().setAttribute("msg", "用户名不能为空!");
			return "register";
		}else if (userService.isExist(user.getUsername())) {
			getRequest().setAttribute("msg", "用户名已存在!");
			return "register";
		}else {
			userService.add(user);
			getRequest().setAttribute("msg", "注册成功, 请登录!");
			return "login";
		}
	}
	
	/**
	 * 用户登录
	 * @return
	 * @throws Exception
	 */
	@Action("login")
	public String login() {
		flag = 6;
		Users loginUser = userService.checkUser(user.getUsername(), user.getPassword());
		if(Objects.nonNull(loginUser)){
			getSession().setAttribute("user", loginUser);
			return "index";
		} else {
			getRequest().setAttribute("msg", "用户名或密码错误!");
			return "login";
		}
	}

	/**
	 * 注销登录
	 * @return
	 */
	@Action("logout")
	public String logout() {
		getSession().removeAttribute("user");
		getSession().removeAttribute("indent");
		return "login";
	}
	
	
	/**
	 * 查看购物车
	 * @return
	 */
	@Action("cart")
	public String cart() {
		categoryList = categoryService.getList();
		saleList = bookService.getSpecialList(Book.type_sale, 1, 2);
		Object sessionUser = getSession().getAttribute("user");
		if (Objects.nonNull(sessionUser)) {
			List<Indent> indentList = indentService.getListByUserid(((Users)sessionUser).getId());
			if (indentList!=null && !indentList.isEmpty()) {
				indent = indentList.get(0); // 最后一次订单信息
			}
		}
		return "cart";
	}
	
	/**
	 * 购买
	 * @return
	 */
	@Action("buy")
	public void buy(){
		Indent indent = (Indent) getSession().getAttribute(indentKey);
		if (indent==null) {
			getSession().setAttribute(indentKey, indentService.createIndent(bookService.get(bookid)));
		}else {
			getSession().setAttribute(indentKey, indentService.addIndentItem(indent, bookService.get(bookid)));
		}
		sendResponseMsg("ok");
	}
	
	/**
	 * 减少
	 */
	@Action("lessen")
	public void lessen(){
		Indent indent = (Indent) getSession().getAttribute(indentKey);
		if (indent != null) {
			getSession().setAttribute(indentKey, indentService.lessenIndentItem(indent, bookService.get(bookid)));
		}
		sendResponseMsg("ok");
	}
	
	/**
	 * 删除
	 */
	@Action("delete")
	public void delete(){
		Indent indent = (Indent) getSession().getAttribute(indentKey);
		if (indent != null) {
			getSession().setAttribute(indentKey, indentService.deleteIndentItem(indent, bookService.get(bookid)));
		}
		sendResponseMsg("ok");
	}
	
	/**
	 * 提交订单
	 * @return
	 */
	@Action("save")
	public String save(){
		Object sessionUser = getSession().getAttribute("user");
		if (Objects.isNull(sessionUser)) {
			getRequest().setAttribute("msg", "请登录后提交订单!");
			return "login";
		}
		Indent indentSession = (Indent) getSession().getAttribute(indentKey);
		indentSession.setUser((Users)sessionUser);
		indentSession.setName(indent.getName());
		indentSession.setPhone(indent.getPhone());
		indentSession.setAddress(indent.getAddress());
		indentService.saveIndent(indentSession);	// 保存订单
		getSession().removeAttribute(indentKey);	// 清除购物车
		getRequest().setAttribute("msg", "提交订单成功!");
		return cart();
	}
	
	/**
	 * 查看订单
	 * @return
	 */
	@Action("order")
	public String order(){
		flag = 9;
		categoryList = categoryService.getList();
		saleList = bookService.getSpecialList(Book.type_sale, 1, 2);
		Object sessionUser = getSession().getAttribute("user");
		if (Objects.isNull(sessionUser)) {
			getRequest().setAttribute("msg", "请登录后提交订单!");
			return "login";
		}
		indentList = indentService.getListByUserid(((Users)sessionUser).getId());
		if (indentList!=null && !indentList.isEmpty()) {
			for(Indent indent : indentList){
				indent.setItemList(indentService.getItemList(indent.getId(), 1, 100)); // 暂不分页
			}
		}
		return "order";
	}
	
	
	/**
	 * 个人中心
	 * @return
	 */
	@Action("/my")
	public String my(){
		flag = 8;
		return "my";
	}
	
	/**
	 * 个人中心
	 * @return
	 */
	@Action("/update")
	public String update(){
		flag = 8;
		Users old = userService.get(user.getId());
		old.setName(user.getName());
		old.setPhone(user.getPhone());
		old.setAddress(user.getAddress());
		userService.update(old);
		getSession().setAttribute("user", old);
		getRequest().setAttribute("msg", "修改成功");
		return "my";
	}
	
	/**
	 * 个人中心
	 * @return
	 */
	@Action("/updatePassword")
	public String updatePassword(){
		flag = 8;
		Users old = userService.get(user.getId());
		if(!old.getPassword().equals(SafeUtil.encode(user.getPassword()))) {
			getRequest().setAttribute("msg2", "原密码错误");
			return "my";
		}
		old.setPassword(SafeUtil.encode(user.getPassword2()));
		userService.update(old);
		getRequest().setAttribute("msg2", "修改成功");
		return "my";
	}
	
	
	
	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public Indent getIndent() {
		return indent;
	}

	public void setIndent(Indent indent) {
		this.indent = indent;
	}

	public List<Category> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}

	public List<Indent> getIndentList() {
		return indentList;
	}

	public void setIndentList(List<Indent> indentList) {
		this.indentList = indentList;
	}

	public int getBookid() {
		return bookid;
	}

	public void setBookid(int bookid) {
		this.bookid = bookid;
	}

	public List<Book> getSaleList() {
		return saleList;
	}

	public void setSaleList(List<Book> saleList) {
		this.saleList = saleList;
	}
	
}
