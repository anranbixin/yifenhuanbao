<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/10/26
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <title>垃圾搜索页面</title>
    <script src="../js/use.js"></script>
    <script src="../layui-v2.5.5/layui/layui.all.js"></script>

    <link rel="stylesheet" href="../css/search_result.css">
    <link rel="stylesheet" href="../layui-v2.5.5/layui/css/layui.css">
    <script src="../js/jquery-1.12.4.js"></script>
    <script src="../js/search_result.js"></script>
</head>
<script>
    window.onload=function () {
        var oUl=document.getElementById('icon-btn');
        var obtn=oUl.getElementsByName("btn-img");
        obtn.onclick=function () {
            obtn.setAttribute("class","img-bg");
        }

        /*var oBtn=document.getElementsByName('btn-img')
        for(var i=0;i<oBtn.length;i++)
        {
           oBtn[i].onclick=function () {
             oBtn[i].style("background:url(img/爱心2.png)");
           }
        }*/

    }
</script>
<body>
<!--导航栏部分-->
<div class="nav">
    <ul>
        <li><img src="../img/树叶.png" alt=""></li>
        <li>易分垃圾网</li>
        <li><a href="index.jsp">首页</a></li>
        <li><a href="garbage.jsp">分类指南</a></li>
        <li><a href="search_result.jsp">分类查询</a></li>
        <li><a href="news_center.jsp">新闻中心</a></li>
    </ul>
</div>
<div class="search">
    <input type="text" class="search_box">
    <div class="search_img">
        <a href="search_result.jsp"><img src="../img/搜索.png" alt=""></a>
    </div>
</div>
<div class="search_result">
    <ul id="icon-btn">
        <li>
            <a href="rbdetail.html"><img src="../img/q-一次性餐具.jpg" alt=""></a>
            <div class="details">
                <p>名称:一次性餐具</p>
                <p>垃圾类别:其他垃圾</p>
                <p>处理方式:xxxx</p>
                <div name="btn-img"  class="img img-bg"> </div>

            </div>
        </li>
        <li><a href="rbdetail.html"><img src="../img/c-果皮.jpg" alt=""></a>
            <div class="details">
                <p>名称:果皮</p>
                <p>垃圾类别:厨余垃圾</p>
                <p>处理方式:xxxx</p>
                <div name="btn-img"  class="img img-bg"> </div>
            </div>
        </li>
        <li><a href="rbdetail.html"><img src="../img/q-灰土.jpg" alt=""></a>
            <div class="details">
                <p>名称:灰土</p>
                <p>垃圾类别:其他垃圾</p>
                <p>处理方式:xxxx</p>
                <div  name="btn-img"  class="img"></div>
            </div>
        </li>
        <li><a href="rbdetail.html"><img src="../img/c-茶叶渣.jpg" alt=""></a>
            <div class="details">
                <p>名称:茶叶渣</p>
                <p>垃圾类别:厨余垃圾</p>
                <p>处理方式:xxxx</p>
                <div name="btn-img"  class="img"> </div>
            </div>
        </li>
        <li><a href="rbdetail.html"><img src="./img/y-废药品.jpg" alt=""></a>
            <div class="details">
                <p>名称:废药品</p>
                <p>垃圾类别:有害垃圾</p>
                <p>处理方式:xxxx</p>
                <div  name="btn-img"  class="img"> </div>
            </div>
        </li>
        <li>
            <a href="rbdetail.html"><img src="../img/y-废油漆桶.jpg" alt=""></a>
            <div class="details">
                <p>名称:废油漆桶</p>
                <p>垃圾类别:有害垃圾</p>
                <p>处理方式:xxxx</p>
                <div  name="btn-img"  class="img"> </div>
            </div>
        </li>
    </ul>
    <a href=""></a>
</div>
<div class="footer">
    <ul>
        <li><span><a href="#"><img src="../img/左箭头.png" alt=""></a></span></li>
        <li><a href="">1</a></li>
        <li><a href="">2</a></li>
        <li><a href="">3</a></li>
        <li><a href="">4</a></li>
        <li><a href="">5</a></li>
        <li><a href="">6</a></li>
        <li><span><a href="#"><img src="../img/向右%20箭头.png" alt=""></a></span></li>
    </ul>



</div>
</body>
<script>
    layui.use('form', function(){
        var form = layui.form;
        form.render();
    });
</script>
</html>
