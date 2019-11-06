import java.sql.*;

/*
*注册
*/
public class AdminDao {

    /** @noinspection deprecation*/
    public int isExists(String uname)
    {
        String sql="SELECT * from admins where loginName=?";
        DbUtil dbUtil=new DbUtil();
        Connection con=dbUtil.getConnection();
        PreparedStatement ps = null;
        ResultSet resultSet = null;
        Admin admin = null;
        try
        {
            ps= con.prepareStatement(sql);
            ps.setString(1,uname);
            resultSet= ps.executeQuery();
            if(resultSet.next())
            {
                admin=new Admin();
                admin.setUserid(resultSet.getInt("id"));
                admin.setLoginName(resultSet.getString("uname"));
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        if(admin!=null)
        {
            return 1;
        }
        return 0;
    }

    public void addUser(String username,String pass)
    {
        DbUtil dbUtil = new DbUtil();
        Connection con = dbUtil.getConnection();
        String sql="INSERT INTO admins(loginName,loginPass) VALUES('"  + username + "','" + pass + "')";
        try {
            Statement st = con.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        dbUtil.closeCon();
    }


    /** @noinspection deprecation*/ /*
    * 登录
    */
    public boolean validate(Admin admin)
    {
        DbUtil dbUtil=new DbUtil();
        Connection con = dbUtil.getConnection();
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean valid=false;
        String sql="select * from admins where loginName=? and loginPass=?";
        try{
            pst=con.prepareStatement(sql);
            pst.setString(1,admin.getLoginName());
            pst.setString(2,admin.getLoginPass());
            rs=pst.executeQuery();
            if(rs.next())
            {

                valid=true;
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        dbUtil.closeCon();
        return valid;
//        return true;
    }

//test登录、注册
    public static void main(String[] args)
    {
        //登录
        try{
            Admin adm = new Admin();
            AdminDao admdao = new AdminDao();
            adm.setLoginName("1234");
            adm.setLoginPass("1234");
            if(admdao.validate(adm)){
                System.out.println("登录成功！！！");
            }else {
                System.out.println("登录失败!!!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("登录失败-(catch)！！！");
        }

        //注册
        try{

            String uname = "马云";
            String upass = "1234";
            AdminDao admindao = new AdminDao();
            if(0 == admindao.isExists(uname)){
                admindao.addUser(uname,upass);
                System.out.println("添加用户成功!!!");
            }else {
                System.out.println("用户已经存在，注册失败！！！");
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("注册失败-（catch）！！！");
        }


    }

}
