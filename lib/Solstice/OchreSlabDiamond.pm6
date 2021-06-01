use Solstice::SlabDiamond;

class Solstice::OchreSlabDiamond is SlabDiamond {

      submethod BUILD(:$x, :$y, :$renderer) {
      		$!x = $x;
		$!y = $y;
		$!width = 96; ### breadth of diamond
		$!height = 48; ### maximum height of diamond
		$!zposition = 24;

		my $img = IMG_Load("./pics/ochreslab-tile-1.png");
		$!image = SDL_CreateTextureFromSurface($renderer, $img);

	}

}