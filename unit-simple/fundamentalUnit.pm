package FundamentalUnit;

use strict;
use warnings;

use unitConverter;
use unit;

# heritage
use base qw( Unit );

sub new {
  my ( $class ) = @_;
  $class = ref($class) || $class;
  my $this = $class->SUPER::new();
  bless($this, $class);
  return $this;
}

sub toBase {
  return UnitConverter->new(1.0);
}
1;
