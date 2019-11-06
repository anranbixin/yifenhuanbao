import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GarbageServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        GarbageDao garbageDao=new GarbageDao();
        String gname = request.getParameter("gname");
        String gdesc = request.getParameter("gdesc");
        String gpic=request.getParameter("gpic");
        String gtype=request.getParameter("gtype");
        String method=request.getParameter("method");
        //String sql = "INSERT INTO garbage(garbage_name,garbage_content,garbage_picture,garbage_type) VALUES('"  + gname + "','" + gdesc +"','"+ gpic + "','" + gtype + "')";
        try {
             garbageDao.addGarbage(gname, gdesc, gpic, gtype);
             request.getRequestDispatcher("jsp/garbage_list.jsp").forward(request, response);
        } catch (Exception e) {
            request.getRequestDispatcher("error.jsp").forward(request, response);
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }
}
