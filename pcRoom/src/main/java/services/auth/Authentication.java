package services.auth;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import bean.MembersInfo;
import bean.PcRoom;
import bean.Action;


public class Authentication {
	private HttpSession session;
	private HttpServletRequest req;
	private DataAccessOb dao;
	private MembersInfo mi;
	private PcRoom pc;
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
		case 2:
			action = this.idCheckCtl();
			break;

		case 0:
			action = this.afterAccess();
			break;
		case 3:
			action = this.setMembers();
			break;
		case 4:
			action = this.accessCtlTwo();
			break;
		default:
		}
		return action;
	}
	//===============================두번째 화면 멤버이름&피씨방이름 표출
	private Action accessCtlTwo() {

		Action action = new Action();
		boolean tran = false;
		
		this.mi = new MembersInfo();
		this.mi.setNickName(this.req.getParameter("nickName"));
		this.pc = new PcRoom();
		this.pc.setPcName("인디고PC방");

		dao = new DataAccessOb();
		Connection conn = dao.getConnection();
		dao.modifyTranStatus(conn, false);
		
		session = this.req.getSession();
		session.setAttribute("pcName", pc.getPcName());
		
		req.setAttribute("nickName", mi.getNickName());
		req.setAttribute("pcRoomName", pc.getPcName());
		
		tran = true;
		
		action.setPage(tran ? "mainOne.jsp" : "main.jsp");
		action.setRedirect(tran ? false : true);

		dao.setTransaction(conn, tran);
		dao.modifyTranStatus(conn, true);
		dao.closeConnection(conn);

		return action;
	}
	//===============================회원가입
	private Action setMembers() {
		Action action = new Action();
		boolean tran = false;
		
		this.mi = new MembersInfo();
		this.mi.setNickName(this.req.getParameter("nickname"));
		this.mi.setMemName(this.req.getParameter("pName"));
		this.mi.setPhoneNum(this.req.getParameter("phonenum"));
		this.mi.setPassWord(this.req.getParameter("pPassword"));
		
		dao = new DataAccessOb();
		Connection conn = dao.getConnection();
		dao.modifyTranStatus(conn, false);
		
		if(dao.setMember(conn, mi)) {
			tran =true;
		}

		action.setPage(tran ? "main.html" : "signin.html");
		action.setRedirect(tran ? false : true);

		dao.setTransaction(conn, tran);
		dao.modifyTranStatus(conn, true);
		dao.closeConnection(conn);

		return action;
	}
	
	
	private Action idCheckCtl() {
		Action action = new Action();

		boolean tran = false;

		this.mi = new MembersInfo();
		this.mi.setNickName(this.req.getParameter("idinput"));

		dao = new DataAccessOb();
		Connection conn = dao.getConnection();
		dao.modifyTranStatus(conn, false);

		if (dao.idCheckInfo(conn, mi)) {
			req.setAttribute("accessInfo", mi.getNickName());
			tran = true;
		}

		action.setPage(tran ? "idCheckResult.jsp" : "idCheckFalse.jsp");
		action.setRedirect(tran ? false : true);

		dao.setTransaction(conn, tran);
		dao.modifyTranStatus(conn, true);
		dao.closeConnection(conn);

		return action;
	}

	private Action accessCtl() {
		
		Action action = new Action();
		

		boolean tran = false;
		this.mi = new MembersInfo();
		this.mi.setNickName(this.req.getParameter("nickName"));
		this.mi.setPassWord(this.req.getParameter("pPassword"));
		this.mi.setState(1);

		dao = new DataAccessOb();
		Connection conn = dao.getConnection();
		dao.modifyTranStatus(conn, false);

		if (dao.isMember(conn, mi)) {

			req.setAttribute("accessInfo", mi.getNickName());
			tran = true;
		}
		System.out.println(mi.getNickName());
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
