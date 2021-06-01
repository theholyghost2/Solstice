use Solstice::Model;
use Solstice::Shadax;

class Solstice::SolsticeModel is Model {

      has $!shadax;      

       submethod BUILD() {
      		$!shadax = Shadax();
	}

	multi method drawOn($view) {
	      $view.blit(self);
	}

}