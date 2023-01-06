#!/usr/bin/perl
use strict;
use warnings;

# pour trouver les modules dans le répertoire local
use FindBin 1.51 qw( $RealBin );
use lib $RealBin;

use unit;
use unitConverter;

print(@INC);
print("\n");
print("Hello World\n");
UnitConverter::titi();
print("\n");
UnitConverter->titi();
print("\n");
Unit::titi();
print("\n");
Unit->titi();
print("\n");

my $unit = Unit->new();
print("\n");

my $unitConverter = UnitConverter->new(1, 2, undef);
print("\n");
print($unitConverter);
print("\n");
print($unitConverter->scale);
print("\n");
print($unitConverter->offset);
print("\n");
print($unitConverter->inverse);
print("\n");
print($unitConverter->inverse->scale);
print("\n");
print($unitConverter->inverse->offset);
print("\n");
print($unitConverter->inverse->inverse);
print("\n");
print($unitConverter->inverse->inverse->scale);
print("\n");
print($unitConverter->inverse->inverse->offset);
print("\n");
print($unitConverter->inverse->inverse->inverse);
print("\n");
print($unitConverter->inverse->inverse->inverse->scale);
print("\n");
print($unitConverter->inverse->inverse->inverse->offset);
print("\n");
