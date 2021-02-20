#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd.service
systemctl enable httpd.service
echo "<html>
<head>
<h1>Distance Calculator</h1><br/>
<script>
function add(){
var a,b,c;
a=Number(document.getElementById("first").value);
b=Number(document.getElementById("second").value);
c= a + b;
document.getElementById("answer").value= c;
}
</script>
</head>
<body>
<h2>Enter the First Distance (Meters): <input id="first"></h2><br/>
<h2>Enter the Second Distance (Meters): <input id="second"></h2><br/>
<button onclick="add()">Calculate Total</button>
<input id="answer">
</body>
</html>" > /var/www/html/index.html