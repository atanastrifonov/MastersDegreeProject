<%-- 
    Document   : category
    Created on : 2015-4-18, 13:49:04
    Author     : user
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

            <div id="categoryLeftColumn">

                <c:forEach var="category" items="${categories}">

                    <c:choose>
                        <c:when test="${category.id == pageContext.request.queryString}">
                            <div class="categoryButton" id="selectedCategory">
                                <span class="categoryText">
                                    ${category.name}
                                </span>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <a href="category?${category.id}" class="categoryButton">
                                <span class="categoryText">
                                    ${category.name}
                                </span>
                            </a>
                        </c:otherwise>
                    </c:choose>

                </c:forEach>

            </div>

            <div id="categoryRightColumn">

                <p id="categoryTitle">    
                    <span style="background-color: #f5eabe; padding: 7px;">${selectedCategory.name}</span>
                </p>

                <table id="productTable">

                    <c:forEach var="product" items="${categoryProducts}" varStatus="iter">

                        <tr class="${((iter.index % 2) == 0) ? 'lightBlue' : 'white'}">
                            <td>
                                <img src="${initParam.productImagePath}${product.name}.png"
                                    alt="image of ${product.name}">
                            </td>
                            <td>
                                ${product.name}
                                <br>
                                <span class="smallText">${product.description}</span>
                            </td>
                            <td>
                                &euro; ${product.price} / unit
                            </td>
                            <td>
                                <form action="addToCart" method="post">
                                    <input type="hidden"
                                           name="productId"
                                           value="${product.id}">
                                    <input type="submit"
                                           value="add to cart">
                                </form>
                            </td>
                        </tr>

                    </c:forEach>

                </table>
            </div>