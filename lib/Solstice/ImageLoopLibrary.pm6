use SDL2::Raw;

### looping through images for animation

class ImageLoopLibrary {

      has @!images; ### contains SDL2 textures
      has $!index;

      submethod BUILD() {
      		@!images = ();
		$!index = 0;

      }

      method addImage($filename) {
      	     ### FIXME :
	     my $img = SDL2::Raw::IMG_Load($filename);
	     SDL2::Raw::SDL_SetColorKey($img, SDL2::Raw::SDL_TRUE, (255,255,255));
	     ### my $tex = SDL_CreateTextureFromSurface($!renderer, $img);

	     ###@!images.push($tex);
      }

      method getImage() {
      	     if ($!index >= @!images.elems) {
	     	$!index = 0;
	     }
	     ### FIXME :
	     SDL_UpdateTexture(@!images[$!index], 0, @!images[$!index], @!images[$!index].width * @!images[$!index].height);
      	     return @!images[$!index++];
      }
}
