package;
//{{{1 imports
import caurina.transitions.Tweener;
import caurina.transitions.properties.DisplayShortcuts;
import caurina.transitions.properties.ColorShortcuts;
import caurina.transitions.properties.TextShortcuts;
class MiShape extends flash.display.Shape{//{{{1
    public var origX:Float;
    public var origY:Float;
    public var profun:Float;
    public function new(){super();}}
// clase para controlar el movimiento del movieclip embebido
class MiClip extends flash.display.MovieClip{//{{{1 
    var contador:Int;
    public var origX:Float;
    public var origY:Float;
    public var profun:Float;
    public function new(?mili:Int=5000){//{{{2  
        super();
        var alarmTimer:flash.utils.Timer = new flash.utils.Timer(mili, 0);		
        alarmTimer.addEventListener(flash.events.TimerEvent.TIMER, onAlarm);
        alarmTimer.start();
        stop();
        contador = 0;
        addEventListener(flash.events.Event.ENTER_FRAME, movimiento);
    }
    function onAlarm(arg1:flash.events.TimerEvent) {//{{{2 
        play();
    }
    function movimiento(arg1:flash.events.Event){//{{{2 
        if (currentFrame == 1) stop();
        if (contador == 5){
            nextFrame();
            contador = 0;
        }
        contador = (contador + 1);
    }
    }
class MiBitmap extends flash.display.Bitmap{//{{{1 
    public var origX:Float;
    public var origY:Float;
    public var profun:Float;
    public function new(){super();}}
