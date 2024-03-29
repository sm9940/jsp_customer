package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
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
		req.setCharacterEncoding("UTF-8");
		switch(command){
		case "/index" : site = getList(req); break;
		case "/view" : site = getView(req); break;
		case "/regist" : site = "regist.jsp"; break;
		case "/insert" : site = insertInfo(req); break;
		case "/delete": site = deleteInfo(req); break;
		case "/update": site = updateInfo(req); break;
		case "/edit" : site = getViewForEdit(req); break;
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
		req.setCharacterEncoding("UTF-8");
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		req.setAttribute("error", "고객 정보목록을 정상적으로 가져오지 못하였습니다.");
	}
	  return "index.jsp";
  }
   
  public String getView(HttpServletRequest req){
	  int id = Integer.parseInt(req.getParameter("id"));
	try {
		Customer c = dao.getView(id);
		req.setAttribute("customer", c);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return "view.jsp";
  }
  public String getViewForEdit(HttpServletRequest req) {
		int id = Integer.parseInt(req.getParameter("id"));
		try {
			Customer c = dao.getView(id);
			req.setAttribute("customer", c);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "edit.jsp";
	}
  public String insertInfo(HttpServletRequest req) {
	  Customer c = new Customer();
	  try { BeanUtils.populate(c, req.getParameterMap());
	  Part part =req.getPart("file");
	  String fileName= getFileName(part);
	  
			part.write(fileName);//서버에 파일 업로드
			
			//2. 경로를 포함한 이미지 파일 이름을 Board 객체에 저장
			c.setImg("/img/" + fileName);
		
				dao.insertInfo(c);
				} catch(Exception e) {
					e.printStackTrace();
					
				}
	  return "redirect:/index";
  }

  private String getFileName(Part part) {
	  String fileName = null;
	    String submittedFileName = part.getSubmittedFileName();
	    if (submittedFileName != null && !submittedFileName.isEmpty()) {
	        fileName = submittedFileName.substring(submittedFileName.lastIndexOf("\\") + 1);
	    }
	    return fileName;
  }
  
  public String updateInfo(HttpServletRequest req) {
	  Customer c = new Customer();
	  String origin_file = req.getParameter("origin_file");
	  try { BeanUtils.populate(c, req.getParameterMap());
	  Part part =req.getPart("file");
	  String fileName= getFileName(part);
	  if(fileName != null && !fileName.isEmpty()) {
			part.write(fileName);//서버에 파일 업로드
			
			//2. 경로를 포함한 이미지 파일 이름을 Board 객체에 저장
			c.setImg("/img/" + fileName);
		}	else {//업로드된 파일이 없을때
			if(origin_file ==null || origin_file.equals("")) {
				c.setImg(null);
			} else {
				c.setImg(origin_file);
			}
		}
				dao.updateInfo(c);
				} catch(Exception e) {
					e.printStackTrace();
					try {
						//쿼리스트링의 한글깨짐을 방지하기 위해 utf-8로 인코딩
						String encodeName = URLEncoder.encode("게시물이 정상적으로 수정되지 않았습니다!","UTF-8");
						return "redirect:/view?id="+c.getId()+"&error="+encodeName;
					} catch (UnsupportedEncodingException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}
	  return "redirect:/view?id="+c.getId();
  }
  
  public String deleteInfo(HttpServletRequest req) {
	  int id = Integer.parseInt(req.getParameter("id"));
	  try {
		dao.deleteInfo(id);
	} catch (Exception e) {
		e.printStackTrace();
		try {
			String encodeName = URLEncoder.encode("정보가 정상적으로 삭제되지 않았습니다.","utf-8");
			return "redirect:/index?error="+encodeName;
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	}
  
  return "redirect:/index";
}
}