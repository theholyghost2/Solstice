use Solstice::Shadax;

class Solstice::JumpingShadax is Solstice::Shadax {
      submethod BUILD(:$x, :$y, :$w, :$h) {
      		self.x = $x;
		self.y = $y;

		self.width = $w;
		self.height = $h;
	}

	multi method collideFloorXY($floordiamond) {
	      ### collide with diamond
	      return False;
	}

	multi method collideSlabXY($slabdiamond) {
	      ### collide with diamond
	      return False;
	}

	multi method moveLeft() { self.x -= 1; self.y -= 0.5; }
	multi method moveRight() { self.x += 1; self.y += 0.5; }
	multi method moveUp() { self.x += 1; self.y -= 0.5; }
	multi method moveDown() { self.x -= 1; self.y += 0.5; }

	multi method jump() {} ### FIXME
	multi method magiccrystal() {} ### FIXME 
}
      		
