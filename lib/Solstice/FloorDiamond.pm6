use Solstice::Diamond;

class Solstice::FloorDiamond is Diamond {

      submethod BUILD(:$x, :$y) {
      		$!x = $x;
		$!y = $y;
		$!width = 92; ### breadth of diamond
		$!height = 48; ### maximum height of diamond
		$!zposition = 0;
	}

	multi method collideXY($player) {
	      return $player.collideFloorXY(self);
	}

}