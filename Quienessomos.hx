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
class Quienessomos {
	public static inline var baseX:Int = 100;
	public static inline var baseY:Int = 50;
	public static inline var longX:Int = 600;
	public static inline var longY:Int = 500;
	public static var arrObj:Array<Dynamic>;
	public static var canal:flash.media.SoundChannel;
	public static var sonido:flash.media.Sound;
	public static var alarmTimer:flash.utils.Timer;
	public static var manuClip:flash.display.MovieClip;
	public static var contador:Int = 0;
	
	public static function main() {

		var marco:Sprite = new flash.display.Sprite();
		marco.graphics.beginFill(65280);
		marco.graphics.drawRect(100, 50, 600, 500);
		var arr1:Array<Int> = [65280, 21760, 13056];
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
		volver.load(new flash.net.URLRequest("../imagenes/madera/volver.png"));
		volver.url = "../index.html";
		volver.scaleX = volver.scaleY -= 0.4;
		
		var madera_menu:Loader = new Loader();
		madera_menu.load(new flash.net.URLRequest("../imagenes/madera/madera_menu.png"));
		madera_menu.scaleX = madera_menu.scaleY -= 0.3;
		var humo:Loader = new Loader();
		var marco0:Array<Dynamic> = [];
		marco0 = marco0.concat([0.3, 0, 0, 0, 0]);
		marco0 = marco0.concat([0, 1, 0, 0, 0]);
		marco0 = marco0.concat([0, 0, 0.3, 0, 0]);
		marco0 = marco0.concat([0, 0, 0, 0.5, 0]);
		humo.load(new flash.net.URLRequest("../imagenes/humo.swf"));
		humo.filters = [new flash.filters.ColorMatrixFilter(marco0)];
		humo.name = "humoLoader";

		manuClip = flash.Lib.attach("manu");
		manuClip.name = "manuClip";
		manuClip.scaleX = manuClip.scaleY -= 0.2;
		manuClip.stop();
		alarmTimer = new flash.utils.Timer(5000, 0);
		alarmTimer.addEventListener(flash.events.TimerEvent.TIMER, onAlarm);
		alarmTimer.start();

		var asociacion:Loader = new Loader();
		asociacion.load(new flash.net.URLRequest("../imagenes/madera/asociacion.png"));
		asociacion.url = "madera/asociacion.html";
		asociacion.scaleX = asociacion.scaleY -= 0.3;

		var fundadores:Loader = new Loader();
		fundadores.load(new flash.net.URLRequest("../imagenes/madera/fundadores.png"));
		fundadores.url = "madera/fundadores.html";
		fundadores.scaleX = fundadores.scaleY -= 0.25;

		var preguntas:Loader = new Loader();
		preguntas.load(new flash.net.URLRequest("../imagenes/madera/preguntas.png"));
		preguntas.url = "madera/preguntas.html";
		preguntas.scaleX = preguntas.scaleY -= 0.25;
		
		var escudo:Loader = new Loader();
		escudo.load(new flash.net.URLRequest("../imagenes/madera/escudo.png"));
		escudo.url = "madera/escudo.html";
		escudo.scaleX = escudo.scaleY -= 0.25;
		volver.x = volver.origX = 650;
		volver.y = volver.origY = 70;
		manuClip.x = manuClip.origX = 290;
		manuClip.y = manuClip.origY = 200;
		humo.x = humo.origX = 300;
		humo.y = humo.origY = 250;
		madera_menu.x = madera_menu.origX = 190;
		madera_menu.y = madera_menu.origY = 50;
		asociacion.x = asociacion.origX = 120;
		asociacion.y = asociacion.origY= 130;
		preguntas.x = preguntas.origX = 120;
		preguntas.y = preguntas.origY = 250;
		fundadores.x = fundadores.origX = 320;
		fundadores.y = fundadores.origY = 450;
		escudo.x = escudo.origX = 500;
		escudo.y = escudo.origY = 250;
		volver.profun = 15;
		madera_menu.profun = 25;
		humo.profun = 25;
		manuClip.profun = 40;
		asociacion.profun = 50;
		escudo.profun = 58;
		preguntas.profun = 60;
		fundadores.profun = 65;
		arrObj = [madera_menu, volver, humo, manuClip, asociacion, fundadores, escudo, preguntas];
		for (i in 0...arrObj.length){
		    marco.addChild(arrObj[i]);
		    arrObj[i].addEventListener(flash.events.Event.ENTER_FRAME, movimiento);
		}
		asociacion.addEventListener(flash.events.MouseEvent.ROLL_OVER, mouseOVER);
		asociacion.addEventListener(flash.events.MouseEvent.ROLL_OUT, mouseOUT);
		asociacion.addEventListener(flash.events.MouseEvent.CLICK, mouseCLICK);
		fundadores.addEventListener(flash.events.MouseEvent.ROLL_OVER, mouseOVER);
		fundadores.addEventListener(flash.events.MouseEvent.ROLL_OUT, mouseOUT);
		fundadores.addEventListener(flash.events.MouseEvent.CLICK, mouseCLICK);
		preguntas.addEventListener(flash.events.MouseEvent.ROLL_OVER, mouseOVER);
		preguntas.addEventListener(flash.events.MouseEvent.ROLL_OUT, mouseOUT);
		preguntas.addEventListener(flash.events.MouseEvent.CLICK, mouseCLICK);
		escudo.addEventListener(flash.events.MouseEvent.ROLL_OVER, mouseOVER);
		escudo.addEventListener(flash.events.MouseEvent.ROLL_OUT, mouseOUT);
		escudo.addEventListener(flash.events.MouseEvent.CLICK, mouseCLICK);
		volver.addEventListener(flash.events.MouseEvent.ROLL_OVER, mouseOVER);
		volver.addEventListener(flash.events.MouseEvent.ROLL_OUT, mouseOUT);
		volver.addEventListener(flash.events.MouseEvent.CLICK, mouseCLICK);

		var archivo:URLRequest = new flash.net.URLRequest("../audio/madera.mp3");
		sonido = new flash.media.Sound(archivo);
		canal = sonido.play(0, 10);
	}

	public static function onAlarm(arg1:flash.events.TimerEvent) {
	    manuClip.play();
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
	    if (arg1.target.name == "manuClip"){
		if (manuClip.currentFrame == 1){
		    manuClip.stop();
		}
		if (contador == 5){
		    manuClip.nextFrame();
		    contador = 0;
		}
		contador = (contador + 1);
	    }
	}
	public static function mouseOVER(arg1:flash.events.Event){
	    arg1.currentTarget.filters = [new flash.filters.GlowFilter(65280, 1, 30, 30)];
	}

	public static function mouseOUT(arg1:flash.events.Event){
	    arg1.currentTarget.filters = [];
	}

	public static function mouseCLICK(arg1:flash.events.Event){
	    canal.stop();
	    flash.Lib.getURL(new flash.net.URLRequest(arg1.currentTarget.url), "_self");
	}

}
