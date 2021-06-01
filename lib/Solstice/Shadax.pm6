use Solstice::Entity;

use Solstice::LeftMove;
use Solstice::RightMove;
use Solstice::UpMove;
use Solstice::DownMove;

use Solstice::ImageLoopLibrary;

class Solstice::Shadax is Solstice::Entity {

      has $!lastmove;

      has $!leftmoveimageslib;
      has $!rightmoveimageslib;
      has $!upmoveimageslib;
      has $!downmoveimageslib;

      submethod BUILD(:$x, :$y, :$w, :$h,) {
      		self.x = $x;
		self.y = $y;

		self.width = $w;
		self.height = $h;

		$!lastmove = Nil;

		self.zposition = 0; ### FIXME dispatch tilemap zpos

		$!leftmoveimageslib = Solstice::ImageLoopLibrary();
		$!rightmoveimageslib = Solstice::ImageLoopLibrary();
		$!upmoveimageslib = Solstice::ImageLoopLibrary();
		$!downmoveimageslib = Solstice::ImageLoopLibrary();
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
	      if ($slabdiamond.getZPos() > self.zposition) {
	      	 return $slabdiamond;
	      } else {
	      	return Nil;
	      }
	}

	multi method getX() { return self.x; }
  	multi method getY() { return self.y; }
	multi method getWidth() { return self.width; }
  	multi method getHeight() { return self.height; }

	multi method getLastMove() { return $!lastmove; }

	multi method setXY($x, $y) { self.x = $x; self.y = $y; }

	multi method moveLeft() {
	      my $lmove = Solstice::LeftMove.new();
	      $!lastmove = $lmove;
	      $lmove.move(self);
	}
	multi method moveRight() {
	      my $rmove = Solstice::RighttMove.new();
	      $!lastmove = $rmove;
	      $rmove.move(self);
	}
	multi method moveUp() {
	      my $umove = Solstice::UpMove.new();
	      $!lastmove = $umove;
	      $umove.move(self);
	}
	multi method moveDown() {
	      my $dmove = Solstice::DownMove.new();
	      $!lastmove = $dmove;
	      $dmove.move(self);
	}

	multi method jump() {} ### FIXME
	multi method magiccrystal() {} ### FIXME

	multi method blit(:$renderer) {
	      ### FIXME blit things on x,y

	      #my $destrect = SDL2::Raw::SDL_Rect.new(self.x, self.y + self.zposition, self.width, self.height); ### NOTE + $zpos

	      #if ($!lastmove.^name == 'LeftMove') {
	      #	 my $image = $!leftmoveimageslib.getImage();
		 ###SDL2::Raw::SDL_RenderCopy($!renderer, $image, 0, $destrect);
	      #}	elsif ($!lastmove.^name == 'RightMove') {
	      #	 my $image = $!rightmoveimageslib.getImage();
		 ###SDL2::Raw::SDL_RenderCopy($!renderer, $image, 0, $destrect);
	      #} elsif ($!lastmove.^name == 'UpMove') {
	      #	 my $image = $!upmoveimageslib.getImage();
		 ###SDL2::Raw::SDL_RenderCopy($!renderer, $image, 0, $destrect);
	      #} elsif ($!lastmove.^name == 'DownMove') {
	      #	 my $image = $!downmoveimageslib.getImage();
		 ###SDL2::Raw::SDL_RenderCopy($!renderer, $image, 0, $destrect);
	      #}

	}
}
      		
