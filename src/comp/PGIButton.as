package comp {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	import mx.core.ButtonAsset;
	
	public class PGIButton extends EventDispatcher {
		
		private var _mcButton:MovieClip;
      private var _labelField:TextField;
		
		public function PGIButton(argButtonClass:Class = null, argLabel:String = "", isActive:Boolean = true):void {
         if(argButtonClass != null) {
            _mcButton = new argButtonClass();
            onMouseOut(null);
         } else {
            _mcButton = new McButton();
            _labelField = (_mcButton.getChildAt(1) as MovieClip).getChildAt(0) as TextField;
            _labelField.mouseEnabled = false;
            _labelField.autoSize = TextFieldAutoSize.LEFT;
            _labelField.text = argLabel;
         }
         _mcButton.buttonMode = true;
         _mcButton.addEventListener(MouseEvent.ROLL_OVER, onMouseOver);
         _mcButton.addEventListener(MouseEvent.ROLL_OUT, onMouseOut);
         _mcButton.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
         _mcButton.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			
			if (isActive) {
				active = true;
			}
		}	
      
		public function get content():MovieClip {
			return _mcButton;
		}
      
      public function get label():String {
         return _labelField.text;
      }
      
      public function set label(value:String):void {
         _labelField.text = value;
      }
		
		/*private function disableText(obj:Sprite):void {
			for(var i:int = 0; i < obj.numChildren; i++){
				if(obj.getChildAt(i) is TextField){
					(obj.getChildAt(i) as TextField).mouseEnabled = false;
				} else if(obj.getChildAt(i) is Sprite){
					disableText(obj.getChildAt(i) as Sprite);
				}
			}
		}*/
		
		private function onMouseOver(e:Event):void {
			if(_mcButton.currentLabel != 'inactive') {
            _mcButton.gotoAndStop('over');
			}
		}
		
		private function onMouseOut(e:Event):void {
			if(_mcButton.currentLabel != 'inactive') {
            _mcButton.gotoAndStop('up');
			}
		}
		
		private function onMouseDown(e:Event):void {
			if(_mcButton.currentLabel != 'inactive') {
            _mcButton.gotoAndStop('down');
			}
		}
		
		private function onMouseUp(e:Event):void {
			if(_mcButton.currentLabel != 'inactive') {
            _mcButton.gotoAndStop('up');
			}
		}
		
		public function hide():void {
         _mcButton.visible = false;
		}
		
		public function get visible():Boolean {
			return _mcButton.visible;
		}
		
		public function set active(isActive:Boolean):void {
			if (isActive) {
            _mcButton.visible = true;
            _mcButton.gotoAndStop('up');
            _mcButton.useHandCursor = true;
            _mcButton.addEventListener(MouseEvent.CLICK, onMouseClick);
				return;
			}
         _mcButton.visible = true;
         _mcButton.gotoAndStop('inactive');
         _mcButton.useHandCursor = false;
			if (_mcButton.hasEventListener(MouseEvent.CLICK)) {
            _mcButton.removeEventListener(MouseEvent.CLICK, onMouseClick);
			}
		}
		
		private function onMouseClick(e:Event):void {
			dispatchEvent(new MouseEvent(MouseEvent.CLICK));
		}
      
      public function set height(value:Number):void {
         _mcButton.height = value;
      }
      
      public function set width(value:Number):void {
         _mcButton.width = value;
      }
      
      public function get x():Number { 
         return _mcButton.x; 
      }
      
      public function set x(value:Number):void {
         _mcButton.x = value;
      }
      
      public function get y():Number { 
         return _mcButton.y; 
      }
      
      public function set y(value:Number):void {
         _mcButton.y = value;
      }
      
      public function get bottom():Number { 
         return _mcButton.y + _mcButton.height; 
      }
	}
}