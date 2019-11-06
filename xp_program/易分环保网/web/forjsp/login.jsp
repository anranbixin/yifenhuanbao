<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/10/25
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>易分环保网登录页面</title>
    <script src="../js/use.js"></script>
    <script src="../layui-v2.5.5/layui/layui.all.js"></script>
    <script src="../js/register.js"></script>

    <link rel="stylesheet" href="../layui-v2.5.5/layui/css/layui.css">
    <link rel="script" href="../bootstrap-3.3.7/dist/js/bootstrap.min.js">
    <link rel="stylesheet" href="../bootstrap-3.3.7/dist/css/bootstrap.css">
    <link rel="stylesheet" href="../css/register.css">
    <link rel="stylesheet" href="../css/total.css">
</head>


<body style="background-image: url(../img/bg.jpg);">
<div class="layui-fluid"style="padding-left: 0px">
    <div class="layui-row">
        <div class="layui-col-md1 layui-col-xs1 nav-right"style="height: 100vh">
            <img src="../img/logo.png"class="img-right">
            <h5>易分垃圾网</h5>
            <button type="button"  class="left-btn">
                <span class="layui-icon layui-icon-home"><a href="index.jsp">首页</a></span>
            </button><br/>
            <button type="button"  class="left-btn">
                <span class="layui-icon layui-icon-user"><a href="register.jsp">注册</a></span>
            </button>
            <button type="button"  class="left-btn">
                <span class="layui-icon layui-icon-read"><a href="garbage.jsp">分类指南</a></span>
            </button>
            <button type="button"  class="left-btn">
                <span class="layui-icon layui-icon-search"><a href="search_result.jsp">分类查询</a></span>
            </button>
            <button type="button"  class="left-btn">
                <span class="layui-icon layui-icon-release"><a href="news_center.jsp">新闻中心</a></span>
            </button>
            <br>
            <span class="layui-icon layui-icon-login-wechat font"></span>
            <span class="layui-icon layui-icon-login-qq font"></span>
            <span class="layui-icon layui-icon-login-weibo font"></span>
        </div>
        <div class="layui-col-md11" style="margin-top: 40px;">
            <div class="text-center">
                <h3>登录</h3>
            </div>
            <form class="layui-form text-center" method="post" action="/UserLogin">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <input type="text" name="username" required  lay-verify="username" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input type="password" name="password" required lay-verify="pwd" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block" style="width: 36px;">
                        <input type="checkbox" name="" title="记住我" lay-skin="primary">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-filter="formDemo">登录</button>
                    </div>
                </div>


            </form>
        </div>
    </div>
</div>
</body>
<script>
    layui.use('form', function(){
        var form = layui.form;
        form.render();
    });
</script>
</html>
