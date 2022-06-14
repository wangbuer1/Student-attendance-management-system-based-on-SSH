package manage.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import manage.dao.BanJiDao;
import manage.dao.KechengDao;
import manage.dao.SubjectDao;
import manage.model.BanJi;
import manage.model.Kecheng;
import manage.model.Subject;
import manage.model.User;
import manage.util.Util;

public class SubjectAction  {
	
	private static final long serialVersionUID = 7963004028001698964L;

	private SubjectDao subjectDao;




	public SubjectDao getSubjectDao() {
		return subjectDao;
	}




	public void setSubjectDao(SubjectDao subjectDao) {
		this.subjectDao = subjectDao;
	}




	
	@SuppressWarnings("unchecked")
	public String subjectlist() throws Exception {	
		HttpServletRequest request = ServletActionContext.getRequest();
		int numPerPage = 20;
		 int pageNum = 1;
		if(request.getParameter("pageNum")!=null && !request.getParameter("pageNum").equals("")){
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		if(request.getParameter("numPerPage")!=null){
			numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
		}
		int total = subjectDao.selectAllSubjectCount();
		List<Subject> subjects = subjectDao.selectAllSubject(
				(pageNum - 1) * numPerPage, numPerPage);
		request.setAttribute("totalCount", total);
		request.setAttribute("ps", numPerPage);
		request.setAttribute("pn", pageNum);
		request.setAttribute("subjectlist", subjects);
		return "success";
	}
	
	
	
	

	public String subjectadd(){
		HttpServletRequest request = ServletActionContext.getRequest();
		return "success";
	}
	
	
	
	public String subjectadd2() throws Exception{
        HttpServletRequest request = ServletActionContext.getRequest();
		
		Subject subject = new Subject();
		
		subject.setSubjectname(request.getParameter("subjectname"));
		
		
		subject.setCreatetime(new Date());
		
		
			subjectDao.insertSubject(subject);
		
			
		HttpServletResponse resp = ServletActionContext.getResponse();
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		//out.write(manage.util.Util.outPutMsg("200", "添加成功", "", "", "subjectlist.html"));
		
		out.print("{\"statusCode\":\"200\", \"message\":\"添加成功！\",\"navTabId\":\"subjectList\", \"rel\":\"subjectList\", \"callbackType\":\"closeCurrent\",\"forwardUrl\":\"subject/subjectlist.html\"}");
		out.flush();
		out.close();
	
		return null;
	}
	
	
	public String  subjectupdate(){
		HttpServletRequest request = ServletActionContext.getRequest();
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("bean", subjectDao.selectSubject(id));
		request.setAttribute("id", id);
		//request.setAttribute("subjectilist", subjectDao.getAll(" and subjectlock=0 "));
		return "success";
	}
	
	

	public String  subjectupdate2() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		int id = Integer.parseInt(request.getParameter("id"));
		Subject bean = subjectDao.selectSubject(id);
		
		
		if(request.getParameter("subjectname")!=null){
			bean.setSubjectname(request.getParameter("subjectname"));
		}
		
		subjectDao.updateSubject(bean);
		//out.write(manage.util.Util.outPutMsg("200", "修改成功", "", "", "subjectlist.html"));
		out.print("{\"statusCode\":\"200\", \"message\":\"修改成功！\",\"navTabId\":\"subjectList\", \"rel\":\"subjectList\", \"callbackType\":\"closeCurrent\",\"forwardUrl\":\"subject///subjectlist.html\"}");

		out.flush();
		out.close();
		return null;
	}
	
	

	public String subjectdel() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		int id = Integer.parseInt(request.getParameter("id"));
		subjectDao.delSubject(subjectDao.selectSubject(id));
		HttpServletResponse resp = ServletActionContext.getResponse();
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		//out.print("{\"statusCode\":\"200\", \"message\":\"删除成功！\",\"navTabId\":\"subjectList\", \"rel\":\"subjectList\", \"callbackType\":\"closeCurrent\",\"forwardUrl\":\"subject///subjectlist.html\"}");
		out.write(manage.util.Util.outPutMsg("200", "修改成功", "subjectList", "", false, "subject///subjectlist.html"));
		out.flush();
		out.close();
		return null;
	}
	
	
}
