use Solstice::Diamond;

class Solstice::FloorDiamond is Solstice::Diamond {

      submethod BUILD(:$x, :$y) {
      		self.x = $x;
		self.y = $y;
		self.width = 96; ### breadth of diamond
		self.height = 48; ### maximum height of diamond
		self.zposition = 0;
	}

	multi method collideXY($player) {
	      return $player.collideFloorXY(self);
	}

}