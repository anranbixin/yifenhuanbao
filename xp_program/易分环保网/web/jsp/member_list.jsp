<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/10/23
  Time: 18:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    class DbUtil {

        ResourceBundle bundle = ResourceBundle.getBundle("jdbc");

        private String dbUrl = bundle.getString("dbUrl");
        private String dbUser = bundle.getString("dbUser");
        private String dbPassword = bundle.getString("dbPassword");
        private String driver = "com.mysql.jdbc.Driver";

        private Connection connection = null;

        public Connection getConnection(){
            try {
                Class.forName(driver);
                connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
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
    }
%>
<%@ page import="java.util.ResourceBundle" %>
<%@ page import="java.sql.*" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-L-admin1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/xadmin.css">
    <script src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="layui-anim layui-anim-up">
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
    <a class="layui-btn layui-btn-primary layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:38px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so">
            <input type="text" name="username"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
            <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>

        <span class="x-right" style="line-height:40px">共有数据：88 条</span>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>ID</th>
            <th>登录名</th>
            <th>用户名</th>
            <th>性别</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <%
            DbUtil dbUtil=new DbUtil();
            String sql="SELECT * from users";
            Connection connection=dbUtil.getConnection();
            PreparedStatement pst;
            pst=connection.prepareStatement(sql);
            ResultSet rs=pst.executeQuery(sql);
            while(rs.next()){
        %>
        <td>
            <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
        </td>
        <td><%=rs.getString(1)%></td>
        <td><%=rs.getString(2)%>></td>
        <td><%=rs.getString(4)%></td>
        <td><%=rs.getString(5)%></td>

        <td class="td-manage">
            <%--<a onclick="member_stop(this,'10001')" href="javascript:;"  title="启用">--%>
                <%--<i class="layui-icon">&#xe601;</i>--%>
            <%--</a>--%>
            <%--<a title="编辑"  onclick="x_admin_show('编辑','member-edit.html',600,400)" href="javascript:;">--%>
                <%--<i class="layui-icon">&#xe642;</i>--%>
            <%--</a>--%>
            <%--<a onclick="x_admin_show('修改密码','member-password.html',600,400)" title="修改密码" href="javascript:;">--%>
                <%--<i class="layui-icon">&#xe631;</i>--%>
            <%--</a>--%>
            <a title="删除" onclick="member_del(this,'要删除的id')" href="/UserDelete?user_id=<%=rs.getString(1)%>">
                <i class="layui-icon">&#xe640;</i>
            </a>
        </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <div class="page">
        <div>
            <a class="prev" href="">&lt;&lt;</a>
            <a class="num" href="">1</a>
            <span class="current">2</span>
            <a class="num" href="">3</a>
            <a class="num" href="">489</a>
            <a class="next" href="">&gt;&gt;</a>
        </div>
    </div>

</div>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
    });

    /*用户-停用*/
    function member_stop(obj,id){
        layer.confirm('确认要停用吗？',function(index){

            if($(obj).attr('title')=='启用'){

                //发异步把用户状态进行更改
                $(obj).attr('title','停用')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!',{icon: 5,time:1000});

            }else{
                $(obj).attr('title','启用')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!',{icon: 5,time:1000});
            }

        });
    }

    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }



    function delAll (argument) {

        var data = tableCheck.getData();

        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }
</script>
</body>

</html>
