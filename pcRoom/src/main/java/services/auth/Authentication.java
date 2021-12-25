package services.auth;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import bean.MembersInfo;
import bean.Action;


public class Authentication {
	private HttpSession session;
	private HttpServletRequest req;
	private DataAccessObject dao;
	private MembersInfo mi;
	private Action action;

	public Authentication(HttpServletRequest req) {
		this.req = req;
		dao = null;
	}

	public Action backController(int jobCode) { // Action -->>로그인 > 동적페이지, 로그아웃 > 정적페이지
		Action action = null;
		switch (jobCode) {
		case 1:
			action = this.accessCtl();
			break;
		case -1:
			action = this.accessOutCtl();
			break;

		case 0:
			action = this.afterAccess();
			break;
		default:
		}
		return action;
	}
	
	private Action accessCtl() {
		System.out.println(this.req.getParameter("nickName"));
		Action action = new Action();
		ArrayList<MembersInfo> list = null;
		
		boolean tran = false;

		// 1.추출해서 bean에 저장 -->>Employees :: srCode, emCode, emPassword
		this.mi = new MembersInfo();
		this.mi.setNickName(this.req.getParameter("nickName"));
		this.mi.setPassWord(this.req.getParameter("pPassword"));
		this.mi.setState(1);

		// 2.DAO 연동(insert(1,0) -->> boolean , select -->>ArrayList ,update(update된 갯수-->)
		dao = new DataAccessObject();
		Connection conn = dao.getConnection();
		dao.modifyTranStatus(conn, false);
		// 2-1::STORES에서 SRCode 존재여부 확인
		// 2-2::EMPLOYEES에서 EMCODE 존재여부 확인
		// 2-3::EMPLOYEES에서 PASSWORD 일치 여부확인 :: RETURN : 1 >> 2-4
		// 2-4::ACCESSHISTORY:INSERT::RETURN:1
		// 2-5::정보취합 -->>ARRAYLIST<EMPLOYEES>
		// 성공했으면 main.jsp
		// 실패했으면 index.html

		
			
			if (dao.isMembers(conn, mi)) {
				
				if (dao.insAccessHistory(conn, mi)) {
					tran = true;
					System.out.println(mi.getNickName());
					//(섹션)▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
					session = this.req.getSession();
					session.setAttribute("nickName", mi.getNickName());
					//(섹션)▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
					if ((list = dao.getAccessInfo(conn, mi)) != null) {
						
						req.setAttribute("accessInfo", list); //>>필요한 작업
						System.out.println(list);
					}
				}
			}
		

		action.setPage(tran ? "main.jsp" : "index.html");
		action.setRedirect(tran ? false : true);

		dao.setTransaction(conn, tran);
		dao.modifyTranStatus(conn, true);
		dao.closeConnection(conn);

		return action;
	}
	private Action accessOutCtl() {
		return action;
	}
	private Action afterAccess() {
		return action;
	}
}
