package;

import flash.display.Loader;
import flash.display.Sprite;
import flash.geom.Matrix;
import flash.media.Sound;
import flash.net.URLRequest;


class Ethnocen extends flash.text.Font{public function new(){super();}} 
class Volver extends Bitmap{public function new(){super();}} 
class Tierra_menu extends Bitmap{public function new(){super();}}
class Clip_humo extends MovieClip{public function new(){super();}}

class MiSprite extends flash.display.Sprite {
	public var url:String;
	public var origX:Int;
	public var origY:Int;
	public var profun:Int;
} 
class dondeestamos {
	public static inline var baseX:Int = 100;
	public static inline var baseY:Int = 50;
	public static inline var longX:Int = 600;
	public static inline var longY:Int = 500;
	public static var arrObj:Array<Dynamic>;
	public static var canal:flash.media.SoundChannel;
	public static var sonido:flash.media.Sound;
	public static var alarmTimer:flash.utils.Timer;
	public static var controlClip:flash.display.MovieClip;
	public static var contador:Int = 0;
	
	public static function main() {

		var marco:Sprite = new flash.display.Sprite();
		marco.graphics.beginFill(16759388);
		marco.graphics.drawRect(100, 50, 600, 500);
		var arr1:Array<Int> = [16759388, 10773000, 5714948];
		var arr2:Array<Int> = [1, 1, 1];
		var arr3:Array<Int> = [0, 100, 150];
		var matriz:Matrix = new flash.geom.Matrix();
		matriz.createGradientBox(598, 498, Math.PI / 2, 100, 50);
		marco.graphics.beginGradientFill(flash.display.GradientType.RADIAL, arr1, arr2, arr3, matriz, 
			flash.display.SpreadMethod.PAD, flash.display.InterpolationMethod.LINEAR_RGB);
		marco.graphics.drawRect(101, 51, 598, 498);
		marco.graphics.endFill();
		flash.Lib.current.addChild(marco);
		
		var volver:MiSprite = new MiSprite();
        var bitmap1 = new Volver();
        volver.addChild(bitmap1);
		volver.url = "../index.html";
		volver.scaleX = volver.scaleY -= 0.4;
		
        var tierra_menu:MiSprite = new MiSprite();
        var bitmap2 = new Tierra_menu();
        tierra_menu.addChild(bitmap2);
		tierra_menu.scaleX = tierra_menu.scaleY += 0.2;
		var humo:Clip_humo = new Clip_humo();
		var marco0:Array<Dynamic> = [];
		marco0 = marco0.concat([0.9, 0, 0, 0, 0]);
		marco0 = marco0.concat([0, 0.7, 0, 0, 0]);
		marco0 = marco0.concat([0, 0, 0.3, 0, 0]);
		marco0 = marco0.concat([0, 0, 0, 0.5, 0]);
		humo.filters = [new flash.filters.ColorMatrixFilter(marco0)];
		humo.name = "humoLoader";
		
        controlClip = flash.Lib.attach("Clip_tierra");
        controlClip.name = "controlClip";
        controlClip.scaleX = controlClip.scaleY -= 0.1;
        controlClip.stop();
		alarmTimer = new flash.utils.Timer(10000, 0);
		alarmTimer.addEventListener(flash.events.TimerEvent.TIMER, onAlarm);
        alarmTimer.start();
		
		var dondeestamos:Texto = new Texto("Dónde estamos",120,130,55,0xffffff,18);
		dondeestamos.url = "tierra/dondeestamos.html";
		
		var centros:Texto = new Texto("Centros registrados",360,460,65,0xffffff,18);
		centros.url = "tierra/centros.html";
		
		var inscripcion:Texto = new Texto("Inscripcion Shen Uh Kwan",260,60,75,0xffffff,18);
		centros.url = "tierra/inscripcion.html";
		
        volver.x = volver.origX = 650;
		volver.y = volver.origY = 70;
		controlClip.x = controlClip.origX = 250;
		controlClip.y = controlClip.origY = 180;
		humo.x = humo.origX = 240;
		humo.y = humo.origY = 150;
		tierra_menu.x = tierra_menu.origX = 190;
		tierra_menu.y = tierra_menu.origY = 20;
		volver.profun = 15;
		tierra_menu.profun = 25;
		humo.profun = 25;
		controlClip.profun = 40;
		arrObj = [tierra_menu, humo, controlClip, dondeestamos, centros, inscripcion, volver];
		for (i in 0...arrObj.length){
			marco.addChild(arrObj[i]);
			arrObj[i].addEventListener(flash.events.Event.ENTER_FRAME, movimiento);
		}
        for (i in 3...arrObj.length){
		    arrObj[i].addEventListener(flash.events.MouseEvent.ROLL_OVER, mouseOVER);
		    arrObj[i].addEventListener(flash.events.MouseEvent.ROLL_OUT, mouseOUT);
		    arrObj[i].addEventListener(flash.events.MouseEvent.CLICK, mouseCLICK);
        }
		
		var archivo:URLRequest = new flash.net.URLRequest("../audio/tierra.mp3");
		sonido = new flash.media.Sound(archivo);
		canal = sonido.play(0, 10);
		}

		public static function onAlarm(arg1:flash.events.TimerEvent) {
			controlClip.play();
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
		    if (arg1.target.name == "controlClip"){
				if (controlClip.currentFrame == 1){
					controlClip.stop();
				}
				if (contador == 5){
					controlClip.nextFrame();
					contador = 0;
				}
				contador = (contador + 1);
			}
		}
		public static function mouseOVER(arg1:flash.events.Event){
			arg1.currentTarget.filters = [new flash.filters.GlowFilter(15443011, 1, 30, 30)];
		}

		public static function mouseOUT(arg1:flash.events.Event){
			arg1.currentTarget.filters = [];
		}

		public static function mouseCLICK(arg1:flash.events.Event){
			canal.stop();
			flash.Lib.getURL(new flash.net.URLRequest(arg1.currentTarget.url), "_self");
		}

	}
