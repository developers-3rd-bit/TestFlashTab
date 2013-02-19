package comp
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   import flashx.textLayout.formats.TextAlign;
   
   public class PGITab extends Sprite
   {
      private var _label:String = "";
      private var _labelField:TextField;
      private var _textFormat:TextFormat;
      private var _leftVerticalLine:PgiLine;
      private var _rightVerticalLine:PgiLine;
      private var _topHorizontalLine:PgiLine;
      private var _bottomHorizontalLine:PgiLine;
      private var _hGroup:PGIHGroup;
      private var _vGroup:PGIVGroup;
      
      public function PGITab(argLabel:String, argWidth:Number)
      {
         _label = argLabel;
         this.buttonMode = true;
         _labelField = new TextField();
         _labelField.mouseEnabled = false;
         _labelField.text = _label;
         _labelField.textColor = 0x00FF00;
         _labelField.height = 15;
         _textFormat = new TextFormat();
         _textFormat.align = TextAlign.CENTER;
         _textFormat.size = 10;
         _labelField.setTextFormat(_textFormat);
         _vGroup = new PGIVGroup(this);
         _vGroup.verticalGap = 0;
         _hGroup = new PGIHGroup(this);
         _hGroup.top = 0;
         _topHorizontalLine = new PgiLine();
         _vGroup.addChild(_topHorizontalLine);
         _leftVerticalLine = new PgiLine();
         _leftVerticalLine.drawVerticalLine(16);
         _hGroup.addChild(_leftVerticalLine);
         _hGroup.addChild(_labelField);
         _rightVerticalLine = new PgiLine();
         _rightVerticalLine.drawVerticalLine(16);
         _hGroup.addChild(_rightVerticalLine);
         _vGroup.addChild(_hGroup);
         _bottomHorizontalLine = new PgiLine();
         _topHorizontalLine.drawHorizontalLine(_rightVerticalLine.x);
         _bottomHorizontalLine.drawHorizontalLine(_rightVerticalLine.x);
         _vGroup.addChild(_bottomHorizontalLine);
         _leftVerticalLine.visible = false;
         _rightVerticalLine.visible = false;
         _topHorizontalLine.visible = false;
         this.addChild(_vGroup);
         width = argWidth;
         this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver, false, 0, true);
         this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut, false, 0, true);
      }
      
      public function set active(argObject:Object):void {
         if (argObject == this) {
            _leftVerticalLine.visible = true;
            _rightVerticalLine.visible = true;
            _topHorizontalLine.visible = true;
            _bottomHorizontalLine.visible = false;
            _labelField.textColor = 0x000000;
            this.buttonMode = false;
            this.removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            this.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
         } else {
            _leftVerticalLine.visible = false;
            _rightVerticalLine.visible = false;
            _topHorizontalLine.visible = false;
            _bottomHorizontalLine.visible = true;
            this.buttonMode = true;
            _labelField.textColor = 0x00FF00;
            this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver, false, 0, true);
            this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut, false, 0, true);
         }
      }
      
      public function set label(value:String):void {
         if (_label == value) return;
         _label = value;
         _labelField.text = value;
         _labelField.setTextFormat(_textFormat);
      }
      
      public function get label():String {
         return _label;
      }
      
      public function set tabWidth(value:Number):void {
         width = value;
         _topHorizontalLine.drawHorizontalLine(_rightVerticalLine.x);
         _bottomHorizontalLine.drawHorizontalLine(_rightVerticalLine.x);
      }
      
      private function onMouseOver(event:Event):void {
         _labelField.textColor = 0x0000FF;
      }
      
      private function onMouseOut(event:Event):void {
         _labelField.textColor = 0x00FF00;
      }
      
   }
}