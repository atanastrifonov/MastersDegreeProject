<%-- Set session-scoped variable to track the view user is coming from.
     This is used by the language mechanism in the Controller so that
     users view the same page when switching between English and Bulgarian. --%>
<c:set var='view' value='/category' scope='session' />

<div id="content">
    <div class="container">

        <div class="col-md-12">
            <ul class="breadcrumb">
                <li><a href="#">Home</a>
                </li>
                <li><fmt:message key="${selectedCategory.name}" /></li>
            </ul>
        </div>

        <div class="col-md-3">
            <!-- *** MENUS AND FILTERS *** -->
            <div class="panel panel-default sidebar-menu">

                <div class="panel-heading">
                    <h3 class="panel-title"><fmt:message key="category.header"/></h3>
                </div>

                <div class="panel-body">
                    <ul class="nav nav-pills nav-stacked category-menu">

                        <c:forEach var="category" items="${categories}">
                            <c:choose>
                                <c:when test="${category.name == selectedCategory.name}">
                                    <li class="active">
                                        <a href="<c:url value='category?${category.id}'/>"><fmt:message key="${category.name}"/>  <span class="badge pull-right">4</span></a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li>
                                        <a href="<c:url value='category?${category.id}'/>"><fmt:message key="${category.name}"/> <span class="badge pull-right">4</span></a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <!-- *** MENUS AND FILTERS END *** -->

            <div class="banner">
                <a href="#">
                    <img src="img/banner.jpg" alt="sales 2014" class="img-responsive">
                </a>
            </div>
        </div>

        <div class="col-md-9">

            <div class="box">
                <h1><fmt:message key="${selectedCategory.name}" /></h1>
                <p>In our <fmt:message key="${selectedCategory.name}" /> department we offer wide selection of the best products we have found and carefully selected worldwide.</p>
            </div>

            <div class="row products">

                <c:forEach var="product" items="${categoryProducts}" varStatus="iter">

                    <div class="col-md-4 col-sm-6">
                        <div class="product">
                            <div class="flip-container">
                                <div class="flipper">
                                    <div class="front">
                                        <a href="#">
                                            <img src="${initParam.productImagePath}${product.name}.png" alt="<fmt:message key='${product.name}'/>" class="img-responsive">
                                        </a>
                                    </div>
                                    <div class="back">
                                        <a href="#">
                                            <img src="${initParam.productImagePath}${product.name}.png" alt="<fmt:message key='${product.name}'/>" class="img-responsive">
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <a href="#" class="invisible">
                                <img src="${initParam.productImagePath}${product.name}.png" alt="<fmt:message key='${product.name}'/>" class="img-responsive">
                            </a>
                            <div class="text">
                                <h3><a href="#"><i><fmt:message key="${product.name}"/></i><br /> <fmt:message key='${product.name}Description'/></a></h3>
                                <p class="price"><fmt:formatNumber type="currency" currencySymbol="&euro; " value="${product.price}"/></p>
                                    
                                    <form action="<c:url value='addToCart'/>" method="post">
                                        <input type="hidden"
                                               name="productId"
                                               value="${product.id}">
                                        <input type="submit"
                                               name="submit"
                                               class="btn btn-primary"
                                               value="<fmt:message key='addToCart'/>">
                                    </form>
                            </div>
                            <!-- /.text -->
                        </div>
                        <!-- /.product -->
                    </div>

                </c:forEach>
                
            </div>
            <!-- /.products -->

        </div>
        <!-- /.col-md-9 -->
    </div>
    <!-- /.container -->
</div>
<!-- /#content -->
