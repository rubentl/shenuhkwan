package;

import flash.display.Loader;
import flash.display.Sprite;
import flash.display.Bitmap;
import flash.display.MovieClip;
import flash.geom.Matrix;
import flash.media.Sound;
import flash.net.URLRequest;

class Ethnocen extends flash.text.Font{public function new(){super();}} 
class Volver extends Bitmap{public function new(){super();}} 
class Metal_menu extends Bitmap{public function new(){super();}}
class Clip_humo extends MovieClip{public function new(){super();}}

class MiSprite extends flash.display.Sprite {
	public var url:String;
	public var origX:Int;
	public var origY:Int;
	public var profun:Int;
} 

class Texto extends flash.text.TextField{
	public var url:String;
	public var origX:Int;
	public var origY:Int;
	public var profun:Int;
    public function new(_txt:String,_x:Int,_y:Int,_profun:Int,_col:Int,_tam:Int){
        super();
        var format: flash.text.TextFormat = new flash.text.TextFormat();
        format.font = "Ethnocen";
        format.color = _col;
        format.size = _tam;
        embedFonts = true;
        autoSize = flash.text.TextFieldAutoSize.RIGHT;
        defaultTextFormat = format;
        text = _txt;
        x = origX = _x;
        y = origY = _y;
        profun = _profun;
    }
}

//Clases para el campo de estrellas
class Start extends flash.display.Sprite{
    private var d:Float;
    private var r:Float;
    private var stageCenter:flash.geom.Point;
    private var speed:Float;
    private static inline var acceleration:Float = 1.025;
    public function new(){
        super();
        this.alpha=0;
        init();
        addEventListener(flash.events.Event.ADDED_TO_STAGE, onAddedToStage);
    }
    private function onAddedToStage(e:flash.events.Event){
        removeEventListener(flash.events.Event.ADDED_TO_STAGE, onAddedToStage);
        addEventListener(flash.events.Event.ENTER_FRAME, update);
        stageCenter = new flash.geom.Point(flash.Lib.current.stage.stageWidth / 2, 
                flash.Lib.current.stage.stageHeight / 2);
    }
    private function update(e:flash.events.Event){
        d*= acceleration + (speed*0.25); 
        alpha= d/500; // fades in the stars as they get closer.
        x = stageCenter.x + Math.cos(r) * d/2;
        y = stageCenter.y + Math.sin(r) * d / 2;
        // loop star when it goes off the stage.
        if (x > stageCenter.x *2 || x < 0 || y > stageCenter.y *2 || y < 0) {
            init();
        }
    }		
    private function init(){
        // init values;
        r = Math.random() * 6;
        d = Math.random() * 150;
        speed = Math.random() * 0.0510;
        // draw circle
        this.graphics.clear();
        this.graphics.beginFill(0xFFFFFF);
        this.graphics.drawCircle(0, 0, speed*40);			
    }
}

class Universo extends flash.display.Sprite{
    static var padre:Sprite;
    public function new(_padre:Sprite){
        super();
        name = "universo";
        x = 800 / 2;
        y = 600 / 2;
        padre = _padre;
        addEventListener(flash.events.Event.ENTER_FRAME,update);
    }
    public function update(e:flash.events.Event){
        if (padre.numChildren < 400){
            var s:Start = new Start();
            s.x = Math.random()*1000;
            s.y = Math.random()*650;
            padre.addChild(s);
        } else {
            removeEventListener(flash.events.Event.ENTER_FRAME, update);
        }
    }
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
	public static var metalClip:flash.display.MovieClip;
	public static var contador:Int = 0;
	
	public static function main() {

        var fondo:Sprite = new Sprite();
        fondo.x = 0;
        fondo.y = 0;
        var univer:Universo = new Universo(fondo);
        fondo.addChild(univer);
		flash.Lib.current.addChild(fondo);

		var marco:Sprite = new flash.display.Sprite();
		/*marco.graphics.beginFill(138823223);*/
		marco.graphics.beginFill(0xaaaaaa);
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
		
		var volver:MiSprite = new MiSprite();
        var bitmap1 = new Volver();
        volver.addChild(bitmap1);
		volver.url = "../index.html";
		volver.scaleX = volver.scaleY -= 0.4;
		
		var metal_menu:MiSprite = new MiSprite();
        var bitmap2 = new Metal_menu();
        metal_menu.addChild(bitmap2);
		metal_menu.scaleX = metal_menu.scaleY -= 0.2;
		var humo:Clip_humo = new Clip_humo();
		var marco0:Array<Dynamic> = [];
		marco0 = marco0.concat([1, 0, 0, 0, 0]);
		marco0 = marco0.concat([0, 1, 0, 0, 0]);
		marco0 = marco0.concat([0, 0, 1, 0, 0]);
		marco0 = marco0.concat([0, 0, 0, 0.5, 0]);
		humo.filters = [new flash.filters.ColorMatrixFilter(marco0)];
		humo.name = "humoLoader";
		
        metalClip = flash.Lib.attach("Clip_metal");
        metalClip.name = "metalClip";
        metalClip.scaleX = metalClip.scaleY -= 0.25;
        metalClip.stop();
		alarmTimer = new flash.utils.Timer(5000, 0);
		alarmTimer.addEventListener(flash.events.TimerEvent.TIMER, onAlarm);
        alarmTimer.start();
	
        var galeria:Texto = new Texto("galería",100,100,65,0xffffff,18);
		galeria.url = "metal/galeria.html";
		
		var articulos:Texto = new Texto("artículos",300,450,75,0xffffff,18);
		articulos.url = "metal/articulos.html";
		
        volver.x = volver.origX = 650;
		volver.y = volver.origY = 70;
		metalClip.x = metalClip.origX = 170;
		metalClip.y = metalClip.origY = 180;
		humo.x = humo.origX = 240;
		humo.y = humo.origY = 150;
		metal_menu.x = metal_menu.origX = 250;
		metal_menu.y = metal_menu.origY = 50;
		volver.profun = 15;
		metal_menu.profun = 25;
		humo.profun = 25;
		metalClip.profun = 35;
		arrObj = [metal_menu, humo, metalClip, galeria, volver, articulos];
		for (i in 0...arrObj.length){
			marco.addChild(arrObj[i]);
			arrObj[i].addEventListener(flash.events.Event.ENTER_FRAME, movimiento);
		}
        for (i in 3...arrObj.length){
		    arrObj[i].addEventListener(flash.events.MouseEvent.ROLL_OVER, mouseOVER);
		    arrObj[i].addEventListener(flash.events.MouseEvent.ROLL_OUT, mouseOUT);
		    arrObj[i].addEventListener(flash.events.MouseEvent.CLICK, mouseCLICK);
        }
	
		var archivo:URLRequest = new flash.net.URLRequest("../audio/metal.mp3");
		sonido = new flash.media.Sound(archivo);
		canal = sonido.play(0, 10);
		}

		public static function onAlarm(arg1:flash.events.TimerEvent) {
			metalClip.play();
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
		    if (arg1.target.name == "metalClip"){
				if (metalClip.currentFrame == 1){
					metalClip.stop();
				}
				//if (contador == 5){
				//	metalClip.nextFrame();
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
