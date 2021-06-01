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

}
