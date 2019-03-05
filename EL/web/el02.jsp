<%--
EL表达式的11个内置(隐式)对象
${ 对象名.成员 }
    - pageContext

    作用域相关对象
    - pageScope
    - requestScope
    - sessionScope
    - applicationScope

    头信息相关对象
    - header
    - headerValues

    参数信息相关对象
    - param
    - paramValues

    - cookie

    全局初始化参数
    - initParam
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>el_02</title>
    </head>
    <body>
        <jsp:forward page="el03.jsp">
            <jsp:param name="address" value="beijing..."></jsp:param>
        </jsp:forward>
    </body>
</html>
