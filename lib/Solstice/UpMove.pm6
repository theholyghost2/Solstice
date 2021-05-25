use Solstice::Move;

class Soltice::UpMove is Move {

      submethod BUILD() {
      		$!dx = 1;
		$!dy = -0.5;
      }

}