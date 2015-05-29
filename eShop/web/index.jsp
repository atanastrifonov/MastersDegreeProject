<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : 2015-3-28, 16:17:21
    Author     : user
--%>
<sql:query var="categories" dataSource="jdbc/eShop">
    SELECT * FROM category
</sql:query>
            <div id="indexLeftColumn">
                <c:forEach var="category" items="${categories.rows}">
                </c:forEach>
                <div id="welcomeText">
                    <p>[ welcome text ]</p>
                    <!-- test to access context parameters -->
                    categoryImagePath :  ${initParam.categoryImagePath}
                    productImagePath : ${initParam.productImagePath}
                </div>
            </div>

            <div id="indexRightColumn">
                <div class="categoryBox">
                    <a href="#">
                        <span class="categoryLabelText">dairy</span>
                    </a>
                </div>
                <div class="categoryBox">
                    <a href="#">
                        <span class="categoryLabelText">meats</span>
                    </a>
                </div>
                <div class="categoryBox">
                    <a href="#">
                        <span class="categoryLabelText">bakery</span>
                    </a>
                </div>
                <div class="categoryBox">
                    <a href="#">
                        <span class="categoryLabelText">fruit & veg</span>
                    </a>
                </div>
            </div>

