class Solstice::Entity {

      has $!x;
      has $!y;
      has $!width;
      has $!height;

      submethod BUILD(:$x, :$y, :$w, :$h) {
      		$!x = $x;
		$!y = $y;

		$!width = $w;
		$!height = $h;
	}

}
      		