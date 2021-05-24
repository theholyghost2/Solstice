use Solstice::Model;

class Solstice::SolsticeModel is Model {

      

       submethod BUILD() {
      		
	}

	multi method drawOn($view) {
	      $view.blit();
	}

}