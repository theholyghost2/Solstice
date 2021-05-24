class Solstice::Model {

      has @!entities;
      has $!room;

      has $!mainscreen;

       submethod BUILD() {
      		
	}

	multi method drawOn($view) {
	 ###     $view.blit();
	}


}