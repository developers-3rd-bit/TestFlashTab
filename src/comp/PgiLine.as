package comp
{
   import flash.display.BlendMode;
   import flash.display.CapsStyle;
   import flash.display.Sprite;
   
   public class PgiLine extends Sprite
   {
      public function PgiLine()
      {
         super();
      }
      
      public function drawHorizontalLine(argX:Number):void {
         graphics.clear();
         graphics.lineStyle(1, 0x000000, .5, false, BlendMode.NORMAL, CapsStyle.NONE);
         graphics.moveTo(0, 0);
         graphics.lineTo(argX, 0);
      }
      
      public function drawVerticalLine(argY:Number):void {
         graphics.clear();
         graphics.lineStyle(1, 0x000000, .5, false, BlendMode.NORMAL, CapsStyle.NONE);
         graphics.moveTo(0, 0);
         graphics.lineTo(0, argY);
      }
   }
}