package comp
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class PGILabel extends McLabel
   {
      private var _labelField:TextField;
      private var _textFormat:TextFormat;
      
      public function PGILabel(argLabel:String = "", argFontSize:Number = 8)
      {
         _labelField = this["labelField"] as TextField;
         _labelField.mouseEnabled = false;
         _labelField.autoSize = TextFieldAutoSize.LEFT;
         _labelField.text = argLabel;
         _textFormat = new TextFormat();
         fontSize = argFontSize;
      }
      
      public function set label(value:String):void {
         if (_labelField.text == value) return;
         _labelField.text = value;
      }
      
      public function get label():String {
         return _labelField.text;
      }
      
      public function set fontSize(value:Number):void {
         if(value < 1) return;
         _textFormat.size = value;
         _labelField.setTextFormat(_textFormat);
      }
      
      public function set bold(value:Boolean):void {
         _textFormat.bold = value;
         _labelField.setTextFormat(_textFormat);
      }
      
      public function set underline(value:Boolean):void {
         _textFormat.underline = value;
         _labelField.setTextFormat(_textFormat);
      }
      
      public function set wordWrap(value:Boolean):void {
         _labelField.wordWrap = value;
      }
      
      public function set textColor(value:uint):void {
         _labelField.textColor = value;
      }
   }
}