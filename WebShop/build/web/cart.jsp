

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
        <title>Cart Page</title>

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
                            <h2>Shopping Cart</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End Page title area -->


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
                            <div class="woocommerce">

                                <table cellspacing="0" class="shop_table cart">
                                    <thead>
                                        <tr>

                                            <th class="product-thumbnail">Image</th>
                                            <th class="product-name">Name</th>
                                            <th class="product-price">Price</th>
                                            <th class="product-quantity">Quantity</th>
                                            <th class="product-subtotal">Sub Total</th>
                                            <th class="product-subtotal">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${sessionScope.cart}" var="u">
                                        <form method="get" action="cart">
                                            <tr class="cart_item">


                                                <td class="product-thumbnail">
                                                    <a><img width="145" height="145" alt="poster_1_up" class="shop_thumbnail" src="${u.value.product.image}"></a>
                                                </td>
                                            <input type="hidden" name="id" value="${u.value.product.id}">
                                            <td class="product-name">
                                                <a>${u.value.product.name}</a> 
                                            </td>

                                            <td class="product-price">
                                                <span class="amount">${u.value.product.sale_price}</span> 
                                            </td>

                                            <td class="product-quantity">
                                                <div class="quantity buttons_added">
                                                    
                                                    <input type="number" size="4" class="input-text qty text" title="Qty" value="${u.value.stock}" name="quantity" min="1" max="${u.value.product.quantity}" step="1">
                                                    
                                                </div>
                                            </td>

                                            <td class="product-subtotal">
                                                <span class="amount">$${u.value.stock*u.value.product.sale_price}</span> 
                                            </td>
                                            <td class="actions" colspan="6">

                                                <input type="submit"  value="Update" class="button">


                                            </td>
                                            </tr>
                                        </form>
                                    </c:forEach>
                                    <tr>
                                        <td>
                                            <input type="submit" value="Total: $${total}" name="update_cart" class="button">
                                        </td>
                                    </tr>




                                    </tbody>
                                </table>

                                <div class="text-center"><a href="productlist"><button style="height:42px;width:135px;" value="Buy more" class="checkout-button button alt wc-forward btn-danger">Buy more</button></a></div>



                                <div class="cart-collaterals" style="margin-right: 260px;margin-top: 50px;">



                                    <c:if test="${sessionScope.account == null}">
                                        <div class="shipping_calculator">
                                            <h2><a class="shipping-calculator-button" href="login" ><input type="submit" value="Contact" name="update_cart" class="button"></a></h2>
                                        </div>

                                    </c:if>
                                    <c:if test="${sessionScope.account != null}">
                                        <form method="post" action="order" class="shipping_calculator">






                                            <h2><a class="shipping-calculator-button" data-toggle="collapse" href="#calcalute-shipping-wrap" aria-expanded="false" aria-controls="calcalute-shipping-wrap"><input type="submit" value="Contact" name="update_cart" class="button"></a></h2>




                                            <section id="calcalute-shipping-wrap" class="shipping-calculator-form collapse">



                                                <p class="form-row form-row-wide text-center">Customer Name<input type="text" id="calc_shipping_state" name="username" placeholder="Name" value="${sessionScope.account.username}" class="input-text"  readonly> </p>

                                                <p class="form-row form-row-wide text-center">Address<input type="text" id="calc_shipping_postcode" name="address" placeholder="Address" value="${sessionScope.account.address}" class="input-text"></p>

                                                <p class="form-row form-row-wide text-center">Phone<input type="text" id="calc_shipping_postcode" name="phone" placeholder="Phone" value="${sessionScope.account.phone}" class="input-text"></p>

                                                <input type="hidden" name="total" value="${total}">
                                                <p><button class="button" value="1" name="calc_shipping" type="submit">Order</button></p>

                                            </section>

                                        </form>
                                    </c:if>



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
