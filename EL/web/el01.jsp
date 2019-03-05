<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="domain.User" %>
<%--
EL表达式
    是为了简化咱们的jsp代码，具体一点就是为了简化在jsp里面写的那些java代码。
写法格式
    ${表达式 }
    如果从作用域中取值，会先从小的作用域开始取，如果没有，就往下一个作用域取。一直把四个作用域取完都没有， 就没有显示。
--%>

<%--
取值细节
    1. 从域中取值。得先存值。
    <%
   	//pageContext.setAttribute("name", "zhangsan");
   	session.setAttribute("name", "lisi...");
    %>
    直接指定说了，到这个作用域里面去找这个name
   	    ${ pageScope.name }
   	先从page里面找，没有去request找，去session，去application
   	    ${ name }
   	指定从session中取值
   	    ${ sessionScope.name }

   	2. 取值方式
   	如果这份值是有下标的，那么直接使用[]
   	<%
		String [] array = {"aa","bb","cc"}
		session.setAttribute("array",array);
	%>
	${ array[1] } --> 这里array说的是attribute的name
    如果没有下标， 直接使用 .的方式去取
	<%
		User user = new User("zhangsan",18);
		session.setAttribute("u", user);
	%>
	${ u.name }  , ${ u.age }
	一般使用EL表达式，用的比较多的，都是从一个对象中取出它的属性值，比如取出某一个学生的姓名。
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Expression Language</title>
    </head>
    <body>
        <%--1. 取出4个作用域中存放的值--%>
        <%
            pageContext.setAttribute("name", "page");
            request.setAttribute("name", "request");
            session.setAttribute("name", "session");
            application.setAttribute("name", "application");
        %>
        <%--按普通手段取值--%>
        <%=pageContext.getAttribute("name")%>
        <%=request.getAttribute("name")%>
        <%=session.getAttribute("name")%>
        <%=application.getAttribute("name")%>
        <%--使用EL表达式取出作用域中的值--%>
        ${pageScope.name}
        ${requestScope.name}
        ${sessionScope.name}
        ${applicationScope.name}

        <%--2. 如果域中所存的是数组--%>
        <%
            String[] strArray = {"aa", "bb", "cc", "dd"};
            pageContext.setAttribute("array", strArray);
        %>
        <%--使用EL表达式取出作用域中数组的值--%>
        ${array[0]}, ${array[1]}, ${array[2]}, ${array[3]}

        <%--3. 如果域中存的是单列集合--%>
        <%
            List<String> strList = new ArrayList<>();
            strList.add("11");
            strList.add("22");
            strList.add("33");
            strList.add("44");
            pageContext.setAttribute("list", strList);
        %>
        <%--使用EL表达式取出作用域中集合的值--%>
        ${list[0]}, ${list[1]}, ${list[2]}, ${list[3]}

        <%--4. 如果域中存的是双列集合--%>
        <%
            Map<String, String> strStrMap = new HashMap<>();
            strStrMap.put("name", "zhangsan");
            strStrMap.put("age", "18");
            strStrMap.put("address", "beijing");
            strStrMap.put("address.city", "shenzhen");
            pageContext.setAttribute("map", strStrMap);
        %>
        <%--取出Map集合的值--%>
        ${map.name}, ${map.age}, ${map.address}, ${map["address.city"]}

        <%--4. 如果域中存的是自定义类的对象--%>
        <%
            User user = new User("zhangsan", 18);
            session.setAttribute("u", user);
        %>
        ${u.name}, ${u.age}
        ${empty user}
    </body>
</html>
