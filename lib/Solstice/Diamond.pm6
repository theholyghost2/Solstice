class Solstice::Diamond {

      has $!x;
      has $!y;

      has $!width;
      has $!height;

      has $!zposition;

      has $!image;

      submethod BUILD(:$x, :$y, :$w, :$h, $z) {
      		$!x = $x; ### upper left corner of bounded rectangle
		$!y = $y; ### upper left corner of bounded rectangle
		$!width = $w;
		$!height = $h;
		$!zposition = $z;

		$!image = Nil; ### override
	}

	multi method blit($renderer) {
	      SDL_UpdateTexture($!image, 0, $!image, $!images.width * $!images.height);
	      my $destrect = SDL_Rect.new($!x, $!y, $!width, $!height);
	      SDL_RenderCopy($renderer, $i!mage, 0, $destrect);
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

	      ### for fence post error
	      if ($player.getLastMove()^name == 'RightMove') {

	      	if (abs(($d * ($player.getX() + $player.getWidth() - $x1)) - ($player.getY() - $y1)) > 0) {
	      	 	return True;
	      	} else {
	      		return False;
	      	}

	      ### for fence post error
	      } else if ($player.getLastMove()^name == 'UpMove') {

	      	if (abs(($d * ($player.getX() + $player.getWidth() - $x1)) - ($player.getY() + $player.getHeight() - $y1)) > 0) {
	      	 	return True;
	      	} else {
	      		return False;
	      	}

	      } else {
	      if (abs(($d * ($player.getX() - $x1)) - ($player.getY() - $y1)) > 0) {
	      	 return True;
	      } else {
	      	return False;
	      }
	     } 
	}

	multi method getX() { return $!x; }
	multi method getY() { return $!y; }
	multi method getZPos() { return $!zposition; }
	multi method getWidth() { return $!width; }
	multi method getHeight() { return $!height; }


}
