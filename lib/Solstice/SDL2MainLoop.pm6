use Solstice::MainLoop;

use Solstice::Shadax;
use Solstice::Room1;

use SDL2::Raw;

class Solstice::SDL2MainLoop is MainLoop {

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
      		$!is_running = True;
		$!renderer = $renderer;
		
		$!currentroom = new Room1();
		$!shadax = new Shadax(100,100,24,24,$renderer);
	}

      multi method loopOnce($event) {
      	    my %down_keys;
      	    my $casted_event = SDL_CastEvent($event);

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
			} else if ($comm == K_RIGHT) {
			   $!shadax.moveRight();
			   $!shadax.collideRoom($!currentroom);
			} else if ($comm == K_UP) {
			   $!shadax.moveUp();
			   $!shadax.collideRoom($!currentroom);
			} else if ($comm == K_DOWN) {
			   $!shadax.moveDown();
			   $!shadax.collideRoom($!currentroom);
			} else if ($comm == K_X) {
			   
			   $!shadax = new JumpingShadax($!shadax.getX(),$!shadax.getY(),$!shadax.getWidth(),$!shadax.getHeight());
			   $!shadax.jump();
			   
		        }### else if ($comm == K_Z) {

			###}


			} 
			CATCH { say $_ }
			}
		}
      }

      multi method mainloop() {

      	    my $event = SDL_Event.new;

	    while $!is_running and SDL_PollEvent($event) { ### SDL_WaitEvent 
	    	  self.loopOnce($event);
            }

      }


}