class Solstice::Diamond {

      has $!x;
      has $!y;

      has $!width;
      has $!height;

      has $!zposition;

      submethod BUILD(:$x, :$y, :$w, :$h, $z) {
      		$!x = $x;
		$!y = $y;
		$!width = $w;
		$!height = $h;
		$!zposition = $z;
	}

	### check if the player is on this tile
	multi method collideXY($player) {
	      return False;
	}

	multi method getX() { return $!x; }
	multi method getY() { return $!y; }
	multi method getZPos() { return $!zposition; }
	multi method getWidth() { return $!width; }
	multi method getHeight() { return $!height; }


}