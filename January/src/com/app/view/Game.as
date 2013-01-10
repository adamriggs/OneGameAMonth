// com.adam.utils.Game// Adam Riggs//package com.app.view {	import com.adam.events.MuleEvent;	import com.adam.utils.Utils;	import com.app.controller.AsteroidManager;	import com.app.controller.KeyboardController;	import com.app.controller.ShotManager;	import com.app.model.Model;		import flash.display.Sprite;	import flash.events.*;
		public class Game extends Sprite{				//vars		protected var _teleportReady:Boolean;		protected var _fireCount:uint;		protected var _fireDelay:uint;		protected var _levelOver:Boolean;		protected var _levelCount:uint;		public var gamePaused:Boolean;				protected var i:uint;				//objects		private var utils:Utils=Utils.instance;		protected var model:Model=Model.instance;		protected var kc:KeyboardController=KeyboardController.instance;		protected var sm:ShotManager=ShotManager.instance;		protected var am:AsteroidManager=AsteroidManager.instance;		protected var ship:Ship;		protected var hud:HUD=HUD.instance;				//const		public const NAME:String="game";		public const RETURNTYPE:String=NAME;				/** Storage for the singleton instance. */		private static const _instance:Game = new Game(GameLock);				public function Game(lock:Class){			// Verify that the lock is the correct class reference.			if (lock != GameLock)			{				throw new Error("Invalid Game access.  Use Game.instance instead.");			} else {				init();			}		}		//*****Initialization Routines				public function init():void{			debug("init()");						initVars();			initEvents();			initObjs();		}				private function initVars():void{			_teleportReady=false;			_fireCount=0;			_fireDelay=4;			_levelOver=false;			_levelCount=0;			gamePaused=true;		}				private function initEvents():void{			utils.em.listen(NAME, onGame);		}				private function initObjs():void{			ship=new Ship();			addChild(ship);						ship.x=(model.stageWidth)/2;			ship.y=(model.stageHeight)/2;						addChild(hud);			hud.lives=model.startingLives;						nextLevel();		}		//*****Core Functionality				protected function nextLevel():void{			am.populate();			_levelCount++;			hud.level=_levelCount;			debug("_levelCount=="+_levelCount);		}				public function render():void{			if(!gamePaused){				if(kc.keyRight){ship.rotation+=ship.rotationSpeed;}				if(kc.keyLeft){ship.rotation-=ship.rotationSpeed;}				if(kc.keyUp){ship.accelerate();}				if(kc.keyDown){_teleportReady=true;}								if(kc.keyFire){					if(_fireCount==0){						ship.fire();					}										_fireCount++;										if(_fireCount>_fireDelay){						_fireCount=0;					}				}								if(!kc.keyDown&&_teleportReady){					_teleportReady=false;					ship.teleport();				}								ship.friction();				ship.x+=ship.speedX;				ship.y+=ship.speedY;								if(ship.x>model.stageWidth+(ship.width/2)){ship.x=-(ship.width/2);}				if(ship.x<-(ship.width/2)){ship.x=model.stageWidth+(ship.width/2);}								if(ship.y>model.stageHeight+(ship.height/2)){ship.y=-(ship.height/2);}				if(ship.y<-(ship.height/2)){ship.y=model.stageHeight+(ship.height/2);}								for(i=0;i<sm.shots.length;i++){					if(sm.shots[i].active){sm.shots[i].move();}										for(var j:uint=0;j<am.asteroids.length;j++){						if(sm.shots[i].hitTestObject(am.asteroids[j]) && am.asteroids[j].active && sm.shots[i].active){							am.asteroids[j].gotShot();							sm.shots[i].deactivate();						}												if(ship.hitTestObject(am.asteroids[j]) && am.asteroids[j].active){							ship.gotHit();						}					}				}								for(i=0;i<am.asteroids.length;i++){										if(ship.hitTestObject(am.asteroids[i]) && am.asteroids[i].active){						ship.gotHit();					}				}								_levelOver=true;				for(i=0;i<am.asteroids.length;i++){					if(am.asteroids[i].active){						am.asteroids[i].move();						_levelOver=false;					}				}								if(_levelOver){					nextLevel();				}			}		}		//*****Event Handlers				private function onGame(e:MuleEvent):void{			/*debug("onGame()");			debug("e.data.sender=="+e.data.sender);			debug("e.data.type=="+e.data.type);*/			switch(e.data.type){												default:					debug("onGame()");					debug("*type not found");					debug("e.data.sender=="+e.data.sender);					debug("e.data.type=="+e.data.type);				break;							}		}				//*****Gets and Sets				public static function get instance():Game{return _instance;}		//*****Utility Functions				//**debug		private function debug(str:String):void{			utils.debug(NAME,str);		}				}//end class}//end packageclass GameLock{}