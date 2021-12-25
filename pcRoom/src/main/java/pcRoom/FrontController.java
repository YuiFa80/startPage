package pcRoom;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Action;
import services.auth.Authentication;



@WebServlet({"/Go","/Out"})
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public FrontController() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		this.getPost(req, res);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		this.getPost(req, res);
	}
	
	void getPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		Action action = new Action();
		String jobCode = req.getRequestURI().substring(req.getContextPath().length() + 1); // >>jobCode생성
		HttpSession session = req.getSession();
		System.out.println(jobCode);
		System.out.println(session.getAttribute("nickName"));
		
		Authentication auth = null;
	
		if (session.getAttribute("nickName") != null) {
			if (jobCode.equals("S")) { //미구현
				
				auth = new Authentication(req);
				action = auth.backController(0);
				
			}else if(jobCode.equals("Out")){

				auth = new Authentication(req);
				action = auth.backController(-1);
				
			}else if(jobCode.equals("Go")){
				
				auth = new Authentication(req);
				action = auth.backController(1);
				
			}else{

				action = new Action();
				action.setRedirect(true);
				action.setPage("index.html");
			}
		}
		 else {
			if (jobCode.equals("Go")) {
				auth = new Authentication(req);
				action = auth.backController(1);
			} else {
				action = new Action();
				action.setRedirect(true);
				action.setPage("index.html");
			}
		}
			if (action.isRedirect()) {
				res.sendRedirect(action.getPage());

			} else {

				RequestDispatcher dp = req.getRequestDispatcher(action.getPage());
				

				dp.forward(req, res);
			}
	}

}
