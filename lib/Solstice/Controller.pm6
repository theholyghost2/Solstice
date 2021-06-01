use Solstice::Model;
use Solstice::View;

class Solstice::Controller {

      has $!view;
      has $!model;

      submethod BUILD() {
      		$!view = Solstice::View.new();
		$!model = Solstice::Model.new();
	}

	multi method update() {
	      $!model.update();
	}


      multi method blit() {
      	    $!model.drawOn($!view);
	}

		
}
