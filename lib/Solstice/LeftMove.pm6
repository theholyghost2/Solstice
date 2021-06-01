use Solstice::Move;

class Soltice::LeftMove is Solstice::Move {

      submethod BUILD() {
      		self.dx = -1;
		self.dy = -1;
      }

}