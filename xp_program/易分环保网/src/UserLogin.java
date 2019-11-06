import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");

        User user=new User();
        UserDao userDao=new UserDao();
        user.setLoginName(request.getParameter("username"));
        user.setLoginPass(request.getParameter("password"));
        String loginName=user.getLoginName();
        try
        {
            if(userDao.validateUser(user))
            {
                request.getSession().setAttribute("loginName",loginName);
                request.getRequestDispatcher("forjsp/index.jsp").forward(request,response);
            }
            else
            {
                request.getRequestDispatcher("forjsp/login.jsp").forward(request,response);
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
