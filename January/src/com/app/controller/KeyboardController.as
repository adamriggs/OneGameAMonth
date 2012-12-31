// com.adam.utils.KeyboardController// Adam Riggs//package com.adam.utils {	import com.adam.events.MuleEvent;	import com.adam.utils.Utils;		import flash.events.*;		public class KeyboardController{				//vars				//objects		private var utils:Utils=Utils.instance;				//const		public const NAME:String="keyboardController";		public const RETURNTYPE:String=NAME;				/** Storage for the singleton instance. */		private static const _instance:KeyboardController = new KeyboardController(KeyboardControllerLock);				public function KeyboardController(lock:Class){			// Verify that the lock is the correct class reference.			if (lock != KeyboardControllerLock)			{				throw new Error("Invalid KeyboardController access.  Use KeyboardController.instance instead.");			} else {				init();			}		}		//*****Initialization Routines				public function init():void{			debug("init()");						initVars();			initEvents();			initObjs();		}				private function initVars():void{					}				private function initEvents():void{			utils.em.listen(NAME, onKeyboardController);		}				private function initObjs():void{					}		//*****Core Functionality						//*****Event Handlers				private function onKeyboardController(e:MuleEvent):void{			/*debug("onKeyboardController()");			debug("e.data.sender=="+e.data.sender);			debug("e.data.type=="+e.data.type);*/			switch(e.data.type){												default:					debug("onKeyboardController()");					debug("*type not found");					debug("e.data.sender=="+e.data.sender);					debug("e.data.type=="+e.data.type);				break;							}		}				//*****Gets and Sets				public static function get instance():KeyboardController{return _instance;}		//*****Utility Functions				//**debug		private function debug(str:String):void{			utils.debug(NAME,str);		}				}//end class}//end packageclass KeyboardControllerLock{}