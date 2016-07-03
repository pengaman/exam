var uitool=(function(){
	function init(id,title,main){
		var instance=new createConfirm(id,title,main);	
		return instance;
	}
	function createConfirm(id,title,main){     //构造方法
	this.id=id;
	this.title=title;
	this.main=main;
	this.init();	
	}
	createConfirm.prototype={
		init:function(){      //dom操作
		var parent=document.getElementsByTagName("body")[0];
		var str="<div id='"+this.id+"' style='display:none;'><div class='shelter'></div><div class='confirm'><h1>"+this.title+"<span>×</span></h1><p>"+this.main+"</p><button class='sure' id='"+this.id+"sure'>确定</button><button class='cancel' id='"+this.id+"cancel'>取消</button></div></div>";
		parent.innerHTML=str+parent.innerHTML;
		},
		bindevent:function(){    //绑定事件
			id=this.id;
			event.preventDefault();
			document.getElementById(id+"sure").onclick=function(){document.getElementById(id).style.display="none";};
			document.getElementById(id+"cancel").onclick=function(){document.getElementById(id).style.display="none";};
			document.getElementById(id).getElementsByTagName('div')[0].onclick=function(){document.getElementById(id).style.display="none";};
			document.getElementById(id).getElementsByTagName('span')[0].onclick=function(){document.getElementById(id).style.display="none";};
			document.getElementById(id).getElementsByTagName("div")[1].onmousedown=function(e){
			this.style.cursor="move";
			e=e||window.event;
			var left1=e.clientX-this.offsetLeft;
			var top1=e.clientY-this.offsetTop;
			this.onmousemove=function(e){
				e=e||window.event;
				var left=e.clientX-left1;
				var top=e.clientY-top1;
				this.style.margin=0;
				this.style.top=top+"px";
				this.style.left=left+"px";
			}
			};
			document.getElementById(id).getElementsByTagName("div")[1].onmouseup=function(){
			this.onmousemove=null;
			};
		},
		dis:function(){
			document.getElementById(this.id).style.display="block";
		}
	};
	return{
		init:init
	}
})();
var c1=uitool.init("c1","警告","此操作不可逆，是否继续？");
function confirmdelete(){
c1.dis(); 
c1.bindevent();
}