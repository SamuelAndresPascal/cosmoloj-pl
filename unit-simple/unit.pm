package Unit;

use strict;
use warnings;

use unitConverter;

sub new {
  my ( $class ) = @_;
  $class = ref($class) || $class;
  print $class;
  my $this = {};
  bless($this, $class);
  return $this;
}

sub titi {
 print("j'imprime titi moi aussi !");
}

#sub new {

#  my ($class,$scale,$offset,$inverse) = @_;
#  my $this = {}
#  bless($this,$class);
#  $this->{SCALE} = $scale
#  $this->{OFFSET} = $offset
#  $this->{INVERSE} = ($inverse == null) ? UnitConverter->new(1. / $scale, $offset / $scale, $this) : $inverse

#  return $this;
#}
1;
