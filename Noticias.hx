package;

import flash.display.Loader;
import flash.display.Sprite;
//import flash.events.*;
//import flash.filters.*;
import flash.geom.Matrix;
import flash.media.Sound;
import flash.net.URLRequest;
//import flash.utils.*;
class Loader extends flash.display.Loader {
	public var url:String;
	public var origX:Int;
	public var origY:Int;
	public var profun:Int;
} 
class Noticias {
	public static inline var baseX:Int = 100;
	public static inline var baseY:Int = 50;
	public static inline var longX:Int = 600;
	public static inline var longY:Int = 500;
	public static var arrObj:Array<Dynamic>;
	public static var canal:flash.media.SoundChannel;
	public static var sonido:flash.media.Sound;
	//public static var alarmTimer:flash.utils.Timer;
	//public static var tigreClip:flash.display.MovieClip;
	public static var contador:Int = 0;
	
	public static function main() {

		var marco:Sprite = new flash.display.Sprite();
		marco.graphics.beginFill(29928);
		marco.graphics.drawRect(100, 50, 600, 500);
		var arr1:Array<Int> = [29928, 541047, 2494282];
		var arr2:Array<Int> = [1, 1, 1];
		var arr3:Array<Int> = [0, 100, 150];
		var matriz:Matrix = new flash.geom.Matrix();
		matriz.createGradientBox(598, 498, Math.PI / 2, 100, 50);
		marco.graphics.beginGradientFill(flash.display.GradientType.RADIAL, arr1, arr2, arr3, matriz, 
			flash.display.SpreadMethod.PAD, flash.display.InterpolationMethod.LINEAR_RGB);
		marco.graphics.drawRect(101, 51, 598, 498);
		marco.graphics.endFill();
		flash.Lib.current.addChild(marco);
		
		var volver:Loader = new Loader();
		volver.load(new flash.net.URLRequest("../imagenes/agua/volver.png"));
		volver.url = "../index.html";
		volver.scaleX = volver.scaleY -= 0.4;
		
		var agua_menu:Loader = new Loader();
		agua_menu.load(new flash.net.URLRequest("../imagenes/agua/agua_menu.png"));
		agua_menu.scaleX = agua_menu.scaleY -= 0.2;
		var humo:Loader = new Loader();
		var marco0:Array<Dynamic> = [];
		marco0 = marco0.concat([0.7, 0, 0, 0, 0]);
		marco0 = marco0.concat([0, 0.7, 0, 0, 0]);
		marco0 = marco0.concat([0, 0, 1, 0, 0]);
		marco0 = marco0.concat([0, 0, 0, 0.5, 0]);
		humo.load(new flash.net.URLRequest("../imagenes/humo.swf"));
		humo.filters = [new flash.filters.ColorMatrixFilter(marco0)];
		humo.name = "humoLoader";
		
		var tigre:Loader = new Loader();
		tigre.load(new flash.net.URLRequest("../imagenes/agua/tigre.swf"));
		tigre.scaleX = tigre.scaleY -= 0.25;
			//tigreClip.stop();
		tigre.name = "tigreLoader";
			//alarmTimer = new flash.utils.Timer(5000, 0);
			//alarmTimer.addEventListener(flash.events.TimerEvent.TIMER, onAlarm);
			//alarmTimer.start();
		
		var eventos:Loader = new Loader();
		eventos.load(new flash.net.URLRequest("../imagenes/agua/eventos.png"));
		eventos.url = "agua/eventos.html";
		eventos.scaleX = eventos.scaleY -= 0.25;
		
		var contacto:Loader = new Loader();
		contacto.load(new flash.net.URLRequest("../imagenes/agua/contacto.png"));
		contacto.url = "agua/contacto.html";
		contacto.scaleX = contacto.scaleY -= 0.25;
		
		var enlaces:Loader = new Loader();
		enlaces.load(new flash.net.URLRequest("../imagenes/agua/enlaces.png"));
		enlaces.url = "agua/enlaces.html";
		enlaces.scaleX = enlaces.scaleY -= 0.25;
		volver.x = volver.origX = 650;
		volver.y = volver.origY = 70;
		tigre.x = tigre.origX = 260;
		tigre.y = tigre.origY = 220;
		humo.x = humo.origX = 240;
		humo.y = humo.origY = 150;
		agua_menu.x = agua_menu.origX = 250;
		agua_menu.y = agua_menu.origY = 50;
		eventos.x = eventos.origX = 130;
		eventos.y = eventos.origY= 130;
		contacto.x = contacto.origX = 200;
		contacto.y = contacto.origY = 450;
		enlaces.x = enlaces.origX = 500;
		enlaces.y = enlaces.origY = 150;
		volver.profun = 15;
		agua_menu.profun = 25;
		humo.profun = 25;
		tigre.profun = 35;
		eventos.profun = 55;
		enlaces.profun = 60;
		contacto.profun = 75;
		arrObj = [agua_menu, volver, humo, tigre, eventos, contacto, enlaces];
		for (i in 0...arrObj.length){
			marco.addChild(arrObj[i]);
			Noticias.arrObj[i].addEventListener(flash.events.Event.ENTER_FRAME, movimiento);
		}
		eventos.addEventListener(flash.events.MouseEvent.ROLL_OVER, mouseOVER);
		eventos.addEventListener(flash.events.MouseEvent.ROLL_OUT, mouseOUT);
		eventos.addEventListener(flash.events.MouseEvent.CLICK, mouseCLICK);
		contacto.addEventListener(flash.events.MouseEvent.ROLL_OVER, mouseOVER);
		contacto.addEventListener(flash.events.MouseEvent.ROLL_OUT, mouseOUT);
		contacto.addEventListener(flash.events.MouseEvent.CLICK, mouseCLICK);
		enlaces.addEventListener(flash.events.MouseEvent.ROLL_OVER, mouseOVER);
		enlaces.addEventListener(flash.events.MouseEvent.ROLL_OUT, mouseOUT);
		enlaces.addEventListener(flash.events.MouseEvent.CLICK, mouseCLICK);
		volver.addEventListener(flash.events.MouseEvent.ROLL_OVER, mouseOVER);
		volver.addEventListener(flash.events.MouseEvent.ROLL_OUT, mouseOUT);
		volver.addEventListener(flash.events.MouseEvent.CLICK, mouseCLICK);
		
		var archivo:URLRequest = new flash.net.URLRequest("../audio/agua.mp3");
		sonido = new flash.media.Sound(archivo);
		canal = sonido.play(0, 10);
		}

