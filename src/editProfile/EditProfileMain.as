package editProfile
{
   import flash.display.Sprite;
   
   public class EditProfileMain extends Sprite
   {
      private var _profileForm:ProfileForm;
      private var _detailsForm:DetailsForm;
      private var _photoForm:PhotoForm;
      private var _selectedForm:Sprite;
      
      public function EditProfileMain()
      {
         super();
         _profileForm = new ProfileForm();
         _detailsForm = new DetailsForm();
         _photoForm = new PhotoForm();
         _detailsForm.visible = false;
         _photoForm.visible = false;
         _selectedForm = _profileForm;
         this.addChild(_profileForm);
         this.addChild(_detailsForm);
         this.addChild(_photoForm);
      }
      
      public function get selectedIndex():int {
         return this.getChildIndex(_selectedForm);
      }
      
      public function set selectedIndex(value:int):void {
         if(value < 0) return;
         _selectedForm.visible = false;
         _selectedForm = this.getChildAt(value) as Sprite;
         _selectedForm.visible = true;
      }
      
   }
}