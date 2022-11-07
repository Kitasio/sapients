// Garden Gnome Software - Skin
// Pano2VR 6.1.10/18007
// Filename: mobile.ggsk
// Generated 2020-11-02T00:16:44

function pano2vrSkin(player,base) {
	player.addVariable('ht_anivar1', 2, true);
	player.addVariable('opt_3d_preview', 2, true);
	var me=this;
	var skin=this;
	var flag=false;
	var skinKeyPressed = 0;
	this.player=player;
	this.player.skinObj=this;
	this.divSkin=player.divSkin;
	this.ggUserdata=player.userdata;
	this.lastSize={ w: -1,h: -1 };
	var basePath="";
	// auto detect base path
	if (base=='?') {
		var scripts = document.getElementsByTagName('script');
		for(var i=0;i<scripts.length;i++) {
			var src=scripts[i].src;
			if (src.indexOf('skin.js')>=0) {
				var p=src.lastIndexOf('/');
				if (p>=0) {
					basePath=src.substr(0,p+1);
				}
			}
		}
	} else
	if (base) {
		basePath=base;
	}
	this.elementMouseDown=[];
	this.elementMouseOver=[];
	var cssPrefix='';
	var domTransition='transition';
	var domTransform='transform';
	var prefixes='Webkit,Moz,O,ms,Ms'.split(',');
	var i;
	var hs,el,els,elo,ela,elHorScrollFg,elHorScrollBg,elVertScrollFg,elVertScrollBg,elCornerBg;
	if (typeof document.body.style['transform'] == 'undefined') {
		for(var i=0;i<prefixes.length;i++) {
			if (typeof document.body.style[prefixes[i] + 'Transform'] !== 'undefined') {
				cssPrefix='-' + prefixes[i].toLowerCase() + '-';
				domTransition=prefixes[i] + 'Transition';
				domTransform=prefixes[i] + 'Transform';
			}
		}
	}
	
	player.setMargins(0,0,0,0);
	
	this.updateSize=function(startElement) {
		var stack=[];
		stack.push(startElement);
		while(stack.length>0) {
			var e=stack.pop();
			if (e.ggUpdatePosition) {
				e.ggUpdatePosition();
			}
			if (e.hasChildNodes()) {
				for(var i=0;i<e.childNodes.length;i++) {
					stack.push(e.childNodes[i]);
				}
			}
		}
	}
	
	this.callNodeChange=function(startElement) {
		var stack=[];
		stack.push(startElement);
		while(stack.length>0) {
			var e=stack.pop();
			if (e.ggNodeChange) {
				e.ggNodeChange();
			}
			if (e.hasChildNodes()) {
				for(var i=0;i<e.childNodes.length;i++) {
					stack.push(e.childNodes[i]);
				}
			}
		}
	}
	player.addListener('changenode', function() { me.ggUserdata=player.userdata; me.callNodeChange(me.divSkin); });
	
	var parameterToTransform=function(p) {
		var hs='translate(' + p.rx + 'px,' + p.ry + 'px) rotate(' + p.a + 'deg) scale(' + p.sx + ',' + p.sy + ')';
		return hs;
	}
	
	this.findElements=function(id,regex) {
		var r=[];
		var stack=[];
		var pat=new RegExp(id,'');
		stack.push(me.divSkin);
		while(stack.length>0) {
			var e=stack.pop();
			if (regex) {
				if (pat.test(e.ggId)) r.push(e);
			} else {
				if (e.ggId==id) r.push(e);
			}
			if (e.hasChildNodes()) {
				for(var i=0;i<e.childNodes.length;i++) {
					stack.push(e.childNodes[i]);
				}
			}
		}
		return r;
	}
	
	this.addSkin=function() {
		var hs='';
		this.ggCurrentTime=new Date().getTime();
		el=me._rectangle_3=document.createElement('div');
		el.ggId="Rectangle 3";
		el.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		el.ggVisible=true;
		el.className="ggskin ggskin_rectangle ";
		el.ggType='rectangle';
		hs ='';
		hs+='background : #6c6c6c;';
		hs+='border : 0px solid #000000;';
		hs+='bottom : 0px;';
		hs+='cursor : default;';
		hs+='height : 50px;';
		hs+='left : 0px;';
		hs+='opacity : 0.5;';
		hs+='position : absolute;';
		hs+='visibility : inherit;';
		hs+='width : 101%;';
		hs+='pointer-events:auto;';
		el.setAttribute('style',hs);
		el.style[domTransform + 'Origin']='50% 50%';
		me._rectangle_3.ggIsActive=function() {
			return false;
		}
		el.ggElementNodeId=function() {
			return player.getCurrentNode();
		}
		me._rectangle_3.logicBlock_visible = function() {
			var newLogicStateVisible;
			if (
				((player.getIsMobile() == true))
			)
			{
				newLogicStateVisible = 0;
			}
			else {
				newLogicStateVisible = -1;
			}
			if (me._rectangle_3.ggCurrentLogicStateVisible != newLogicStateVisible) {
				me._rectangle_3.ggCurrentLogicStateVisible = newLogicStateVisible;
				me._rectangle_3.style[domTransition]='';
				if (me._rectangle_3.ggCurrentLogicStateVisible == 0) {
					me._rectangle_3.style.visibility="hidden";
					me._rectangle_3.ggVisible=false;
				}
				else {
					me._rectangle_3.style.visibility=(Number(me._rectangle_3.style.opacity)>0||!me._rectangle_3.style.opacity)?'inherit':'hidden';
					me._rectangle_3.ggVisible=true;
				}
			}
		}
		me._rectangle_3.ggUpdatePosition=function (useTransition) {
		}
		me.divSkin.appendChild(me._rectangle_3);
		el=me._controller2=document.createElement('div');
		el.ggId="controller2";
		el.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		el.ggVisible=true;
		el.className="ggskin ggskin_container ";
		el.ggType='container';
		hs ='';
		hs+='bottom : 3px;';
		hs+='height : 46px;';
		hs+='position : absolute;';
		hs+='right : 4px;';
		hs+='visibility : inherit;';
		hs+='width : 181px;';
		hs+='pointer-events:none;';
		el.setAttribute('style',hs);
		el.style[domTransform + 'Origin']='50% 50%';
		me._controller2.ggIsActive=function() {
			return false;
		}
		el.ggElementNodeId=function() {
			return player.getCurrentNode();
		}
		me._controller2.logicBlock_visible = function() {
			var newLogicStateVisible;
			if (
				((player.getIsMobile() == true))
			)
			{
				newLogicStateVisible = 0;
			}
			else {
				newLogicStateVisible = -1;
			}
			if (me._controller2.ggCurrentLogicStateVisible != newLogicStateVisible) {
				me._controller2.ggCurrentLogicStateVisible = newLogicStateVisible;
				me._controller2.style[domTransition]='';
				if (me._controller2.ggCurrentLogicStateVisible == 0) {
					me._controller2.style.visibility="hidden";
					me._controller2.ggVisible=false;
				}
				else {
					me._controller2.style.visibility=(Number(me._controller2.style.opacity)>0||!me._controller2.style.opacity)?'inherit':'hidden';
					me._controller2.ggVisible=true;
				}
			}
		}
		me._controller2.ggUpdatePosition=function (useTransition) {
		}
		el=me._image_2222=document.createElement('div');
		els=me._image_2222__img=document.createElement('img');
		els.className='ggskin ggskin_image_2222';
		hs='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAmCAYAAACoPemuAAAFdklEQVRYhc2YS2xVVRSGv3v7pNyWtij1FdAEkTJASJSAmvgAB8rEFyEtGEGjGI1K1BBjTByokJigCYkDNTE+Bg4Mj5kYMXHQFJABVBItvmJFGEhBoEUCRX4H+z+c3dNzy71A1J3snHP2Wnut/6y1115r74IkLqDNARYBtwDTgWuAiaadAH4HfgJ6gW3Anqo1SKq0N0taI6lf1bd+z22uVF+hAovVAc8CLwPtHhu0JXqAfuA3YMi0ZmAqMBO4zZa9zLQjwFpgAzByMRa7QdLu6M93SlomqUNSm6RWSS22RMm92WOt5unwnJ2RnN2WXVb3eKDuk3TcggYkdUdgSpIaJdVJqpFUzPQa0yYYaKukdssYsMwh66gK2ApJIxawRdK0CFC9lRcqWCsF89Z7bq'+
			'tlbbHsEUkrKwV2v6Qznrjef9psJZWAGa83Sppkmeut44x1jgus0yaWpLcVXHcpAMUWrFNYg23WIevsjHnjqKwDviHsUVuAx4A/TasHVgGzgNNR7BSAY8BbjrikLQCWWGYc9rXA58AXQKO/3wceIOx1885Fa4TyBaMf8Dpoiax1h8ZvqyM5tZL2jMN71DKbFNw6TdKvpr2ojCubJR02sVthkcbueyJHwaCkA5J+kbQw4i1KesPy9ks6lpl3KuJrsq5u0w4byzlga0zYobAwSxlgK3OA7ZI0T9J1GrsGGyTNlLRY0sHMvJMRX7KdtEvabvqaGFiSZpb5DxozivKAnZb0nv88b6FPkfSVpLPmT54xsKLBxVbrT4DN9cAhC8vLZ49GgLZqtHs+9ryYf4akryOePvcsMBT2uBbLOGSeuUVgoSNmmyPibE7misc+Ap4Ehv39'+
			'MDA7w78KuN3vPeY5EEVm3P52HwG+9NiiIjA/EiAzZdveaHwQ+BRYTdg63gR2ZPg/APrcu4Bvgf2mDWR4z5L+eI+f85G01+ZbqBC+9TmuLEq6U9KiDH2O10jeGrvWPfnukPSgpOk5vA1eZ3cZy96CpMOEcmYG8AdwktGb6L/R6oEJwOXAj8CRIlAycZjgygsqaS9RS9ZtqRgNipBi/hetSITSz/8CXMH9nPeKwEF/TI0YsuBKhHJ4A9AWjb0G3FhG2WJgefR9E/AZ0J0DKvHcVD8PImmjI+FphVKkSWN383ujzXKpx5J6qk9jy+R7lKai5R7b5O/BnIifaN1PmWdjkXQPutXoa6I/SNpV0XsD8CrwvL9nZegFwuZ6pb/fBZ4j3VibM7ITfQXC4QVgR15KmuR9pVyu7FOa905I6srZl1oVUlXSTitNN9lc2Wj+USkpL4'+
			'm32bTnS+JDCom3XLValPSJ0jI9aTGwBoVKpk2ZJJ647EM/n7FJa+2yJAjyIrWPEABLgZYM7XpgJfADocLNa0XSKrZg3SkWjS0Uu/wHcZWxIsdicXskY6mt5+FPrHWFQi3W5fEjid7EYkPAOr+vswVqbZE64Lsyf520M5nvclaCEGy1hCCo8zPRvdZYyh5GNgGPE7LBiPtsoNMuSCbVAD8Du4C/IuVTCFHeRlqV1BAON7uAUwQ3jgDvEA4jfcDN5BxG0NjjW7vdWrLpL+YYV1AIqg6FqqNd6fFtWJnjW56A7IF3ssFNsv+rBVjwnDZJVytsC5NV5YE33h4ScJsVjljtSi9RmhTqspoyIAum1Zs3OeC2W9bmCFTFVwRJf8gmlsK5r8uCE/cmIEt2UZP7RI/FNz7JvC6lZ8hhSUvK6T+fG2Zq9OG1V2Ej7MiAzOsJvcNz'+
			'eiM5eyy7rO5qLu5eAVo9Nkg4OPQA3xOuNo+b1kK4+uwk5L67SS/ujgKvcwku7rL57yVJ+1R92+e5rZXqq8RieW2OLbGA9HI4LtGTy+HttmzVl8P/AOmxYXCzefbAAAAAAElFTkSuQmCC';
		els.setAttribute('src',hs);
		els.ggNormalSrc=hs;
		els.setAttribute('style','position: absolute;top: 0px;left: 0px;width: 100%;height: 100%;-webkit-user-drag:none;pointer-events:none;;');
		els.className='ggskin ggskin_image';
		els['ondragstart']=function() { return false; };
		player.checkLoaded.push(els);
		el.appendChild(els);
		el.ggSubElement = els;
		el.ggId="Image 2222";
		el.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		el.ggVisible=true;
		el.className="ggskin ggskin_image ";
		el.ggType='image';
		hs ='';
		hs+='cursor : pointer;';
		hs+='height : 38px;';
		hs+='left : 140px;';
		hs+='opacity : 0.7;';
		hs+='position : absolute;';
		hs+='top : 6px;';
		hs+='visibility : inherit;';
		hs+='width : 38px;';
		hs+='pointer-events:auto;';
		el.setAttribute('style',hs);
		el.style[domTransform + 'Origin']='50% 50%';
		me._image_2222.ggIsActive=function() {
			if ((this.parentNode) && (this.parentNode.ggIsActive)) {
				return this.parentNode.ggIsActive();
			}
			return false;
		}
		el.ggElementNodeId=function() {
			if ((this.parentNode) && (this.parentNode.ggElementNodeId)) {
				return this.parentNode.ggElementNodeId();
			}
			return player.getCurrentNode();
		}
		me._image_2222.logicBlock_alpha = function() {
			var newLogicStateAlpha;
			if (
				((me.elementMouseOver['image_2222'] == true))
			)
			{
				newLogicStateAlpha = 0;
			}
			else {
				newLogicStateAlpha = -1;
			}
			if (me._image_2222.ggCurrentLogicStateAlpha != newLogicStateAlpha) {
				me._image_2222.ggCurrentLogicStateAlpha = newLogicStateAlpha;
				me._image_2222.style[domTransition]='opacity 0s';
				if (me._image_2222.ggCurrentLogicStateAlpha == 0) {
					me._image_2222.style.visibility=me._image_2222.ggVisible?'inherit':'hidden';
					me._image_2222.style.opacity=1;
				}
				else {
					me._image_2222.style.visibility=me._image_2222.ggVisible?'inherit':'hidden';
					me._image_2222.style.opacity=0.7;
				}
			}
		}
		me._image_2222.onclick=function (e) {
			player.toggleFullscreen();
		}
		me._image_2222.onmouseover=function (e) {
			me.elementMouseOver['image_2222']=true;
			me._image_2222.logicBlock_alpha();
		}
		me._image_2222.onmouseout=function (e) {
			me.elementMouseOver['image_2222']=false;
			me._image_2222.logicBlock_alpha();
		}
		me._image_2222.ontouchend=function (e) {
			me.elementMouseOver['image_2222']=false;
			me._image_2222.logicBlock_alpha();
		}
		me._image_2222.ggUpdatePosition=function (useTransition) {
		}
		me._controller2.appendChild(me._image_2222);
		me.divSkin.appendChild(me._controller2);
		el=me._controller=document.createElement('div');
		el.ggId="controller";
		el.ggDx=2.5;
		el.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		el.ggVisible=true;
		el.className="ggskin ggskin_container ";
		el.ggType='container';
		hs ='';
		hs+='bottom : 3px;';
		hs+='height : 43px;';
		hs+='left : -10000px;';
		hs+='position : absolute;';
		hs+='visibility : inherit;';
		hs+='width : 295px;';
		hs+='pointer-events:none;';
		el.setAttribute('style',hs);
		el.style[domTransform + 'Origin']='50% 50%';
		me._controller.ggIsActive=function() {
			return false;
		}
		el.ggElementNodeId=function() {
			return player.getCurrentNode();
		}
		me._controller.logicBlock_visible = function() {
			var newLogicStateVisible;
			if (
				((player.getIsMobile() == true))
			)
			{
				newLogicStateVisible = 0;
			}
			else {
				newLogicStateVisible = -1;
			}
			if (me._controller.ggCurrentLogicStateVisible != newLogicStateVisible) {
				me._controller.ggCurrentLogicStateVisible = newLogicStateVisible;
				me._controller.style[domTransition]='';
				if (me._controller.ggCurrentLogicStateVisible == 0) {
					me._controller.style.visibility="hidden";
					me._controller.ggVisible=false;
				}
				else {
					me._controller.style.visibility=(Number(me._controller.style.opacity)>0||!me._controller.style.opacity)?'inherit':'hidden';
					me._controller.ggVisible=true;
				}
			}
		}
		me._controller.ggUpdatePosition=function (useTransition) {
			if (useTransition==='undefined') {
				useTransition = false;
			}
			if (!useTransition) {
				this.style[domTransition]='none';
			}
			if (this.parentNode) {
				var pw=this.parentNode.clientWidth;
				var w=this.offsetWidth;
					this.style.left=(this.ggDx + pw/2 - w/2) + 'px';
			}
		}
		el=me._image_3333=document.createElement('div');
		els=me._image_3333__img=document.createElement('img');
		els.className='ggskin ggskin_image_3333';
		hs='data:image/png;base64,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';
		els.setAttribute('src',hs);
		els.ggNormalSrc=hs;
		els.setAttribute('style','position: absolute;top: 0px;left: 0px;width: 100%;height: 100%;-webkit-user-drag:none;pointer-events:none;;');
		els.className='ggskin ggskin_image';
		els['ondragstart']=function() { return false; };
		player.checkLoaded.push(els);
		el.appendChild(els);
		el.ggSubElement = els;
		el.ggId="Image 3333";
		el.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		el.ggVisible=true;
		el.className="ggskin ggskin_image ";
		el.ggType='image';
		hs ='';
		hs+='height : 38px;';
		hs+='left : 254px;';
		hs+='opacity : 0.7;';
		hs+='position : absolute;';
		hs+='top : 3px;';
		hs+='visibility : inherit;';
		hs+='width : 38px;';
		hs+='pointer-events:auto;';
		el.setAttribute('style',hs);
		el.style[domTransform + 'Origin']='50% 50%';
		me._image_3333.ggIsActive=function() {
			if ((this.parentNode) && (this.parentNode.ggIsActive)) {
				return this.parentNode.ggIsActive();
			}
			return false;
		}
		el.ggElementNodeId=function() {
			if ((this.parentNode) && (this.parentNode.ggElementNodeId)) {
				return this.parentNode.ggElementNodeId();
			}
			return player.getCurrentNode();
		}
		me._image_3333.logicBlock_alpha = function() {
			var newLogicStateAlpha;
			if (
				((me.elementMouseOver['image_3333'] == true))
			)
			{
				newLogicStateAlpha = 0;
			}
			else {
				newLogicStateAlpha = -1;
			}
			if (me._image_3333.ggCurrentLogicStateAlpha != newLogicStateAlpha) {
				me._image_3333.ggCurrentLogicStateAlpha = newLogicStateAlpha;
				me._image_3333.style[domTransition]='opacity 0s';
				if (me._image_3333.ggCurrentLogicStateAlpha == 0) {
					me._image_3333.style.visibility=me._image_3333.ggVisible?'inherit':'hidden';
					me._image_3333.style.opacity=1;
				}
				else {
					me._image_3333.style.visibility=me._image_3333.ggVisible?'inherit':'hidden';
					me._image_3333.style.opacity=0.7;
				}
			}
		}
		me._image_3333.onclick=function (e) {
			player.toggleAutorotate();
		}
		me._image_3333.onmouseover=function (e) {
			me.elementMouseOver['image_3333']=true;
			me._image_3333.logicBlock_alpha();
		}
		me._image_3333.onmouseout=function (e) {
			me.elementMouseOver['image_3333']=false;
			me._image_3333.logicBlock_alpha();
		}
		me._image_3333.ontouchend=function (e) {
			me.elementMouseOver['image_3333']=false;
			me._image_3333.logicBlock_alpha();
		}
		me._image_3333.ggUpdatePosition=function (useTransition) {
		}
		me._controller.appendChild(me._image_3333);
		el=me._move_right=document.createElement('div');
		els=me._move_right__img=document.createElement('img');
		els.className='ggskin ggskin_move_right';
		hs='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACUAAAAlCAYAAADFniADAAADl0lEQVRYhb3Yz2tdRRQH8E+uEBWbmNqNP7IotCIVUxNaXNpGgksl6MJF24huVCSx+ge4Vqm1WBAXWktTXfijCDULxRaz1Kq1AUE0IBilm7YmaYl14XExc83LIz/ufS/xwDBv7n1zvt97Zs6ZOacjItSUm/EwHsJObMet6MI8ZvELLuAMPsdCLYSIqNr6IuJ4RMxHPZnP8/qqYnVUsNRdeB2Po8jPvs0WOIefcSlbqQtbcDd2Z4vuynP+wUd4Eb+3Y6kDDZZZiIi3I6I/IrpqtP48b6HBcgdWw13pxQ0RcbRhCU5HxI6aZJrbvRHxWYPOoxmnEqmOiBjPE/+KiNE2yTS30Yi4nvWPZ7w199SbeB5X8QQm19p0LchevI9NGW+08WUzqX04gb/xGL7aAE'+
			'Kl7MHH6MR+jC9Hqhc/Sh70At7dQEKlPIU3JM/dIXtl0fCHQ5nQxP9ESMY5nXEPlQ9LS/XhPK5LcWWmgsJBPImRNon1SnHvRvRjqrTUS5LVxisSIi3xMD5FTxukZjJukXnoiIhbcFHyhAFMV1TWg+OSxc7jEfzZIrFt+F7y+NsLDGVC52oQkgk8ilOS2SextUVS0xl/E4YK6UtJJ3orMoJjmVA7xL7M/WCB+/Pg6xaVwRgOS0s6afFD68g3ud9ZSOsJP7VBCl7OrdxrwzXnl/jbCmzOg0ttkiJZa6xFYpdzv7kjFkN69zqQKmU4kyKRPFZx3hwpNlzNDzatE6EeKajCr5J3VpGu3M8XuJIHW9aJUBm7zuJB1WPXbbm/UliMTfesA6HS885KoaJOMC3xpwv8kAcPtEFoq8UYdUoKqnWje4l/oZC+ipQytSKN0fyw1g/o'+
			'odyfaT77dknZSVUZlPZQjxSjDrdIaDu+k+5VdxS4JqU+8EwNRaXb91iM6K3Ks7n/BNeWu0/txm8VFJXBcUR1t19OeiUrdWq6T03hQyklf62isjHJ5dshBK/ipow/xcp39IN4p02wKvK0tOwr3tFn8Fz+/YqUbWyk7Mk4pD31XypfNP1xHG9J6/uBlJ9thOzN+jtxBCeXvF0hZT+ZM9jrG5AhjzVkyCeWy5BXqiV0RMSRhrx/ItanljDRoPPIcoRWI1W2/RExl5WUVZeBmmQGYmnVZS4i9q2GW6U+dafkIavVpy5Ld6Fu6bRfrT51EH+siriGpRrbfRHxXkTMRj2ZzfPWtZLXLGXNc9DSmmd3tlZzzfMLNWue/wJJBIbcm1/jVAAAAABJRU5ErkJggg==';
		els.setAttribute('src',hs);
		els.ggNormalSrc=hs;
		els.setAttribute('style','position: absolute;top: 0px;left: 0px;width: 100%;height: 100%;-webkit-user-drag:none;pointer-events:none;;');
		els.className='ggskin ggskin_button';
		els['ondragstart']=function() { return false; };
		player.checkLoaded.push(els);
		el.appendChild(els);
		el.ggSubElement = els;
		el.ggId="move_right";
		el.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		el.ggVisible=true;
		el.className="ggskin ggskin_button ";
		el.ggType='button';
		hs ='';
		hs+='cursor : pointer;';
		hs+='height : 37px;';
		hs+='left : 212px;';
		hs+='opacity : 0.7;';
		hs+='position : absolute;';
		hs+='top : 3px;';
		hs+='visibility : inherit;';
		hs+='width : 37px;';
		hs+='pointer-events:auto;';
		el.setAttribute('style',hs);
		el.style[domTransform + 'Origin']='50% 50%';
		me._move_right.ggIsActive=function() {
			if ((this.parentNode) && (this.parentNode.ggIsActive)) {
				return this.parentNode.ggIsActive();
			}
			return false;
		}
		el.ggElementNodeId=function() {
			if ((this.parentNode) && (this.parentNode.ggElementNodeId)) {
				return this.parentNode.ggElementNodeId();
			}
			return player.getCurrentNode();
		}
		me._move_right.logicBlock_alpha = function() {
			var newLogicStateAlpha;
			if (
				((me.elementMouseOver['move_right'] == true))
			)
			{
				newLogicStateAlpha = 0;
			}
			else {
				newLogicStateAlpha = -1;
			}
			if (me._move_right.ggCurrentLogicStateAlpha != newLogicStateAlpha) {
				me._move_right.ggCurrentLogicStateAlpha = newLogicStateAlpha;
				me._move_right.style[domTransition]='opacity 0s';
				if (me._move_right.ggCurrentLogicStateAlpha == 0) {
					me._move_right.style.visibility=me._move_right.ggVisible?'inherit':'hidden';
					me._move_right.style.opacity=1;
				}
				else {
					me._move_right.style.visibility=me._move_right.ggVisible?'inherit':'hidden';
					me._move_right.style.opacity=0.7;
				}
			}
		}
		me._move_right.onmouseover=function (e) {
			me.elementMouseOver['move_right']=true;
			me._move_right.logicBlock_alpha();
		}
		me._move_right.onmouseout=function (e) {
			me.elementMouseDown['move_right']=false;
			me.elementMouseOver['move_right']=false;
			me._move_right.logicBlock_alpha();
		}
		me._move_right.onmousedown=function (e) {
			me.elementMouseDown['move_right']=true;
		}
		me._move_right.onmouseup=function (e) {
			me.elementMouseDown['move_right']=false;
		}
		me._move_right.ontouchend=function (e) {
			me.elementMouseDown['move_right']=false;
			me.elementMouseOver['move_right']=false;
			me._move_right.logicBlock_alpha();
		}
		me._move_right.ggUpdatePosition=function (useTransition) {
		}
		me._controller.appendChild(me._move_right);
		el=me._move_left=document.createElement('div');
		els=me._move_left__img=document.createElement('img');
		els.className='ggskin ggskin_move_left';
		hs='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACUAAAAlCAYAAADFniADAAADh0lEQVRYhbXYy29VVRQG8F8vBENsEXBiRBOTSozEasHHEKyoQxOiIxUbdcYALP4FTAk+GpsYB2gbqg6EaAwyMIaqQ4NPBsYoSROfE6AvUnHgcrD3yT1eess5995+yc7OOffstb679t7r1RcRamIjHsMjuBd34iZswgLm8Qt+wAw+xXItDRFRdQxFxGREzEc9zOd191TV1VfBUrfiNTyFRn73dbbAOfyMS9lKm7AV2/EAHsf9ec2/OIkx/NGNpZ6NiIX8j5cj4q2I2BkRAzXGzrxuOctZiIj9q+lt90NfRIyXtuBMROyoSaZ13J3lFBjPeiqR6ouIE3nh1Yg41CWZ1nEwy42IeDci1rVyWOlMvY5DWMLT+Px6h64DPIz30I83caD8YyupZzCNf/Akvl'+
			'gDQgX24BQ2YH/Wew2pbfgRA9INOb6GhAq8KN3sRezAbzSvOLySCZ3uAaFhbK7w3XGcyXqPFS8LSw3hO2nbdhWMO8Q+TOFDjFb4/nbJ390g/ZnzhaVelqx2oktCz2dCc/io4ppfpfPUwGGSpW7En5IJd0lxqxOM4UgmNCrFvarYLkWJJdzSwN5M6JsuCB0pEXqiJiFSqDonuYhHG1K0h886JDQlWWkWu6Wz2QnO5nlkvZR+wFc1hWzOhEZKhOY6JFTWf18Dg/nhpw4JzfSAUFn/4HpsyQ+XahD6EndkQqM9IAQX87ylIR1ykletgn2ZEEz2iBDp5kF/o0RmoM3HrXhH0ylOSb6pF+jP81IDl/PD1hoCCm89h3Hp9nWLm/N8uYEL+eGumkLKxAo/1Q0K/RcaUtUBD3YgqHzzxiSrdYqH8vx9Q9P77u1Q2GwmNqsZ+zpB'+
			'4cRnitj3l3TQdmpuZ11sxsdSpK/rKgbxrVLsuyJlgLSkpTVRjnsj6lms0HsKV1rzqatSndZN+iITmlQtMN8mZQjX5FPn8YFUkh/tkhD1UpdjWe/JzKNtjv4S3u4BuevhBal6apuj/665t0elamMtsUdzVw4oHZlGy4fTeEMqe96X6rO1wO4sfwMmlMortK2Qp0sV8sE1qJD/zvKnVyrd2/US1kXERKnu/yR600s4XZI5sVLJvhqpYjwXEYtZSNF1Ga5JZjj+33VZzHK76k9tw6tW709dlG7QgBTtV+tPHZYuVXtcx1KtnbypkuWqYjGvG6qqq4qlWrExW6C15zmQrVXueZ7VQc/zP+hYjLDyeLAbAAAAAElFTkSuQmCC';
		els.setAttribute('src',hs);
		els.ggNormalSrc=hs;
		els.setAttribute('style','position: absolute;top: 0px;left: 0px;width: 100%;height: 100%;-webkit-user-drag:none;pointer-events:none;;');
		els.className='ggskin ggskin_button';
		els['ondragstart']=function() { return false; };
		player.checkLoaded.push(els);
		el.appendChild(els);
		el.ggSubElement = els;
		el.ggId="move_left";
		el.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		el.ggVisible=true;
		el.className="ggskin ggskin_button ";
		el.ggType='button';
		hs ='';
		hs+='cursor : pointer;';
		hs+='height : 37px;';
		hs+='left : 170px;';
		hs+='opacity : 0.7;';
		hs+='position : absolute;';
		hs+='top : 3px;';
		hs+='visibility : inherit;';
		hs+='width : 37px;';
		hs+='pointer-events:auto;';
		el.setAttribute('style',hs);
		el.style[domTransform + 'Origin']='50% 50%';
		me._move_left.ggIsActive=function() {
			if ((this.parentNode) && (this.parentNode.ggIsActive)) {
				return this.parentNode.ggIsActive();
			}
			return false;
		}
		el.ggElementNodeId=function() {
			if ((this.parentNode) && (this.parentNode.ggElementNodeId)) {
				return this.parentNode.ggElementNodeId();
			}
			return player.getCurrentNode();
		}
		me._move_left.logicBlock_alpha = function() {
			var newLogicStateAlpha;
			if (
				((me.elementMouseOver['move_left'] == true))
			)
			{
				newLogicStateAlpha = 0;
			}
			else {
				newLogicStateAlpha = -1;
			}
			if (me._move_left.ggCurrentLogicStateAlpha != newLogicStateAlpha) {
				me._move_left.ggCurrentLogicStateAlpha = newLogicStateAlpha;
				me._move_left.style[domTransition]='opacity 0s';
				if (me._move_left.ggCurrentLogicStateAlpha == 0) {
					me._move_left.style.visibility=me._move_left.ggVisible?'inherit':'hidden';
					me._move_left.style.opacity=1;
				}
				else {
					me._move_left.style.visibility=me._move_left.ggVisible?'inherit':'hidden';
					me._move_left.style.opacity=0.7;
				}
			}
		}
		me._move_left.onmouseover=function (e) {
			me.elementMouseOver['move_left']=true;
			me._move_left.logicBlock_alpha();
		}
		me._move_left.onmouseout=function (e) {
			me.elementMouseDown['move_left']=false;
			me.elementMouseOver['move_left']=false;
			me._move_left.logicBlock_alpha();
		}
		me._move_left.onmousedown=function (e) {
			me.elementMouseDown['move_left']=true;
		}
		me._move_left.onmouseup=function (e) {
			me.elementMouseDown['move_left']=false;
		}
		me._move_left.ontouchend=function (e) {
			me.elementMouseDown['move_left']=false;
			me.elementMouseOver['move_left']=false;
			me._move_left.logicBlock_alpha();
		}
		me._move_left.ggUpdatePosition=function (useTransition) {
		}
		me._controller.appendChild(me._move_left);
		el=me._move_up=document.createElement('div');
		els=me._move_up__img=document.createElement('img');
		els.className='ggskin ggskin_move_up';
		hs='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACUAAAAlCAYAAADFniADAAADeElEQVRYhcXYTWhdRRQH8F+uUCsmaa0boRUCVrRCv6K4tE1Ql35AXYgfpa6ULqK0+9Ktom3jx8KFbdr6AYoRRQXRRl2qldp2oVghUOtCaE0TbdCFx8XM5b0+38t7Ny8ffxjm3jtz5vzvmZkzZ05PRKiI63EvhrAJt+AG9GEGf+AXnMYJfIG/KmmIiE7Lxog4EhEzUQ3TWW5jp7p6OrDUWryIR1Dkb99lC3yLn3ApW6kPa3Ab7s4WHcwy/+Jd7MGFbiz1eP7TiIgrEfF6RGyJiL4KZWuWm62z3GNz6W3V0BMRo3VT8FFEbKhIprFsyOOUOJj1dETqmog4ngX/joiRLsk0lmfzuBERx5oRa7amXsFu/IlH8VW7RTcPbMPb6MUoRuobG0k9iTH8gx34ch'+
			'EIldiO97ACT+B4M1Jr8aPEfgSHF5FQiadwUNq5t+M3alscXsqEPlkiQvAGPpVcyYHyY2mpjTglTdudOL9EpOBmnJSmcQvOlJbaK1nt6BITkvUdzfr3kCx1HX6Xpm6rdG7NB7swjql5yK7H95jGTQXuz4ROdkHoYRzC11g9D/lzWX8/7iswnBs+64LQWH4eyM/zIVbqHy6k8IN0yFbFkGQh2ImJ/G2spURrlPo3FdJ8ws8VBxlQs8qItJ66IVbqX19gVX65WJFQuX72qfm1qUxsUprW/RXGvJTrVYXkuEhetROsxoe5PqDO6dURuycTey6XTjCd6/6ijkxfi87NCA1I1tnXot8UHsj1fsldtEN/Sa7A5fxyYweCY5LXHddwsjfBZB2xQ9J0zoU1ub5cSD4Cbu2A0JC0kHe26VviVO47pfZDrVDqP1dItw64q42CIxUJ'+
			'lZhQ252Tc/Qr9Z/uiYgH8YHkUYcqKlxITEjBwEMLefZ1g/+dfbN4Pzc+swyE4Olcj2O2WTw1iF+XkNA6yUorsBlny3jqjBQvr8QLS0iIdNFdmfWfZflj9F2SD2sZo1+QrlbwvHRULCa2q83K7pJQIylSWPoqrsU70v1sMbANb0nraBTHrmpd5hvym81uyHPlEl6uu/d/HN3nEu7I45R4LRug4wTHQmZdBrPclTzOdB63q/zUOmnb7nB1fuoEvpHyUxel3EOvFG2U+alhtTOtzE/t1c4PtrHUQmTyZiLicCxwJq8R9TnPzWo5z95srTLn+YN0yH6uYs7zP1AOiuX0JYOSAAAAAElFTkSuQmCC';
		els.setAttribute('src',hs);
		els.ggNormalSrc=hs;
		els.setAttribute('style','position: absolute;top: 0px;left: 0px;width: 100%;height: 100%;-webkit-user-drag:none;pointer-events:none;;');
		els.className='ggskin ggskin_button';
		els['ondragstart']=function() { return false; };
		player.checkLoaded.push(els);
		el.appendChild(els);
		el.ggSubElement = els;
		el.ggId="move_up";
		el.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		el.ggVisible=true;
		el.className="ggskin ggskin_button ";
		el.ggType='button';
		hs ='';
		hs+='cursor : pointer;';
		hs+='height : 37px;';
		hs+='left : 128px;';
		hs+='opacity : 0.7;';
		hs+='position : absolute;';
		hs+='top : 3px;';
		hs+='visibility : inherit;';
		hs+='width : 37px;';
		hs+='pointer-events:auto;';
		el.setAttribute('style',hs);
		el.style[domTransform + 'Origin']='50% 50%';
		me._move_up.ggIsActive=function() {
			if ((this.parentNode) && (this.parentNode.ggIsActive)) {
				return this.parentNode.ggIsActive();
			}
			return false;
		}
		el.ggElementNodeId=function() {
			if ((this.parentNode) && (this.parentNode.ggElementNodeId)) {
				return this.parentNode.ggElementNodeId();
			}
			return player.getCurrentNode();
		}
		me._move_up.logicBlock_alpha = function() {
			var newLogicStateAlpha;
			if (
				((me.elementMouseOver['move_up'] == true))
			)
			{
				newLogicStateAlpha = 0;
			}
			else {
				newLogicStateAlpha = -1;
			}
			if (me._move_up.ggCurrentLogicStateAlpha != newLogicStateAlpha) {
				me._move_up.ggCurrentLogicStateAlpha = newLogicStateAlpha;
				me._move_up.style[domTransition]='opacity 0s';
				if (me._move_up.ggCurrentLogicStateAlpha == 0) {
					me._move_up.style.visibility=me._move_up.ggVisible?'inherit':'hidden';
					me._move_up.style.opacity=1;
				}
				else {
					me._move_up.style.visibility=me._move_up.ggVisible?'inherit':'hidden';
					me._move_up.style.opacity=0.7;
				}
			}
		}
		me._move_up.onmouseover=function (e) {
			me.elementMouseOver['move_up']=true;
			me._move_up.logicBlock_alpha();
		}
		me._move_up.onmouseout=function (e) {
			me.elementMouseDown['move_up']=false;
			me.elementMouseOver['move_up']=false;
			me._move_up.logicBlock_alpha();
		}
		me._move_up.onmousedown=function (e) {
			me.elementMouseDown['move_up']=true;
		}
		me._move_up.onmouseup=function (e) {
			me.elementMouseDown['move_up']=false;
		}
		me._move_up.ontouchend=function (e) {
			me.elementMouseDown['move_up']=false;
			me.elementMouseOver['move_up']=false;
			me._move_up.logicBlock_alpha();
		}
		me._move_up.ggUpdatePosition=function (useTransition) {
		}
		me._controller.appendChild(me._move_up);
		el=me._move_down=document.createElement('div');
		els=me._move_down__img=document.createElement('img');
		els.className='ggskin ggskin_move_down';
		hs='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACUAAAAlCAYAAADFniADAAADg0lEQVRYhcXYS4xURRQG4K9bgxoYGCFxoZiQiPERQUR0KQ8NSxMTXRg1hJ2vCET2hq0vHIwuXAiMqAtRo4SYGAPq0gDqsNGICQlq3IDDDEJk4XFx6jpNz/R03x5m+JPK7ep7T53//nXuqarTiAg1MR8PYT3uxi24HgtwDn/hV/yIw/gKf9fyEBG9thURsTsixqMexiNiT7HvyVejB6WW4lU8hmb57wgO4Tv8jNNFpQVYgttwPzZgTbH5F/vxIn6biVJPRsRYeePzEfFORKyOiIEabVWxO1/GGSvjdvTb6cZVEfF2yxQcjIg7a5Jpb3eUcSq8GRGNXkk1IuL9YvhPRGydIZn2tqWMGxGxrwjQNaaG8EKJkcfxTbeg6wNr8aGMwbfwfOvNdlJPYRgX8S'+
			'i+ngVCFR7Ax7gGm4rfSaRuxE8YwBbsnkVCFTbLmTmH2/E7E5847CyEvpgjQoqfg3IaX6/+rJS6S2bgi1itWx65vFiKY5iHVTheKbVdqjY8x4QUf8PF/3ZSqevwJxZKlU7MMSly/fxextYNTWwshI5eIULkAn5UxtbGplzt4ctpjAaxF4/04XAQn7X46YTK/4arsbJ0jkxjsKwQWo9RuSXpFXt7tKv8r2xieen8Mo3BDzLBVYqtqknocLGfDpX/5U0sKp0zXYw+lUl1EJ9L9abDkFS3eqFuOF2uixoxkdIX9mAI27ADJ+VSMTrFMzvKc9M9MxXGyNwwVpPUztKW4VupXDvpbYXIwzUIDZTreBNnS2dxj8bwkpzOZTJuKmKbpUqjUqGTNcZcUq5nmyZy0601BiDj5LAM5CpdDBVCm2oSavV/oomR0lnT4eE6xMiPoU7K'+
			'qFD5H2nKAwCZ2euiXZVNclr7QeX/0OVa+wbl9PW75Zm09l0w8XZP9zno6AwIwTPl+gkuVPupFTLJXcS9ODUDB3Vxs1yMJ+2njsuD4rXy4DmXeKX43V94dNyjb8W7c0Co6x79Dzxbfr+MdbNMaJ1UCZ6rCLWTgn3YJef3A3k+mw2sLePPk+e+4Uvudjghv3clT8idagmNiHij5dx/ILIWMNNawoGWMXdFjVpCa3siJqouFyKrJ/fUJFO76tJLfeomvObS+tQxWaGr6lNnMC6/3MWyPnUfHnRpfeojWZ/6P6inRBel2it5e1qU6xWzUslrx/yiwAZ56KhqngNFrarmOaLPmud/5A2NPRp0ajQAAAAASUVORK5CYII=';
		els.setAttribute('src',hs);
		els.ggNormalSrc=hs;
		els.setAttribute('style','position: absolute;top: 0px;left: 0px;width: 100%;height: 100%;-webkit-user-drag:none;pointer-events:none;;');
		els.className='ggskin ggskin_button';
		els['ondragstart']=function() { return false; };
		player.checkLoaded.push(els);
		el.appendChild(els);
		el.ggSubElement = els;
		el.ggId="move_down";
		el.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		el.ggVisible=true;
		el.className="ggskin ggskin_button ";
		el.ggType='button';
		hs ='';
		hs+='cursor : pointer;';
		hs+='height : 37px;';
		hs+='left : 86px;';
		hs+='opacity : 0.7;';
		hs+='position : absolute;';
		hs+='top : 3px;';
		hs+='visibility : inherit;';
		hs+='width : 37px;';
		hs+='pointer-events:auto;';
		el.setAttribute('style',hs);
		el.style[domTransform + 'Origin']='50% 50%';
		me._move_down.ggIsActive=function() {
			if ((this.parentNode) && (this.parentNode.ggIsActive)) {
				return this.parentNode.ggIsActive();
			}
			return false;
		}
		el.ggElementNodeId=function() {
			if ((this.parentNode) && (this.parentNode.ggElementNodeId)) {
				return this.parentNode.ggElementNodeId();
			}
			return player.getCurrentNode();
		}
		me._move_down.logicBlock_alpha = function() {
			var newLogicStateAlpha;
			if (
				((me.elementMouseOver['move_down'] == true))
			)
			{
				newLogicStateAlpha = 0;
			}
			else {
				newLogicStateAlpha = -1;
			}
			if (me._move_down.ggCurrentLogicStateAlpha != newLogicStateAlpha) {
				me._move_down.ggCurrentLogicStateAlpha = newLogicStateAlpha;
				me._move_down.style[domTransition]='opacity 0s';
				if (me._move_down.ggCurrentLogicStateAlpha == 0) {
					me._move_down.style.visibility=me._move_down.ggVisible?'inherit':'hidden';
					me._move_down.style.opacity=1;
				}
				else {
					me._move_down.style.visibility=me._move_down.ggVisible?'inherit':'hidden';
					me._move_down.style.opacity=0.7;
				}
			}
		}
		me._move_down.onmouseover=function (e) {
			me.elementMouseOver['move_down']=true;
			me._move_down.logicBlock_alpha();
		}
		me._move_down.onmouseout=function (e) {
			me.elementMouseDown['move_down']=false;
			me.elementMouseOver['move_down']=false;
			me._move_down.logicBlock_alpha();
		}
		me._move_down.onmousedown=function (e) {
			me.elementMouseDown['move_down']=true;
		}
		me._move_down.onmouseup=function (e) {
			me.elementMouseDown['move_down']=false;
		}
		me._move_down.ontouchend=function (e) {
			me.elementMouseDown['move_down']=false;
			me.elementMouseOver['move_down']=false;
			me._move_down.logicBlock_alpha();
		}
		me._move_down.ggUpdatePosition=function (useTransition) {
		}
		me._controller.appendChild(me._move_down);
		el=me._zoom_out=document.createElement('div');
		els=me._zoom_out__img=document.createElement('img');
		els.className='ggskin ggskin_zoom_out';
		hs='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACUAAAAlCAYAAADFniADAAADEklEQVRYhcXYy49URRQG8N9cDGYiPQbcGNHVSIzE0Rl8LMH3P6ArFRe6YwGK/wXxRZzEuNBoGHWh7JCFMaAuDSo6C2OUlc8NkJkeMuKC46Kq0tfLdE83TXd/SaVy7+065+tTr/OdqYgwIKbxBB7FvbgTN2MGq1jBr/gRp/E51gfyEBH9trmIeD8iVmIwrORx9/Tra6qPSN2GN/A0qvzu2xyBM/gFF3KUZrADu/AAnsT9ecwVfIqX8ecwkXouIlbzP16PiHciYiEiWgO0hTxuPdtZjYj9vfx2+zAVEUdrU3AyInYPSKbZ7s52Co5mP32RmoqIY3ng5Yg4NCSZZjuY7UZEfBgRW5ocNlpTb+IQ1vAMvtxs0V0DHsZH2Ia3caD+sUnqWSzhXzyFr0ZAqG'+
			'AfjmMr9me/V5HaiZ/QknbIuyMkVPCitLPb2I3f6WxxeC0TOjEmQrKfk9nvq+VlidQczkrTtkdmPCbcIZ13N2IeyyVSr0hROzZmQvCbtJ4qHCZF6ib8JYVwj3RvjRu7pFtiDbdWeCwT+m5ChEhX1RnpiHi8km57+GJChApO5f6RSko/4JsJkSko/u+rMJsffp4QmYLif7bC9vxwYUJkCs7nfvtUdI70mU0GzePrIZzulc7CXlglnQ3t/KI1hMPrgW25X7sBFyVCO3QIboSzNo/mMLgl9xcrnMsPd43QYT8o/s9VkuqABydEpuCh3P9QSTKIdLJPEuUQP13uvr+lhbagM53jxCy+V7v7LkkZII20dIwofo/jUjOfuizptHGmL7dLGcJV+dQyPpEk+ZExEiJlnNOSUF2me47+Et4bA6EXJPXUNUf/Q2duj0hqY5TYpzMr'+
			'B9SWTNX44RLekmTPx5I+GwX2Zvtbsagmr9BVIS/VFPLBESjkf7L9pY2ke7dawpaIWKzp/s/i+tQSTtRsLm4k2XuRKu35iGhnI6XqMj8gmfn4f9Wlne0OVZ/aidf1rk+dl3ZQS7rte9WnDkubqjs2iVSzkvdBLXL9op3HzfXrq59INTGdI9CsebZytOo1z1Ouoeb5H1FfY9pYgBzEAAAAAElFTkSuQmCC';
		els.setAttribute('src',hs);
		els.ggNormalSrc=hs;
		els.setAttribute('style','position: absolute;top: 0px;left: 0px;width: 100%;height: 100%;-webkit-user-drag:none;pointer-events:none;;');
		els.className='ggskin ggskin_button';
		els['ondragstart']=function() { return false; };
		player.checkLoaded.push(els);
		el.appendChild(els);
		el.ggSubElement = els;
		el.ggId="zoom_out";
		el.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		el.ggVisible=true;
		el.className="ggskin ggskin_button ";
		el.ggType='button';
		hs ='';
		hs+='cursor : pointer;';
		hs+='height : 37px;';
		hs+='left : 44px;';
		hs+='opacity : 0.7;';
		hs+='position : absolute;';
		hs+='top : 3px;';
		hs+='visibility : inherit;';
		hs+='width : 37px;';
		hs+='pointer-events:auto;';
		el.setAttribute('style',hs);
		el.style[domTransform + 'Origin']='50% 50%';
		me._zoom_out.ggIsActive=function() {
			if ((this.parentNode) && (this.parentNode.ggIsActive)) {
				return this.parentNode.ggIsActive();
			}
			return false;
		}
		el.ggElementNodeId=function() {
			if ((this.parentNode) && (this.parentNode.ggElementNodeId)) {
				return this.parentNode.ggElementNodeId();
			}
			return player.getCurrentNode();
		}
		me._zoom_out.logicBlock_alpha = function() {
			var newLogicStateAlpha;
			if (
				((me.elementMouseOver['zoom_out'] == true))
			)
			{
				newLogicStateAlpha = 0;
			}
			else {
				newLogicStateAlpha = -1;
			}
			if (me._zoom_out.ggCurrentLogicStateAlpha != newLogicStateAlpha) {
				me._zoom_out.ggCurrentLogicStateAlpha = newLogicStateAlpha;
				me._zoom_out.style[domTransition]='opacity 0s';
				if (me._zoom_out.ggCurrentLogicStateAlpha == 0) {
					me._zoom_out.style.visibility=me._zoom_out.ggVisible?'inherit':'hidden';
					me._zoom_out.style.opacity=1;
				}
				else {
					me._zoom_out.style.visibility=me._zoom_out.ggVisible?'inherit':'hidden';
					me._zoom_out.style.opacity=0.7;
				}
			}
		}
		me._zoom_out.onmouseover=function (e) {
			me.elementMouseOver['zoom_out']=true;
			me._zoom_out.logicBlock_alpha();
		}
		me._zoom_out.onmouseout=function (e) {
			me.elementMouseDown['zoom_out']=false;
			me.elementMouseOver['zoom_out']=false;
			me._zoom_out.logicBlock_alpha();
		}
		me._zoom_out.onmousedown=function (e) {
			me.elementMouseDown['zoom_out']=true;
		}
		me._zoom_out.onmouseup=function (e) {
			me.elementMouseDown['zoom_out']=false;
		}
		me._zoom_out.ontouchend=function (e) {
			me.elementMouseDown['zoom_out']=false;
			me.elementMouseOver['zoom_out']=false;
			me._zoom_out.logicBlock_alpha();
		}
		me._zoom_out.ggUpdatePosition=function (useTransition) {
		}
		me._controller.appendChild(me._zoom_out);
		el=me._zoom_in=document.createElement('div');
		els=me._zoom_in__img=document.createElement('img');
		els.className='ggskin ggskin_zoom_in';
		hs='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACUAAAAlCAYAAADFniADAAADLklEQVRYhcXYzW9UVRgG8N9cEkxDpxrcWWVTjZFYLSguxe8/QFmpaKI7FqD4Bxi3REVCE3ShkVB1ocQNsjAEdGvUqF0Yg2z82im2HVJx4cvinJteL53hzpSZeZKT0zvnnvd9+p6P+z5vKyL0iQk8jkdwD27HjZjCMpbwM37AOXyO1b48RETTNhsR70fEUvSHpTzv7qa+Wg0idQsOYw+K/Ns3OQJf4zz+ylGawlbcgfvxBO7Lc/7DJ3gZf2wkUs9GxHL+j1cj4p2I2BER7T7ajjxvNdtZjoi9vfx2G2hFxJHKEpyOiO19kqm3u7KdEkeyn0akWhFxIk+8HBEHNkim3vZnuxERH0TEpjqH9fbUWziADp7GF9fadAPgIXyISRzDvupgndQzWMC/eApfDo'+
			'FQid04ic3Ym/1eRWoaP6ItnZB3h0ioxIvSyV7BdvzG2hGHNzKhUyMiJPs5nf2+Xv5YRmoW30nLtlNmPCLcJt13N2AOi2WkXpGidmJAQq9Jl+fxAeb+Ku2nAgflP7bgyfzCsQGMXg+8nfs92FLgUWlNv5U+pOPAeWkJJ/FYIX3t4cyYCJU4m/uHCyn9gK/GRKZE6f/eAjP54acxkSlR+p9pRcSytKempUusF37BTQM63Ya/e4xPSilNp8iENCA0bHRyP1lYI9Pu8nIV26RErt4O5/FPu4xP6R0lUqTIkbqYH7Y2IDVM3Jz7iwUu5Ic7x0SmROn/QiGpDtg1JjIlHsj994Ukg0g3+zhRXuLnCukm70jqY6brlOFiJvvv4EyBS1IGSC0t7QOvSifs+QHnl35P4lI9n7os6bRR5lO3SjryqnxqER9LkvzQCAmRMs4JSagu'+
			'0j1HfwnvjYDQC5J66pqj/25tbQ9JamOY2G1tVfapbJmi9uICjkqy5yNJnw0DD2b7mzGvIq/QVSEvVBTy/iEo5H+y/YX1pHu3WsKmiJiv6P7P4vrUEk5VbM6vJ9l7kSrbcxGxko2UVZe5PsnMxf+rLivZ7obqU9N4U+/61J/SCWpLX/te9amD0qHqjmtEql7JO16JXFOs5HmzTX01iVQdEzkC9ZpnO0erWvM8a4Ca5xVfQGHC9+5tQwAAAABJRU5ErkJggg==';
		els.setAttribute('src',hs);
		els.ggNormalSrc=hs;
		els.setAttribute('style','position: absolute;top: 0px;left: 0px;width: 100%;height: 100%;-webkit-user-drag:none;pointer-events:none;;');
		els.className='ggskin ggskin_button';
		els['ondragstart']=function() { return false; };
		player.checkLoaded.push(els);
		el.appendChild(els);
		el.ggSubElement = els;
		el.ggId="zoom_in";
		el.ggParameter={ rx:0,ry:0,a:0,sx:1,sy:1 };
		el.ggVisible=true;
		el.className="ggskin ggskin_button ";
		el.ggType='button';
		hs ='';
		hs+='cursor : pointer;';
		hs+='height : 37px;';
		hs+='left : 2px;';
		hs+='opacity : 0.7;';
		hs+='position : absolute;';
		hs+='top : 3px;';
		hs+='visibility : inherit;';
		hs+='width : 37px;';
		hs+='pointer-events:auto;';
		el.setAttribute('style',hs);
		el.style[domTransform + 'Origin']='50% 50%';
		me._zoom_in.ggIsActive=function() {
			if ((this.parentNode) && (this.parentNode.ggIsActive)) {
				return this.parentNode.ggIsActive();
			}
			return false;
		}
		el.ggElementNodeId=function() {
			if ((this.parentNode) && (this.parentNode.ggElementNodeId)) {
				return this.parentNode.ggElementNodeId();
			}
			return player.getCurrentNode();
		}
		me._zoom_in.logicBlock_alpha = function() {
			var newLogicStateAlpha;
			if (
				((me.elementMouseOver['zoom_in'] == true))
			)
			{
				newLogicStateAlpha = 0;
			}
			else {
				newLogicStateAlpha = -1;
			}
			if (me._zoom_in.ggCurrentLogicStateAlpha != newLogicStateAlpha) {
				me._zoom_in.ggCurrentLogicStateAlpha = newLogicStateAlpha;
				me._zoom_in.style[domTransition]='opacity 0s';
				if (me._zoom_in.ggCurrentLogicStateAlpha == 0) {
					me._zoom_in.style.visibility=me._zoom_in.ggVisible?'inherit':'hidden';
					me._zoom_in.style.opacity=1;
				}
				else {
					me._zoom_in.style.visibility=me._zoom_in.ggVisible?'inherit':'hidden';
					me._zoom_in.style.opacity=0.7;
				}
			}
		}
		me._zoom_in.onmouseover=function (e) {
			me.elementMouseOver['zoom_in']=true;
			me._zoom_in.logicBlock_alpha();
		}
		me._zoom_in.onmouseout=function (e) {
			me.elementMouseDown['zoom_in']=false;
			me.elementMouseOver['zoom_in']=false;
			me._zoom_in.logicBlock_alpha();
		}
		me._zoom_in.onmousedown=function (e) {
			me.elementMouseDown['zoom_in']=true;
		}
		me._zoom_in.onmouseup=function (e) {
			me.elementMouseDown['zoom_in']=false;
		}
		me._zoom_in.ontouchend=function (e) {
			me.elementMouseDown['zoom_in']=false;
			me.elementMouseOver['zoom_in']=false;
			me._zoom_in.logicBlock_alpha();
		}
		me._zoom_in.ggUpdatePosition=function (useTransition) {
		}
		me._controller.appendChild(me._zoom_in);
		me.divSkin.appendChild(me._controller);
		player.addListener('sizechanged', function() {
			me.updateSize(me.divSkin);
		});
	};
	this.hotspotProxyClick=function(id, url) {
	}
	this.hotspotProxyDoubleClick=function(id, url) {
	}
	me.hotspotProxyOver=function(id, url) {
	}
	me.hotspotProxyOut=function(id, url) {
	}
	player.addListener('changenode', function() {
		me.ggUserdata=player.userdata;
	});
	me.skinTimerEvent=function() {
		me.ggCurrentTime=new Date().getTime();
		if (me.elementMouseDown['move_right']) {
			player.changePanLog(-1.5,true);
		}
		if (me.elementMouseDown['move_left']) {
			player.changePanLog(1.5,true);
		}
		if (me.elementMouseDown['move_up']) {
			player.changeTiltLog(1,true);
		}
		if (me.elementMouseDown['move_down']) {
			player.changeTiltLog(-1,true);
		}
		if (me.elementMouseDown['zoom_out']) {
			player.changeFovLog(1,true);
		}
		if (me.elementMouseDown['zoom_in']) {
			player.changeFovLog(-1,true);
		}
	};
	player.addListener('timer', me.skinTimerEvent);
	me.addSkin();
	var style = document.createElement('style');
	style.type = 'text/css';
	style.appendChild(document.createTextNode('.ggskin { font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px;}'));
	document.head.appendChild(style);
	me._rectangle_3.logicBlock_visible();
	me._controller2.logicBlock_visible();
	me._controller.logicBlock_visible();
	player.addListener('configloaded', function(args) { me._rectangle_3.logicBlock_visible();me._controller2.logicBlock_visible();me._controller.logicBlock_visible(); });
	me.skinTimerEvent();
};