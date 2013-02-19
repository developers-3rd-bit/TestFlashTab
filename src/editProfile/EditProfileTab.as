package editProfile
{
   import com.halcyon.util.events.HalcyonEvent;
   import com.soma.ui.layouts.HBoxUI;
   
   import comp.PGIHGroup;
   import comp.PGITab;
   import comp.PgiLine;
   
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class EditProfileTab extends Sprite
   {
      public static const TAB_INDEX_CHANGE:String = "tabIndexChange";
      
      public var _profile:PGITab;
      private var _details:PGITab;
      private var _photo:PGITab;
      private var _leftHorizontalLine:PgiLine;
      private var _rightHorizontalLine:PgiLine;
      private var _selectedLabel:String;
      public var _hGroup:PGIHGroup;
      
      public function EditProfileTab()
      {
         super();
         this.addEventListener(Event.ADDED_TO_STAGE, addedToStage, false, 0, true);
      }
      
      private function addedToStage(event:Event):void {
         this.removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
         _profile = new PGITab("PROFILE", 55);
         _details = new PGITab("DETAILS", 55);
         _photo = new PGITab("PHOTO", 45);
         _profile.addEventListener(MouseEvent.CLICK, onClick);
         _details.addEventListener(MouseEvent.CLICK, onClick);
         _photo.addEventListener(MouseEvent.CLICK, onClick);
         _hGroup = new PGIHGroup(this);
         _hGroup.horizontalgap = -1;
         _hGroup.childrenAlign = HBoxUI.ALIGN_BOTTOM_LEFT;
         _leftHorizontalLine = new PgiLine();
         _leftHorizontalLine.drawHorizontalLine(15);
         _hGroup.addChild(_leftHorizontalLine);
         _hGroup.addChild(_profile);
         _hGroup.addChild(_details);
         _hGroup.addChild(_photo);
         _rightHorizontalLine = new PgiLine();
         _rightHorizontalLine.drawHorizontalLine(stage.width);
         _hGroup.addChild(_rightHorizontalLine);
         this.addChild(_hGroup);
         _profile.active = _profile;
         _selectedLabel = _profile.label;
      }
      
      private function onClick(event:Event):void {
         if(_selectedLabel == event.currentTarget.label) return;
         _selectedLabel = event.currentTarget.label;
         _profile.active = event.currentTarget;
         _details.active = event.currentTarget;
         _photo.active = event.currentTarget;
         this.dispatchEvent(new HalcyonEvent(TAB_INDEX_CHANGE, false, false, event.currentTarget ));
      }
   }
   
}