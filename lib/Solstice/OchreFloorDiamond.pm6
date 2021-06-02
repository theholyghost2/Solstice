use Solstice::FloorDiamond;

use SDL2::Raw;

class Solstice::OchreFloorDiamond is Solstice::FloorDiamond {

      submethod BUILD(:$x, :$y, :$renderer) {
      		self.x = $x;
		self.y = $y;
		self.width = 96; ### breadth of diamond
		self.height = 48; ### maximum height of diamond
		self.zposition = 0;

		my $img = SDL2::Raw::SDL_LoadBMP("../../images/ochre-floor-tile-1.bmp");
		SDL2::Raw::SDL_SetColorKey($img, SDL2::Raw::SDL_TRUE, (255,255,255));	     
		self.image = SDL2::Raw::SDL_CreateTextureFromSurface($renderer, $img);
	}

}
