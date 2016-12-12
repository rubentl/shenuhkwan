package;

import flash.display.Loader;
import flash.display.Sprite;
import flash.net.URLRequest;
import flash.net.URLVariables;
import flash.net.URLLoader;
import flash.utils.Timer;
import flash.events.TimerEvent;
import flash.text.TextField;
import flash.text.TextFormat;

class Libro {
    public static var mc:flash.display.MovieClip;
    public static var tempo:Timer = new Timer(3000, 1); 
    public static var avisoTxt:TextField = new TextField();
    public static var mensajeTxt:TextField = new TextField();
    public static var emailTxt:TextField = new TextField();
    public static var nombreTxt:TextField = new TextField();
    public static function main() {

	mc = flash.Lib.current;
	
	var fondo:Loader = new Loader();
	fondo.load(new URLRequest("../imagenes/libro/fondo.jpeg"));
	fondo.x = fondo.y = 0;
	mc.addChild(fondo);

	var borrar:Loader = new Loader();
	borrar.load(new URLRequest("../imagenes/libro/borrar.png"));
	borrar.x = 600;
	borrar.y = 400;
	mc.addChild(borrar);

	var enviar:Loader = new Loader();
	enviar.load(new URLRequest("../imagenes/libro/enviar.png"));
	enviar.x = 600; 
	enviar.y = 500;
	mc.addChild(enviar);

	enviar.addEventListener(flash.events.MouseEvent.ROLL_OVER, mouseOVER);
	enviar.addEventListener(flash.events.MouseEvent.ROLL_OUT, mouseOUT);
	enviar.addEventListener(flash.events.MouseEvent.CLICK, enviaMensaje);
	mc.addChild(enviar);
	
	borrar.addEventListener(flash.events.MouseEvent.ROLL_OVER, mouseOVER);
	borrar.addEventListener(flash.events.MouseEvent.ROLL_OUT, mouseOUT);
	borrar.addEventListener(flash.events.MouseEvent.CLICK, limpiaCampos);
	mc.addChild(borrar);
	
	tempo.addEventListener( TimerEvent.TIMER, limpiaAviso );
	
	var formato:TextFormat = new TextFormat();
	formato.color = 0xffffff;
	formato.size = 20;
	formato.bold = true;

	avisoTxt.defaultTextFormat = formato;
	avisoTxt.x = 30;
	avisoTxt.y = 200;
	avisoTxt.border = false;
	avisoTxt.multiline = false;
	avisoTxt.width = 300;
	avisoTxt.height = 40;
	avisoTxt.type = flash.text.TextFieldType.DYNAMIC;

	nombreTxt.defaultTextFormat = formato;
	nombreTxt.x = 160;
	nombreTxt.y = 85;
	nombreTxt.border = true;
	nombreTxt.borderColor = 0xffffff;
	nombreTxt.multiline = false;
	nombreTxt.width = 300;
	nombreTxt.height = 40;
	nombreTxt.type = flash.text.TextFieldType.INPUT;

	emailTxt.defaultTextFormat = formato;
	emailTxt.x = 160;
	emailTxt.y = 130;
	emailTxt.border = true;
	emailTxt.borderColor = 0xffffff;
	emailTxt.multiline = false;
	emailTxt.width = 300;
	emailTxt.height = 40;
	emailTxt.type = flash.text.TextFieldType.INPUT;

	mensajeTxt.defaultTextFormat = formato;
	mensajeTxt.x = 220;
	mensajeTxt.y = 380;
	mensajeTxt.multiline = true;
	mensajeTxt.wordWrap = true;
	mensajeTxt.border = true;
	mensajeTxt.borderColor = 0xffffff;
	mensajeTxt.width = 370;
	mensajeTxt.height = 200;
	mensajeTxt.type = flash.text.TextFieldType.INPUT;

	mc.addChild(avisoTxt);
	mc.addChild(nombreTxt);
	mc.addChild(emailTxt);
	mc.addChild(mensajeTxt);

    }

    public static function mouseOVER(arg1:flash.events.Event){
	arg1.currentTarget.scaleX = arg1.currentTarget.scaleY += 0.3; 
	arg1.currentTarget.filters = [new flash.filters.GlowFilter(0x0000ff, 0.5, 50, 50)];
    }

    public static function mouseOUT(arg1:flash.events.Event){
	arg1.currentTarget.scaleX = arg1.currentTarget.scaleY -= 0.3; 
	arg1.currentTarget.filters = [];
    }

    public static function enviaMensaje(arg1:flash.events.Event){
	if(nombreTxt.text == "" ||  emailTxt.text  == "" || mensajeTxt.text  ==  "")
	{   avisoTxt.htmlText  =  "<b>Rellena todos los campos.</b>";
	  limpiaAviso(null);
	}
	else enviaDadosParaPHP();
    }

    public static function   limpiaCampos(arg1:flash.events.Event){
	nombreTxt.text  =  emailTxt.text  =  mensajeTxt.text  = "";
    }

    public static function limpiaAviso(e:TimerEvent){
	avisoTxt.text  = "";   
    }   	
	
    public static function   enviaDadosParaPHP(){            
	avisoTxt.htmlText   =   "<b>Enviando   mensaje...</b>";                        
	var   variaveis:URLVariables   =   new   URLVariables();
	variaveis.nombrePhp   =   nombreTxt.text;
	variaveis.emailPhp   =   emailTxt.text;                     
	variaveis.mensajePhp   =   mensajeTxt.text;                                          
	var   urlPhp:URLRequest   =   new   URLRequest("correo.php");                     
	urlPhp.method   = flash.net.URLRequestMethod.POST;                     
	urlPhp.data   =   variaveis;                                          
        var receptor:URLLoader = new URLLoader(); 
	//receptor.dataFormat = flash.net.URLLoaderDataFormat.VARIABLES;
	receptor.addEventListener( flash.events.Event.COMPLETE,   envio   );                        
	receptor.addEventListener( flash.events.IOErrorEvent.IO_ERROR,   erroNoEnvio   );                        
	receptor.load(   urlPhp   );  
    }      
    
    public static function   envio(   e:flash.events.Event   ){
	avisoTxt.htmlText   =   "<b> ¡Mensaje   enviado!</b>";            
	limpiaCampos(null);               
	tempo.start();
    }      
    
    public static function   erroNoEnvio(   e:flash.events.IOErrorEvent   ){            
	avisoTxt.htmlText   =   "<b>Error   intenta   nuevamente.</b>";               
	tempo.start();   
    }

}
