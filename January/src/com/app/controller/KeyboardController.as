// com.adam.utils.KeyboardController// Adam Riggs//package com.app.controller {	import com.adam.events.MuleEvent;	import com.adam.utils.Utils;		import flash.display.Stage;	import flash.events.*;	import flash.ui.Keyboard;
		public class KeyboardController{				//vars		protected var _keyUp:Boolean;		protected var _keyDown:Boolean;		protected var _keyLeft:Boolean;		protected var _keyRight:Boolean;		protected var _keyFire:Boolean;				//objects		private var utils:Utils=Utils.instance;		protected var _stage:Stage;				//const		public const NAME:String="keyboardController";		public const RETURNTYPE:String=NAME;				/** Storage for the singleton instance. */		private static const _instance:KeyboardController = new KeyboardController(KeyboardControllerLock);				public function KeyboardController(lock:Class){			// Verify that the lock is the correct class reference.			if (lock != KeyboardControllerLock)			{				throw new Error("Invalid KeyboardController access.  Use KeyboardController.instance instead.");			} else {				init();			}		}		//*****Initialization Routines				public function init():void{			debug("init()");						initVars();			initEvents();			initObjs();		}				private function initVars():void{					}				private function initEvents():void{			utils.em.listen(NAME, onKeyboardController);		}				private function initObjs():void{					}		//*****Core Functionality				protected function setStage(stg:Stage):void{			_stage=stg;			_stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);			_stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);		}		//*****Event Handlers				protected function onKeyDown(e:KeyboardEvent):void{			//push the keycode into an array, checking if it's not already in there firt.			//debug("onKeyDown "+e.keyCode);						// alternate "fire" buttons			if (e.ctrlKey || 				e.altKey || 				e.shiftKey)				_keyFire=true;						// key codes that support international keyboards:			// QWERTY = W A S D			// AZERTY = Z Q S D			// DVORAK = , A O E						switch(e.keyCode){								case Keyboard.UP:				case 87: // W				case 90: // Z				case 188:// ,					_keyUp=true;					break;								case Keyboard.DOWN:				case 83: // S				case 79: // O					_keyDown=true;					break;								case Keyboard.LEFT:				case 65: // A				case 81: // Q					_keyLeft=true;					break;								case Keyboard.RIGHT:				case 68: // D				case 69: // E					_keyRight=true;					break;								case Keyboard.SPACE:				case Keyboard.SHIFT:				case Keyboard.CONTROL:				case Keyboard.ENTER:				case 88: // x				case 67: // c					_keyFire=true;					break;											}		}				protected function onKeyUp(e:KeyboardEvent):void{			//slice the keycode out of the array, checking if it's in there first.			//debug("onKeyUp "+e.keyCode);						// alternate "fire" buttons			if (e.ctrlKey || 				e.altKey || 				e.shiftKey)				_keyFire=false;						// key codes that support international keyboards:			// QWERTY = W A S D			// AZERTY = Z Q S D			// DVORAK = , A O E						switch(e.keyCode){								case Keyboard.UP:				case 87: // W				case 90: // Z				case 188:// ,					_keyUp=false;					break;								case Keyboard.DOWN:				case 83: // S				case 79: // O					_keyDown=false;					break;								case Keyboard.LEFT:				case 65: // A				case 81: // Q					_keyLeft=false;					break;								case Keyboard.RIGHT:				case 68: // D				case 69: // E					_keyRight=false;					break;								case Keyboard.SPACE:				case Keyboard.SHIFT:				case Keyboard.CONTROL:				case Keyboard.ENTER:				case 88: // x				case 67: // c					_keyFire=false;					break;											}		}				private function onKeyboardController(e:MuleEvent):void{			/*debug("onKeyboardController()");			debug("e.data.sender=="+e.data.sender);			debug("e.data.type=="+e.data.type);*/			switch(e.data.type){												default:					debug("onKeyboardController()");					debug("*type not found");					debug("e.data.sender=="+e.data.sender);					debug("e.data.type=="+e.data.type);				break;							}		}				//*****Gets and Sets				public static function get instance():KeyboardController{return _instance;}				public function get keyUp():Boolean{return _keyUp;}		public function get keyDown():Boolean{return _keyDown;}		public function get keyLeft():Boolean{return _keyLeft;}		public function get keyRight():Boolean{return _keyRight;}		public function get keyFire():Boolean{return _keyFire;}				public function set stage(value:Stage):void{setStage(value);}		//*****Utility Functions				//**debug		private function debug(str:String):void{			utils.debug(NAME,str);		}				}//end class}//end packageclass KeyboardControllerLock{}