// com.adam.utils.ShotManager// Adam Riggs//package com.app.controller {	import com.adam.events.MuleEvent;	import com.adam.utils.Utils;	import com.app.view.weapons.Shot;		import flash.display.Stage;	import flash.events.*;
		public class ShotManager{				//vars		protected var _fireCount:uint;		protected var _fireDelay:uint;				//objects		private var utils:Utils=Utils.instance;		protected var _shots:Vector.<Shot>;		protected var _stage:Stage;				//const		public const NAME:String="shotManager";		public const RETURNTYPE:String=NAME;				/** Storage for the singleton instance. */		private static const _instance:ShotManager = new ShotManager(ShotManagerLock);				public function ShotManager(lock:Class){			// Verify that the lock is the correct class reference.			if (lock != ShotManagerLock)			{				throw new Error("Invalid ShotManager access.  Use ShotManager.instance instead.");			} else {				init();			}		}		//*****Initialization Routines				public function init():void{			debug("init()");						initVars();			initEvents();			initObjs();		}				private function initVars():void{						_fireCount=0;			_fireDelay=4;		}				private function initEvents():void{			utils.em.listen(NAME, onShotManager);		}				private function initObjs():void{			_shots=new Vector.<Shot>;		}		//*****Core Functionality				public function shoot(x:Number,y:Number,rot:Number):void{			var len:uint=_shots.length;//			debug("x=="+x);//			debug("y=="+y);//			debug("rot=="+rot);			//debug("len=="+len);									if(_fireCount==0){				for(var i:uint=0;i<len;i++){					if(!_shots[i].active){						//debug("inactive");						setupShot(i,x,y,rot);						break;					}					//debug("after if");				}								if(i==len){					_shots.push(new Shot());					setupShot(len,x,y,rot);					_stage.addChildAt(_shots[len],0);				}			}								_fireCount++;								if(_fireCount>_fireDelay){					_fireCount=0;				}		}				protected function setupShot(idx:uint, x:Number, y:Number, rot:Number):void{			_shots[idx].rotation=rot;			_shots[idx].x=x;			_shots[idx].y=y;			_shots[idx].fire();		}				protected function resetFireCount():void{			_fireCount=0;		}		//*****Event Handlers				private function onShotManager(e:MuleEvent):void{			/*debug("onShotManager()");			debug("e.data.sender=="+e.data.sender);			debug("e.data.type=="+e.data.type);*/			switch(e.data.type){								case "shootStart":					shoot(e.data.x,e.data.y,e.data.rot);					break;								case "shootStop":					resetFireCount();					break;								default:					debug("onShotManager()");					debug("*type not found");					debug("e.data.sender=="+e.data.sender);					debug("e.data.type=="+e.data.type);				break;							}		}				//*****Gets and Sets				public static function get instance():ShotManager{return _instance;}				public function get shots():Vector.<Shot>{return _shots;}				public function set stage(value:Stage):void{_stage=value;}		//*****Utility Functions				//**debug		private function debug(str:String):void{			utils.debug(NAME,str);		}				}//end class}//end packageclass ShotManagerLock{}