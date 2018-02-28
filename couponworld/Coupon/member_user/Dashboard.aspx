<%@ Page Title="" Language="C#" MasterPageFile="~/member.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Coupon.member_user.Dashboard" %>


<%@ Register Src="~/controls/uc_consumer_sidebar.ascx" TagPrefix="uc1" TagName="uc_consumer_sidebar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .chartCls {
            height: 400px;
            width: 500px;
        }
    </style>


    <script type="text/javascript" src="https://www.google.com/jsapi"></script>


    <%-- <div class="col-lg-4">
        <canvas id="myChart"></canvas>
    </div>

    <div class="clearfix"></div>
    <script>

        var dataLable = '', dataData = '', dataColor = '';



        $.ajax({
            url: '<%=ResolveUrl("~/member_user/Dashboard.aspx/getChartData") %>',
            //data: "{ 'prefix': 'test'}",

            type: "POST",
            contentType: "application/json; charset=utf-8",
            success: function (data) {

                alert(data);

                dataLable = data.d.split('=')[0].substring(0, data.d.split('=')[0].length - 1);
                dataData = data.d.split('=')[1].substring(1, data.d.split('=')[0].length);
                dataColor = data.d.split('=')[2].substring(1, data.d.split('=')[0].length);;

                alert(dataColor);
            }, error: function (response) {
                alert(response.responseText);
            },
            failure: function (response) {
                alert(response.responseText);
            }
        });

        Chart.pluginService.register({
            afterUpdate: function (chart) {
                if (chart.config.options.elements.center) {
                    var helpers = Chart.helpers;
                    var centerConfig = chart.config.options.elements.center;
                    var globalConfig = Chart.defaults.global;
                    var ctx = chart.chart.ctx;

                    var fontStyle = helpers.getValueOrDefault(centerConfig.fontStyle, globalConfig.defaultFontStyle);
                    var fontFamily = helpers.getValueOrDefault(centerConfig.fontFamily, globalConfig.defaultFontFamily);

                    if (centerConfig.fontSize)
                        var fontSize = centerConfig.fontSize;
                        // figure out the best font size, if one is not specified
                    else {
                        ctx.save();
                        var fontSize = helpers.getValueOrDefault(centerConfig.minFontSize, 1);
                        var maxFontSize = helpers.getValueOrDefault(centerConfig.maxFontSize, 256);
                        var maxText = helpers.getValueOrDefault(centerConfig.maxText, centerConfig.text);

                        do {
                            ctx.font = helpers.fontString(fontSize, fontStyle, fontFamily);
                            var textWidth = ctx.measureText(maxText).width;

                            // check if it fits, is within configured limits and that we are not simply toggling back and forth
                            if (textWidth < chart.innerRadius * 2 && fontSize < maxFontSize)
                                fontSize += 1;
                            else {
                                // reverse last step
                                fontSize -= 1;
                                break;
                            }
                        } while (true)
                        ctx.restore();
                    }

                    // save properties
                    chart.center = {
                        font: helpers.fontString(fontSize, fontStyle, fontFamily),
                        fillStyle: helpers.getValueOrDefault(centerConfig.fontColor, globalConfig.defaultFontColor)
                    };
                }
            },
            afterDraw: function (chart) {
                if (chart.center) {
                    var centerConfig = chart.config.options.elements.center;
                    var ctx = chart.chart.ctx;

                    ctx.save();
                    ctx.font = chart.center.font;
                    ctx.fillStyle = chart.center.fillStyle;
                    ctx.textAlign = 'center';
                    ctx.textBaseline = 'middle';
                    var centerX = (chart.chartArea.left + chart.chartArea.right) / 2;
                    var centerY = (chart.chartArea.top + chart.chartArea.bottom) / 2;
                    ctx.fillText(centerConfig.text, centerX, centerY);
                    ctx.restore();
                }
            },
        })


        var config = {
            type: 'doughnut',
            data: {
                labels: [
                  dataLable
                ],
                datasets: [{
                    data: [dataData],
                    backgroundColor: [
                     dataColor
                    ]
                }]
            },
            options: {
                elements: {
                    center: {
                        // the longest text that could appear in the center
                        maxText: '100%',
                        text: '90%',
                        fontColor: '#36A2EB',
                        fontFamily: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif",
                        fontStyle: 'normal',
                        // fontSize: 12,
                        // if a fontSize is NOT specified, we will scale (within the below limits) maxText to take up the maximum space in the center
                        // if these are not specified either, we default to 1 and 256
                        minFontSize: 1,
                        maxFontSize: 256,
                    }
                }
            }
        };




        var ctx = document.getElementById("myChart").getContext("2d");
        var myChart = new Chart(ctx, config);
    </script>--%>


    <script type="text/javascript">
        google.load("visualization", "1", { packages: ["corechart"] });
        google.setOnLoadCallback(drawChart);
     //   google.setOnLoadCallback(drawRetailerChart);




        function drawChart() {
            $.ajax({
                type: "POST",
                url: "<%=ResolveUrl("~/member_user/Dashboard.aspx/getChartData") %>",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var jsonData = r.d;


                    var data = new google.visualization.DataTable();
                    data.addColumn('string', 'str_category_name');
                    data.addColumn('number', 'Total');

                    var totalamt = 0;
                    $.each(JSON.parse(jsonData), function (index, obj) {
                        data.addRow([obj.str_category_name, parseFloat(obj.Total)]);
                        totalamt = totalamt + parseFloat(obj.Total);
                    });


                    //Pie
                    var options = {
                        title: 'Total $' + totalamt.toString() + ' Purchase Category Wise',
                        pieHole: 0.3,

                    };
                    var chart = new google.visualization.PieChart($("#chart")[0]);
                    chart.draw(data, options);
                    //drawRetailerChart();

                },
                failure: function (r) {
                    alert(r.d);
                },
                error: function (r) {
                    alert(r.d);
                }
            });
        }

        function drawRetailerChart() {
            $.ajax({
                type: "POST",
                url: "<%=ResolveUrl("~/member_user/Dashboard.aspx/getChartDataRetailer") %>",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var jsonData = r.d;


                    var data = new google.visualization.DataTable();
                    data.addColumn('string', 'str_corporate_name');
                    data.addColumn('number', 'Total');

                    var totalamt = 0;
                    $.each(JSON.parse(jsonData), function (index, obj) {
                        data.addRow([obj.str_category_name, parseFloat(obj.Total)]);
                        totalamt = totalamt + parseFloat(obj.Total);
                    });


                    //Pie
                    var options = {
                        title: 'Total $' + totalamt.toString() + ' Purchase Category Wise',
                        pieHole: 0.3,

                    };
                    var chart = new google.visualization.PieChart($("#chart_retailer")[0]);
                    chart.draw(data, options);


                },
                failure: function (r) {
                    alert(r.d);
                },
                error: function (r) {
                    alert(r.d);
                }
            });
        }
    </script>

    <div class="products">
        <div class="container">

            <div class="col-md-2">
                <uc1:uc_consumer_sidebar runat="server" ID="uc_consumer_sidebar" />
            </div>

            <div class="col-md-9 product-w3ls">
                <div class="box">
                    <div class="box-body">
                        <div class="single-top-right" style="padding-left: 0em;">
                            <h3 class="item_name">Statics</h3>
                        </div>
                        <hr />
                        <div class="clearfix"></div>
                        <div class="col-lg-12">
                            <div class="col-lg-6">
                                <div id="chart" class="chartCls">
                                </div>

                            </div>
                            <div class="col-lg-5">
                                <div id="chart_retailer" class="chartCls">
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
