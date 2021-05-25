use Solstice::SlabDiamond;

class Solstice::OchreSlabDiamond is SlabDiamond {

      submethod BUILD(:$x, :$y) {
      		$!x = $x;
		$!y = $y;
		$!width = 92; ### breadth of diamond
		$!height = 48; ### maximum height of diamond
		$!zposition = 24;
	}

## FIXME multi method collideXY($player) {
##	      ###$player.collideSlab(self);
##	}

}