use Solstice::Room;

use SDL2::Raw;

use Solstice::Goon1;

class Solstice::Room2 is Solstice::Room {


	has $!x;
	has $!y;
	has $!background-image;

       submethod BUILD() {
      		$!background-image = SDL2::Raw::SDL_LoadBMP("../../images/bg-room-2.bmp");	
		self.addEntity(Solstice::Goon1(100,100,48,48,0));

	}

	multi method blit($renderer) {
	      my $destrect = SDL2::Raw::SDL_Rect.new($!x,$!y,1024,768);
	      my $image = SDL2::Raw::SDL_CreateTextureFromSurface($renderer, $!background-image);
	      SDL2::Raw::SDL_RenderCopy($renderer, $image, 0, $destrect);
	}

        multi method update() {

	}

	### gets current collided tile
	multi method collideShadax($shadax) {
	    return Nil;
	}
}
