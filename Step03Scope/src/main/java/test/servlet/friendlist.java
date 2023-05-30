package test.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/friend/list")
public class friendlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//get 방식을 하면 호출되는 메소드
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		//링크를 눌렀으니 여기에 코딩
		
		//비지니스 로직을 수행해서 얻어넨 데이터(model)라고 가정
		List<String> list = new ArrayList<>();
		list.add("kim");
		list.add("gol");
		list.add("won");
		
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("/friend/list.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
