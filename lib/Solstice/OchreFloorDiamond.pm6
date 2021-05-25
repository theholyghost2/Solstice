use Solstice::FloorDiamond;

class Solstice::OchreFloorDiamond is FloorDiamond {

      submethod BUILD(:$x, :$y, :$renderer) {
      		$!x = $x;
		$!y = $y;
		$!width = 92; ### breadth of diamond
		$!height = 48; ### maximum height of diamond
		$!zposition = 0;

		### FIXME load image texture from file
		my $tex = SDL_CreateTexture($renderer, %PIXELFORMAT<RGBA8888>
+, TARGET, 92,48);
		@!image = $tex;
	}

}