use Solstice::Entity;

class Solstice::Shadax is Solstice::Entity {
      submethod BUILD(:$x, :$y, :$w, :$h) {
      		$!x = $x;
		$!y = $y;

		$!width = $w;
		$!height = $h;

		$!zposition = 0; ### FIXME dispatch tilemap zpos
	}

	### main colliding method
	multi method collideRoom($room) {
	      $room.collideShadax(self);
	}

	multi method collideFloorXY($floordiamond) {
	      ### collide with Floor diamond
	      return Nil;
	}

	multi method collideSlabXY($slabdiamond) {
	      ### collide with Slab diamond
	      if ($slabdiamond.getZPos() > $!zposition) {
	      	 return $slabdiamond;
	      } else {
	      	return Nil;
	      }
	}

	multi method moveLeft() { $!x -= 1; $!y -= 0.5; }
	multi method moveRight() { $!x += 1; $!y += 0.5; }
	multi method moveUp() { $!x += 1; $!y -= 0.5; }
	multi method moveDown() { $!x -= 1; $!y += 0.5; }

	multi method jump() {} ### FIXME
	multi method magiccrystal() {} ### FIXME 
}
      		