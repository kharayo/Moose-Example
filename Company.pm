package Company;
use Moose::Role;
use Moose::Util::TypeConstraints;

has brand => (
    is  => 'rw',
    isa => 'Str',
);

has established_date => (
    is  => 'ro',
    isa => 'DateStr',
);

subtype 'DateStr'
    => as 'Str'
    => where {
        /^\d\d-\d\d-\d\d\d\d$/
};

sub operating_system {
    my $self = shift;
    print $self->brand . " has " . $self->os;
}

requires 'info';
no Moose::Role;
1;

package Mobile;
use Moose;
with 'Company';
has os => (
    is  => 'rw',
    isa  => 'Str',
);

has released_date => (
    is  => 'rw',
    isa => 'DateTime',
);


sub info { 'Powered by ' . shift->os };

no Moose;
1;

use Data::Dumper;
use DateTime;
use 5.020;

my $a_google = Mobile->new( brand => 'Google', os => 'Android' );
my $date = DateTime->new(
    year => 1963, month => 5, day => 5,
);
$a_google->released_date($date);
say $a_google->info;
say $a_google->released_date();
say $a_google->released_date->year;
say $a_google->released_date->month;
say $a_google->released_date->day;
