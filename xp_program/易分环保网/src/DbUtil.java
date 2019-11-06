import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class DbUtil {

//	ResourceBundle bundle = ResourceBundle.getBundle("jdbc");
//
//	private String dbUrl = bundle.getString("dbUrl");
//	private String dbUser = bundle.getString("dbUser");
//	private String dbPassword = bundle.getString("dbPassword");
//	private String driver = "com.mysql.jdbc.Driver";


	private String dbUrl = "jdbc:mysql://localhost:3306/garbagedb?serverTimezone=UTC&characterEncoding=utf-8&autoReconnect=true";
	private String dbUser = "root";
	private String dbPassword = "root";
	private String driver = "com.mysql.jdbc.Driver";

	private Connection connection = null;

	public Connection getConnection(){
		try {
			System.out.println("开始链接数据库……");
			Class.forName(driver);
			connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			System.out.println("数据库连接成功");
		} catch (Exception e) {
			System.out.println("数据库连接失败");
			e.printStackTrace();
		}
		return connection;
	}

	public void closeCon(){
		if(connection != null)
			try {
				connection.close();
				System.out.println("数据库已关闭");
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}


	//test 数据库的链接和关闭
	public static void main(String[] args)
	{
		DbUtil db = new DbUtil();
		System.out.println("啊啊啊啊~");
		try{
			System.out.println("请等待……");
			db.getConnection();

		} catch (Exception e) {
			e.printStackTrace();
            System.out.println("数据库连接失败！");
		}

		try{
			System.out.println("请等待……");
			db.closeCon();

		} catch (Exception e){
			e.printStackTrace();
			System.out.println("数据库关闭失败！");

		}
	}

}
