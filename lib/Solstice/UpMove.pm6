use Solstice::Move;

class Soltice::UpMove is Solstice::Move {

      submethod BUILD() {
      		self.dx = 1;
		self.dy = -1;
      }

}