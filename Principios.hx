package;

import flash.display.Loader;
import flash.display.Sprite;
import flash.geom.Matrix;
import flash.media.Sound;
import flash.net.URLRequest;

class Loader extends flash.display.Loader {
	public var url:String;
	public var origX:Int;
	public var origY:Int;
	public var profun:Int;
} 
class Principios {
	public static inline var baseX:Int = 100;
	public static inline var baseY:Int = 50;
	public static inline var longX:Int = 600;
	public static inline var longY:Int = 500;
	public static var arrObj:Array<Dynamic>;
	public static var canal:flash.media.SoundChannel;
	public static var sonido:flash.media.Sound;
	public static var alarmTimer:flash.utils.Timer;
	public static var patadaClip:flash.display.MovieClip;
	public static var contador:Int = 0;

	public static function main() {

		var marco:Sprite = new flash.display.Sprite();
		marco.graphics.beginFill(16711680);
		marco.graphics.drawRect(100, 50, 600, 500);
		var arr1:Array<Int> = [16711680, 5570560, 3342336];
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
		volver.load(new flash.net.URLRequest("../imagenes/fuego/volver.png"));
		volver.url = "../index.html";
		volver.scaleX = volver.scaleY -= 0.4;

		var fuego_menu:Loader = new Loader();
		fuego_menu.load(new flash.net.URLRequest("../imagenes/fuego/fuego_menu.png"));
		fuego_menu.scaleX = fuego_menu.scaleY += 0.1;
		var humo:Loader = new Loader();
		var marco0:Array<Dynamic> = [];
		marco0 = marco0.concat([1, 0, 0, 0, 0]);
		marco0 = marco0.concat([0, 0.3, 0, 0, 0]);
		marco0 = marco0.concat([0, 0, 0.3, 0, 0]);
		marco0 = marco0.concat([0, 0, 0, 0.5, 0]);
		humo.load(new flash.net.URLRequest("../imagenes/humo.swf"));
		humo.filters = [new flash.filters.ColorMatrixFilter(marco0)];
		humo.name = "humoLoader";

		patadaClip = flash.Lib.attach("patada");
		patadaClip.name = "patadaClip";
		patadaClip.scaleX = patadaClip.scaleY -= 0.3;
		patadaClip.stop();
		var marco1:Array<Dynamic> = [];
		marco1 = marco1.concat([1, 0, 0, 0, 0]);
		marco1 = marco1.concat([0, -0.5, 0, 0, 0]);
		marco1 = marco1.concat([0, 0, -0.5, 0, 0]);
		marco1 = marco1.concat([0, 0, 0, 1, 0]);
		patadaClip.filters = [new flash.filters.ColorMatrixFilter(marco1)];
		alarmTimer = new flash.utils.Timer(10000, 0);
		alarmTimer.addEventListener(flash.events.TimerEvent.TIMER, onAlarm);
		alarmTimer.start();

		var prinhapkido:Loader = new Loader();
		prinhapkido.load(new flash.net.URLRequest("../imagenes/fuego/principioshapkido.png"));
		prinhapkido.url = "fuego/principioshapkido.html";
		prinhapkido.scaleX = prinhapkido.scaleY -= 0.25;

		var prinshenuhkwan:Loader = new Loader();
		prinshenuhkwan.load(new flash.net.URLRequest("../imagenes/fuego/principiosshenuhkwan.png"));
		prinshenuhkwan.url = "fuego/principiosshenuhkwan.html";
		prinshenuhkwan.scaleX = prinshenuhkwan.scaleY -= 0.25;

		var historia:Loader = new Loader();
		historia.load(new flash.net.URLRequest("../imagenes/fuego/historia.png"));
		historia.url = "fuego/historia.html";
		historia.scaleX = historia.scaleY -= 0.25;

		var grados:Loader = new Loader();
		grados.load(new flash.net.URLRequest("../imagenes/fuego/grados.png"));
		grados.url = "fuego/grados.html";
		grados.scaleX = grados.scaleY -= 0.25;

		var naegongki:Loader = new Loader();
		naegongki.load(new flash.net.URLRequest("../imagenes/fuego/naegongki.png"));
		naegongki.url = "fuego/naegongki.html";
		naegongki.scaleX = naegongki.scaleY -= 0.25;

		volver.x = volver.origX = 650;
		volver.y = volver.origY = 70;
		patadaClip.x = patadaClip.origX = 290;
		patadaClip.y = patadaClip.origY = 190;
		humo.x = humo.origX = 240;
		humo.y = humo.origY = 230;
		fuego_menu.x = fuego_menu.origX = 220;
		fuego_menu.y = fuego_menu.origY = 50;
		prinhapkido.x = prinhapkido.origX = 120;
		prinhapkido.y = prinhapkido.origY= 130;
		prinshenuhkwan.x = prinshenuhkwan.origX = 320;
		prinshenuhkwan.y = prinshenuhkwan.origY = 450;
		historia.x = historia.origX = 150;
		historia.y = historia.origY = 350;
		grados.x = grados.origX = 420;
		grados.y = grados.origY =  60;
		naegongki.x = naegongki.origX = 520;
		naegongki.y = naegongki.origY = 250;
		volver.profun = 15;
		fuego_menu.profun = 25;
		humo.profun = 25;
		patadaClip.profun = 40;
		prinhapkido.profun = 65;
		historia.profun = 65;
		prinshenuhkwan.profun = 65;
		grados.profun = 65;
		naegongki.profun = 65;
		arrObj = [fuego_menu, volver, humo, patadaClip, prinhapkido, prinshenuhkwan, historia, grados, naegongki];
		for (i in 0...arrObj.length){
			marco.addChild(arrObj[i]);
			arrObj[i].addEventListener(flash.events.Event.ENTER_FRAME, movimiento);
		}
		prinhapkido.addEventListener(flash.events.MouseEvent.ROLL_OVER, mouseOVER);
		prinhapkido.addEventListener(flash.events.MouseEvent.ROLL_OUT, mouseOUT);
		prinhapkido.addEventListener(flash.events.MouseEvent.CLICK, mouseCLICK);
		prinshenuhkwan.addEventListener(flash.events.MouseEvent.ROLL_OVER, mouseOVER);
		prinshenuhkwan.addEventListener(flash.events.MouseEvent.ROLL_OUT, mouseOUT);
		prinshenuhkwan.addEventListener(flash.events.MouseEvent.CLICK, mouseCLICK);
		historia.addEventListener(flash.events.MouseEvent.ROLL_OVER, mouseOVER);
		historia.addEventListener(flash.events.MouseEvent.ROLL_OUT, mouseOUT);
		historia.addEventListener(flash.events.MouseEvent.CLICK, mouseCLICK);
		grados.addEventListener(flash.events.MouseEvent.ROLL_OVER, Principios.mouseOVER);
		grados.addEventListener(flash.events.MouseEvent.ROLL_OUT, Principios.mouseOUT);
		grados.addEventListener(flash.events.MouseEvent.CLICK, Principios.mouseCLICK);
		naegongki.addEventListener(flash.events.MouseEvent.ROLL_OVER, Principios.mouseOVER);
		naegongki.addEventListener(flash.events.MouseEvent.ROLL_OUT, Principios.mouseOUT);
		naegongki.addEventListener(flash.events.MouseEvent.CLICK, Principios.mouseCLICK);
		volver.addEventListener(flash.events.MouseEvent.ROLL_OVER, mouseOVER);
		volver.addEventListener(flash.events.MouseEvent.ROLL_OUT, mouseOUT);
		volver.addEventListener(flash.events.MouseEvent.CLICK, mouseCLICK);

		var archivo:URLRequest = new flash.net.URLRequest("../audio/fuego.mp3");
		sonido = new flash.media.Sound(archivo);
		canal = sonido.play(0, 10);
	}

	public static function onAlarm(arg1:flash.events.TimerEvent) {
		patadaClip.play();
	}

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
		if (arg1.target.name == "patadaClip"){
			if (patadaClip.currentFrame == 1){
				patadaClip.stop();
			}
			if (contador == 5){
				patadaClip.nextFrame();
				contador = 0;
			}
			contador = (contador + 1);
		}
	}
	public static function mouseOVER(arg1:flash.events.Event){
		arg1.currentTarget.filters = [new flash.filters.GlowFilter(16711680, 1, 30, 30)];
	}

	public static function mouseOUT(arg1:flash.events.Event){
		arg1.currentTarget.filters = [];
	}

	public static function mouseCLICK(arg1:flash.events.Event){
		canal.stop();
		flash.Lib.getURL(new flash.net.URLRequest(arg1.currentTarget.url), "_self");
	}

}
