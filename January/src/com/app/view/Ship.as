// com.adam.utils.Ship// Adam Riggs//package com.app.view {	import com.adam.events.MuleEvent;	import com.adam.utils.Utils;	import com.greensock.TweenLite;		import flash.display.Sprite;	import flash.events.*;		public class Ship extends Sprite {				//vars				//objects		private var utils:Utils=Utils.instance;				//const		public const NAME:String="ship";		public const RETURNTYPE:String=NAME;				public function Ship(){						init();		}		//*****Initialization Routines				public function init():void{			debug("init()");						initVars();			initEvents();			initObjs();		}				private function initVars():void{					}				private function initEvents():void{			utils.em.listen(NAME, onShip);		}				private function initObjs():void{					}		//*****Core Functionality						//*****Event Handlers				private function onShip(e:MuleEvent):void{			/*debug("onShip()");			debug("e.data.sender=="+e.data.sender);			debug("e.data.type=="+e.data.type);*/			switch(e.data.type){																default:					debug("onShip()");					debug("*type not found");					debug("e.data.sender=="+e.data.sender);					debug("e.data.type=="+e.data.type);				break;							}		}				//*****Gets and Sets						//*****Utility Functions				//**visibility		public function show():void{			this.visible = true;		}				public function hide():void{			this.visible = false;		}				//**debug		private function debug(str:String):void{			utils.debug(NAME,str);		}				}//end class}//end package