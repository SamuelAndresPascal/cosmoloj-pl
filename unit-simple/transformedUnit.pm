package TransformedUnit;

use strict;
use warnings;

use unitConverter;
use unit;

# heritage
use base qw( Unit );

sub new {
  my ( $class, $toReference, $reference ) = @_;
  $class = ref($class) || $class;
  my $this = $class->SUPER::new();
  bless($this, $class);
  $this->{TO_REFERENCE} = $toReference;
  $this->{REFERENCE} = $reference;
  return $this;
}

sub toReference {
  my $this = shift;
  return $this->{TO_REFERENCE};
}

sub reference {
  my $this = shift;
  return $this->{REFERENCE};
}

sub toBase {
  my $this = shift;
  return $this->reference->toBase->concatenate($this->toReference);
}
1;
