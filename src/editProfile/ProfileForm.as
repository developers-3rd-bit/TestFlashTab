package editProfile
{
   import comp.PGILabel;
   
   import flash.display.Sprite;
   
   public class ProfileForm extends Sprite
   {
      public function ProfileForm()
      {
         super();
         var label:PGILabel = new PGILabel("Profile Form");
         this.addChild(label);
      }
   }
}