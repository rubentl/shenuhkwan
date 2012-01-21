package;

import flash.display.Loader;
import flash.display.Sprite;
import flash.media.Sound;
import flash.net.URLRequest;

class Ethnocen extends flash.text.Font{public function new(){super();}} 

class Loader extends flash.display.Loader {
    public var url:String;
    public var titulo:String;
    public var texto:Texto;
    public var index:Int;
    public var angulo:Float;
    public var color_filtro:Int;
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

class Principal {
    static var canal:flash.media.SoundChannel;
    static var sonido:flash.media.Sound;
    static inline var centroX:Int = 335;
    /*static inline var centroY:Int = 245;*/
    static inline var centroY:Int = 200;
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
	/*amplitudY = 200;*/
	amplitudY = 210;
	
	var fondo:Loader = new Loader();
	fondo.load(new URLRequest("imagenes/estrellas.swf"));
	fondo.x = fondo.y = 0;
	mc.addChild(fondo);

	var logo:Loader = new Loader();
	logo.load(new flash.net.URLRequest("imagenes/escudo.png"));
	/*logo.x = centroX - 60;*/
	logo.x = centroX - 40;
	/*logo.y = centroY - 65;*/
	logo.y = centroY - 45;
	/*logo.filters = [new flash.filters.GlowFilter(16711680, 1, 30, 30)];*/
	logo.filters = [new flash.filters.GlowFilter(0xffffff, 1, 30, 30)];
	mc.addChild(logo);

	ElMenu();

	tim = new flash.utils.Timer(3000, 1);
	tim.addEventListener(flash.events.TimerEvent.TIMER, salirTIMER);
	
	var archivo:URLRequest = new flash.net.URLRequest("audio/intro.mp3");
	sonido = new flash.media.Sound(archivo);
	canal = sonido.play(0, 10);
    }
    static function ElMenu(){
	/*var mapawebLoader:Loader = new Loader();*/
	/*mapawebLoader.url = "menus/madera/mapaweb.html";*/
	/*mapawebLoader.load(new URLRequest("imagenes/mapaweb.png"));*/
	/*mapawebLoader.x = 0;*/
	/*mapawebLoader.y = 575;*/
    var mapawebLoader:Texto = new Texto("mapa web",700,575,0xffffff,15);
	mapawebLoader.addEventListener(flash.events.MouseEvent.ROLL_OVER, mouseOVER);
	mapawebLoader.addEventListener(flash.events.MouseEvent.ROLL_OUT, mouseOUT);
	mapawebLoader.addEventListener(flash.events.MouseEvent.CLICK, mouseCLICK);
	mc.addChild(mapawebLoader);
	var maderaLoader:Loader = new Loader();
	maderaLoader.index = 0;
	maderaLoader.url = "menus/quienessomos.html";
	maderaLoader.name = "imagenes/madera.png";
    maderaLoader.titulo = "quienes somos";
	maderaLoader.load(new URLRequest(maderaLoader.name));
	maderaLoader.color_filtro = 65280;
	cargarImg(maderaLoader);
	var fuegoLoader:Loader = new Loader();
	fuegoLoader.index = 1;
	fuegoLoader.url = "menus/principios.html";
	fuegoLoader.name = "imagenes/fuego.png";
    fuegoLoader.titulo = "qué hacemos";
	fuegoLoader.load(new URLRequest(fuegoLoader.name));
	fuegoLoader.color_filtro = 16711680;
	cargarImg(fuegoLoader);
	var tierraLoader:Loader = new Loader();
	tierraLoader.index = 2;
	tierraLoader.url = "menus/maestros.html";
	tierraLoader.name = "imagenes/tierra.png";
    tierraLoader.titulo = "dónde estamos";
	tierraLoader.load(new URLRequest(tierraLoader.name));
	tierraLoader.color_filtro = 15443011; 
	cargarImg(tierraLoader);
	var metalLoader:Loader = new Loader();
	metalLoader.index = 3;
	metalLoader.url = "menus/galeria.html";
	metalLoader.name = "imagenes/metal.png";
    metalLoader.titulo = "galería";
	metalLoader.load(new URLRequest(metalLoader.name));
	metalLoader.color_filtro = 13882323; 
	cargarImg(metalLoader);
	var aguaLoader:Loader = new Loader();
	aguaLoader.index = 4;
	aguaLoader.url = "menus/noticias.html";
	aguaLoader.name = "imagenes/agua.png";
    aguaLoader.titulo = "programas";
	aguaLoader.load(new URLRequest(aguaLoader.name));
	aguaLoader.color_filtro = 29928;
	cargarImg(aguaLoader);
    }
    public static function cargarImg(arg1:Loader){
	arg1.angulo = difAngular * arg1.index;
	arg1.x = Math.cos(arg1.angulo) * amplitudX + (centroX  );
	arg1.y = Math.sin(arg1.angulo) * amplitudY + (centroY  );
	arg1.scaleX = arg1.scaleX -= 0.55;
	arg1.scaleY = arg1.scaleY -= 0.55;
    arg1.texto = new Texto(arg1.titulo,10,10,0xffffff,20);
    arg1.texto.visible = false;
	arg1.filters = [new flash.filters.GlowFilter(arg1.color_filtro, 0.5, 40, 40)];
	arg1.addEventListener(flash.events.MouseEvent.ROLL_OVER, mouseOVERmenu);
	arg1.addEventListener(flash.events.Event.ENTER_FRAME, moverMenu);
	mc.addChild(arg1);
    mc.addChild(arg1.texto);
    }

