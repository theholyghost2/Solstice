use Solstice::FloorDiamond;

use SDL2::Raw;

class Solstice::OchreFloorDiamond is Solstice::FloorDiamond {

      submethod BUILD(:$x, :$y) {
      		self.x = $x;
		self.y = $y;
		self.width = 96; ### breadth of diamond
		self.height = 48; ### maximum height of diamond
		self.zposition = 0;

		###my $tex = SDL_CreateTexture($renderer, %PIXELFORMAT<RGBA8888>+, TARGET, 96,48);

		my $img = SDL2::Raw::IMG_Load("images/ochre-floor-tile-1.png");
		SDL2::Raw::SDL_SetColorKey($img, SDL2::Raw::SDL_TRUE, (255,255,255));	     
		###self.image = SDL2::Raw::SDL_CreateTextureFromSurface($renderer, $img);
	}

}
