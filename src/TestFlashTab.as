package
{
   import com.halcyon.util.events.HalcyonEvent;
   
   import comp.PGIButton;
   import comp.PGITab;
   import comp.PGIVGroup;
   
   import editProfile.EditProfileMain;
   import editProfile.EditProfileTab;
   
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class TestFlashTab extends Sprite
   {
      private var _editProfileTab:EditProfileTab;
      private var _editProfileMain:EditProfileMain;
      
      public function TestFlashTab()
      {
         super();
         var vGroup:PGIVGroup = new PGIVGroup(this);
         vGroup.top = 20;
         vGroup.verticalGap = 20;
         _editProfileTab = new EditProfileTab();
         _editProfileTab.addEventListener("tabIndexChange", editProfileTabIndexChange, false, 0, true);
         vGroup.addChild(_editProfileTab);
         _editProfileMain = new EditProfileMain();
         vGroup.addChild(_editProfileMain);
         var button:PGIButton = new PGIButton(null, "Change");
         button.content.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
         vGroup.addChild(button.content);
         this.addChild(vGroup);
      }
      
      private function onClick(event:Event):void {
         _editProfileTab._profile.label = "NEW PROFILE TAB";
         _editProfileTab._profile.tabWidth = 120;
         _editProfileTab._hGroup.refresh();
      }
      
      private function editProfileTabIndexChange(event:HalcyonEvent):void {
         _editProfileMain.selectedIndex = _editProfileTab._hGroup.getChildIndex(event.getExtra() as PGITab) - 1;
      }
      
   }
}