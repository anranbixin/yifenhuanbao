import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/NewsAlter")
public class NewsAlter extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        int id=Integer.valueOf(request.getParameter("news_id"));
        String title=request.getParameter("news_title");
        String text=request.getParameter("news_text");
        String pic=request.getParameter("news_pic");
        String time=request.getParameter("news_time");
        String author=request.getParameter("news_author");
        NewsDao newsDao=new NewsDao();
        try
        {
            newsDao.alterNews(id,title,text,pic,time,author);
            request.getRequestDispatcher("jsp/news_list.jsp").forward(request,response);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
