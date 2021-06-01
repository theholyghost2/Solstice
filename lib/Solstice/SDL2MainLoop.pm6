use Solstice::MainLoop;

use Solstice::Shadax;
use Solstice::JumpingShadax;
use Solstice::Room1;

use SDL2::Raw;

class Solstice::SDL2MainLoop is Solstice::MainLoop {

      has $!shadax;
      has $!currentroom;

      has $!renderer;

      enum GAME_KEYS (
		K_UP => 82,
		K_DOWN => 81,
		K_LEFT => 80,
		K_RIGHT => 79,
		K_SPACE => 44,
		### FIXME K_X
		### FIXME K_Z 
	);

      submethod BUILD(:$renderer) {
      		self.is_running = True;
		$!renderer = $renderer;
		
		$!currentroom = Solstice::Room1.new($renderer);
		$!shadax = Solstice::Shadax.new(100,100,24,24,$renderer);
	}

      method render() {
	### SDL2::Raw::SDL_UpdateTexture($tile, 0, $data, 320*32);

	SDL2::Raw::SDL_SetRenderDrawColor($!renderer, 0x0, 0x0, 0x0, 0xff);
	SDL2::Raw::SDL_RenderClear($!renderer);
	SDL2::Raw::SDL_SetRenderDrawColor($!renderer, 0xff, 0xff, 0xff, 0x7f);
	SDL2::Raw::SDL_RenderPresent($!renderer);

	SDL2::Raw::SDL_RendererFlip;
      }

      multi method loopOnce($event) {
      	    my %down_keys;
      	    my $casted_event = SDL2::Raw::SDL_CastEvent($event);

	    given $casted_event {
		when (*.type == QUIT) {
			return -1; ###last;### mainloop;
		}

		when (*.type == KEYDOWN) {
		     if GAME_KEYS(.scancode) -> $comm {
			###%down_keys{$comm} = 1;
			}
			CATCH { say $_ }
			}
	
		when (*.type == KEYUP) {
		     if GAME_KEYS(.scancode) -> $comm {
			###%down_keys{$comm} = 0;

			if ($comm == K_LEFT) {
			   $!shadax.moveLeft();
			   $!shadax.collideRoom($!currentroom);
			} elsif ($comm == K_RIGHT) {
			   $!shadax.moveRight();
			   $!shadax.collideRoom($!currentroom);
			} elsif ($comm == K_UP) {
			   $!shadax.moveUp();
			   $!shadax.collideRoom($!currentroom);
			} elsif ($comm == K_DOWN) {
			   $!shadax.moveDown();
			   $!shadax.collideRoom($!currentroom);
			} #elsif ($comm == K_X) {
			   
			   #$!shadax = Solstice::JumpingShadax.new($!shadax.getX(),$!shadax.getY(),$!shadax.getWidth(),$!shadax.getHeight());
			   #$!shadax.jump();
			   
		        #}### else if ($comm == K_Z) {

			###}


			} 
			CATCH { say $_ }
			}
		}
		$!currentroom.blit($!renderer);
		$!shadax.blit();
		self.render();
      }

      multi method mainloop() {

      	    my $event = SDL2::Raw::SDL_Event.new;

	    while self.is_running and SDL2::Raw::SDL_PollEvent($event) { ### NOTE SDL2::Raw::SDL_WaitEvent 
	    	  self.loopOnce($event);
            }

      }


}
