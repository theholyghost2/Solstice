use Solstice::Move;

class Soltice::DownMove is Solstice::Move {

      submethod BUILD() {
      		self.dx = -1;
		self.dy = 1;
      }

}