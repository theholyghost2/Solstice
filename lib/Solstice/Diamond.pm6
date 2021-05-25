class Solstice::Diamond {

      has $!x;
      has $!y;

      has $!width;
      has $!height;

      has $!zposition;

      submethod BUILD(:$x, :$y, :$w, :$h, $z) {
      		$!x = $x; ### upper left corner of bounded rectangle
		$!y = $y; ### upper left corner of bounded rectangle
		$!width = $w;
		$!height = $h;
		$!zposition = $z;
	}

	### check if the player is on this tile
	### This is not needed for collision detection (which only uses zpos)
	multi method collideDiamond($player) {

	      ### left upper quarter of diamond
	      if (self.diagonalSolution($!y + $!height / 2, $!y,
	      	 			$!x + $!width / 2, $!x, $player)) {
			return True;
	      } else ### right upper quarter of diamond
	      if (self.diagonalSolution($!y + $!height / 2, $!y,
	      	 			$!x + $!width / 2, $!x + $!width, $player)) {
			return True;
	      } else ### left down quarter of diamond
	      if (self.diagonalSolution($!y + $!height / 2, $!y + $!height,
	      	 			$!x + $!width / 2, $!x, $player)) {
			return True;
		} else ### right down quarter of diamond
	      if (self.diagonalSolution($!y + $!height / 2, $!y + $!height,
	      	 			$!x + $!width / 2, $!x + $!width, $player)) {
			return True;
		} else {
	      	  return False;
		}
	}

	method diagonalSolution($y2, $y1, $x2, $x1, $player) {
	      my $dy = $y2 - $y1;
	      my $dx = $x2 - $x1;
	      my $diff = abs($dy / $dx);

	      if (abs($player.getY() - $y1 - ($d * ($player.getX() - $x1))) > 0) {
	      	 return True;
	      } else {
	      	return False;
	      }
	      
	}

	multi method getX() { return $!x; }
	multi method getY() { return $!y; }
	multi method getZPos() { return $!zposition; }
	multi method getWidth() { return $!width; }
	multi method getHeight() { return $!height; }


}