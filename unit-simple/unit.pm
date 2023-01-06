package Unit;

use strict;
use warnings;

use unitConverter;
use factor;
use transformedUnit;

# heritage
use base qw( Factor );

sub new {
  my ( $class ) = @_;
  $class = ref($class) || $class;
  my $this = $class->SUPER::new();
  bless($this, $class);
  return $this;
}

sub getConverterTo {
  my ( $this, $target ) = @_;
  return $target->toBase->inverse->concatenate($this->toBase);
}

sub toBase {
  die "abstract method toBase";
}

sub shift {
  my ( $this, $value ) = @_;
  return TransformedUnit->new(UnitConverter->newTranslation($value), $this);
}

sub scaleMultiply {
  my ( $this, $value ) = @_;
  return TransformedUnit->new(UnitConverter->newLinear($value), $this);
}

sub scaleDivide {
  my ( $this, $value ) = @_;
  return $this->scaleMultiply(1.0 / $value);
}

sub factor {
  my ( $this, $numerator, $denominator ) = @_;
  return Factor->new($this, $numerator, $denominator);
}
1;
