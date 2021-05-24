use Solstice::Shadax;

class Solstice::JumpingShadax is Solstice::Shadax {
      submethod BUILD(:$x, :$y, :$w, :$h) {
      		$!x = $x;
		$!y = $y;

		$!width = $w;
		$!height = $h;
	}

	multi method collideFloor($floordiamond) {
	      ### collide with diamond
	      return False;
	}

	multi method collideSlab($slabdiamond) {
	      ### collide with diamond
	      return False;
	}

	multi method moveLeft() { $!x -= 1; $!y -= 0.5; }
	multi method moveRight() { $!x += 1; $!y += 0.5; }
	multi method moveUp() { $!x += 1; $!y -= 0.5; }
	multi method moveDown() { $!x -= 1; $!y += 0.5; }

	multi method jump() {} ### FIXME
	multi method magiccrystal() {} ### FIXME 
}
      		