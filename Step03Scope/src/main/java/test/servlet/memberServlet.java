package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import test.member.dto.MemberDto;

@WebServlet("/member")
public class memberServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException {
		MemberDto dto = new MemberDto(1,"김구라","상도동");
		
		req.setAttribute("mem", dto);
		
		RequestDispatcher rd = req.getRequestDispatcher("/test/member.jsp");
		rd.forward(req, resp);
	}
}