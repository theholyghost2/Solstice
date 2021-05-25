use Solstice::Move;

class Soltice::RightMove is Move {

      submethod BUILD() {
      		$!dx = 1;
		$!dy = 1;
      }

}