use Solstice::Entity;

use Solstice::LeftMove;
use Solstice::RightMove;
use Solstice::UpMove;
use Solstice::DownMove;

class Solstice::Shadax is Solstice::Entity {

      has $!lastmove;

      submethod BUILD(:$x, :$y, :$w, :$h) {
      		$!x = $x;
		$!y = $y;

		$!width = $w;
		$!height = $h;

		$!lastmove = Nil;

		$!zposition = 0; ### FIXME dispatch tilemap zpos
	}

	### main colliding method
	multi method collideRoom($room) {
	      $room.collideShadax(self);
	}

	multi method undoMove() {
	  $!lastmove.undomove(self);    
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

	multi method getX() { return $!x; }
  	multi method getY() { return $!y; }
	multi method getW() { return $!width; }
  	multi method getH() { return $!height; }

	multi method setXY($x, $y) { $!x = $x; $!y = $y; }

	multi method moveLeft() {
	      my $lmove = new LeftMove();
	      $lastmove = $lmove;
	      $lmove.move(self);
	}
	multi method moveRight() {
	      my $rmove = new RighttMove();
	      $lastmove = $rmove;
	      $rmove.move(self);
	}
	multi method moveUp() {
	      my $umove = new UpMove();
	      $lastmove = $umove;
	      $umove.move(self);
	}
	multi method moveDown() {
	      my $dmove = new DownMove();
	      $lastmove = $dmove;
	      $dmove.move(self);
	}

	multi method jump() {} ### FIXME
	multi method magiccrystal() {} ### FIXME 
}
      		