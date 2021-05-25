use Solstice::Diamond;

class Solstice::SlabDiamond is Diamond {

      submethod BUILD(:$x, :$y, :$zpos) {
      		$!x = $x;
		$!y = $y;
		$!width = 92; ### breadth of diamond
		$!height = 48; ### maximum height of diamond
		$!zposition = $zpos;
	}

	multi method collideXY($player) {
	      return $player.collideSlabXY(self);
	}

}