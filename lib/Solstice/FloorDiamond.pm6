use Solstice::Diamond;

class Solstice::FloorDiamond is Diamond {

      submethod BUILD(:$x, :$y) {
      		$!x = $x;
		$!y = $y;
		$!width = 92; ### breadth of diamond
		$!height = 48; ### maximum height of diamond
		$!zposition = 0;
	}

	multi method collideShadax($player) {
	      ###$player.collideFloor(self);
	      return False; ### FIXME you do not collide on a floor 
	}

	multi method getX() { return $!x; }
	multi method getY() { return $!y; }
	multi method getWidth() { return $!width; }
	multi method getHeight() { return $!height; }

}