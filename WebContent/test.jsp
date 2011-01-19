<!DOCTYPE html>
<html>
<head>
    <script src="libraries/RGraph.common.adjusting.js" ></script>
    <script src="libraries/RGraph.common.core.js" ></script>
    <script src="libraries/RGraph.common.context.js" ></script>
    <script src="libraries/RGraph.common.tooltips.js" ></script>
    <script src="libraries/RGraph.common.zoom.js" ></script>
    <script src="libraries/RGraph.modaldialog.js" ></script>

    <script src="libraries/RGraph.line.js" ></script>
    <script src="libraries/RGraph.bar.js" ></script>
    <script src="libraries/RGraph.rose.js" ></script>
</head>
<body>

    <div style="width: 475px; float: right">
    
    
        <div style="float: right; width: 480px; text-align: center">
            <canvas id="myLine" width="480" height="230">[Please wait for the onload event to fire...]</canvas>
            <script>
                /**
                * Create the line graph
                */
                function CreateLineChart ()
                {
                    var data1 = [14,13,16,18,14,12,11,14,19,18,17,18];
                    var data2 = [11,12,14,12,11,13,13,15,14,15,13,14];
            
                    var myLine = new RGraph.Line('myLine', data1, data2);
                    myLine.Set('chart.colors', ['red', 'black']);
                    myLine.Set('chart.units.post', '%');
                    myLine.Set('chart.tickmarks', null);
                    myLine.Set('chart.shadow', true);
                    myLine.Set('chart.shadow.offsety', RGraph.isIE8() ? 3 : 0);
                    myLine.Set('chart.shadow.offsetx', RGraph.isIE8() ? 3 : 0);
                    myLine.Set('chart.shadow.blur', 15);
                    myLine.Set('chart.shadow.color', ['#f66', '#666']);
                    myLine.Set('chart.linewidth', 5);
                    myLine.Set('chart.hmargin', 10);
                    myLine.Set('chart.background.grid.width', 1);
                    myLine.Set('chart.background.grid.color', '#ddd');
                    myLine.Set('chart.background.grid.hsize', 25);
                    myLine.Set('chart.background.grid.vsize', 25);
                    myLine.Set('chart.background.barcolor1', 'white');
                    myLine.Set('chart.background.barcolor2', 'white');
                    myLine.Set('chart.title', 'An example line chart with zoom');
                    myLine.Set('chart.title.xaxis', 'Previous year');
                    myLine.Set('chart.title.yaxis.pos', 0.5);
                    myLine.Set('chart.title.xaxis.pos', 0.5);
                    myLine.Set('chart.title.yaxis', 'Percentage');                
                    myLine.Set('chart.title.color', '#333');
                    myLine.Set('chart.text.color', '#333');
                    myLine.Set('chart.noaxes', true);
                    myLine.Set('chart.gutter', 40);
                    myLine.Set('chart.yaxispos', 'right');
                    myLine.Set('chart.ymin', 10);

                    myLine.Set('chart.key', ['Robert', 'Daniel']);
                    myLine.Set('chart.key.shadow', true);
                    myLine.Set('chart.key.shadow.blur', navigator.userAgent.indexOf('Chrome') > 0 ? 15 : 5);
                    myLine.Set('chart.key.shadow.offsetx', 0);
                    myLine.Set('chart.key.shadow.offsety', 0);
                    myLine.Set('chart.key.shadow.color', navigator.userAgent.indexOf('Chrome') > 0 ? '#ccc' : 'black');
                    myLine.Set('chart.key.rounded', true);
                    
                    if (!RGraph.isIE8()) {
                        myLine.Set('chart.zoom.frames', 15);
                        myLine.Set('chart.zoom.delay', 20);
                        myLine.Set('chart.zoom.hdir', 'left');
                        myLine.Set('chart.zoom.vdir', 'center');
                        myLine.Set('chart.zoom.mode', 'area');
                        myLine.Set('chart.zoom.factor', 2);

                    } else {
                        myLine.Set('chart.contextmenu', [['Show modal dialog', function() {ModalDialog.Show('myDialog', 300);}],['Cancel', function () {}]]);
                        // Change the shadow color
                        myLine.Set('chart.shadow.color', '#666');
                    }
                    
                    // Chrome shadow bug
                    myLine.Set('chart.chromefix', location.href.indexOf('chromefix=0') > 0 ? false : true);
                    
                    myLine.Draw();
                }
            </script>
            

        </div>
    </div>

        <script>
        
        CreateLineChart();

    </script>
</body>
</html>