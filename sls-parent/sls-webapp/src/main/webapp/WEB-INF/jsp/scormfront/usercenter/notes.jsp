<%--@elvariable id="noteList" type="java.util.List"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>笔记</title>
    <%@include file="../../includes/common.jsp" %>
    <link rel="shortcut icon" href="../favicon.ico">
    <link rel="stylesheet" type="text/css" href="booknote/css/default.css"/>
    <link rel="stylesheet" type="text/css" href="booknote/css/bookblock.css"/>
    <!-- custom demo style -->
    <link rel="stylesheet" type="text/css" href="booknote/css/demo4.css"/>
    <script src="booknote/js/modernizr.custom.js"></script>
</head>
<body>
<div class="container" style="border-bottom: ">
    <div class="bb-custom-wrapper">

        <div id="bb-bookblock" class="bb-bookblock">
            <div class="bb-item">
                <div class="bb-custom-firstpage">
                    <nav><ul style="list-style-type:none">
                        <li><h1>我</h1></li>
                        <li><h1>的</h1></li>
                        <li><h1>笔</h1></li>
                        <li><h1>记</h1></li>
                        <li><h1>本</h1></li>
                    </ul></nav>
                </div>
                <div class="bb-custom-side">
                    <p>Pastry bear claw oat cake danish croissant jujubes danish. Wypas soufflé muffin. Liquorice powder
                        pastry danish. Candy toffee gummi bears chocolate bar lollipop applicake chocolate cake danish
                        brownie.</p>
                </div>
            </div>
            <div class="bb-item">
                <div class="bb-custom-side">
                    <p>Soufflé tootsie roll jelly beans. Sweet icing croissant dessert bear claw. Brownie dessert
                        cheesecake danish jelly pudding bear claw soufflé.</p>
                </div>
                <div class="bb-custom-side">
                    <p>Candy canes lollipop macaroon marshmallow gummi bears tiramisu. Dessert croissant cupcake candy
                        canes. Bear claw faworki faworki lemon drops. Faworki marzipan sugar plum jelly-o marzipan
                        jelly-o.</p>
                </div>
            </div>
        </div>

        <nav>
            <a id="bb-nav-first" href="#" class="bb-custom-icon bb-custom-icon-first">First page</a>
            <a id="bb-nav-prev" href="#" class="bb-custom-icon bb-custom-icon-arrow-left">Previous</a>
            <a id="bb-nav-next" href="#" class="bb-custom-icon bb-custom-icon-arrow-right">Next</a>
            <a id="bb-nav-last" href="#" class="bb-custom-icon bb-custom-icon-last">Last page</a>
        </nav>

    </div>

</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="booknote/js/jquerypp.custom.js"></script>
<script src="booknote/js/jquery.bookblock.js"></script>
<script>
    var Page = (function () {

        var config = {
                    $bookBlock: $('#bb-bookblock'),
                    $navNext: $('#bb-nav-next'),
                    $navPrev: $('#bb-nav-prev'),
                    $navFirst: $('#bb-nav-first'),
                    $navLast: $('#bb-nav-last')
                },
                init = function () {
                    config.$bookBlock.bookblock({
                        speed: 1000,
                        shadowSides: 0.8,
                        shadowFlip: 0.4
                    });
                    initEvents();
                },
                initEvents = function () {

                    var $slides = config.$bookBlock.children();

                    // add navigation events
                    config.$navNext.on('click touchstart', function () {
                        config.$bookBlock.bookblock('next');
                        return false;
                    });

                    config.$navPrev.on('click touchstart', function () {
                        config.$bookBlock.bookblock('prev');
                        return false;
                    });

                    config.$navFirst.on('click touchstart', function () {
                        config.$bookBlock.bookblock('first');
                        return false;
                    });

                    config.$navLast.on('click touchstart', function () {
                        config.$bookBlock.bookblock('last');
                        return false;
                    });

                    // add swipe events
                    $slides.on({
                        'swipeleft': function (event) {
                            config.$bookBlock.bookblock('next');
                            return false;
                        },
                        'swiperight': function (event) {
                            config.$bookBlock.bookblock('prev');
                            return false;
                        }
                    });

                    // add keyboard events
                    $(document).keydown(function (e) {
                        var keyCode = e.keyCode || e.which,
                                arrow = {
                                    left: 37,
                                    up: 38,
                                    right: 39,
                                    down: 40
                                };

                        switch (keyCode) {
                            case arrow.left:
                                config.$bookBlock.bookblock('prev');
                                break;
                            case arrow.right:
                                config.$bookBlock.bookblock('next');
                                break;
                        }
                    });
                };

        return { init: init };

    })();
</script>
<script>
    Page.init();
</script>
</body>
</html>