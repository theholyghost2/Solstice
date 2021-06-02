use Solstice::Room;

use SDL2::Raw;

class Solstice::Room2 is Solstice::Room {


	has $!x;
	has $!y;
	has $!background-image;

       submethod BUILD($window) {
      		$!background-image = SDL2::Raw::SDL_LoadBMP("../../images/bg-room-2.bmp");	
		### FIXME self.addEntity();

	}

	multi method blit($renderer) {
	      my $destrect = SDL2::Raw::SDL_Rect.new($!x,$!y,1024,768);
	      my $image = SDL2::Raw::SDL_CreateTextureFromSurface($renderer, $!background-image);
	      SDL2::Raw::SDL_RenderCopy($renderer, $image, 0, $destrect);
	}

        multi method update() {

	}
}
