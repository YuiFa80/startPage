package services.auth;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import bean.Action;
import bean.MembersInfo;

public class PcRoomStore {
	private HttpSession session;
	private HttpServletRequest req; //HTTP요청 메세지를 파싱
	private MembersInfo mem;
	private DataAccessOb dao;
	
	public PcRoomStore(HttpServletRequest req) {
		this.req = null;
	}
	
	public Action backController(int jobCode) {
		Action action = null;
		switch(jobCode) {
		case 1:
			action = this.getIndigoCtl();
			break;
		default:
		}
		
		return action;
	}
	
	private Action getIndigoCtl() {
		Action action = new Action();
		ArrayList<MembersInfo> list = null;
		
		this.mem = new MembersInfo();
		this.mem.setNickName(req.getParameter("nickName"));
		
		return action;
	}
}
