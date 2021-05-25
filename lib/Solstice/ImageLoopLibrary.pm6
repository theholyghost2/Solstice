use SDL2::Raw;

### looping through images for animation

class ImageLoopLibrary {

      has @!images;
      has $!index;

      has $!renderer;

      submethod BUILD(:$renderer) {
      		@!images = ();
		$!index = 0;

		$!renderer = $renderer;
      }

      method addImage($image) {
      	     ### FIXME :
		my $tex = SDL_CreateTexture($!renderer, %PIXELFORMAT<RGBA8888>
+, TARGET, $image.width, $image.height);
		@!images.push($tex);
      }

      method getImage() {
      	     if ($!index >= @!images.elems()) {
	     	$!index = 0;
	     }
	     ### FIXME :
	     SDL_UpdateTexture(@!images[$index], 0, @!images[$!index], @!images[$!index].width, @!images[!$index].height);
      	     return @!images[$!index++];
      }