    public static function moverMenu(arg1:flash.events.Event){
	incAngulo = (mc.stage.mouseX - centroX) / centroY * 0.01;
	arg1.target.angulo = arg1.target.angulo + incAngulo;
	arg1.target.x = Math.cos(arg1.target.angulo) * amplitudX + centroX + 10;
	arg1.target.y = Math.sin(arg1.target.angulo) * amplitudY + centroY + 10;
    }

    public static function mouseOVER(arg1:flash.events.Event){
	arg1.currentTarget.scaleX = arg1.currentTarget.scaleY += 0.4; 
    arg1.currentTarget.texto.visible = true;
	arg1.currentTarget.filters = [new flash.filters.GlowFilter(16711680, 0.5, 50, 50)];
    }

    public static function mouseOVERmenu(arg1:flash.events.Event){
	/*if (mc.getChildByName("menu_activo") == null){*/
	/*    var tmp:Loader = new Loader();*/
	/*    tmp.load(new URLRequest(arg1.currentTarget.name));*/
	/*    tmp.x = 150;*/
	/*    tmp.y = 100;*/
	/*    tmp.scaleY -= 0.2;*/
	/*    tmp.scaleX -= 0.2;*/
	/*    tmp.url = arg1.currentTarget.url;*/
	/*    tmp.name = "menu_activo";*/
	/*    tmp.filters = [new flash.filters.GlowFilter(arg1.currentTarget.color_filtro, 0.5, 50, 50)];*/
	/*    tmp.addEventListener(flash.events.MouseEvent.CLICK, mouseCLICK);*/
	/*    mc.addChild(tmp);*/
	/*    tim.start();*/
	/*}*/
        var menu:Loader = arg1.currentTarget;
        menu.scaleX = menu.scaleY += 0.4;
        menu.texto.visible = true;
        menu.addEventListener(flash.events.MouseEvent.CLICK, mouseCLICK);
        menu.addEventListener(flash.events.MouseEvent.ROLL_OUT, mouseOUTmenu);
        tim.start();
    }

    public static function salirTIMER(arg1:flash.events.TimerEvent){
	    /*mc.removeChild(mc.getChildByName("menu_activo"));*/
	    tim.reset();	
    }

    public static function mouseOUTmenu(arg1:flash.events.Event){
    	arg1.currentTarget.scaleX = arg1.currentTarget.scaleY -= 0.4;
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
