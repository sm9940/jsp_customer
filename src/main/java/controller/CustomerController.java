package controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import DAO.CustomerDAO;
import DTO.Customer;



/**
 * Servlet implementation class CustomerController
 */
@WebServlet("/")
@MultipartConfig(maxFileSize=1024*1024*2, location="c:/Temp/img")
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustomerDAO dao;
    private ServletContext ctx;
    
    @Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dao = new CustomerDAO();
		ctx = getServletContext();
		
	}   
    
	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String command = req.getServletPath();
		String site = null;
		
		switch(command){
		case "/index" : site = getList(req); break;
		case "/view" : site = getView(req); break;
		case "/regist" : site = "regist.jsp"; break;
		case "/insert" : site = regist(req); break;
		}
		
		if(site.startsWith("redirect:/")) {
			String rview = site.substring("redirect:/".length()); //index: 10
			resp.sendRedirect(rview); //rview: /index
		} else {
			 ctx.getRequestDispatcher("/"+site).forward(req, resp);
		}
	}
	
  public String getList(HttpServletRequest req) {
	  List<Customer> list;
	  try {
		list = dao.getList();
		req.setAttribute("customerList", list);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		req.setAttribute("error", "고객 정보목록을 정상적으로 가져오지 못하였습니다.");
	}
	  return "index.jsp";
  }
   
  public String getView(HttpServletRequest req){
	  int id = Integer.parseInt(req.getParameter("id"));
	  Customer c;
	try {
		c = dao.getView(id);
		req.setAttribute("customer", c);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return "view.jsp";
  }
  public String regist(HttpServletRequest req) {
	  Customer c = new Customer();
	  
	  try {
		BeanUtils.populate(c, req.getParameterMap());
		Part part = req.getPart("file");
		String fileName = getFileName(part);
		if(fileName !=null && !fileName.isEmpty()) {
			part.write(fileName);
			c.setImg("/img/"+fileName);
		} 
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} 
	  return "redirect:/index";
  }

  private String getFileName(Part part) {
	  String fileName = null;
	  String header = part.getHeader("content-disposition");
	  
	  int start = header.indexOf("filename=");
	  fileName = header.substring(start+10,header.length()-1);
	  
	  return fileName;
  }
}
