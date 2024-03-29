package comp
{
   import com.soma.ui.layouts.VBoxUI;
   import com.soma.ui.vo.GapUI;
   import com.soma.ui.vo.PaddingUI;
   
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   
   public class PGIVGroup extends VBoxUI
   {
      private var _gapUI:GapUI;
      private var _paddingUI:PaddingUI;
      
      public function PGIVGroup(reference:DisplayObjectContainer, width:Number = 15, height:Number = 15)
      {
         super(reference, width, height);
         _gapUI = new GapUI();
         _paddingUI = new PaddingUI();
      }
      
      public function set verticalGap(value:Number):void {
         _gapUI.vertical = value;
         childrenGap = _gapUI;
         refresh();
      }
      
      public function set horizontalgap(value:Number):void {
         _gapUI.horizontal = value;
         childrenGap = _gapUI;
         refresh();
      }
      
      public function set paddingLeft(value:Number):void {
         _paddingUI.left = value;
         childrenGap = _gapUI;
         refresh();
      }
      
      public function set paddingRight(value:Number):void {
         _paddingUI.right = value;
         childrenGap = _gapUI;
         refresh();
      }
      
      public function set paddingTop(value:Number):void {
         _paddingUI.top = value;
         childrenGap = _gapUI;
         refresh();
      }
      
      public function set paddingBottom(value:Number):void {
         _paddingUI.bottom = value;
         childrenGap = _gapUI;
         refresh();
      }
      
      override public function addChild(child:DisplayObject):DisplayObject {
         var displayObject:DisplayObject = super.addChild(child);
         refresh();
         return displayObject;
      }
   }
}