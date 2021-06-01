use Solstice::Entity;

use Solstice::LeftMove;
use Solstice::RightMove;
use Solstice::UpMove;
use Solstice::DownMove;

use Solstice::ImageLoopLibrary;

class Solstice::Shadax is Solstice::Entity {

      has $!lastmove;
      has $!renderer;

      has $!leftmoveimageslib;
      has $!rightmoveimageslib;
      has $!upmoveimageslib;
      has $!downmoveimageslib;

      submethod BUILD(:$x, :$y, :$w, :$h, :$renderer) {
      		self.x = $x;
		self.y = $y;

		self.width = $w;
		self.height = $h;

		$!lastmove = Nil;

		$!zposition = 0; ### FIXME dispatch tilemap zpos

		$!renderer = $renderer;
		
		$!leftmoveimageslib = Solstice::ImageLoopLibrary($renderer);
		$!rightmoveimageslib = Solstice::ImageLoopLibrary($renderer);
		$!upmoveimageslib = Solstice::ImageLoopLibrary($renderer);
		$!downmoveimageslib = Solstice::ImageLoopLibrary($renderer);
		### FIXME add images to image loop libs
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
	multi method getWidth() { return $!width; }
  	multi method getHeight() { return $!height; }

	multi method getLastMove() { return $!lastmove; }

	multi method setXY($x, $y) { $!x = $x; $!y = $y; }

	multi method moveLeft() {
	      my $lmove = LeftMove.new();
	      $lastmove = $lmove;
	      $lmove.move(self);
	}
	multi method moveRight() {
	      my $rmove = RighttMove.new();
	      $lastmove = $rmove;
	      $rmove.move(self);
	}
	multi method moveUp() {
	      my $umove = UpMove.new();
	      $lastmove = $umove;
	      $umove.move(self);
	}
	multi method moveDown() {
	      my $dmove = DownMove.new();
	      $lastmove = $dmove;
	      $dmove.move(self);
	}

	multi method jump() {} ### FIXME
	multi method magiccrystal() {} ### FIXME

	multi method blit() {
	      ### FIXME blit things on x,y

	      my $destrect = SDL_Rect.new($!x, $!y + $!zposition, $!width, $!height); ### NOTE + $zpos

	      if ($lastmove.^name == 'LeftMove') {
	      	 my $image = $leftmoveimageslib.getImage();
		 SDL_RenderCopy($!renderer, $image, 0, $destrect);
	      }	else if ($lastmove.^name == 'RightMove') {
	      	 my $image = $rightmoveimageslib.getImage();
		 SDL_RenderCopy($!renderer, $image, 0, $destrect);
	      } else if ($lastmove.^name == 'UpMove') {
	      	 my $image = $upmoveimageslib.getImage();
		 SDL_RenderCopy($!renderer, $image, 0, $destrect);
	      } else if ($lastmove.^name == 'DownMove') {
	      	 my $image = $downmoveimageslib.getImage();
		 SDL_RenderCopy($!renderer, $image, 0, $destrect);
	      }

	}
}
      		
