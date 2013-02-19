package editProfile
{
   import comp.PGILabel;
   
   import flash.display.Sprite;
   
   public class PhotoForm extends Sprite
   {
      public function PhotoForm()
      {
         super();
         var label:PGILabel = new PGILabel("Photo Form");
         this.addChild(label);
      }
   }
}