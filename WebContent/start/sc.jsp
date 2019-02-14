<%@page import="blackSurviver.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>

<jsp:useBean id="mgr" class="blackSurviver.Connect" />
<jsp:useBean id="bean" class="blackSurviver.User" />
<jsp:setProperty property="*" name="bean" />

<%
	String id = request.getParameter("id");
	bean = mgr.user_info(id);
	bean.setCh(Integer.parseInt(request.getParameter("ch")));
	//int ch=bean.getCh();
	int level = bean.getLevel();
	int nowhp = bean.getNowhp();
	int nowst = bean.getNowst();
	int maxhp = bean.getMaxhp();
	int maxst = bean.getMaxst();
	int atk = bean.getAtk();
	int def = bean.getDef();
	int local = bean.getLocal();
	int weapon = bean.getWeapon();
	int armor1 = bean.getArmor1();
	int armor2 = bean.getArmor2();
	int armor3 = bean.getArmor3();
	int armor4 = bean.getArmor4();
	int armor5 = bean.getArmor5();

	bean.setNow(Integer.parseInt(request.getParameter("now")));

	/* bean.setId(request.getParameter("id"));
	bean.setCh(Integer.parseInt(request.getParameter("ch")));
	bean.setNow(Integer.parseInt(request.getParameter("now"))); */
%>

<link href="../css/css.css?ver=<?php echo time()?>" rel="stylesheet"
	type="text/css">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<META HTTP-EQUIV="EXPIRES" CONTENT="Mon, 22 Jul 2002 11:12:01 GMT">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<script>

