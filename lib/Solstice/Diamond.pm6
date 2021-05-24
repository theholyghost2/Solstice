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

	multi method collide($player) {
	      return False;
	}
}