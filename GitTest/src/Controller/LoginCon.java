package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Member_DAO;
import DTO.Member_DTO;


@WebServlet("/LoginCon")
public class LoginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
				
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		Member_DAO dao = new Member_DAO();
			
		Member_DTO dto = dao.Login(mem_id,mem_pw);
		
		if(dto!=null) {
			session.setAttribute("dto", dto);
			response.sendRedirect("main.jsp");
		}else {
			response.sendRedirect("LoginFalse.jsp");
		}
	}

}
