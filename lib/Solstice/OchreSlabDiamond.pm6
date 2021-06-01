use Solstice::SlabDiamond;

class Solstice::OchreSlabDiamond is Solstice::SlabDiamond {

      submethod BUILD(:$x, :$y, :$renderer) {
      		self.x = $x;
		self.y = $y;
		self.width = 96; ### breadth of diamond
		self.height = 48; ### maximum height of diamond
		self.zposition = 24;

		my $img = IMG_Load("images/ochre-slab-tile-1.png");
		SDL_SetColorKey($img, SDL_TRUE, (255,255,255));	     
		self.image = SDL_CreateTextureFromSurface($renderer, $img);

	}

}