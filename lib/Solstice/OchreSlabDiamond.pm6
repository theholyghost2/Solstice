use Solstice::SlabDiamond;

class Solstice::OchreSlabDiamond is SlabDiamond {

      submethod BUILD(:$x, :$y, :$renderer) {
      		$!x = $x;
		$!y = $y;
		$!width = 96; ### breadth of diamond
		$!height = 48; ### maximum height of diamond
		$!zposition = 24;

		my $img = IMG_Load("images/ochre-slab-tile-1.png");
		SDL_SetColorKey($img, SDL_TRUE, (255,255,255));	     
		$!image = SDL_CreateTextureFromSurface($renderer, $img);

	}

}