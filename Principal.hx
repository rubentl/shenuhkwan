package;

import flash.display.Loader;
import flash.display.Sprite;
import flash.display.Bitmap;
import flash.display.MovieClip;
import flash.media.Sound;
import flash.net.URLRequest;

class Ethnocen extends flash.text.Font{public function new(){super();}} 
class Madera extends Bitmap{public function new(){super();}}
class Fuego extends Bitmap{public function new(){super();}} 
class Tierra extends Bitmap{public function new(){super();}}
class Metal extends Bitmap{public function new(){super();}} 
class Agua extends Bitmap{public function new(){super();}} 
class Logo extends Bitmap{public function new(){super();}}

class MiSprite extends Sprite {
    public var url:String;
    public var texto:Texto;
    public var index:Int;
    public var angulo:Float;
    public var color_filtro:Int;
    public function new(){super();}
}

class Texto extends flash.text.TextField{
    public function new(_txt:String,_x:Int,_y:Int,_col:Int,_tam:Int){
        super();
        var format: flash.text.TextFormat = new flash.text.TextFormat();
        format.font = "Ethnocen";
        format.color = _col;
        format.size = _tam;
        embedFonts = true;
        autoSize = flash.text.TextFieldAutoSize.RIGHT;
        defaultTextFormat = format;
        text = _txt;
        this.x = _x;
        this.y = _y;
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
    public function new(){
        super();
        name = "universo";
        x = 800 / 2;
        y = 600 / 2;
        addEventListener(flash.events.Event.ENTER_FRAME,update);
    }
    public function update(e:flash.events.Event){
        if (flash.Lib.current.numChildren < 400){
            var s:Start = new Start();
            s.x = Math.random()*1000;
            s.y = Math.random()*650;
            flash.Lib.current.addChild(s);
        } else {
            removeEventListener(flash.events.Event.ENTER_FRAME, update);
        }
    }
}

class Principal {
    static var canal:flash.media.SoundChannel;
    static var sonido:flash.media.Sound;
    static inline var centroX:Int = 335;
    static inline var centroY:Int = 200;
    static inline var corregirX:Int = 40;
    static inline var corregirY:Int = 40;
    static var incAngulo:Float;
    static inline var cantidad:Int = 5;
    static inline var difAngular:Float = (Math.PI *2)/cantidad;
    static var amplitudX:Float;
    static var amplitudY:Float;
    static var mc:flash.display.MovieClip;
    static var tim:flash.utils.Timer;

    public static function main() {
        mc = flash.Lib.current;
        amplitudX = 220;
        amplitudY = 210;
        
        var fondo:Universo = new Universo();
        fondo.x = fondo.y = 0;
        mc.addChild(fondo);

        var logo:Bitmap = new Logo();
        logo.x = centroX - 40;
        logo.y = centroY - 45;
        logo.filters = [new flash.filters.GlowFilter(0xff0000, 1, 30, 30)];
        mc.addChild(logo);

        ElMenu();

        tim = new flash.utils.Timer(3000, 1);
        tim.addEventListener(flash.events.TimerEvent.TIMER, salirTIMER);
        
        var archivo:URLRequest = new flash.net.URLRequest("audio/intro.mp3");
        sonido = new flash.media.Sound(archivo);
        canal = sonido.play(0, 10);
    }

    static function ElMenu(){
        var madera:MiSprite = new MiSprite();
        madera.index = 0;
        madera.url = "menus/quienessomos.html";
        madera.name = "quienes somos";
        madera.color_filtro = 65280;
        cargarImg(madera, new Madera());
        
        var fuego:MiSprite = new MiSprite();
        fuego.index = 1;
        fuego.url = "menus/principios.html";
        fuego.name = "qué hacemos";
        fuego.color_filtro = 16711680;
        cargarImg(fuego, new Fuego());
        
        var tierra:MiSprite = new MiSprite();
        tierra.index = 2;
        tierra.url = "menus/maestros.html";
        tierra.name = "dónde estamos";
        tierra.color_filtro = 15443011; 
        cargarImg(tierra, new Tierra());
        
        var metal:MiSprite = new MiSprite();
        metal.index = 3;
        metal.url = "menus/galeria.html";
        metal.name = "galería";
        metal.color_filtro = 13882323; 
        cargarImg(metal, new Metal());
        
        var agua:MiSprite = new MiSprite();
        agua.index = 4;
        agua.url = "menus/noticias.html";
        agua.name = "programas";
        agua.color_filtro = 29928;
        cargarImg(agua, new Agua());
    }
    
    public static function cargarImg(arg1:MiSprite, dibu:Bitmap){
        arg1.angulo = difAngular * arg1.index;
        arg1.x = Math.cos(arg1.angulo) * amplitudX + (centroX + corregirX );
        arg1.y = Math.sin(arg1.angulo) * amplitudY + (centroY + corregirY );
        arg1.scaleX = arg1.scaleX -= 0.75;
        arg1.scaleY = arg1.scaleY -= 0.75;
        arg1.texto = new Texto(arg1.name,10,10,0xffffff,20);
        arg1.texto.visible = false;
        /*arg1.filters = [new flash.filters.GlowFilter(arg1.color_filtro, 0.5, 50, 50)];*/
        arg1.addEventListener(flash.events.MouseEvent.ROLL_OVER, mouseOVERmenu);
        arg1.addEventListener(flash.events.Event.ENTER_FRAME, moverMenu);
        arg1.addChild(dibu);
        mc.addChild(arg1);
        mc.addChild(arg1.texto);
    }

    public static function moverMenu(arg1:flash.events.Event){
        incAngulo = (mc.stage.mouseX - centroX) / centroY * 0.01;
        arg1.target.angulo = arg1.target.angulo + incAngulo;
        arg1.target.x = Math.cos(arg1.target.angulo) * amplitudX + (centroX + corregirX);
        arg1.target.y = Math.sin(arg1.target.angulo) * amplitudY + (centroY + corregirY);
    }

    public static function mouseOVERmenu(arg1:flash.events.Event){
        var menu:MiSprite = arg1.currentTarget;
        menu.scaleX = menu.scaleY += 0.2;
        menu.texto.visible = true;
        menu.addEventListener(flash.events.MouseEvent.CLICK, mouseCLICK);
        menu.addEventListener(flash.events.MouseEvent.ROLL_OUT, mouseOUTmenu);
        tim.start();
    }

    public static function salirTIMER(arg1:flash.events.TimerEvent){
	    tim.reset();	
    }

    public static function mouseOUTmenu(arg1:flash.events.Event){
    	arg1.currentTarget.scaleX = arg1.currentTarget.scaleY -= 0.2;
        arg1.currentTarget.texto.visible = false;
    }

    public static function mouseOUT(arg1:flash.events.Event){
    	arg1.currentTarget.scaleX = arg1.currentTarget.scaleY -= 0.4;
	    arg1.currentTarget.filters = [];
    }

    public static function mouseCLICK(arg1:flash.events.Event){
        canal.stop();
        flash.Lib.getURL(new URLRequest(arg1.currentTarget.url), "_self");
    }

}
