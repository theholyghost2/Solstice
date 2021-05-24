use Solstice::Model;
use Solstice::View;

class Solstice::Controller {

      has $!view;
      has $!model;

      submethod BUILD() {
      		$!view = new View();
		$!model = new Model();
	}

	multi method update() {
	      $!model.update();
	}


      multi method blit() {
      	    $!model.drawOn($!view);
	}

		
}