use Solstice::FloorDiamond;

class Solstice::OchreFloorDiamond is FloorDiamond {

      submethod BUILD(:$x, :$y) {
      		$!x = $x;
		$!y = $y;
		$!width = 92; ### breadth of diamond
		$!height = 48; ### maximum height of diamond
		$!zposition = 0;
	}

## FIXME multi method collideXY($player) {
##	      ###$player.collideFloor(self);
##	}

}