////{{{1  Todos los recursos embebidos
class Ethnocen extends flash.text.Font{public function new(){super();}} 
class Madera extends MiBitmap{public function new(){super();name = "quienes somos";}}
class Fuego extends MiBitmap{public function new(){super();name = "principios";}} 
class Tierra extends MiBitmap{public function new(){super();name = "maestros";}}
class Metal extends MiBitmap{public function new(){super();name = "galeria";}} 
class Agua extends MiBitmap{public function new(){super();name = "noticias";}} 
class Logo extends MiBitmap{public function new(){super();}}
class Espana extends MiBitmap{public function new(){super();name = "espana";}}
class ReinoUnido extends MiBitmap{public function new(){super();name = "reino-unido";}}
class Estrellas extends MiBitmap{public function new(){super();name = "estrellas";}} 
class Facebook extends MiBitmap{public function new(){super();name= "facebook";}}
class Youtube extends MiBitmap{public function new(){super();name= "youtube";}}
class Clip_madera extends MiClip{public function new(){super();}}
class Clip_fuego extends MiClip{public function new(){super();}} 
class Clip_tierra extends MiClip{public function new(){super();}} 
class Clip_humo extends flash.display.MovieClip{public function new(){super();}} 
class Clip_agua extends flash.display.MovieClip{public function new(){super();}}
class Clip_metal extends MiClip{//{{{1 
    public function new(){super();}
    override function movimiento(arg1:flash.events.Event){if (currentFrame == 1) stop();}
}
// Clase que contiene las variables globales
class Va {//{{{1 
    public static inline var altura:Float = 480;
    public static inline var anchura:Float = 640;
    public static inline var baseX:Float = (800 - anchura)/2; // esquina izda
    public static inline var baseY:Float = (600 - altura)/2; // esquina superior
    public static var _negros:Array<Int> = [0xffffff,0x333333,0x000000]; // colores de cada elemento
    public static var _madera:Array<Int> = [0x00ff00,0x005500,0x003300];
    public static var _fuego:Array<Int> = [0xff0000,0x550000,0x330000];
    public static var _tierra:Array<Int> = [0xffba5c,0xa46208,0x573404];
    public static var _metal:Array<Int> = [0xd3d3d3,0x6e6e6e,0x393939];
    public static var _agua:Array<Int> = [0x0000ff,0x000055,0x000033];
    public static var minimenu:Float = 40; // anchura y altura del elemento en el minimenu 
    public static var fondo:Fondo; // guarda la clase Fondo
    public static var menu:Menu; // guarda la clase Menu
    public static var canal:flash.media.SoundChannel; // el canal para el sonido
    public static var espanol:Hash<String>;
    public static var ingles:Hash<String>;
    public static var idioma:Hash<String>;
    public static var todo:Todo;
    public static function iniciar(){//{{{2 
        espanol = new Hash();
        espanol.set("quienes somos","quienes somos");
        espanol.set("principios","principios");
        espanol.set("maestros","maestros");
        espanol.set("galeria","galeria");
        espanol.set("noticias","noticias");
        espanol.set("mapa web","mapa web");
        espanol.set("url:mapa web","http://www.shenuhkwan.com/menus/madera/mapaweb.html");
        espanol.set("los fundadores","los fundadores");
        espanol.set("url:los fundadores","menus/madera/fundadores.html");
        espanol.set("la asociación","la asociación");
        espanol.set("url:la asociación", "menus/madera/asociacion.html");
        espanol.set("nuestro escudo","nuestro escudo");
        espanol.set("url:nuestro escudo", "menus/madera/escudo.html");
        espanol.set("preguntas más frecuentes","preguntas\nmás frecuentes");
        espanol.set("url:preguntas más frecuentes", "menus/madera/preguntas.html");
        espanol.set("principios hapkido","principios\nhapkido");
        espanol.set("url:principios hapkido", "menus/fuego/principioshapkido.html");
        espanol.set("historia","historia");
        espanol.set("url:historia", "menus/fuego/historia.html");
        espanol.set("principios shen uh kwan","principios\nshen uh kwan");
        espanol.set("url:principios shen uh kwan", "menus/fuego/principiosshenuhkwan.html");
        espanol.set("grados","grados");
        espanol.set("url:grados","menus/fuego/grados.html");
        espanol.set("qi gong","ki gong");
        espanol.set("url:qi gong","menus/fuego/naegongki.html");
        espanol.set("delegaciones","delegaciones");
        espanol.set("url:delegaciones","menus/tierra/delegaciones.html"); 
        espanol.set("maestros","maestros");
        espanol.set("url:maestros","menus/tierra/maestros.html"); 
        espanol.set("vídeos","vídeos");
        espanol.set("url:vídeos","menus/metal/videos.html"); 
        espanol.set("fotos","fotos");
        espanol.set("url:fotos","menus/metal/fotos.html");
        espanol.set("artículos","artículos");
        espanol.set("url:artículos","menus/metal/articulos.html"); 
        espanol.set("descargas","descargas");
        espanol.set("url:descargas","menus/metal/descargas.html"); 
        espanol.set("enlaces","enlaces");
        espanol.set("url:enlaces","menus/agua/enlaces.html");
        espanol.set("novedades","novedades");
        espanol.set("url:novedades","/novedades/novedades.html");
        espanol.set("contactos","contactos");
        espanol.set("url:contactos","menus/agua/contacto.html"); 

        ingles = new Hash();
        ingles.set("quienes somos","about us");
        ingles.set("principios","principles");
        ingles.set("maestros","teachers");
        ingles.set("galeria","gallery");
        ingles.set("noticias","news");
        ingles.set("mapa web","site map");
        ingles.set("url:mapa web","http://www.shenuhkwan.com/ingles/menus/madera/mapaweb.html");
        ingles.set("los fundadores","the founders");
        ingles.set("url:los fundadores","ingles/menus/madera/fundadores.html");
        ingles.set("la asociación","the association");
        ingles.set("url:la asociación", "ingles/menus/madera/asociacion.html");
        ingles.set("nuestro escudo","our shield");
        ingles.set("url:nuestro escudo", "menus/madera/escudo.html");
        ingles.set("preguntas más frecuentes","frecuently\nasked questions");
        ingles.set("url:preguntas más frecuentes", "ingles/menus/madera/preguntas.html");
        ingles.set("principios hapkido","hapkido\nprinciples");
        ingles.set("url:principios hapkido", "ingles/menus/fuego/principioshapkido.html");
        ingles.set("historia","history");
        ingles.set("url:historia", "ingles/menus/fuego/historia.html");
        ingles.set("principios shen uh kwan","shen uh kwan\nprinciples");
        ingles.set("url:principios shen uh kwan", "ingles/menus/fuego/principiosshenuhkwan.html");
        ingles.set("grados","degrees");
        ingles.set("url:grados","ingles/menus/fuego/grados.html");
        ingles.set("qi gong","ki gong");
        ingles.set("url:qi gong","ingles/menus/fuego/naegongki.html"); 
        ingles.set("delegaciones","delegations");
        ingles.set("url:delegaciones","ingles/menus/tierra/delegaciones.html"); 
        ingles.set("maestros","teachers");
        ingles.set("url:maestros","ingles/menus/tierra/maestros.html"); 
        ingles.set("vídeos","videos");
        ingles.set("url:vídeos","ingles/menus/metal/videos.html"); 
        ingles.set("fotos","photos");
        ingles.set("url:fotos","ingles/menus/metal/fotos.html");
        ingles.set("artículos","articles");
        ingles.set("url:artículos","ingles/menus/metal/articulos.html"); 
        ingles.set("descargas","downloads");
        ingles.set("url:descargas","ingles/menus/metal/descargas.html"); 
        ingles.set("enlaces","links");
        ingles.set("url:enlaces","ingles/menus/agua/enlaces.html");
        ingles.set("novedades","news");
        ingles.set("url:novedades","/novedades/novedades.html");
        ingles.set("contactos","contacts");
        ingles.set("url:contactos","ingles/menus/agua/contacto.html"); 

        idioma = espanol;
    }
    public static function espana(){// {{{2 
        idioma = espanol;
    }
    public static function reinounido(){//{{{2 
        idioma = ingles;
    }
}
class Fondo extends flash.display.Sprite {//{{{1 
    var shenuhkwan:Texto;
    var novedad:Texto;
    public var paraMenus:flash.display.Sprite;	
    var bandera1:flash.display.Sprite;
    var bandera2:flash.display.Sprite;
    var logo:Logo;
    public function new(){//{{{2 
        super();
        name = "fondo";
        marco(Va._negros);
        shenuhkwan = new Texto("Shen uh kwan",0xffffff,18);
        addChild(shenuhkwan);
        shenuhkwan.x = Va.baseX;
        shenuhkwan.y = Va.baseY -30;

        novedad = new Texto("Novedades",0x0022ff,17);
        novedad.x = Va.baseX + shenuhkwan.width + 80;
        novedad.y = Va.baseY -28;
        novedad.url = "/novedades/novedades.html";
        novedad.addEventListener(flash.events.MouseEvent.ROLL_OVER, t0tOVER);
        novedad.addEventListener(flash.events.MouseEvent.ROLL_OUT, t0tOUT);
        novedad.addEventListener(flash.events.MouseEvent.CLICK, t0tCLICK);
        addChild(novedad);
        
        var face:flash.display.Sprite = new flash.display.Sprite();
        var facebook:Facebook = new Facebook();
        facebook.scaleX = facebook.scaleY -= 0.76;
        face.addChild(facebook);
        face.x = (Va.anchura + Va.baseX) - face.width;
        face.y = Va.baseY - face.height -2;
        face.name = facebook.name;
        face.addEventListener(flash.events.MouseEvent.ROLL_OVER, t0tOVER);
        face.addEventListener(flash.events.MouseEvent.ROLL_OUT, t0tOUT);
        face.addEventListener(flash.events.MouseEvent.CLICK, faceCLICK);
        addChild(face);

        var you:flash.display.Sprite = new flash.display.Sprite();
        var youtube:Youtube = new Youtube();
        youtube.scaleX -= 0.94;
        youtube.height = facebook.height;
        you.addChild(youtube);
        you.x = (Va.anchura + Va.baseX) - you.width - face.width -3;
        you.y = Va.baseY - you.height -2;
        you.name = youtube.name;
        you.addEventListener(flash.events.MouseEvent.ROLL_OVER, t0tOVER);
        you.addEventListener(flash.events.MouseEvent.ROLL_OUT, t0tOUT);
        you.addEventListener(flash.events.MouseEvent.CLICK, faceCLICK);
        addChild(you);

        paraMenus = new flash.display.Sprite();
        paraMenus.mask = mascara();
        paraMenus.x = paraMenus.y = 0;
        addChild(paraMenus);

        var estrellas:Estrellas = new Estrellas();
        estrellas.mask = mascara();
        addChild(estrellas);

        logo = new Logo();
        logo.x = ((Va.anchura / 2) - (logo.width / 2)) + Va.baseX;
        logo.y = ((Va.altura / 2) - (logo.height / 2)) + Va.baseY;
        logo.mask = mascara();
        addChild(logo);

        bandera1 = new flash.display.Sprite();
        var espana:Espana =  new Espana();
        espana.scaleX = espana.scaleY -= 0.2;
        bandera1.x = (Va.baseX + (Va.anchura / 2)) - espana.width -5;
        bandera1.y = Va.baseY + (Va.altura /2) + 150;
        bandera1.name = espana.name;
        bandera1.addEventListener(flash.events.MouseEvent.ROLL_OVER, t0tOVER);
        bandera1.addEventListener(flash.events.MouseEvent.ROLL_OUT, t0tOUT);
        bandera1.addEventListener(flash.events.MouseEvent.CLICK, idiomaCLICK);
        bandera1.addChild(espana);
        addChild(bandera1);

        bandera2 = new flash.display.Sprite();
        var reinounido:ReinoUnido =  new ReinoUnido();
        reinounido.scaleX = reinounido.scaleY -= 0.2;
        bandera2.x = (Va.baseX + (Va.anchura / 2)) + 5;
        bandera2.y = bandera1.y;
        bandera2.name = reinounido.name;
        bandera2.addEventListener(flash.events.MouseEvent.ROLL_OVER, t0tOVER);
        bandera2.addEventListener(flash.events.MouseEvent.ROLL_OUT, t0tOUT);
        bandera2.addEventListener(flash.events.MouseEvent.CLICK, idiomaCLICK);
        bandera2.addChild(reinounido);
        addChild(bandera2);
    }
    function marco(valores:Array<Int>){//{{{2 
        graphics.beginFill(valores[0]);
        graphics.drawRect(Va.baseX,Va.baseY,Va.anchura,Va.altura);
        graphics.endFill();
        graphics.beginFill(valores[2]);
        graphics.drawRect(Va.baseX+2,Va.baseY+2,Va.anchura-4,Va.altura-4);
        graphics.endFill();
    }
    public function madera(){marco(Va._madera);} 
    public function fuego(){marco(Va._fuego);} 
    public function tierra(){marco(Va._tierra);} 
    public function metal(){marco(Va._metal);} 
    public function agua(){marco(Va._agua);}
    public function negro(){marco(Va._negros);} 
    public function mascara():flash.display.Shape{//{{{2 
        var tmp:flash.display.Shape = new flash.display.Shape();
        tmp.graphics.beginFill(0x000000);
        tmp.graphics.drawRect(Va.baseX+2, Va.baseY+2, Va.anchura-4, Va.altura-4);
        tmp.graphics.endFill();
        flash.Lib.current.addChild(tmp);
        return tmp;
    }
    function t0tOVER(arg1:flash.events.Event){//{{{2 
        arg1.target.filters = [new flash.filters.DropShadowFilter(5,45,0xffffff)];
    }
    function t0tOUT(arg1:flash.events.Event){//{{{2 
        arg1.target.filters = [];
    }
    function t0tCLICK(arg1:flash.events.Event){//{{{2
        flash.Lib.getURL(new flash.net.URLRequest(arg1.target.url), "_self");
    }
    function faceCLICK(arg1:flash.events.Event){//{{{2
        if (arg1.target.name == "facebook")
            flash.Lib.getURL(new
                    flash.net.URLRequest("http://www.facebook.com/group.php?gid=114156481974412"),"_self");
        if (arg1.target.name == "youtube")
            flash.Lib.getURL(new
                    flash.net.URLRequest("http://www.youtube.com/user/wonsmanu"),"_self");
    }
    function idiomaCLICK(ev:flash.events.MouseEvent){//{{{2
        if (ev.target.name == "espana") Va.espana();
        if (ev.target.name == "reino-unido") Va.reinounido();
        removeChild(bandera1); 
        removeChild(bandera2);
        var mapaweb:Texto = new Texto(Va.idioma.get("mapa web"),Va._metal[1],14);
        mapaweb.x = (Va.baseX + Va.anchura) - mapaweb.width;
        mapaweb.y = (Va.baseY + Va.altura) +5;
        mapaweb.url = Va.idioma.get("url:mapa web");
        mapaweb.addEventListener(flash.events.MouseEvent.ROLL_OVER, t0tOVER);
        mapaweb.addEventListener(flash.events.MouseEvent.ROLL_OUT, t0tOUT);
        mapaweb.addEventListener(flash.events.MouseEvent.CLICK, t0tCLICK);
        addChild(mapaweb);
        var menu:Menu = new Menu(); // construimos el menú
        menu.mask = mascara(); // aplicamos al menú la máscara del fondo para que no se salga
        Va.menu = menu;
        flash.Lib.current.addChild(menu);
        Tweener.addTween(logo,{alpha:0,time:7,transition:"linear"});
    }
}
class Texto extends flash.text.TextField{//{{{1
    public var origX:Int;
    public var origY:Int;
    public var profun:Int;
    public var url:String;
    public function new(_txt:String,_col:Int,_tam:Int){//{{{2 
        super();
        var format: flash.text.TextFormat = new flash.text.TextFormat();
        format.font = "Ethnocen";
        format.color = _col;
        format.size = _tam;
        embedFonts = true;
        autoSize = flash.text.TextFieldAutoSize.RIGHT;
        defaultTextFormat = format;
        text = _txt;
    }
}
class MiniMenu extends flash.display.Sprite{//{{{1 
    static var contador:Int;
    static var tit:Texto;
    static var objetos:Array<Dynamic> = [];
    public function new(men:MiBitmap){//{{{2 
        super();
        name = Va.idioma.get(men.name);
        graphics.beginFill(Va._negros[0]);
        graphics.drawRect(0, 0, Va.minimenu +4, Va.minimenu +4);
        graphics.endFill();
        graphics.beginFill(Va._negros[2]);
        graphics.drawRect(2,2,Va.minimenu,Va.minimenu);
        graphics.endFill();
        men.width = men.height = Va.minimenu; men.x = men.y = 1;
        addChild(men);
        contador = 0;
        addEventListener(flash.events.MouseEvent.CLICK, mouseCLICK);
        addEventListener(flash.events.MouseEvent.ROLL_OVER, mouseOVER);
        addEventListener(flash.events.MouseEvent.ROLL_OUT, mouseOUT);
    }
    public function mouseCLICK(ev:flash.events.MouseEvent){//{{{2 
        var tmp = Va.fondo.getChildByName("estrellas");
        if ( tmp != null ) Va.fondo.removeChild(tmp);
        if (name == Va.idioma.get("quienes somos")) madera();
        else if (name == Va.idioma.get("principios")) fuego();
        else if (name == Va.idioma.get("maestros")) tierra();
        else if (name == Va.idioma.get("galeria")) metal();
        else agua();
    }
    function madera(){//{{{2 
        if (objetos.length != 0)
            for (i in 0...objetos.length){
                Va.fondo.paraMenus.removeChild(objetos.pop());
            }
        if (Va.canal != null) Va.canal.stop();
        var archivo:flash.net.URLRequest = new flash.net.URLRequest("audio/madera.mp3");
        var sonido = new flash.media.Sound(archivo);
        Va.canal = sonido.play(0, 10);
        Va.fondo.madera();
        Va.menu.removeEventListener(flash.events.Event.ENTER_FRAME, Va.menu.moverMenu);

        var degradado:MiShape = gradiante(Va._madera);
        degradado.x = Va.anchura; degradado.y = 0; degradado.profun = 15;
        degradado.origX = Va.baseX+160; degradado.origY = Va.baseY+75; 
        objetos.push(degradado);
        Va.fondo.paraMenus.addChild(degradado);
        degradado.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);