$(document).ready(function(){
  
  /* background */
  var mbg=$('.mbg');  var bg=$('.bg');  var fade=$('.fade'); var death=$('.death'); 
  /* ui */
  var chface=$('#chface'); var find_item=$('.find_item'); var hp=$('.hp'); var st=$('.st');
  var maxhp=$('.maxhp'); var nowhp=$('.nowhp'); var maxst=$('.maxst'); var nowst=$('.nowst'); 
  /* button */
  var rest = $('.rest');  var move = $('.move');	var search=$('.search'); var item_cancel=$('.item_cancel'); var reset=$('.reset'); 
  /* map */
  var A1=$('.A1');  var A3=$('.A3');  var A4=$('.A4');  var B2=$('.B2');  var B3=$('.B3');  var B5=$('.B5');  var B6=$('.B6');  var B8=$('.B8');
  var C1=$('.C1');  var C2=$('.C2');  var C6=$('.C6');  var C7=$('.C7');  var D1=$('.D1');  var D3=$('.D3');  var D5=$('.D5');  var E2=$('.E2');
  var E3=$('.E3');  var E5=$('.E5');  var E7=$('.E7');  var F4=$('.F4');  var F8=$('.F8');
  var maping=$('.A1,.A3,.A4,.B2,.B3,.B5,.B6,.B8,.C1,.C2,.C6,.C7,.D1,.D3,.D5,.E2,.E3,.E5,.E7,.F4,.F8,.G1');
  var G1=$('.G1'); var map = $('.map'); var cancel=$('.cancel');
  /* limit_time */
  var time=$('#time');   var now=<%=bean.getNow()%>;

  
  var bgm=document.getElementById("bgm");
  var find_can=2;
  var move_can=0;
  var can=0;
  
  
  maxhp.text(' / '+<%=maxhp%>);
  maxst.text(' / '+<%=maxst%>);
  
  
  function map_move(){
		fade.fadeIn(300);
		var audio = new Audio('../../audio/전투_도망.wav');
		  audio.play();
	}

	bgm.play();
  


  
  
  /* 캐릭터 ui */
  if(<%=bean.getCh()%>==1){chface.attr("src","../../image/char/1.png")}
  else if(<%=bean.getCh()%>==2){chface.attr("src","../../image/char/2.png")}
  else if(<%=bean.getCh()%>==3){chface.attr("src","../../image/char/3.png")}
  else if(<%=bean.getCh()%>==4){chface.attr("src","../../image/char/4.png")}
  else if(<%=bean.getCh()%>==5){chface.attr("src","../../image/char/5.png")}
  else if(<%=bean.getCh()%>==6){chface.attr("src","../../image/char/6.png")}
  else if(<%=bean.getCh()%>==7){chface.attr("src","../../image/char/7.png")}
  else if(<%=bean.getCh()%>==8){chface.attr("src","../../image/char/8.png")}
  
  /* 전체 ui fadeout */
  reset.fadeOut(0);  death.fadeOut(0);  fade.fadeOut(1000);		map.fadeOut(0);
  cancel.fadeOut(0);  find_item.fadeOut(0);  item_cancel.fadeOut(0);
  maping.fadeOut(0);
  
  /* 금지구역 타이머 */
  var x=setInterval(function(){
	  if(now>0){
		  var minutes=Math.floor((now%(1000*60*60))/(1000*60));
		  var seconds=Math.floor((now%(1000*60))/1000);
		  document.getElementById('time').innerHTML="금지구역까지 "+minutes+'분 '+seconds+'초 남았습니다';
		now-=1000;
		
	  }
	  else if(now==0){
			bgm.pause();
			
		  fade.fadeIn(1000); map.fadeOut(0); maping.fadeOut(0);
		  cancel.fadeOut(0);  find_item.fadeOut(0);  item_cancel.fadeOut(0);
		  
		  var y=setInterval(function(){
			  var audio = new Audio('../../audio/사망 시.wav');
			  audio.play();
			  death.fadeIn(1000);  reset.fadeIn(0);
			  clearInterval(y);  clearInterval(x);
		  },1000);
		  
		
	  }
  },1000);
  
	
  reset.click(function(){
		death.fadeOut(1000); 	reset.fadeOut(0);
		var hack=document.createElement("img");
	  	hack.src="../../image/역행.gif";	hack.bottom="200";  	hack.width="1300";  	hack.height="700";
	  	document.body.appendChild(hack);
	  	
		var timer=setInterval(function() {
			location.href = "../login.jsp?id=<%=id%>";
		  	  clearInterval(timer);
		    }, 1500);
	  });

  	function mov(){
  		can=2;
  		move_can=1;
  		map.fadeIn(150);
	    maping.fadeIn(150);
	    cancel.fadeIn(150);
  	}
  
  	move.click(function(){
  		if(move_can==0&&can==0){
			   mov();
		   }
  		});


	A1.click(function(){map_move();	var timer=setInterval(function() {
		 location.href = "A1.jsp?local=1&id=<%=bean.getId()%>&ch=<%=bean.getCh()%>&now="+now;
	  	  clearInterval(timer);    }, 1000);	});
	A3.click(function(){map_move();	var timer=setInterval(function() {
			 location.href = "A3.jsp?local=2&id=<%=bean.getId()%>&ch=<%=bean.getCh()%>&now="+now;
		  	  clearInterval(timer);    }, 1000);	});
	A4.click(function(){map_move();var timer=setInterval(function() {
		 location.href = "A4.jsp?local=3&id=<%=bean.getId()%>&ch=<%=bean.getCh()%>&now="+now;
	  	  clearInterval(timer);    }, 1000);	});
	B2.click(function(){map_move();var timer=setInterval(function() {
		 location.href = "B2.jsp?local=4&id=<%=bean.getId()%>&ch=<%=bean.getCh()%>&now="+now;
	  	  clearInterval(timer);    }, 1000);	});
	B3.click(function(){map_move();var timer=setInterval(function() {
		 location.href = "B3.jsp?local=5&id=<%=bean.getId()%>&ch=<%=bean.getCh()%>&now="+now;
	  	  clearInterval(timer);    }, 1000);	});
	B5.click(function(){map_move();var timer=setInterval(function() {
		 location.href = "B5.jsp?local=6&id=<%=bean.getId()%>&ch=<%=bean.getCh()%>&now="+now;
	  	  clearInterval(timer);    }, 1000);	});
	B6.click(function(){map_move();var timer=setInterval(function() {
		 location.href = "B6.jsp?local=7&id=<%=bean.getId()%>&ch=<%=bean.getCh()%>&now="+now;
	  	  clearInterval(timer);    }, 1000);	});
	B8.click(function(){map_move();var timer=setInterval(function() {
		 location.href = "B8.jsp?local=8&id=<%=bean.getId()%>&ch=<%=bean.getCh()%>&now="+now;
	  	  clearInterval(timer);    }, 1000);	});
	C1.click(function(){map_move();var timer=setInterval(function() {
		 location.href = "C1.jsp?local=9&id=<%=bean.getId()%>&ch=<%=bean.getCh()%>&now="+now;
	  	  clearInterval(timer);    }, 1000);	});
	C2.click(function(){map_move();var timer=setInterval(function() {
		 location.href = "C2.jsp?local=10&id=<%=bean.getId()%>&ch=<%=bean.getCh()%>&now="+now;
	  	  clearInterval(timer);    }, 1000);	});
	C6.click(function(){map_move();var timer=setInterval(function() {
		 location.href = "C6.jsp?local=11&id=<%=bean.getId()%>&ch=<%=bean.getCh()%>&now="+now;
	  	  clearInterval(timer);    }, 1000);	});
	C7.click(function(){map_move();var timer=setInterval(function() {
		 location.href = "C7.jsp?local=12&id=<%=bean.getId()%>&ch=<%=bean.getCh()%>&now="+now;
	  	  clearInterval(timer);    }, 1000);	});
	D1.click(function(){map_move();var timer=setInterval(function() {
		 location.href = "D1.jsp?local=13&id=<%=bean.getId()%>&ch=<%=bean.getCh()%>&now="+now;
	  	  clearInterval(timer);    }, 1000);	});
	D3.click(function(){map_move();var timer=setInterval(function() {
		 location.href = "D3.jsp?local=14&id=<%=bean.getId()%>&ch=<%=bean.getCh()%>&now="+now;
	  	  clearInterval(timer);    }, 1000);	});
	D5.click(function(){map_move();var timer=setInterval(function() {
		 location.href = "D5.jsp?local=15&id=<%=bean.getId()%>&ch=<%=bean.getCh()%>&now="+now;
	  	  clearInterval(timer);    }, 1000);	});
	E2.click(function(){map_move();var timer=setInterval(function() {
		 location.href = "E2.jsp?local=16&id=<%=bean.getId()%>&ch=<%=bean.getCh()%>&now="+now;
	  	  clearInterval(timer);    }, 1000);	});
	E3.click(function(){map_move();var timer=setInterval(function() {
		 location.href = "E3.jsp?local=17&id=<%=bean.getId()%>&ch=<%=bean.getCh()%>&now="+now;
	  	  clearInterval(timer);    }, 1000);	});
	E5.click(function(){map_move();var timer=setInterval(function() {
		 location.href = "E5.jsp?local=18&id=<%=bean.getId()%>&ch=<%=bean.getCh()%>&now="+now;
	  	  clearInterval(timer);    }, 1000);	});
	E7.click(function(){map_move();var timer=setInterval(function() {
		 location.href = "E7.jsp?local=19&id=<%=bean.getId()%>&ch=<%=bean.getCh()%>&now="+now;
	  	  clearInterval(timer);    }, 1000);	});
	F4.click(function(){map_move();var timer=setInterval(function() {
		 location.href = "F4.jsp?local=20&id=<%=bean.getId()%>&ch=<%=bean.getCh()%>&now="+now;
	  	  clearInterval(timer);    }, 1000);	});
	F8.click(function(){map_move();var timer=setInterval(function() {
		 location.href = "F8.jsp?local=21&id=<%=bean.getId()%>&ch=<%=bean.getCh()%>&now="+now;
	  	  clearInterval(timer);    }, 1000);	});
	G1.click(function(){map_move();	var timer=setInterval(function() {
		 location.href = "G1.jsp?local=22&id=<%=bean.getId()%>&ch=<%=bean.getCh()%>&now="+now;
          clearInterval(timer);    }, 1000);	});

						function cancel_map() {
							move_can = 0;
							can = 0;
							map.fadeOut(150);
							maping.fadeOut(150);
							cancel.fadeOut(150);
						}

						cancel.click(function() {
							if (can == 2) {
								cancel_map();
							}
						});

						function find_fun() {

							var audio = new Audio('../../audio/탐색_이동음.wav');
							audio.play();

							can = 1;
							search.fadeOut(0);
							find_can = 0;
							mbg.animate({
								top : "30px",
								height : "110%",
								width : "110%",
								left : "-50px",
								opacity : "0.8"
							}, 550).animate({
								top : "10px",
								height : "120%",
								width : "120%",
								left : "-100px",
								opacity : "0.6"
							}, 300).animate({
								top : "30px",
								height : "130%",
								width : "130%",
								left : "-150px",
								opacity : "0.1"
							}, 550).animate({
								top : "10px",
								height : "100%",
								width : "100%",
								left : "10px"
							}, 0);

							var timer = setInterval(
									function() {
										var audio = new Audio(
												'../../audio/아이템_획득.wav');
										audio.play();
										find_item.fadeIn(150);
										item_cancel.fadeIn(150);
										find_can += 1;
										clearInterval(timer);
									}, 1500);
						}
						;

						search.click(function() {
							if (find_can == 2 && can == 0) {

								find_fun();
							}
						});

						function cancel_item_get() {

							can = 0;
							find_can += 1;
							search.fadeIn(0);
							find_item.fadeOut(150);
							item_cancel.fadeOut(150);
						}

						item_cancel.click(function() {
							if (find_can == 1 && can == 1) {
								cancel_item_get();
							}
						});

						$('body').keydown(
								function(e) {
									//alert(e.keyCode);
									if (e.keyCode == 70 && find_can == 2
											&& can == 0) {
										find_fun();
									} else if (e.keyCode == 27 && find_can == 1
											&& can == 1) {
										cancel_item_get();
									} else if (e.keyCode == 27 && can == 2) {
										cancel_map();
									} else if (e.keyCode == 81 && move_can == 0
											&& can == 0) {
										mov();
									}
								});

						//스크립트끝
					});

	getTime();
</script>