use Solstice::Tilemap;

use Solstice::OchreFloorDiamond;
use Solstice::OchreSlabDiamond;

### The tilemap of the first room

class Solstice::Tilemap1 is Solstice::Tilemap {

      has $!tilewidth;
      has $!tileheight;
      has $!mapwidth;
      has $!mapheight;

      has @!map;

      has $!tile1id;
      has @!tiles;

      has $!tileid1;

      	submethod BUILD(:$renderer) {

		  $!tilewidth = 96;
		  $!tileheight = 48;

		  $!mapwidth = 5;
		  $!mapheight = 5;

		  @!tiles = ();
		  $!tileid1 = 0;

		  @!map = ((0,0,0,0,0),
		  	(0,0,0,0,0),
			(0,0,0,0,0),
			(0,0,0,0,0),
			(0,0,0,0,0));

		my $j = 0;
		for @!map -> @l {
		    my $i = 0;
		    @!tiles.push(());
		    for @l -> $el {
		    	
		    	if ($el == $!tileid1) {
			   ### FIXME diagonal x, y
			   @!tiles[$j].push(Solstice::OchreFloorDiamond(self.x + $i * $!tilewidth, self.y + $j * $!tileheight, $renderer));
			   $i++;
			  }
		     }
		     $j++;
		}

	}

	multi method collideShadax($shadax) {
	     for @!tiles -> @l {
	     	 for @l -> $el {
		     if ($el.collideDiamond($shadax) and $el.collideXY($shadax)) {
		     	return $el;
			  }
		     }
		     
		}
	    return Nil;
	}

	multi method blit($renderer) {
	     for @!tiles -> @l {
	     	 for @l -> $el {
		     $el.blit($renderer);
		    }
		     
		}
	}
}
