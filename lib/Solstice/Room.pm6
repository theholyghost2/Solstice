class Solstice::Room {

      has $!tilemap;

       submethod BUILD() {
      		
	}

	multi method blit() {

	}

	### gets current collided tile
	multi method collideShadax($shadax) {
	      ### true collision returns the collided tile (else Nil)
	      my $currentcollidedtile = $tilemap.collideShadax($shadax);

	      if ($currentcollidedtile != Nil) {
	      	  ### $shadax.donotmove();
	          return $currentcollidedtile;
	      }
	}
}