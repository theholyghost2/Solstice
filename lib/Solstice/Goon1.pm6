use Solstice::Entity;

class Solstice::Goon1 is Solstice::Entity {

      submethod BUILD(:$x, :$y, :$w, :$h, :$zpos) {
      		self.x = $x;
		self.y = $y;

		self.width = $w;
		self.height = $h;

		self.zposition = $zpos;
	}

}
      		