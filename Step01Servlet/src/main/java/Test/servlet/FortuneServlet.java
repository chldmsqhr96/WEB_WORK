package Test.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
1. 클래스 상속
2. 서비스 메소드 오버라이드
3. 클래스 위에 @WebServlet후 어떤 경로를 처리할 것인지 설정 EX> @WebServlet("/fortune")
*/

@WebServlet("/fortune") //3.
public class FortuneServlet extends HttpServlet { //1.
	
	@Override //2.
	protected void service(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException {
		//클라이언트에게 문자열을 응답할 수 있는 객체의 참조값 얻어내기.
		
		//응답 인코딩 설정
		resp.setCharacterEncoding("utf-8");
		
		//응답 컨텍트 설정
		resp.setContentType("text/html; charset=utf-8");
		
		PrintWriter a = resp.getWriter();
		a.println("<!doctype html>");
		a.println("<html>");
		a.println("<head>");
		a.println("<meta charset=\"UTF-8\" />");
		a.println("<title>오늘의 운세</title>");
		a.println("</head>");
		a.println("<body>");
		
		String[] fortunes= {
				"오늘은 집에만 계세요",
				"동쪽으로 가면 귀인을 만나요",
				"너무 멀리가지 마세요",
				"오늘은 뭘해도 되는 날이에요",
				"오늘 로또 당첨되요"
		};
		
		Random ran = new Random();
		int rs = ran.nextInt(fortunes.length);
		
		a.println("<p>" + fortunes[rs] + "</p>");
		a.println("</body>");
		a.println("</html>");
		a.close(); 
	}
}