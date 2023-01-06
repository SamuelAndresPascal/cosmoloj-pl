package UnitConverter;

use strict;
use warnings;

use unit;

sub new {
  my ( $class, $scale, $offset, $inverse ) = @_;
  $class = ref($class) || $class;
  my $this = {};
  bless($this, $class);
  $this->{SCALE} = $scale;
  $this->{OFFSET} = $offset ||= 0.;
  $this->{INVERSE} = $inverse ? $inverse : UnitConverter->new(1. / $scale, -$offset / $scale, $this);
  return $this;
}

sub scale {
  my $this = shift;
  return $this->{SCALE};
}

sub offset {
  my $this = shift;
  return $this->{OFFSET};
}

sub inverse {
  my $this = shift;
  return $this->{INVERSE};
}

sub linear {
  my $this = shift;
  # comparaison volontaire avec un double
  if ($this->offset == 0.) {
    return $this;
  } else {
    return UnitConverter->new($this->scale);
  }
}

sub linearPow {
  my ( $this, $pow ) = @_;
  # comparaison volontaire avec des doubles
  if ($this->offset == 0. and $pow == 1.) {
    return $this;
  } else {
    return UnitConverter->new($this->scale ** $pow);
  }
}

sub convert {
  my ( $this, $value ) = @_;
  return $value * $this->scale + $this->offset;
}

sub concatenate {
  my ( $this, $converter ) = @_;
  return UnitConverter->new($converter->scale * $this->scale, $this->convert($converter->offset));
}
1;
