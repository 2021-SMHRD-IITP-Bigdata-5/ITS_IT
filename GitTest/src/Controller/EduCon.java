package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import DAO.EduDAO;
import DAO.UserDAO;
import DTO.EduDTO;

@WebServlet("/EduCon")
public class EduCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String s_edu_info = request.getParameter("edu_info");
		String s_edu_addr = request.getParameter("edu_addr");
		String s_edu_part = request.getParameter("edu_part");
		String s_edu_kind = request.getParameter("edu_kind");
		String out_time_data = request.getParameter("out_time_data");
		String[] edu_seq = request.getParameterValues("myedu");
		System.out.println(Arrays.toString(edu_seq));
		
//		for(int i = 0; i < edu_seq.length; i++) {
//			System.out.println("phm :"+edu_seq[i]);
//		}
		
//		if(edu_seq.length > 0){
//			for(int i=0; i<edu_seq.length;i++){
//				System.out.println(edu_seq[i]);
//			}
//		}

		if(out_time_data == null) {
			out_time_data = "N";
		}
		
		EduDAO dao = new EduDAO();
		ArrayList<EduDTO> search_list = dao.Search(s_edu_info, s_edu_addr, s_edu_part, s_edu_kind, out_time_data);
		
		Gson gson = new Gson();
		JsonArray jarray = new JsonArray();
		
		for(int i=0;i<search_list.size();i++) {
			jarray.add(gson.toJson(search_list.get(i)));
		}
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(jarray);
	
	}

}
