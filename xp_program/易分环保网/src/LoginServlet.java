import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        this.doPost(request,response);
    }

    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException
    {
        response.setContentType("text/html;charset=gbk");
        request.setCharacterEncoding("utf-8");
        //PrintWriter out=response.getWriter();
        Admin admin=new Admin();
        AdminDao admindao = new AdminDao();

        admin.setLoginName(request.getParameter("loginName"));
        admin.setLoginPass(request.getParameter("loginPass"));
        String loginName=admin.getLoginName();

        try {
            if(admindao.validate(admin)){
                request.getSession().setAttribute("loginName",loginName);
                request.getRequestDispatcher("system.jsp").forward(request,response);
//                response.sendRedirect("system.jsp");
            }else {
                request.getRequestDispatcher("login.jsp").forward(request,response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }


//        admin.setLoginName(request.getParameter("loginName"));
//        admin.setLoginPass(request.getParameter("loginPass"));
//        String loginName=admin.getLoginName();
//        AdminDao adminDao=new AdminDao();
//        //登录
//        if(adminDao.validate(admin))
//            {
//            request.getSession().setAttribute("loginName",loginName);
//            request.getRequestDispatcher("system.jsp").forward(request,response);
//        }
//        else
//        {
//            request.getRequestDispatcher("login.jsp").forward(request,response);
//        }

    }
}
