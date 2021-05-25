use Solstice::Move;

class Soltice::DownMove is Move {

      submethod BUILD() {
      		$!dx = -1;
		$!dy = 1;
      }

}