use v6.c;
use Test;      # a Standard module included with Rakudo 
use lib 'lib';

my $num-tests = 5;

plan $num-tests;
 
# .... tests 
#  

use-ok "Solstice::Diamond";
use-ok "Solstice::Entity";
use-ok "Solstice::Shadax";
use-ok "Solstice::Room";
use-ok "Solstice::Tilemap";

done-testing;  # optional with 'plan' 
