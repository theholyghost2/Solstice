use Solstice::Move;

class Soltice::RightMove is Solstice::Move {

      submethod BUILD() {
      		self.dx = 1;
		self.dy = 1;
      }

}