class Solstice::Room {

      has $!tilemap;
      has @!entities;
 
       submethod BUILD() {
      		
	}

       multi method addEntity($e) {
		@!entities.push($e);
	}

	multi method blit($renderer) {
	      $!tilemap.blit($renderer)
	}

	### gets current collided tile
	multi method collideShadax($shadax) {
	      ### true collision returns the collided tile (else Nil)
	      my $currentcollidedtile = $!tilemap.collideShadax($shadax);

	      if ($currentcollidedtile != Nil) {
	      	  $shadax.undoMove();
	          return $currentcollidedtile;
	      }
	}

        multi method update() {

	}

}
