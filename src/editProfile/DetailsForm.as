package editProfile
{
   import comp.PGILabel;
   
   import flash.display.Sprite;
   
   public class DetailsForm extends Sprite
   {
      public function DetailsForm()
      {
         super();
         var label:PGILabel = new PGILabel("Details Form");
         this.addChild(label);
      }
   }
}