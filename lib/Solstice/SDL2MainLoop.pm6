use Solstice::MainLoop;

use Solstice::Shadax;
use Solstice::JumpingShadax;
use Solstice::Room1;

use SDL2::Raw;

class Solstice::SDL2MainLoop is Solstice::MainLoop {

      has $!shadax;
      has $!currentroom;

      submethod BUILD() {
      		self.is_running = True;
		
		$!currentroom = Solstice::Room1.new();
		$!shadax = Solstice::Shadax.new(100,100,24,24);
	}

      multi method loopOnce() {
		
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
