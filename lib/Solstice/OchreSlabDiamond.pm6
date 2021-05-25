use Solstice::SlabDiamond;

class Solstice::OchreSlabDiamond is SlabDiamond {

      submethod BUILD(:$x, :$y, :$renderer) {
      		$!x = $x;
		$!y = $y;
		$!width = 96; ### breadth of diamond
		$!height = 48; ### maximum height of diamond
		$!zposition = 24;

		### FIXME load image texture from file
		my $tex = SDL_CreateTexture($renderer, %PIXELFORMAT<RGBA8888>
+, TARGET, 96, 48);
		@!image = $tex;
	}

}