		//public static function onAlarm(arg1:flash.events.TimerEvent) {
		//	tigreClip.play();
		//}

		public static function movimiento(arg1:flash.events.Event){
		var ratonX:Float;
		ratonX = (flash.Lib.current.stage.stageWidth / 2 - flash.Lib.current.stage.mouseX) / 
			(flash.Lib.current.stage.stageWidth / 2);
		var ratonY:Float;
		ratonY = (flash.Lib.current.stage.stageHeight / 2 - flash.Lib.current.stage.mouseY) / 
			(flash.Lib.current.stage.stageHeight / 2);
		var destX:Float;
		destX = arg1.target.origX + ratonX * arg1.target.profun;
		var destY:Float;
		destY = arg1.target.origY + ratonY * arg1.target.profun;
		var tmpX:Float;
		tmpX = arg1.target.x + (destX - arg1.target.x) / 8;
		var tmpY:Float;
		tmpY = arg1.target.y + (destY - arg1.target.y) / 8;
		if (tmpX >= baseX && tmpY >= baseY && (tmpX <= (baseX + (longX - arg1.target.width)))
			&& (tmpY <= (baseY + (longY - arg1.target.height)))){
			arg1.target.x = tmpX;
			arg1.target.y = tmpY;
		}
		//if (arg1.target.name == "tigreClip"){
				//if (tigreClip.currentFrame == 1){
				//	tigreClip.stop();
				//}
				//if (contador == 5){
				//	tigreClip.nextFrame();
				//	contador = 0;
				//}
				//contador = (contador + 1);
			//}
		}
		public static function mouseOVER(arg1:flash.events.Event){
			arg1.currentTarget.filters = [new flash.filters.GlowFilter(29928, 1, 30, 30)];
		}

		public static function mouseOUT(arg1:flash.events.Event){
			arg1.currentTarget.filters = [];
		}

		public static function mouseCLICK(arg1:flash.events.Event){
			Noticias.canal.stop();
			flash.Lib.getURL(new flash.net.URLRequest(arg1.currentTarget.url), "_self");
		}

	}



