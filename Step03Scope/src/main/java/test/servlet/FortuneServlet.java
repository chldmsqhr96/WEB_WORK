package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException {
		// DB에서 로직을 읽어왔다고 가정
		String fortune = "동쪽으로 가면 귀인을 만나요";
		
		/* 
		 	HttpServletRequest 객체의 setAttribute(Key[String], value[Obj]) 메소드를 통해
		 	응답에 필요한 데이터를 담아둘 수가 있다.
		 	담은 데이터는 응답하기 전까지 유효하며, 응답을 마친 이후는 사라지는 1회성 데이터이다.
		 	담은 데이터를 얻어내는 방법은 HttpServletRequest객체의 getAttribute(key)를 사용하면된다.
			단, 담을때는 object type으로 받아 주기 떄문에 어떤 type이든 담을 수 있지만
			얻어낼때도 역시 object type으로 return되기에 원래 type을 기억하고 있다가
			casting하는 것이 필요하다.
			
			예를 들어, "fortuneToday"라는 key값으로 String 타입을 담았다면.
			얻어낼때는 아래와 같은 code가 된다.
		*/
		req.setAttribute("fortuneT", fortune);
		
		// 응답을 여기서 하지 않고 jsp페이지로 응답을 위임할 수 있음
		// getRequestDispatcher == jsp 페이지에 대한 요청 전달객체(짬처리)
		RequestDispatcher rd = req.getRequestDispatcher("/test/fortune.jsp");
		/*
		 	webapp/test/fortune.jsp 페이지에게 응답을 대신하도록 하고
		 	서블릿으로 부터 받은 응답에 필요한 HttpServletRequest, HttpServletResponse 객체를 전달
		 */
		rd.forward(req, resp); // forward를 통해 jsp페이지로 이동
	}
}
