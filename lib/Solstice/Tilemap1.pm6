use Solstice::Tilemap;

### The tilemap of the first room

class Solstice::Tilemap1 is Tilemap {

      has $!tilewidth;
      has $!tileheight;
      has $!mapwidth;
      has $!mapheight;

      has $!tile1id;
      has @!tiles;

      	submethod BUILD(:$renderer) {

		  $!tilewidth = 92;
		  $!tileheight = 48;

		  $!mapwidth = 5;
		  $!mapheight = 5;

		  @!tiles = ();
		  $!tileid0 = 0;

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
		    	
		    	if ($el == $!tileid0) {
			   ### FIXME diagonal x, y
			   @!tiles[$j].push(OchreFloorDiamond($i * $!tilewidth, $j * $!tileheight, $renderer));
			   $i++;
			  }
		     }
		     $j++;
		}

	}

	multi method collideShadax($shadax) {
	     for @tiles -> @l {
	     	 for @l -> $el {
		     if ($el.collideDiamond($shadax) and $el.collideXY($shadax)) {
		     	return $el;
			  }
		     }
		     
		}
	    retrun Nil;
	}

	multi method blit($renderer) {
	     for @tiles -> @l {
	     	 for @l -> $el {
		     $el.blit($renderer);
		    }
		     
		}
	}
}