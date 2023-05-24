package Test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/send")
public class sendServlet extends HttpServlet{
	/*
	 service() 메소드에는 2개의 객체의 참조값이 매게 변수에 전달된다.
	 
	 1. httpServletRequest 객체 => 요청과 관련된 작업을 처리할 때 사용된다.
	 2. httpServletResponse 객체 => 응답과 관련된 작업을 처리할 때 사용된다.
	 */
	
	/*
	req.getParameter("hello");
	req.getParameterValues("hello");
	*/
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		String msg = req.getParameter("msg");
		//콘솔창에 출력
		System.out.println("msg:"+ msg);
		
		PrintWriter a = resp.getWriter();
	
		a.println("<!doctype html>");
		a.println("<html>");
		a.println("<head>");
		a.println("<meta charset=\"UTF-8\" />");
		a.println("<title>메세지</title>");
		a.println("</head>");
		a.println("<body>");
		a.println("<p>메세지 잘받았음</p>");
		a.println("</body>");
		a.println("</html>");
		a.close(); 
	}
}
