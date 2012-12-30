﻿// com.app.view.View// Adam Riggs//package com.app.view {	import com.adam.events.MuleEvent;	import com.adam.utils.Utils;		import flash.display.Sprite;	import flash.events.*;		public class View extends Sprite{				//vars				//objects		private var utils:Utils=Utils.instance;				//const		public const NAME:String="view";		public const RETURNTYPE:String=NAME;				/** Storage for the singleton instance. */		private static const _instance:View = new View(ViewLock);				public function View(lock:Class){			// Verify that the lock is the correct class reference.			if (lock != ViewLock)			{				throw new Error("Invalid View access.  Use View.instance instead.");			} else {				//init();			}		}		//*****Initialization Routines				public function init():void{			debug("init()");						initVars();			initEvents();			initObjs();		}				private function initVars():void{					}				private function initEvents():void{			utils.em.listen(NAME, onView);		}				private function initObjs():void{					}		//*****Core Functionality						//*****Event Handlers				private function onView(e:MuleEvent):void{			/*debug("onView()");			debug("e.data.sender=="+e.data.sender);			debug("e.data.type=="+e.data.type);*/			switch(e.data.type){								default:					debug("onView()");					debug("*type not found");					debug("e.data.sender=="+e.data.sender);					debug("e.data.type=="+e.data.type);					break;							}		}				//*****Gets and Sets				public static function get instance():View{return _instance;}		//*****Utility Functions				//**visibility		public function show():void{			this.visible = true;		}				public function hide():void{			this.visible = false;		}				//**debug		private function debug(str:String):void{			utils.debug(NAME,str);		}				}//end class}//end packageclass ViewLock{}