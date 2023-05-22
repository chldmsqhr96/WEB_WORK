package Test.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Test.dto.MemberDto;

@WebServlet("/member/list")
public class MemberTable extends HttpServlet {
 @Override
protected void service(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		List<MemberDto> list = new ArrayList<>();
		list.add(new MemberDto(1, "김구라", "행신동"));
		list.add(new MemberDto(2, "해골", "분당동"));
		list.add(new MemberDto(3, "원숭이", "정자동"));
		
		PrintWriter a = resp.getWriter();
		a.println("<!doctype html>");
		a.println("<html>");
		a.println("<head>");
		a.println("<meta charset=\"UTF-8\" />");
		a.println("<title>친구 목록</title>");
		a.println("</head>");
		a.println("<body>");
		
		a.println("<h1>테이블</h1>");
		
		a.println("<table border=\"1\">");
		a.println("<thead>");
			a.println("<tr>");
				a.println("<th>번호</th>");
				a.println("<th>이름</th>");
				a.println("<th>주소</th>");
			a.println("</tr>");
		a.println("</thead>");
		a.println("<tbody>");
			for(MemberDto tmp : list) {
				a.println("<tr>");
					a.println("<td>" + tmp.getNum() + "</td>");
					a.println("<td>" + tmp.getName() + "</td>");
					a.println("<td>" + tmp.getAddr() + "</td>");
				a.println("</tr>");
			}
		a.println("</tbody>");
		a.println("</table>");	
		a.println("</body>");
		a.println("</html>");
		a.close(); 
 	}
}