        var kanji:Madera = new Madera();
        kanji.x = Va.anchura; kanji.y = 0;
        kanji.scaleX = kanji.scaleY -= 0.4; kanji.profun = 25;
        kanji.origX = Va.baseX; kanji.origY = Va.baseY;
        objetos.push(kanji);
        Va.fondo.paraMenus.addChild(kanji);
        kanji.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);

        var humo:Clip_humo = new Clip_humo();
        humo.x = Va.anchura; humo.y = 0; humo.profun = 25;
        humo.origX = Va.baseX +200; humo.origY = Va.baseY +70;
        objetos.push(humo);
        Va.fondo.paraMenus.addChild(humo);
        humo.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);

        var manu:Clip_madera = new Clip_madera();
        manu.x = Va.anchura; manu.y = 0;
        manu.scaleX = manu.scaleY -=0.3; manu.profun = 40;
        manu.origX = Va.baseX +210; manu.origY = Va.baseY+120;
        objetos.push(manu);
        Va.fondo.paraMenus.addChild(manu);
        manu.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);

        var tit1:Texto = new Texto(Va.idioma.get("los fundadores"),0xffffff,14);
        tit1.x = Va.anchura; tit1.y = 0;
        tit1.origX = tit1.origY = 100; tit1.profun = 90;
        tit1.url = Va.idioma.get("url:los fundadores");	
        objetos.push(tit1);
        Va.fondo.paraMenus.addChild(tit1);
        tit1.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);
        tit1.addEventListener(flash.events.MouseEvent.ROLL_OVER, titOVER);
        tit1.addEventListener(flash.events.MouseEvent.ROLL_OUT, titOUT);
        tit1.addEventListener(flash.events.MouseEvent.CLICK, titCLICK);

        var tit2:Texto = new Texto(Va.idioma.get("la asociación"),0xffffff,14);
        tit2.x = Va.anchura; tit2.y = 0;
        tit2.origX = 170; tit2.origY = 420; tit2.profun = 80;
        tit2.url =Va.idioma.get("url:la asociación");
        objetos.push(tit2);
        Va.fondo.paraMenus.addChild(tit2);
        tit2.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);
        tit2.addEventListener(flash.events.MouseEvent.ROLL_OVER, titOVER);
        tit2.addEventListener(flash.events.MouseEvent.ROLL_OUT, titOUT);
        tit2.addEventListener(flash.events.MouseEvent.CLICK, titCLICK);

        var tit3:Texto = new Texto(Va.idioma.get("nuestro escudo"),0xffffff,14);
        tit3.x = Va.anchura; tit3.y = 0;
        tit3.origX = 450; tit3.origY = 150; tit3.profun = 70;
        tit3.url = Va.idioma.get("url:nuestro escudo");
        objetos.push(tit3);
        Va.fondo.paraMenus.addChild(tit3);
        tit3.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);
        tit3.addEventListener(flash.events.MouseEvent.ROLL_OVER, titOVER);
        tit3.addEventListener(flash.events.MouseEvent.ROLL_OUT, titOUT);
        tit3.addEventListener(flash.events.MouseEvent.CLICK, titCLICK);

        var tit4:Texto = new Texto(Va.idioma.get("preguntas más frecuentes"),0xffffff,14);
        tit4.x = Va.anchura; tit4.y = 0;
        tit4.origX = 500; tit4.origY = 450; tit4.profun = 75;
        tit4.url = Va.idioma.get("url:preguntas más frecuentes");
        objetos.push(tit4);
        Va.fondo.paraMenus.addChild(tit4);
        tit4.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);
        tit4.addEventListener(flash.events.MouseEvent.ROLL_OVER, titOVER);
        tit4.addEventListener(flash.events.MouseEvent.ROLL_OUT, titOUT);
        tit4.addEventListener(flash.events.MouseEvent.CLICK, titCLICK);

        Va.menu.pequeno();
        Tweener.addTween(tit1,{x:tit1.origX,y:tit1.origY,time:2,transition:"linear"});
        Tweener.addTween(tit2,{x:tit2.origX,y:tit2.origY,time:2,transition:"linear"});
        Tweener.addTween(tit3,{x:tit3.origX,y:tit3.origY,time:2,transition:"linear"});
        Tweener.addTween(tit4,{x:tit4.origX,y:tit4.origY,time:2,transition:"linear"});
        Tweener.addTween(humo,{x:humo.origX,y:humo.origY,time:2,transition:"linear"});
        Tweener.addTween(humo,{_color:0x009900,time:2,transition:"linear"});
        Tweener.addTween(manu,{x:humo.origX,y:humo.origY,time:2,transition:"linear"});
        Tweener.addTween(degradado,{x:degradado.origX,y:degradado.origY,time:2,transition:"linear"});
        Tweener.addTween(kanji,{x:kanji.origX,y:kanji.origY,time:2,transition:"linear"});
    }
    function fuego(){//{{{2 
        if (objetos.length != 0)
            for (i in 0...objetos.length){
                Va.fondo.paraMenus.removeChild(objetos.pop());
            }
        if (Va.canal != null) Va.canal.stop();
        var archivo:flash.net.URLRequest = new flash.net.URLRequest("audio/fuego.mp3");
        var sonido = new flash.media.Sound(archivo);
        Va.canal = sonido.play(0, 10);
        Va.fondo.fuego();
        Va.menu.removeEventListener(flash.events.Event.ENTER_FRAME, Va.menu.moverMenu);

        var degradado:MiShape = gradiante(Va._fuego);
        degradado.x = degradado.y = 0; degradado.profun = 15;
        degradado.origX = Va.baseX+160; degradado.origY = Va.baseY+75; 
        objetos.push(degradado);
        Va.fondo.paraMenus.addChild(degradado);
        degradado.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);

        var kanji:Fuego = new Fuego();
        kanji.x = kanji.y = 0;
        kanji.origX = Va.baseX; kanji.origY = Va.baseY;
        kanji.profun = 25;
        objetos.push(kanji);
        Va.fondo.paraMenus.addChild(kanji);
        kanji.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);

        var humo:Clip_humo = new Clip_humo();
        humo.x = humo.y = 0; humo.profun = 25;
        humo.origX = Va.baseX +200; humo.origY = Va.baseY +70;
        objetos.push(humo);
        Va.fondo.paraMenus.addChild(humo);
        humo.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);

        var patada:Clip_fuego = new Clip_fuego();
        patada.x = patada.y = 0;
        patada.scaleX = patada.scaleY -=0.4; patada.profun = 40;
        patada.origX = Va.baseX +160; patada.origY = Va.baseY+130;
        objetos.push(patada);
        Va.fondo.paraMenus.addChild(patada);
        patada.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);

        var tit1:Texto = new Texto(Va.idioma.get("principios hapkido"),0xffffff,14);
        tit1.x = tit1.y = 0;
        tit1.origX = tit1.origY = 100; tit1.profun = 90;
        tit1.url = Va.idioma.get("url:principios hapkido");
        objetos.push(tit1);
        Va.fondo.paraMenus.addChild(tit1);
        tit1.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);
        tit1.addEventListener(flash.events.MouseEvent.ROLL_OVER, titOVER);
        tit1.addEventListener(flash.events.MouseEvent.ROLL_OUT, titOUT);
        tit1.addEventListener(flash.events.MouseEvent.CLICK, titCLICK);

        var tit2:Texto = new Texto(Va.idioma.get("historia"),0xffffff,14);
        tit2.x = tit2.y = 0;
        tit2.origX = 560; tit2.origY = 280; tit2.profun = 80;
        tit2.url = Va.idioma.get("url:historia");
        objetos.push(tit2);
        Va.fondo.paraMenus.addChild(tit2);
        tit2.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);
        tit2.addEventListener(flash.events.MouseEvent.ROLL_OVER, titOVER);
        tit2.addEventListener(flash.events.MouseEvent.ROLL_OUT, titOUT);
        tit2.addEventListener(flash.events.MouseEvent.CLICK, titCLICK);

        var tit3:Texto = new Texto(Va.idioma.get("principios shen uh kwan"),0xffffff,14);
        tit3.x = tit3.y = 0;
        tit3.origX = 450; tit3.origY = 150; tit3.profun = 70;
        tit3.url = Va.idioma.get("url:principios shen uh kwan");
        objetos.push(tit3);
        Va.fondo.paraMenus.addChild(tit3);
        tit3.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);
        tit3.addEventListener(flash.events.MouseEvent.ROLL_OVER, titOVER);
        tit3.addEventListener(flash.events.MouseEvent.ROLL_OUT, titOUT);
        tit3.addEventListener(flash.events.MouseEvent.CLICK, titCLICK);

        var tit4:Texto = new Texto(Va.idioma.get("grados"),0xffffff,14);
        tit4.x = tit4.y = 0;
        tit4.origX = 540; tit4.origY = 390; tit4.profun = 75;
        tit4.url = Va.idioma.get("url:grados");
        objetos.push(tit4);
        Va.fondo.paraMenus.addChild(tit4);
        tit4.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);
        tit4.addEventListener(flash.events.MouseEvent.ROLL_OVER, titOVER);
        tit4.addEventListener(flash.events.MouseEvent.ROLL_OUT, titOUT);
        tit4.addEventListener(flash.events.MouseEvent.CLICK, titCLICK);

        var tit5:Texto = new Texto(Va.idioma.get("qi gong"),0xffffff,14);
        tit5.x = tit5.y = 0;
        tit5.origX = 250; tit5.origY = 400; tit5.profun = 85;
        tit5.url = Va.idioma.get("url:qi gong");
        objetos.push(tit5);
        Va.fondo.paraMenus.addChild(tit5);
        tit5.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);
        tit5.addEventListener(flash.events.MouseEvent.ROLL_OVER, titOVER);
        tit5.addEventListener(flash.events.MouseEvent.ROLL_OUT, titOUT);
        tit5.addEventListener(flash.events.MouseEvent.CLICK, titCLICK);

        Va.menu.pequeno();
        Tweener.addTween(tit1,{x:tit1.origX,y:tit1.origY,time:2,transition:"linear"});
        Tweener.addTween(tit2,{x:tit2.origX,y:tit2.origY,time:2,transition:"linear"});
        Tweener.addTween(tit3,{x:tit3.origX,y:tit3.origY,time:2,transition:"linear"});
        Tweener.addTween(tit4,{x:tit4.origX,y:tit4.origY,time:2,transition:"linear"});
        Tweener.addTween(tit5,{x:tit5.origX,y:tit5.origY,time:2,transition:"linear"});
        Tweener.addTween(humo,{x:humo.origX,y:humo.origY,time:2,transition:"linear"});
        Tweener.addTween(humo,{_color:Va._fuego[2],time:2,transition:"linear"});
        Tweener.addTween(patada,{x:patada.origX,y:patada.origY,time:2,transition:"linear"});
        Tweener.addTween(degradado,{x:degradado.origX,y:degradado.origY,time:2,transition:"linear"});
        Tweener.addTween(kanji,{x:kanji.origX,y:kanji.origY,time:2,transition:"linear"});
    }
    function tierra(){//{{{2 
        if (objetos.length != 0)
            for (i in 0...objetos.length){
                Va.fondo.paraMenus.removeChild(objetos.pop());
            }
        if (Va.canal != null) Va.canal.stop();
        var archivo:flash.net.URLRequest = new flash.net.URLRequest("audio/tierra.mp3");
        var sonido = new flash.media.Sound(archivo);
        Va.canal = sonido.play(0, 10);
        Va.fondo.tierra();
        Va.menu.removeEventListener(flash.events.Event.ENTER_FRAME, Va.menu.moverMenu);

        var degradado:MiShape = gradiante(Va._tierra);
        degradado.x = Va.anchura; degradado.y = Va.altura; degradado.profun = 15;
        degradado.origX = Va.baseX+160; degradado.origY = Va.baseY+75; 
        objetos.push(degradado);
        Va.fondo.paraMenus.addChild(degradado);
        degradado.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);

        var kanji:Tierra = new Tierra();
        kanji.x = Va.anchura; kanji.y = Va.altura;
        kanji.profun = 25;
        kanji.origX = Va.baseX; kanji.origY = Va.baseY;
        objetos.push(kanji);
        Va.fondo.paraMenus.addChild(kanji);
        kanji.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);

        var humo:Clip_humo = new Clip_humo();
        humo.x = Va.anchura; humo.y = Va.altura; humo.profun = 25;
        humo.origX = Va.baseX +200; humo.origY = Va.baseY +50;
        objetos.push(humo);
        Va.fondo.paraMenus.addChild(humo);
        humo.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);

        var proyeccion:Clip_tierra = new Clip_tierra();
        proyeccion.x = Va.anchura; proyeccion.y = Va.altura;
        proyeccion.scaleX = proyeccion.scaleY -=0.2; proyeccion.profun = 40;
        proyeccion.origX = Va.baseX +210; proyeccion.origY = Va.baseY+120;
        objetos.push(proyeccion);
        Va.fondo.paraMenus.addChild(proyeccion);
        proyeccion.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);

        var tit1:Texto = new Texto(Va.idioma.get("delegaciones"),0xffffff,14);
        tit1.x = Va.anchura; tit1.y = Va.altura;
        tit1.origX = 400; tit1.origY = 100; tit1.profun = 90;
        tit1.url = Va.idioma.get("url:delegaciones");
        objetos.push(tit1);
        Va.fondo.paraMenus.addChild(tit1);
        tit1.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);
        tit1.addEventListener(flash.events.MouseEvent.ROLL_OVER, titOVER);
        tit1.addEventListener(flash.events.MouseEvent.ROLL_OUT, titOUT);
        tit1.addEventListener(flash.events.MouseEvent.CLICK, titCLICK);

        var tit2:Texto = new Texto(Va.idioma.get("maestros"),0xffffff,14);
        tit2.x = Va.anchura; tit2.y = Va.altura;
        tit2.origX = 450; tit2.origY = 420; tit2.profun = 80;
        tit2.url = Va.idioma.get("url:maestros");
        objetos.push(tit2);
        Va.fondo.paraMenus.addChild(tit2);
        tit2.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);
        tit2.addEventListener(flash.events.MouseEvent.ROLL_OVER, titOVER);
        tit2.addEventListener(flash.events.MouseEvent.ROLL_OUT, titOUT);
        tit2.addEventListener(flash.events.MouseEvent.CLICK, titCLICK);	

        Va.menu.pequeno();
        Tweener.addTween(tit1,{x:tit1.origX,y:tit1.origY,time:2,transition:"linear"});
        Tweener.addTween(tit2,{x:tit2.origX,y:tit2.origY,time:2,transition:"linear"});
        Tweener.addTween(humo,{x:humo.origX,y:humo.origY,time:2,transition:"linear"});
        Tweener.addTween(humo,{_color:Va._tierra[2],time:2,transition:"linear"});
        Tweener.addTween(proyeccion,{x:humo.origX,y:humo.origY,time:2,transition:"linear"});
        Tweener.addTween(degradado,{x:degradado.origX,y:degradado.origY,time:2,transition:"linear"});
        Tweener.addTween(kanji,{x:kanji.origX,y:kanji.origY,time:2,transition:"linear"});
    }
    function metal(){//{{{2 
        if (objetos.length != 0)
            for (i in 0...objetos.length){
                Va.fondo.paraMenus.removeChild(objetos.pop());
            }
        if (Va.canal != null) Va.canal.stop();
        var archivo:flash.net.URLRequest = new flash.net.URLRequest("audio/metal.mp3");
        var sonido = new flash.media.Sound(archivo);
        Va.canal = sonido.play(0, 10);
        Va.fondo.metal();
        Va.menu.removeEventListener(flash.events.Event.ENTER_FRAME, Va.menu.moverMenu);

        var degradado:MiShape = gradiante(Va._metal);
        degradado.x = 0; degradado.y = Va.altura; degradado.profun = 15;
        degradado.origX = Va.baseX+160; degradado.origY = Va.baseY+75; 
        objetos.push(degradado);
        Va.fondo.paraMenus.addChild(degradado);
        degradado.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);

        var kanji:Metal = new Metal();
        kanji.x = 0; kanji.y = Va.altura;
        kanji.origX = Va.baseX; kanji.origY = Va.baseY;
        kanji.profun = 25;
        objetos.push(kanji);
        Va.fondo.paraMenus.addChild(kanji);
        kanji.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);

        var humo:Clip_humo = new Clip_humo();
        humo.x = 0; humo.y = Va.altura; humo.profun = 25;
        humo.origX = Va.baseX +200; humo.origY = Va.baseY +100;
        objetos.push(humo);
        Va.fondo.paraMenus.addChild(humo);
        humo.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);

        var emili:Clip_metal = new Clip_metal();
        emili.x = 0; emili.y = Va.altura;
        emili.scaleX = emili.scaleY -=0.2; emili.profun = 40;
        emili.origX = Va.baseX +160; emili.origY = Va.baseY+130;
        objetos.push(emili);
        Va.fondo.paraMenus.addChild(emili);
        emili.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);

        var tit1:Texto = new Texto(Va.idioma.get("vídeos"),0xffffff,14);
        tit1.x = 0; tit1.y = Va.altura;
        tit1.origX = tit1.origY = 100; tit1.profun = 90;
        tit1.url = Va.idioma.get("url:vídeos");
        objetos.push(tit1);
        Va.fondo.paraMenus.addChild(tit1);
        tit1.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);
        tit1.addEventListener(flash.events.MouseEvent.ROLL_OVER, titOVER);
        tit1.addEventListener(flash.events.MouseEvent.ROLL_OUT, titOUT);
        tit1.addEventListener(flash.events.MouseEvent.CLICK, titCLICK);

        var tit2:Texto = new Texto(Va.idioma.get("fotos"),0xffffff,14);
        tit2.x = 0; tit2.y = Va.altura;
        tit2.origX = 550; tit2.origY = 280; tit2.profun = 80;
        tit2.url = Va.idioma.get("url:fotos");
        objetos.push(tit2);
        Va.fondo.paraMenus.addChild(tit2);
        tit2.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);
        tit2.addEventListener(flash.events.MouseEvent.ROLL_OVER, titOVER);
        tit2.addEventListener(flash.events.MouseEvent.ROLL_OUT, titOUT);
        tit2.addEventListener(flash.events.MouseEvent.CLICK, titCLICK);

        var tit3:Texto = new Texto(Va.idioma.get("artículos"),0xffffff,14);
        tit3.x = 0; tit3.y = Va.altura;
        tit3.origX = 450; tit3.origY = 150; tit3.profun = 70;
        tit3.url = Va.idioma.get("url:artículos");
        objetos.push(tit3);
        Va.fondo.paraMenus.addChild(tit3);
        tit3.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);
        tit3.addEventListener(flash.events.MouseEvent.ROLL_OVER, titOVER);
        tit3.addEventListener(flash.events.MouseEvent.ROLL_OUT, titOUT);
        tit3.addEventListener(flash.events.MouseEvent.CLICK, titCLICK);

        var tit4:Texto = new Texto(Va.idioma.get("descargas") ,0xffffff,14);
        tit4.x = 0; tit4.y = Va.altura;
        tit4.origX = 540; tit4.origY = 390; tit4.profun = 75;
        tit4.url = Va.idioma.get("url:descargas"); 
        objetos.push(tit4);
        Va.fondo.paraMenus.addChild(tit4);
        tit4.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);
        tit4.addEventListener(flash.events.MouseEvent.ROLL_OVER, titOVER);
        tit4.addEventListener(flash.events.MouseEvent.ROLL_OUT, titOUT);
        tit4.addEventListener(flash.events.MouseEvent.CLICK, titCLICK);

        /*var tit5:Texto = new Texto(Va.idioma.get("qigongleón") ,0xffffff,14);*/
        /*tit5.x = 0; tit5.y = Va.altura;*/
        /*tit5.origX = 270; tit5.origY = 60; tit5.profun = 105;*/
        /*tit5.url = Va.idioma.get("url:qigongleón"); */
        /*objetos.push(tit5);*/
        /*Va.fondo.paraMenus.addChild(tit5);*/
        /*tit5.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);*/
        /*tit5.addEventListener(flash.events.MouseEvent.ROLL_OVER, titOVER);*/
        /*tit5.addEventListener(flash.events.MouseEvent.ROLL_OUT, titOUT);*/
        /*tit5.addEventListener(flash.events.MouseEvent.CLICK, titCLICK);*/

        Va.menu.pequeno();
        Tweener.addTween(tit1,{x:tit1.origX,y:tit1.origY,time:2,transition:"linear"});
        Tweener.addTween(tit2,{x:tit2.origX,y:tit2.origY,time:2,transition:"linear"});
        Tweener.addTween(tit3,{x:tit3.origX,y:tit3.origY,time:2,transition:"linear"});
        Tweener.addTween(tit4,{x:tit4.origX,y:tit4.origY,time:2,transition:"linear"});
        /*Tweener.addTween(tit5,{x:tit5.origX,y:tit5.origY,time:2,transition:"linear"});*/
        Tweener.addTween(humo,{x:humo.origX,y:humo.origY,time:2,transition:"linear"});
        Tweener.addTween(humo,{_color:Va._metal[2],time:2,transition:"linear"});
        Tweener.addTween(emili,{x:emili.origX,y:emili.origY,time:2,transition:"linear"});
        Tweener.addTween(degradado,{x:degradado.origX,y:degradado.origY,time:2,transition:"linear"});
        Tweener.addTween(kanji,{x:kanji.origX,y:kanji.origY,time:2,transition:"linear"});
    }
    function agua(){//{{{2 
        if (objetos.length != 0)
            for (i in 0...objetos.length){
                Va.fondo.paraMenus.removeChild(objetos.pop());
            }
        if (Va.canal != null) Va.canal.stop();
        var archivo:flash.net.URLRequest = new flash.net.URLRequest("audio/agua.mp3");
        var sonido = new flash.media.Sound(archivo);
        Va.canal = sonido.play(0, 10);
        Va.fondo.agua();
        Va.menu.removeEventListener(flash.events.Event.ENTER_FRAME, Va.menu.moverMenu);

        var degradado:MiShape = gradiante(Va._agua);
        degradado.x = Va.anchura; degradado.y = 0; degradado.profun = 15;
        degradado.origX = Va.baseX+160; degradado.origY = Va.baseY+75; 
        objetos.push(degradado);
        Va.fondo.paraMenus.addChild(degradado);
        degradado.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);

        var kanji:Agua = new Agua();
        kanji.x = Va.anchura; kanji.y = 0;
        kanji.origX = Va.baseX; kanji.origY = Va.baseY;
        kanji.profun = 25;
        objetos.push(kanji);
        Va.fondo.paraMenus.addChild(kanji);
        kanji.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);

        var humo:Clip_humo = new Clip_humo();
        humo.x = Va.anchura; humo.y = 0; humo.profun = 25;
        humo.origX = Va.baseX +200; humo.origY = Va.baseY +100;
        objetos.push(humo);
        Va.fondo.paraMenus.addChild(humo);
        humo.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);

        var tigre:Clip_agua = new Clip_agua();
        tigre.x = Va.anchura; tigre.y = 0;
        tigre.scaleX = tigre.scaleY -=0.3; tigre.profun = 40;
        tigre.origX = Va.baseX +200; tigre.origY = Va.baseY+130;
        objetos.push(tigre);
        Va.fondo.paraMenus.addChild(tigre);
        tigre.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);

        var tit1:Texto = new Texto(Va.idioma.get("enlaces"),0xffffff,14);
        tit1.x = Va.anchura; tit1.y = 0;
        tit1.origX = 450; tit1.origY = 200; tit1.profun = 90;
        tit1.url = Va.idioma.get("url:enlaces");
        objetos.push(tit1);
        Va.fondo.paraMenus.addChild(tit1);
        tit1.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);
        tit1.addEventListener(flash.events.MouseEvent.ROLL_OVER, titOVER);
        tit1.addEventListener(flash.events.MouseEvent.ROLL_OUT, titOUT);
        tit1.addEventListener(flash.events.MouseEvent.CLICK, titCLICK);

        var tit2:Texto = new Texto(Va.idioma.get("novedades"),0xffffff,14);
        tit2.x = Va.anchura; tit2.y = 0;
        tit2.origX = 550; tit2.origY = 280; tit2.profun = 80;
        tit2.url = Va.idioma.get("url:novedades");
        objetos.push(tit2);
        Va.fondo.paraMenus.addChild(tit2);
        tit2.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);
        tit2.addEventListener(flash.events.MouseEvent.ROLL_OVER, titOVER);
        tit2.addEventListener(flash.events.MouseEvent.ROLL_OUT, titOUT);
        tit2.addEventListener(flash.events.MouseEvent.CLICK, titCLICK);

        var tit3:Texto = new Texto(Va.idioma.get("contactos"),0xffffff,14);
        tit3.x = Va.anchura; tit3.y = 0;
        tit3.origX = 450; tit3.origY = 450; tit3.profun = 70;
        tit3.url = Va.idioma.get("url:contactos");
        objetos.push(tit3);
        Va.fondo.paraMenus.addChild(tit3);
        tit3.addEventListener(flash.events.Event.ENTER_FRAME, movimiento);
        tit3.addEventListener(flash.events.MouseEvent.ROLL_OVER, titOVER);
        tit3.addEventListener(flash.events.MouseEvent.ROLL_OUT, titOUT);
        tit3.addEventListener(flash.events.MouseEvent.CLICK, titCLICK);

        Va.menu.pequeno();
        Tweener.addTween(tit1,{x:tit1.origX,y:tit1.origY,time:2,transition:"linear"});
        Tweener.addTween(tit2,{x:tit2.origX,y:tit2.origY,time:2,transition:"linear"});
        Tweener.addTween(tit3,{x:tit3.origX,y:tit3.origY,time:2,transition:"linear"});
        Tweener.addTween(humo,{x:humo.origX,y:humo.origY,time:2,transition:"linear"});
        Tweener.addTween(humo,{_color:Va._agua[2],time:2,transition:"linear"});
        Tweener.addTween(tigre,{x:tigre.origX,y:tigre.origY,time:2,transition:"linear"});
        Tweener.addTween(degradado,{x:degradado.origX,y:degradado.origY,time:2,transition:"linear"});
        Tweener.addTween(kanji,{x:kanji.origX,y:kanji.origY,time:2,transition:"linear"});
    }
    public static function movimiento(arg1:flash.events.Event){//{{{2 
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
        arg1.target.x = tmpX;
        arg1.target.y = tmpY;
    }
    public function mouseOVER(ev:flash.events.MouseEvent){//{{{2 
        addEventListener(flash.events.Event.ENTER_FRAME, cadaFrame);
        tit = new Texto(ev.currentTarget.name,0xffffff,14); // para escribir el texto del menu
        tit.x = Va.baseX;
        tit.y = Va.baseY + Va.altura + 10;
        flash.Lib.current.addChild(tit);
    }
    public function mouseOUT(ev:flash.events.MouseEvent){//{{{2 
        removeEventListener(flash.events.Event.ENTER_FRAME,cadaFrame);
        flash.Lib.current.removeChild(tit);
        filters = [];
    }
    public function cadaFrame(ev:flash.events.Event){ //{{{2  tintineo a gris del minimenu
        if (contador == 2) {gris(); contador=0;}
        else {filters=[];contador++;}
    }
    function gris(){//{{{2 
        var marco0:Array<Dynamic> = [];
        marco0 = marco0.concat([0.3, 0.59, 0.11, 0, 60]);
        marco0 = marco0.concat([0.3, 0.59, 0.11, 0, 60]);
        marco0 = marco0.concat([0.3, 0.59, 0.11, 0, 60]);
        marco0 = marco0.concat([0, 0, 0, 1, 0]);
        filters = [new flash.filters.ColorMatrixFilter(marco0)];
    }
    function gradiante(valores:Array<Int>){//{{{2 
        var tmp:MiShape = new MiShape();
        var arr1:Array<Int> = [valores[0],valores[1],valores[2]];
        var arr2:Array<Int> = [1, 1, 1];
        var arr3:Array<Int> = [0, 190, 250];
        var matriz:flash.geom.Matrix = new flash.geom.Matrix();
        matriz.createGradientBox(300, 300);
        tmp.graphics.beginGradientFill(flash.display.GradientType.RADIAL, arr1, arr2, arr3, matriz, 
                flash.display.SpreadMethod.PAD, flash.display.InterpolationMethod.LINEAR_RGB);
        tmp.graphics.drawCircle(150,150,150);
        tmp.graphics.endFill();
        return tmp;
    }
    public static function titOVER(arg1:flash.events.Event){//{{{2 
        arg1.currentTarget.filters = [new flash.filters.DropShadowFilter(5,45,0xffffff)];
    }
    public static function titOUT(arg1:flash.events.Event){//{{{2 
        arg1.currentTarget.filters = [];
    }
    public static function titCLICK(arg1:flash.events.Event){//{{{2 
        Va.canal.stop();
        flash.Lib.getURL(new flash.net.URLRequest(arg1.currentTarget.url), "_self");
    }
}
class Menu extends flash.display.Sprite{ //{{{1 menu que agrupa todos los minimenus de los elementos
    public function new(){//{{{2
        super();
        name = "menu";
        var madera:MiniMenu = new MiniMenu(new Madera()); madera.x = -(Va.minimenu * 4);
        var fuego:MiniMenu = new MiniMenu(new Fuego()); fuego.x = -(Va.minimenu * 3) +10;
        var tierra:MiniMenu = new MiniMenu(new Tierra()); tierra.x = -(Va.minimenu * 2) +20;
        var metal:MiniMenu = new MiniMenu(new Metal()); metal.x = -Va.minimenu +30;
        var agua:MiniMenu = new MiniMenu(new Agua()); agua.x = 40;
        addChild(madera);
        addChild(fuego);
        addChild(tierra);
        addChild(metal);
        addChild(agua);
        addEventListener(flash.events.Event.ENTER_FRAME, moverMenu);
    }
    public function moverMenu(ev:flash.events.Event){//{{{2
        var destinoX:Float;
        var destinoY:Float;
        var incrX:Float;
        var incrY:Float;
        destinoX = flash.Lib.current.stage.stageWidth - flash.Lib.current.stage.mouseX;
        destinoY = flash.Lib.current.stage.stageHeight - flash.Lib.current.stage.mouseY;
        incrX = ( destinoX - this.x ) /10;
        incrY = ( destinoY - this.y ) /10;
        this.x += incrX;
        this.y += incrY;
    }
    public function pequeno(){//{{{2
        Tweener.addTween(this,{x:Va.baseX+(Va.minimenu*3)+30,y:Va.baseY+420,_scale:0.7,time:1,transition:"linear"});
    }
}
class Todo extends flash.display.Sprite { //{{{1
    public function new(){//{{{2
        super();
        flash.Lib.current.addChild(this);
        var archivo:flash.net.URLRequest = new flash.net.URLRequest("audio/intro.mp3");
        var sonido = new flash.media.Sound(archivo);
        Va.canal = sonido.play(0, 10);
        // iniciamos los efectos
        DisplayShortcuts.init();
        ColorShortcuts.init();
        TextShortcuts.init();
        var fondo = new Fondo(); // construimos el fondo
        flash.Lib.current.addChild(fondo);
        Va.fondo = fondo;
    }
   public static function main(){//{{{2
       Va.iniciar();
       Va.todo = new Todo();
   } 
}

//vim: tw=80 ts=4 ai fdm=marker zi
