<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <title>Login</title>
    <link rel="stylesheet" href="style.css">
    <script language="JavaScript">
			function checkForm(form){
				for(var i = 0;i<form.elements.length;i++){
					if(form.elements[i].type == "text" && form.elements[i].value == ""){
						alert("请输入用户名或密码！");
						return false;
					}
				}
				return true;
			}
			
</script>
</head>
<h1>学生信息管理系统</h1>
<body>
<div class="login-panda">
<svg id="panda" viewBox="9.5 -10 120 120" xmlns="http://www.w3.org/2000/svg">
<path class="ears" d="M43.7,109.2c0.6-0.9,1.2-1.8,1.9-2.5c1.3-1.4,2.8-2.8,4.1-4.2c0.4-0.5,0.8-1,1.2-1.5c-0.4-0.1-1.1-0.4-1.7-0.6
	c-1.2-0.4-2.4-0.6-3.6-1.1c-1.5-0.6-2.9-1.4-4.3-2.1c-2.9-1.5-5-3.9-6.5-6.7c-1-1.8-1.6-3.7-2-5.6c-0.6-2.5-0.8-5.1-0.6-7.7
	c0.1-1.4,0.3-2.9,0.6-4.3c0.3-1.7,0.7-3.4,1.2-5c0.4-1.4,1-2.8,1.6-4.2c0.7-1.6,1.6-3.1,2.3-4.7c0.1-0.3,0-0.8-0.1-1
	c-1.6-1.7-2.6-3.7-2.9-5.9c-0.3-1.6-0.5-3.4,0.2-5s1.5-3.1,2.8-4.2c1.4-1.2,2.9-2.1,4.6-2.4c1.5-0.3,3.1-0.3,4.5,0.3
	c1.6,0.6,2.9,1.7,4.1,3c0.1,0.1,0.2,0.2,0.2,0.3c0.4,0.7,0.4,0.8,1.2,0.5c2.4-0.9,4.8-1.5,7.3-1.9c0.5-0.1,1-0.2,1.6-0.3
	c0.3-0.1,0.5-0.2,0.4-0.5c-0.2-0.7-0.4-1.5-1-2c-0.2-0.2-0.5-0.5-0.7-0.8c-0.2-0.2-0.4-0.7-0.3-0.8c0.2-0.3,0.6-0.6,0.9-0.6
	c1.2-0.2,2.3,0.4,3.4,0.8c0.4,0.1,0.7,0.3,1,0.5c1,0.5,1.7,1.3,2.4,2.2c0.1,0.1,0.3,0.2,0.5,0.4c0.1-0.7,0.3-1.2,0.4-1.8
	c0.4-1.6,0.5-3.2,0.3-4.9c-0.1-0.4-0.3-0.9-0.5-1.3c-0.4-0.6-0.4-1.4,0.1-1.9c0.1-0.1,0.3-0.1,0.4-0.1c0.5,0.2,1,0.5,1.5,0.8
	c1.2,0.6,2,1.6,2.7,2.7s1.1,2.2,1.3,3.4c0.2,1,0.3,2,0.4,3.1c0,0.4,0.1,0.6,0.6,0.6c0.9,0,1.8,0.1,2.7,0.3c2.3,0.5,4.6,1.1,7,1.6
	c0.5,0.1,1.1,0.4,1.6,0.6c0.4,0.2,0.6,0,0.9-0.3c1.2-1.6,2.5-3,4.5-3.5c2-0.6,4-0.7,5.8,0.1c2,0.8,3.7,2.1,4.9,4.1
	c1,1.6,1.6,3.2,1.5,5c0,0.5,0,0.9,0,1.4c0.1,1.1-0.4,2-0.8,3c-0.5,1.3-1.2,2.6-2.2,3.7c-0.3,0.4-0.4,0.7-0.1,1.2
	c1.4,2.5,2.6,5.1,3.5,7.9c1.5,4.6,2.4,9.3,1.9,14.1c-0.2,2.6-0.8,5.2-1.9,7.6c-0.6,1.4-1.3,2.8-2.2,4.1c-0.7,1-1.6,1.8-2.5,2.6
	c-1.7,1.5-3.7,2.4-5.7,3.3c-1.7,0.8-3.5,1.2-5.3,1.6c-0.1,0-0.3,0.1-0.3,0.2s0,0.3,0.2,0.4c0.8,0.7,1.6,1.4,2.3,2.1s1.4,1.3,2,2
	c0.7,0.7,1.3,1.4,1.9,2.2c0.5,0.6,0.9,1.2,1.4,1.8C79,109.2,61.3,109.2,43.7,109.2z M70.9,37.1c0,0.2,0,0.4-0.1,0.6
	c-0.2,1.6-0.4,3.2-0.7,4.8c-0.1,0.6-0.5,1.3-0.8,1.8c-0.3,0.6-0.6,0.6-1.2,0.2c-0.4-0.3-0.8-0.7-1.3-1.1c-0.6-0.5-1.1-1.1-1.7-1.6
	c-0.5-0.4-0.7-0.3-0.8,0.3c-0.1,0.5-0.3,1-0.3,1.4c-0.1,0.4-0.2,0.6-0.7,0.7c-2.6,0.3-5.2,0.7-7.6,1.6c-1.3,0.5-2.6,0.9-3.9,1.5
	c-1,0.5-2,1.1-3,1.6c-2.1,1.2-3.6,2.9-5,4.7c-1.9,2.5-3.7,5.1-5,8c-0.9,2-1.8,4-2.6,6.1c-1.9,5.6-2.4,11.3-0.8,17
	c0.5,1.7,1.1,3.5,1.9,5.1c1,1.9,2.6,3.3,4.3,4.6c1.7,1.3,3.6,2.3,5.6,3.2c1.4,0.6,2.8,1.1,4.2,1.5c2.6,0.6,5.2,1.3,7.8,1.5
	c7.1,0.8,14.2,0.9,21.3-0.2c2.6-0.4,5.3-0.7,7.8-1.7c1.3-0.5,2.7-0.9,3.9-1.5c1.1-0.5,2.2-1.1,3.3-1.7c1.4-0.8,2.7-1.8,3.9-3
	c1.4-1.4,2.4-2.9,3.1-4.8c1.8-4.6,2.3-9.4,1.5-14.3c-0.9-6-3.3-11.4-6.6-16.5c-0.8-1.2-1.6-2.3-2.4-3.4c-1-1.4-2.1-2.6-3.4-3.6
	c-1.6-1.3-3.4-2.2-5.2-3c-1.4-0.6-2.8-1.1-4.2-1.5c-1.8-0.5-3.7-0.8-5.5-1.1c-1.3-0.2-2.6-0.4-4-0.6C72.8,41.4,72.1,39.2,70.9,37.1z
	 M79.8,102.5c-0.4,0-0.7,0.1-1.1,0.1c-0.5,0-0.9,0.2-1.2,0.7c-0.7,1.1-1.8,1.9-2.9,2.5c-1.8,1-3.7,1.2-5.7,0.9
	c-2.4-0.3-4.3-1.4-5.8-3.3c-0.2-0.2-0.4-0.5-0.6-0.5c-0.5-0.1-1.1-0.1-1.7-0.2c0,0.2,0,0.3,0.1,0.5c0.8,1.9,2.2,3.2,4,4
	c1.3,0.6,2.7,1,4.1,1c3.7,0.2,7.1-0.3,9.7-3.3C79.2,104.2,79.7,103.5,79.8,102.5z"/>

             <path class="eyes" d="M55.4,64.7c0.9,0.3,1.5,1.8,1.4,2.9c-0.2,1.2-0.7,2.1-1.8,2.6s-2.2,0.3-3-0.5c-1.4-1.4-1.3-3.6-0.1-4.8
	c0.9-0.9,1.9-1.1,3-0.7C55,64.3,55.2,64.6,55.4,64.7c-0.6-0.5-1-0.3-1.5,0.2c-0.4,0.4-0.4,1.2-0.1,1.6c0.3,0.4,0.9,0.6,1.4,0.3
	c0.5-0.2,0.8-0.8,0.6-1.4C55.7,65.2,55.5,65,55.4,64.7z"/>
			<path class="eyes" d="M61.6,66.2c-0.1,2.5-0.8,4.7-1.9,6.7c-0.9,1.6-2.2,2.8-3.8,3.7c-2.4,1.3-4.9,1.1-7.3-0.1c-1-0.5-1.9-1.2-2.6-1.9
	c-1.5-1.5-1.8-3.3-1.3-5.3c0.6-2,1.7-3.7,3.3-5.1c1.7-1.5,3.6-2.8,5.8-3.5c1.5-0.5,3.1-0.5,4.6,0.2C60.9,61.9,61.5,64,61.6,66.2z
	 M49.3,68c0,2.2,1.9,4.1,3.8,4c1.9,0,3.7-1.9,3.7-4.1C56.7,65.7,55.1,64,53,64C50.8,64,49.3,65.7,49.3,68z"/>
                <!-- right eye and eyebrow -->
     		<path class="eyes" d="M82.9,60.8c2.1,0.1,3.9,0.8,5.6,2c0.2,0.1,0.4,0.2,0.5,0.3c1.5,1.1,3,2.2,3.9,3.9c1.1,1.8,1.8,3.7,1.2,5.8
	c-0.4,1.4-1.3,2.5-2.6,3.3c-1.5,1-3,1.6-4.8,1.8c-1.5,0.1-2.9-0.1-4.1-0.9c-1.9-1.2-3.4-2.8-4.3-5c-0.6-1.4-1-2.8-1.2-4.3
	c-0.2-1.9,0.2-3.6,1.3-5.1c0.1-0.2,0.3-0.4,0.5-0.5C80.3,61.3,81.5,60.7,82.9,60.8z M83.6,68.5c0,2.2,1.9,4.1,3.8,4
	c1.9,0,3.7-1.9,3.7-4.1s-1.7-3.9-3.8-3.9S83.6,66.2,83.6,68.5z"/>
			<path class="eyes" d="M88.7,64.5c1.1,0.8,1.7,1.8,1.5,3.2c-0.2,1.1-0.7,2.1-1.8,2.5s-2.1,0.3-3-0.5c-1.5-1.4-1.4-3.6-0.1-4.8
	C86.4,63.9,87.6,63.8,88.7,64.5c-0.5-0.1-0.9-0.1-1.3,0.4c-0.4,0.5-0.5,1.2-0.1,1.7s1.1,0.6,1.6,0.2s0.6-1.2,0.2-1.8
	C89,64.8,88.9,64.6,88.7,64.5z"/>
           <path class="muzzle" d="M68.5,87.1c-0.1-1.6-0.1-3.2-0.1-4.8c0-0.6-0.2-0.8-0.7-0.8c-1-0.1-2-0.2-3-0.5c-1-0.3-1.5-1.5-1.1-2.6
	c0.4-0.8,0.8-1.5,1.6-1.9c0.5-0.2,0.9-0.6,1.4-0.7c2.6-0.7,5-0.4,7.1,1.4c0.3,0.3,0.5,0.6,0.7,0.9c0.5,0.7,0.4,1.7-0.1,2.1
	c-0.4,0.4-1,0.8-1.6,1c-0.8,0.2-1.6,0.3-2.4,0.4c-0.4,0-0.5,0.1-0.5,0.5c0,1.7,0,3.4-0.1,5.1c0,0.4,0.2,0.5,0.6,0.5
	c1.7-0.2,3.4-0.3,5-1c1.3-0.5,2.4-1.1,3.3-2.2c0.1-0.1,0.3-0.1,0.5-0.2c0,0.2,0.1,0.4,0,0.6c-0.4,1.2-1.2,2-2.3,2.5
	c-1.3,0.5-2.6,1-4,1.3c-3.4,0.8-6.7,0.4-9.9-0.8c-1.5-0.5-2.8-1.4-3.4-2.9c-0.1-0.2,0-0.4,0-0.6c0.2,0.1,0.4,0.2,0.5,0.3
	c0.6,0.6,1.2,1.1,1.9,1.6c0.6,0.4,1.3,0.7,1.9,0.9c1.6,0.5,3.2,0.7,5,0.7C68.8,87.6,68.8,87.5,68.5,87.1z M65.2,78.4
	c0,0.1,0,0.3,0,0.4c0.1,0,0.2,0,0.3,0c0.4-0.3,0.7-0.5,1.1-0.8C66.2,77.8,65.4,78,65.2,78.4z M65.1,79.3c0-0.1-0.2-0.2-0.3-0.3
	c-0.1,0.1-0.3,0.2-0.3,0.3s0.2,0.2,0.3,0.5C65,79.5,65.1,79.4,65.1,79.3z"/>
