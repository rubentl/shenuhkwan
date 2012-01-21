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
class Galeria {
	public static inline var baseX:Int = 100;
	public static inline var baseY:Int = 50;
	public static inline var longX:Int = 600;
	public static inline var longY:Int = 500;
	public static var arrObj:Array<Dynamic>;
	public static var canal:flash.media.SoundChannel;
	public static var sonido:flash.media.Sound;
	public static var alarmTimer:flash.utils.Timer;
	public static var emiliClip:flash.display.MovieClip;
	public static var contador:Int = 0;
	
	public static function main() {

		var marco:Sprite = new flash.display.Sprite();
		marco.graphics.beginFill(138823223);
		marco.graphics.drawRect(100, 50, 600, 500);
		var arr1:Array<Int> = [13882323, 7237230, 3750201];
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
		volver.load(new flash.net.URLRequest("../imagenes/metal/volver.png"));
		volver.url = "../index.html";
		volver.scaleX = volver.scaleY -= 0.4;
		
		var metal_menu:Loader = new Loader();
		metal_menu.load(new flash.net.URLRequest("../imagenes/metal/metal_menu.png"));
		metal_menu.scaleX = metal_menu.scaleY -= 0.2;
		var humo:Loader = new Loader();
		var marco0:Array<Dynamic> = [];
		marco0 = marco0.concat([1, 0, 0, 0, 0]);
		marco0 = marco0.concat([0, 1, 0, 0, 0]);
		marco0 = marco0.concat([0, 0, 1, 0, 0]);
		marco0 = marco0.concat([0, 0, 0, 0.5, 0]);
		humo.load(new flash.net.URLRequest("../imagenes/humo.swf"));
		humo.filters = [new flash.filters.ColorMatrixFilter(marco0)];
		humo.name = "humoLoader";
		
        emiliClip = flash.Lib.attach("patada");
        emiliClip.name = "emiliClip";
        emiliClip.scaleX = emiliClip.scaleY -= 0.15;
        emiliClip.stop();
		alarmTimer = new flash.utils.Timer(5000, 0);
		alarmTimer.addEventListener(flash.events.TimerEvent.TIMER, onAlarm);
        alarmTimer.start();
		
		var videos:Loader = new Loader();
		videos.load(new flash.net.URLRequest("../imagenes/metal/videos.png"));
		videos.url = "metal/videos.html";
		videos.scaleX = videos.scaleY -= 0.25;
		
		var fotos:Loader = new Loader();
		fotos.load(new flash.net.URLRequest("../imagenes/metal/fotos.png"));
		fotos.url = "metal/fotos.html";
		fotos.scaleX = fotos.scaleY -= 0.25;
		
        var articulos:Loader = new Loader();
		articulos.load(new flash.net.URLRequest("../imagenes/metal/articulos.png"));
		articulos.url = "metal/articulos.html";
		articulos.scaleX = articulos.scaleY -= 0.25;
		
		var descargas:Loader = new Loader();
		descargas.load(new flash.net.URLRequest("../imagenes/metal/descargas.png"));
		descargas.url = "metal/descargas.html";
		descargas.scaleX = descargas.scaleY -= 0.25;

        volver.x = volver.origX = 650;
		volver.y = volver.origY = 70;
		emiliClip.x = emiliClip.origX = 170;
		emiliClip.y = emiliClip.origY = 180;
		humo.x = humo.origX = 240;
		humo.y = humo.origY = 150;
		metal_menu.x = metal_menu.origX = 250;
		metal_menu.y = metal_menu.origY = 50;
		videos.x = videos.origX = 190;
		videos.y = videos.origY= 130;
		fotos.x = fotos.origX = 200;
		fotos.y = fotos.origY = 450;
		descargas.x = descargas.origX = 400;
		descargas.y = descargas.origY = 430;
		articulos.x = articulos.origX = 440;
		articulos.y = articulos.origY = 150;
		volver.profun = 15;
		metal_menu.profun = 25;
		humo.profun = 25;
		emiliClip.profun = 35;
		videos.profun = 55;
		descargas.profun = 70;
		fotos.profun = 75;
        articulos.profun = 60;
		arrObj = [metal_menu, volver, humo, emiliClip, videos, fotos, descargas,articulos];
		for (i in 0...arrObj.length){
			marco.addChild(arrObj[i]);
			arrObj[i].addEventListener(flash.events.Event.ENTER_FRAME, movimiento);
		}
		videos.addEventListener(flash.events.MouseEvent.ROLL_OVER, mouseOVER);
		videos.addEventListener(flash.events.MouseEvent.ROLL_OUT, mouseOUT);
		videos.addEventListener(flash.events.MouseEvent.CLICK, mouseCLICK);
		fotos.addEventListener(flash.events.MouseEvent.ROLL_OVER, mouseOVER);
		fotos.addEventListener(flash.events.MouseEvent.ROLL_OUT, mouseOUT);
		fotos.addEventListener(flash.events.MouseEvent.CLICK, mouseCLICK);
		descargas.addEventListener(flash.events.MouseEvent.ROLL_OVER, mouseOVER);
		descargas.addEventListener(flash.events.MouseEvent.ROLL_OUT, mouseOUT);
		descargas.addEventListener(flash.events.MouseEvent.CLICK, mouseCLICK);
		articulos.addEventListener(flash.events.MouseEvent.ROLL_OVER, mouseOVER);
		articulos.addEventListener(flash.events.MouseEvent.ROLL_OUT, mouseOUT);
		articulos.addEventListener(flash.events.MouseEvent.CLICK, mouseCLICK);
		volver.addEventListener(flash.events.MouseEvent.ROLL_OVER, mouseOVER);
		volver.addEventListener(flash.events.MouseEvent.ROLL_OUT, mouseOUT);
		volver.addEventListener(flash.events.MouseEvent.CLICK, mouseCLICK);
		
		var archivo:URLRequest = new flash.net.URLRequest("../audio/metal.mp3");
		sonido = new flash.media.Sound(archivo);
		canal = sonido.play(0, 10);
		}

		public static function onAlarm(arg1:flash.events.TimerEvent) {
			emiliClip.play();
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
		    if (arg1.target.name == "emiliClip"){
				if (emiliClip.currentFrame == 1){
					emiliClip.stop();
				}
				//if (contador == 5){
				//	emiliClip.nextFrame();
				//	contador = 0;
				//}
				//contador = (contador + 1);
			}
		}
		public static function mouseOVER(arg1:flash.events.Event){
			arg1.currentTarget.filters = [new flash.filters.GlowFilter(13882323, 1, 30, 30)];
		}

		public static function mouseOUT(arg1:flash.events.Event){
			arg1.currentTarget.filters = [];
		}

		public static function mouseCLICK(arg1:flash.events.Event){
			canal.stop();
			flash.Lib.getURL(new flash.net.URLRequest(arg1.currentTarget.url), "_self");
		}

	}
