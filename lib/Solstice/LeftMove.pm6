use Solstice::Move;

class Soltice::LeftMove is Move {

      submethod BUILD() {
      		$!dx = -1;
		$!dy = -1;
      }

}