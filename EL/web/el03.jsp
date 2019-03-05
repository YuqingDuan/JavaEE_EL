<%--
  Created by IntelliJ IDEA.
  User: Yuqing
  Date: 3/4/2019
  Time: 10:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>el_03</title>
    </head>
    <body>
        <%--使用传统方法获取这个参数--%>
            <%=request.getParameter("address")%>

        <%--使用传统方法EL表达式--%>
        ${param.address}
</html>
