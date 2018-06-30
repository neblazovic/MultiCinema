<%-- 
    Document   : QRCode
    Created on : Feb 4, 2017, 11:08:41 AM
    Author     : Nebojsa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <link id="themecss" rel="stylesheet" type="text/css" href="//www.shieldui.com/shared/components/latest/css/light/all.min.css" />
    <script type="text/javascript" src="//www.shieldui.com/shared/components/latest/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="//www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
</head>
<body class="theme-light">
<div class="container">
    <div id="qrcode" class="qrcode"></div>
    <div class="qrcode-config">
        <h3>Text Value</h3>
        <textarea style="width: 160px;" id="textValue">Enter QR code value here</textarea>
        <h3>Options</h3>
        <div class="clearfix">
            <label for="size">Size:</label>
            <input type="text" id="size" value="250" /> px
        </div>
        <div class="clearfix">
            <label for="mode">Mode:</label>
            <select id="mode">
                <option value="Byte">Byte</option>
                <option value="Alphanumeric">Alphanumeric</option>
                <option value="Numeric">Numeric</option>
            </select>
        </div>
        <div class="clearfix">
            <label for="error">Error Level:</label>
            <select id="error">
                <option value="L">L</option>
                <option value="M">M</option>
                <option value="H">H</option>
                <option value="Q">Q</option>
            </select>
        </div>
        <div class="clearfix">
            <div class="exception"></div>
        </div>
    </div>
</div>
<script type="text/javascript">
    jQuery(function ($) {
        var textValue = $("#textValue").shieldTextBox({
            events: {
                change: update
            }
        }).swidget();
        var size = $("#size").shieldNumericTextBox({
            min: 100,
            max: 350,
            step: 10,
            events: {
                change: update
            }
        }).swidget();
        var mode = $("#mode").shieldDropDown({
            events: {
                select: update
            }
        }).swidget();
        var error = $("#error").shieldDropDown({
            events: {
                select: update
            }
        }).swidget();
        var qrcode = null;
        function update() {
            if (qrcode) {
                qrcode.destroy();
            }
            $(".exception").html("");
            try {
                qrcode = $("#qrcode").shieldQRcode({
                    value: textValue.value(),
                    size: size.value(),
                    errorLevel: error.value(),
                    mode: mode.value()
                }).swidget();
            }
            catch (err) {
                $(".exception").html(err);
                return;
            }
        }
        update();
    });
</script>
<style type="text/css" scoped>
    .container
    {
        max-width: 600px;
        margin-left: auto;
        margin-right: auto;
    }
    .qrcode
    {
        display: inline-block;
        padding: 10px;
    }
    .qrcode-config
    {
        display: inline-block;
        padding: 10px;
    }
        .qrcode-config h3
        {
            margin-bottom: 10px;
        }
        .qrcode-config textarea
        {
            display: none;
            height: 60px;
            resize: none;
            margin-bottom: 20px;
        }
        .qrcode-config label
        {
            float: left;
            width: 75px;
        }
    .exception
    {
        color: red;
        display: none;
    }
</style>
</body>
</html>
