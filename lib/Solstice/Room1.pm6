use Solstice::Room;

use Solstice::Tilemap1;

### The first room (you start the game in)

class Solstice::Room1 is Room {

       submethod BUILD(:$renderer) {
      		$!tilemap = Tilemap1.new($renderer);
	}

	multi method blit($renderer) {
	      $!tilemap.blit($renderer)
	}

}
