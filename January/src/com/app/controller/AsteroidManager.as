// com.adam.utils.AsteroidManager// Adam Riggs//package com.app.controller{	import com.adam.events.MuleEvent;	import com.adam.utils.Utils;	import com.app.model.Model;	import com.app.view.Asteroid;		import flash.display.Stage;	import flash.events.*;
		public class AsteroidManager{				//vars		protected var _asteroidCount:uint;		protected var _asteroidAngle:Number;		protected var _asteroidVelocity:Number;		protected var _asteroids:Vector.<Asteroid>;				//objects		private var utils:Utils=Utils.instance;		protected var model:Model=Model.instance;		protected var _stage:Stage;				//const		public const NAME:String="asteroidManager";		public const RETURNTYPE:String=NAME;				public static const SMALL:String="small";		public static const MEDIUM:String="medium";		public static const LARGE:String="large";				/** Storage for the singleton instance. */		private static const _instance:AsteroidManager = new AsteroidManager(AsteroidManagerLock);				public function AsteroidManager(lock:Class){			// Verify that the lock is the correct class reference.			if (lock != AsteroidManagerLock)			{				throw new Error("Invalid AsteroidManager access.  Use AsteroidManager.instance instead.");			} else {				init();			}		}		//*****Initialization Routines				public function init():void{			debug("init()");						initVars();			initEvents();			initObjs();		}				private function initVars():void{			_asteroidCount=model.asteroidCount;			_asteroidVelocity=model.asteroidVelocity;			_asteroidAngle=model.asteroidAngle;		}				private function initEvents():void{			utils.em.listen(NAME, onAsteroidManager);		}				private function initObjs():void{			_asteroids=new Vector.<Asteroid>;		}		//*****Core Functionality				protected function getAsteroid():uint{						var len:uint=_asteroids.length				//debug("len=="+len);						for(var i:uint=0;i<len;i++){				if(!_asteroids[i].active){					//debug("i=="+i);					return i;					break;				}			}			//debug("i=="+i);			if(i==len){				_asteroids.push(new Asteroid());				return _asteroids.length-1;			}						return 0;		}				public function populate():void{						for(var i:uint=0;i<_asteroidCount;i++){				var idx:uint=getAsteroid();				//debug("idx=="+idx);				_asteroids[idx].x=Math.random()*model.asteroidBeltWidth;				if(Math.random()>.5){_asteroids[idx].x+=(model.stageWidth-model.asteroidBeltWidth);}				_asteroids[idx].y=Math.random()*model.stageHeight;				_asteroids[idx].velocity=_asteroidVelocity;				_asteroids[idx].angle=_asteroidAngle;				_asteroids[idx].setSize(AsteroidManager.LARGE);				if(!_asteroids[idx].stage){					_stage.addChildAt(_asteroids[idx],0);				}				_asteroids[idx].activate();			}						//setAsteroidVariables();		}		//		public function setAsteroidVariables():void{//			for(var i:uint=0;i<_asteroids.length;i++){//			}//		}				public function spawn(x:Number, y:Number, size:String):void{			if(size==LARGE || size==MEDIUM){				for(var i:uint=0;i<model.asteroidSpawncount;i++){					//debug("i=="+i);					var idx:uint=getAsteroid();					_asteroids[idx].activate();					_asteroids[idx].velocity=_asteroidVelocity;					_asteroids[idx].angle=_asteroidAngle;					_asteroids[idx].x=x+(Math.random()*10);					_asteroids[idx].y=y+(Math.random()*10);					if(size==LARGE){						_asteroids[idx].setSize(MEDIUM);					} else {						_asteroids[idx].setSize(SMALL);					}					if(!_asteroids[idx].stage){						_stage.addChildAt(_asteroids[idx],0);					}				}			}		}		//*****Event Handlers				private function onAsteroidManager(e:MuleEvent):void{			/*debug("onAsteroidManager()");			debug("e.data.sender=="+e.data.sender);			debug("e.data.type=="+e.data.type);*/			switch(e.data.type){												default:					debug("onAsteroidManager()");					debug("*type not found");					debug("e.data.sender=="+e.data.sender);					debug("e.data.type=="+e.data.type);				break;							}		}				//*****Gets and Sets				public static function get instance():AsteroidManager{return _instance;}				public function get asteroids():Vector.<Asteroid>{return _asteroids;}				public function set stage(value:Stage):void{_stage=value;}		//*****Utility Functions				//**debug		private function debug(str:String):void{			utils.debug(NAME,str);		}				}//end class}//end packageclass AsteroidManagerLock{}