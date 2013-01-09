// com.adam.utils.HUD// Adam Riggs//package com.app.view{	import com.adam.events.MuleEvent;	import com.adam.utils.Utils;	import com.app.lib.HUDMC;		import flash.display.Sprite;	import flash.events.*;
		public class HUD extends Sprite{				//vars				//objects		private var utils:Utils=Utils.instance;		protected var _hudMC:HUDMC;		protected var _lives:uint;				//const		public const NAME:String="hud";		public const RETURNTYPE:String=NAME;				/** Storage for the singleton instance. */		private static const _instance:HUD = new HUD(HUDLock);				public function HUD(lock:Class){			// Verify that the lock is the correct class reference.			if (lock != HUDLock)			{				throw new Error("Invalid HUD access.  Use HUD.instance instead.");			} else {				init();			}		}		//*****Initialization Routines				public function init():void{			debug("init()");						initVars();			initEvents();			initObjs();		}				private function initVars():void{					}				private function initEvents():void{			utils.em.listen(NAME, onHUD);		}				private function initObjs():void{			_hudMC=new HUDMC();			addChild(_hudMC);		}		//*****Core Functionality				private function setLevel(lvl:uint):void{			_hudMC.levelTxt.text=lvl.toString();		}				private function setLives(lvs:uint):void{			_hudMC.livesTxt.text=lvs.toString();		}		//*****Event Handlers				private function onHUD(e:MuleEvent):void{			/*debug("onHUD()");			debug("e.data.sender=="+e.data.sender);			debug("e.data.type=="+e.data.type);*/			switch(e.data.type){												default:					debug("onHUD()");					debug("*type not found");					debug("e.data.sender=="+e.data.sender);					debug("e.data.type=="+e.data.type);				break;							}		}				//*****Gets and Sets				public static function get instance():HUD{return _instance;}				public function set level(value:uint):void{setLevel(value);}		public function set lives(value:uint):void{setLives(value);}		//*****Utility Functions				//**debug		private function debug(str:String):void{			utils.debug(NAME,str);		}				}//end class}//end packageclass HUDLock{}