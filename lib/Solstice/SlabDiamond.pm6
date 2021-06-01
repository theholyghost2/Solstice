use Solstice::Diamond;

class Solstice::SlabDiamond is Solstice::Diamond {

      submethod BUILD(:$x, :$y, :$zpos) {
      		self.x = $x;
		self.y = $y;
		self.width = 96; ### breadth of diamond
		self.height = 48; ### maximum height of diamond
		self.zposition = $zpos;
	}

	multi method collideXY($player) {
	      return $player.collideSlabXY(self);
	}

}