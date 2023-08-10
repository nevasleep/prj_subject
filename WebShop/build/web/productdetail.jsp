

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
        ustora by freshdesignweb.com
        Twitter: https://twitter.com/freshdesignweb
        URL: https://www.freshdesignweb.com/ustora/
-->
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Product Page - Ustora Demo</title>

        <!-- Google Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>

        <!-- Bootstrap -->
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>

        <jsp:include page="header.jsp"/>

        <div class="product-big-title-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="product-bit-title text-center">
                            <h2>Shop</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="single-product-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">

                        <div class="single-sidebar">
                            <h2 class="sidebar-title">New Products</h2>
                            <c:forEach items="${proList}" var="c">
                                <div class="thubmnail-recent">
                                    <a href="productdetail?id=${c.id}"><img style="height: 80px;width: 80px;" src="${c.image}" class="recent-thumb" alt=""></a>
                                    <h2><a href="">${c.name}</a></h2>
                                    <div class="product-sidebar-price">
                                        <ins>${c.sale_price}$</ins> <del>${c.price}$</del>
                                    </div>                             
                                </div>
                            </c:forEach>


                        </div>


                    </div>

                    <div class="col-md-8">
                        <div class="product-content-right">
                            <div class="product-breadcroumb">
                                <a href="home">Home</a>
                                <a href="">${product.name}</a>
                            </div>

                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="product-images">
                                        <div class="product-main-img">
                                            <img src="${product.image}" alt="">
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="product-inner">
                                        <h2 class="product-name">${product.name}</h2>
                                        <div class="product-inner-price">
                                            <ins>${product.sale_price}$</ins> <del>${product.price}$</del>
                                        </div>    

                                        <form action="cart" class="cart" method="get">
                                            <div class="quantity">
                                                <input type="number" max="${product.quantity}" class="input-text qty text" title="Qty" name="quantity" min="1" step="1">
                                            </div>
                                            <input type="hidden" name="id" value="${product.id}">
                                            <button class="add_to_cart_button" type="submit">Add to cart</button>
                                        </form>   

                                        <div class="product-inner-category">

                                        </div> 

                                        <div role="tabpanel">
                                            <ul class="product-tab" role="tablist">
                                                <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Description</a></li>

                                            </ul>
                                            <div class="tab-content">
                                                <div role="tabpanel" class="tab-pane fade in active" id="home">
                                                    <h2>Product Description</h2>  
                                                    <p>${product.text}</p>
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>


                            <div class="related-products-wrapper">
                                <h2 class="related-products-title">Related Products</h2>
                                <div class="related-products-carousel">
                                    <c:forEach items="${proList2}" var="c">
                                        <div class="single-product">
                                            <div class="product-f-image">
                                                <img style="height: 280px;width: 340px;" src="${c.image}" alt="">
                                                <div class="product-hover">
                                                    <a href="cart?quantity=1&id=${c.id}"  class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                                    <a href="productdetail?id=${c.id}" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                                </div>
                                            </div>

                                            <h2><a href="">${c.name}</a></h2>

                                            <div class="product-carousel-price">
                                                <ins>${c.sale_price}$</ins> <del>${c.price}$</del>
                                            </div> 
                                        </div>
                                    </c:forEach>


                                </div>
                            </div>
                        </div>                    
                    </div>
                </div>
            </div>
        </div>


        <jsp:include page="footer.jsp"/>

        <!-- Latest jQuery form server -->
        <script src="https://code.jquery.com/jquery.min.js"></script>

        <!-- Bootstrap JS form CDN -->
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

        <!-- jQuery sticky menu -->
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.sticky.js"></script>

        <!-- jQuery easing -->
        <script src="js/jquery.easing.1.3.min.js"></script>

        <!-- Main Script -->
        <script src="js/main.js"></script>
    </body>
</html>
