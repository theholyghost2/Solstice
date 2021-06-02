use Solstice::MainLoop;

use Solstice::Shadax;
use Solstice::JumpingShadax;
use Solstice::Room1;

use SDL2::Raw;

class Solstice::SDL2MainLoop is Solstice::MainLoop {

      has $!shadax;
      has $!currentroom;

      submethod BUILD(:$renderer) {
      		self.is_running = True;
		
		$!currentroom = Solstice::Room1.new($renderer);
		$!shadax = Solstice::Shadax.new(100,100,24,24,$renderer);
	}

      ### compiler pattern for the main loop
      ### update and blit everything
      multi method loopOnce($renderer) {
      	    $!currentroom.update();
      	    $!currentroom.blit($renderer);
	    $!shadax.update();
	    $!shadax.blit($renderer);
      }

      multi method movePlayerLeft() {
	$!shadax.moveLeft();
        $!shadax.collideRoom($!currentroom);
      }
      multi method movePlayerRight() {
	$!shadax.moveRight();
        $!shadax.collideRoom($!currentroom);
      }
      multi method movePlayerUp() {
	$!shadax.moveUp();
        $!shadax.collideRoom($!currentroom);
      }
      multi method movePlayerDown() {
	$!shadax.moveDown();
        $!shadax.collideRoom($!currentroom);
      }
}
