
function popup(url,width,height){
	var iWidth = width; //弹出窗口的宽度;
	var iHeight = height; //弹出窗口的高度;
	var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
	var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	window.open(url,'_blank','height='+iHeight+',,innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
}
function popup2(url,width,height){
	var iWidth = width; //弹出窗口的宽度;
	var iHeight = height; //弹出窗口的高度;
	var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
	var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	window.open(url,'_blank','height='+iHeight+',,innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=yes,menubar=yes,scrollbars=yes,resizeable=yes,location=yes,status=yes');
}
function popupModalDialog(url,width,height){
	var iTop = (window.screen.availHeight-30-height)/2;
	var iLeft = (window.screen.availWidth-10-width)/2;
	window.showModalDialog(url," ", "dialogWidth="+width+";dialogHeight="+height+";dialogTop="+iTop+";dialogLeft="+iLeft+";status:0;help:0");
}