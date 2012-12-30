﻿// com.app.Utils// Adam Riggs//package com.adam.utils{		import com.adam.apis.Flickr;	import com.adam.db.Database;	import com.adam.debug.DebugWindow;	import com.adam.events.EventManager;	import com.adam.fms.FlashMediaServer;		import flash.display.MovieClip;	import flash.display.Sprite;	import flash.events.*;	import flash.xml.*;		public class Utils{				public var main:Sprite;		public var em:EventManager=EventManager.instance;		public var debugWindow:DebugWindow;				/** Storage for the singleton instance. */		private static const _instance:Utils = new Utils( UtilsLock );				public function Utils(lock:Class){			trace("Utils()");						// Verify that the lock is the correct class reference.			if ( lock != UtilsLock )			{				throw new Error( "Invalid Utils access.  Use Utils.instance instead." );			}		}		//*****Initialization functions				public function init():void{			trace("Utils.init()");		}		//*****Core functionality				public function listObject(obj:Object):void{			for (var item:Object in obj) {				trace(item+"=="+obj[item]);			}		}				public function makeButton(mc:MovieClip, obj:Object):void{			mc.buttonMode=true;			mc.addEventListener(MouseEvent.CLICK, obj.onClick);		}				public function makeHoverButton(mc:MovieClip, obj:Object):void{			mc.buttonMode=true;			mc.mouseChildren=false;			mc.overBtn.visible=false;			mc.addEventListener(MouseEvent.CLICK, obj.onClick);			mc.addEventListener(MouseEvent.MOUSE_OVER, onOver);			mc.addEventListener(MouseEvent.MOUSE_OUT, onOut);		}				public function debug(objName:String, str:String):void{			trace(objName+": "+str);			em.dispatch("debug", {msg:str, sender:objName});		}		//*****Event Handlers				private function onOver(e:MouseEvent):void{			e.currentTarget.overBtn.visible=true;		}				private function onOut(e:MouseEvent):void{			e.currentTarget.overBtn.visible=false;		}		//*****Gets and sets				public static function get instance():Utils		{			return _instance;		}			}}class UtilsLock{} 