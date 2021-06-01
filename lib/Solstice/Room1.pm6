use Solstice::Room;

use Solstice::Tilemap1;

### The first room (you start the game in)

class Solstice::Room1 is Solstice::Room {

       submethod BUILD(:$renderer) {
      		self.tilemap = Solstice::Tilemap1.new($renderer);
	}

	multi method blit($renderer) {
	      self.tilemap.blit($renderer);
	}

}
