<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${sessionScope.userId == null}">
    <!--User is not yet logged in-->
    <a href="<c:url value="/index.jsp"/>">HOME</a> | <a href="<c:url value="/index.jsp"/>">Login</a> | <a href="<c:url value="/reg_form.jsp"/>">Register</a> | About
</c:if>

<!--ADMIN-->
<c:if test="${sessionScope.userId!=null && sessionScope.role==1}">
    <!--Admin is logged in-->
    <a href="<c:url value="/admin_home.jsp"/>">HOME</a> | <a href="<c:url value="/ulist.jsp"/>">User List</a> | <a href="<c:url value="/manage_profile.jsp"/>">Manage Profile</a> | <a href="<c:url value="/logout.jsp"/>">Logout</a> | Welcome ${sessionScope.user.name}
</c:if>


<!--USER-->    
<c:if test="${sessionScope.userId!=null && sessionScope.role==2}">
    <!--User is logged in-->
    <a href="<c:url value="/user_home.jsp"/>">HOME</a> | <a href="<c:url value="/clist.jsp"/>">Contact List</a> | <a href="<c:url value="/contact_form.jsp"/>">Add Contact</a> | <a href="<c:url value="/manage_profile.jsp"/>">Manage Profile</a> | <a href="<c:url value="/logout.jsp"/>">Logout</a> | Welcome ${sessionScope.user.name}
</c:if>

