// com.adam.utils.Ship// Adam Riggs//package com.app.view {	import com.adam.events.MuleEvent;	import com.adam.utils.Utils;	import com.app.lib.Spaceship;	import com.greensock.TweenLite;		import flash.display.Sprite;	import flash.events.*;		public class Ship extends Sprite {				//vars		protected var _rotationSpeed:Number;		protected var _speedX:Number;		protected var _speedY:Number;		protected var _speedZ:Number;		protected var _velocity:Number;		protected var _acceleration:Number;		protected var _maxVelocity:Number;				//objects		private var utils:Utils=Utils.instance;		protected var spaceship:Spaceship;				//const		public const NAME:String="ship";		public const RETURNTYPE:String=NAME;				public function Ship(){						init();		}		//*****Initialization Routines				public function init():void{			debug("init()");						initVars();			initEvents();			initObjs();		}				private function initVars():void{			_rotationSpeed=10;					}				private function initEvents():void{			utils.em.listen(NAME, onShip);		}				private function initObjs():void{			spaceship=new Spaceship();			addChild(spaceship);			spaceship.x=-(spaceship.width/2);			spaceship.y=-(spaceship.height/2);		}		//*****Core Functionality				public function accelerate():void{					}		//*****Event Handlers				private function onShip(e:MuleEvent):void{			/*debug("onShip()");			debug("e.data.sender=="+e.data.sender);			debug("e.data.type=="+e.data.type);*/			switch(e.data.type){																default:					debug("onShip()");					debug("*type not found");					debug("e.data.sender=="+e.data.sender);					debug("e.data.type=="+e.data.type);				break;							}		}				//*****Gets and Sets				public function get rotationSpeed():Number{return _rotationSpeed;}		//*****Utility Functions				//**visibility		public function show():void{			this.visible = true;		}				public function hide():void{			this.visible = false;		}				//**debug		private function debug(str:String):void{			utils.debug(NAME,str);		}				}//end class}//end package