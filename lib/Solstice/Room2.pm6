use Solstice::Room;

use Solstice::Tilemap1;

### The first room (you start the game in)

class Solstice::Room2 is Solstice::Room {

       submethod BUILD(:$renderer) {
      		self.tilemap = Solstice::Tilemap2.new($renderer);
	}

	multi method blit($renderer) {
	      self.tilemap.blit($renderer);
	}

        multi method update() {

	}

}