</svg>
</div>

<form action="MainServlet?choice=login" method="post" onsubmit="return checkForm(this)">
<div class="login">
  <div class="login-form">
    <div>
      <div class="login-inp">
        <label>登录</label>
        <input type="text" id="account" name="lgname">
      </div>
    </div>
    <div>
      <div class="login-inp">
        <label>密码</label>
        <input type="password" id="passwd" name="lgpasswd">
      </div>
    </div>
    <div>
      <div class="login-inp">
           <input class="login-inp.label" type="submit" name = "login" value="立即登录">
      </div>
    </div>
  </div>
</div>

</form>

<script>
    (function(){

    	const panda = document.querySelector('#panda');
    	const face = document.querySelectorAll('.ears, .eyes, .muzzle');
    	const email = document.querySelector('input[type="text"]');
    	const password = document.querySelector('input[type="password"]');
    	const fauxInput = document.createElement('div');
    	const span = document.createElement('span');
    	let timer = null;

    	function rotate3d(x, y, z, rad) {
    	    const value = `rotate3d(${x}, ${y}, ${z}, ${rad}rad)`;
    	    for (let i=0; i < face.length; i++) {
    	        face[i].style.transform = value;
    	    }
    	}

    	function focus(event) {
    	    event.target.classList.add('focused');
    	    copyStyles(event.target);
    	    event.target.type === 'password' ? lookAway(event) : look(event);
    	}

    	function reset(event) {
    	    event.target.classList.remove('focused');
    	    panda.classList.remove('playing');

    	    clearTimeout(timer);
    	    timer = setTimeout( () => {
    	        panda.classList.remove('look-away', 'down', 'up');
    	        rotate3d(0,0,0,0);
    	    }, 1 );
    	}

    	function copyStyles(el) {
    	    const props = window.getComputedStyle(el, null);

    	    if ( fauxInput.parentNode === document.body ) {
    	        document.body.removeChild(fauxInput);
    	    }

    	    fauxInput.style.visibility = 'hidden';
    	    fauxInput.style.position = 'absolute';
    	    fauxInput.style.top = Math.min(el.offsetHeight * -2, -999) + 'px';

    	    for(let i=0; i < props.length; i++) {
    	        if (['visibility','display','opacity','position','top','left','right','bottom'].indexOf(props[i]) !== -1) {
    	            continue;
    	        }
    	        fauxInput.style[props[i]] = props.getPropertyValue(props[i]);
    	    }

    	    document.body.appendChild(fauxInput);
    	}

    	function look(event) {
    	    const el = event.target;
    	    const text = el.value.substr(0, el.selectionStart);

    	    span.innerText = text || '.';

    	    const pandaRect = panda.getBoundingClientRect();
    	    const inputRect = el.getBoundingClientRect();
    	    const caretRect = span.getBoundingClientRect();
    	    const caretPos = caretRect.left + Math.min(caretRect.width, inputRect.width) * !!text;
    	    const distCaret = pandaRect.left + pandaRect.width/2 - inputRect.left - caretPos;
    	    const distInput = pandaRect.top + pandaRect.height/2 - inputRect.top;
    	    const y = Math.atan2(-distCaret, Math.abs(distInput)*3);
    	    const x =  Math.atan2(distInput, Math.abs(distInput)*3 / Math.cos(y));
    	    const angle = Math.max(Math.abs(x), Math.abs(y));

    	    rotate3d(x/angle, y/angle, y/angle/2, angle);
    	}

    	function lookAway(event) {
    	    const el = event.target;
    	    const pandaRect = panda.getBoundingClientRect();
    	    const inputRect = el.getBoundingClientRect();
    	    const distInput = pandaRect.top + pandaRect.height/2 - inputRect.top;

    	    panda.classList.add( 'look-away', distInput < 0 ? 'up' : 'down' );

    	    clearTimeout(timer);
    	    timer = setTimeout( () => {
    	        panda.classList.add( 'playing' );
    	    }, 300);
    	}

    	fauxInput.appendChild(span);

    	email.addEventListener( 'focus', focus, false );
    	email.addEventListener( 'keyup', look, false );
    	email.addEventListener( 'click', look, false );
    	email.addEventListener( 'blur', reset, false );

    	password.addEventListener( 'focus', lookAway, false );
    	password.addEventListener( 'blur', reset, false );

    	})();
</script>

</body>
</html>