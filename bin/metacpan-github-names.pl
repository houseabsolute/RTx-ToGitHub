use strict;
use warnings;
use v5.10;

use List::AllUtils qw( first );
use Search::Elasticsearch;

my $es = Search::Elasticsearch->new(
    cxn_pool => 'Static::NoPing',
    nodes    => 'api.metacpan.org'
);

my $scroller = $es->scroll_helper(
    search_type => 'scan',
    scroll      => '5m',
    index       => 'v0',
    type        => 'author',
    size        => 100,
    body => { query => { match => { 'author.profile.name' => 'github' } } },
);

my %map;
while ( my $result = $scroller->next ) {
    my $profile = (
        first { $_->{name} eq 'github' }
        @{ $result->{_source}{profile} }
    );
    my $id = lc $profile->{id};
    $id =~ s{^.+github\.com/}{};
    $id =~ s{/$}{};

    next unless length $id;

    # Some people appear to have some sort of hash as their github ID.
    next if $id =~ /^[0-9a-f]{40}$/;

    if ( $result->{_source}{pauseid} ) {
        $map{ lc $result->{_source}{pauseid} . '@cpan.org' } = $id;
    }
    if ( @{ $result->{_source}{email} // [] } ) {
        $map{ lc $_ } = $id for @{ $result->{_source}{email} };
    }
}

# Extra mappings I know about go here ...
$map{'olaf@wundersolutions.com'} = 'oalders';

use Devel::Dwarn;
Dwarn \%map;
