import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/NewsServlet")
public class NewsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    /** @noinspection deprecation*/
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        NewsDao newsDao = new NewsDao();
//        try {
//            ResultSet rs = newsDao.selectNews();
//            while(rs.next()){
//                    rs.getString(1);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }


    }
}
