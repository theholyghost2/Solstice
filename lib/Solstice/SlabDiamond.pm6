use Solstice::Diamond;

class Solstice::SlabDiamond is Diamond {

      submethod BUILD(:$x, :$y, :$zpos) {
      		$!x = $x;
		$!y = $y;
		$!width = 92; ### breadth of diamond
		$!height = 48; ### maximum height of diamond
		$!zposition = $zpos;
	}

	multi method collideShadax($player) {
	      return $player.collideSlab(self);
	}

	multi method getX() { return $!x; }
	multi method getY() { return $!y; }
	multi method getWidth() { return $!width; }
	multi method getHeight() { return $!height; }

}