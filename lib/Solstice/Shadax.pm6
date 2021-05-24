use Solstice::Entity;

class Solstice::Shadax is Solstice::Entity {
      submethod BUILD(:$x, :$y, :$w, :$h) {
      		$!x = $x;
		$!y = $y;

		$!width = $w;
		$!height = $h;
	}

}
      		