use Solstice::SlabDiamond;
use SDL2::Raw;

class Solstice::OchreSlabDiamond is Solstice::SlabDiamond {

      submethod BUILD(:$x, :$y, :$renderer) {
      		self.x = $x;
		self.y = $y;
		self.width = 96; ### breadth of diamond
		self.height = 48; ### maximum height of diamond
		self.zposition = 24;

		my $img = SDL2::Raw::IMG_Load("images/ochre-slab-tile-1.png");
		SDL2::Raw::SDL_SetColorKey($img, SDL2::Raw::SDL_TRUE, (255,255,255));	     
		self.image = SDL2::Raw::SDL_CreateTextureFromSurface($renderer, $img);

	}

}
