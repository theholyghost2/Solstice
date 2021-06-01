use Solstice::Model;
use Solstice::Shadax;

class Solstice::SolsticeModel is Solstice::Model {

      has $!shadax;      

       submethod BUILD() {
      		$!shadax = Solstice::Shadax();
	}

	multi method drawOn($view) {
	      $view.blit(self);
	}

}
