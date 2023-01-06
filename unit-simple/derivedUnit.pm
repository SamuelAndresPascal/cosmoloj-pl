package DerivedUnit;

use strict;
use warnings;

use unitConverter;
use unit;

# heritage
use base qw( Unit );

sub new {
  my $class = shift;
  my @definition = @_;
  $class = ref($class) || $class;
  my $this = $class->SUPER::new();
  bless($this, $class);
  $this->{DEFINITION} = [@definition];
  return $this;
}

sub definition {
  my $this = shift;
  my @titi = $this->{DEFINITION};
  return @{$this->{DEFINITION}};
}

sub toBase {
  my $this = shift;
  my $transform = UnitConverter->new(1.0);
  my @def = $this->definition;
  for (@def) {
    $transform = $_->dim->toBase->linearPow($_->power)->concatenate($transform);
  }
  return $transform;
}
1;
