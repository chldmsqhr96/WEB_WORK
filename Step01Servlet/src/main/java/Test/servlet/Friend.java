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

@WebServlet("/friend/list")
public class Friend extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		List<String> members = new ArrayList<>();
		members.add("김구라");
		members.add("해골");
		members.add("원숭이");
		
		PrintWriter a = resp.getWriter();
		a.println("<!doctype html>");
		a.println("<html>");
		a.println("<head>");
		a.println("<meta charset=\"UTF-8\" />");
		a.println("<title>친구 목록</title>");
		a.println("</head>");
		a.println("<body>");
		a.println("<h1>친구 목록입니다.</h1>");
		a.println("<ul>");
		
		for(int i=0; i<3; i++) {
			a.println("<li>" + members.get(i) + "</li>");
		}
		
		a.println("</ul>");
		a.println("</body>");
		a.println("</html>");
		a.close(); 
	}
}
