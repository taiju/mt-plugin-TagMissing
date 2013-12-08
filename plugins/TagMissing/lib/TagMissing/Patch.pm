package TagMissing::Patch;

use strict;
use warnings;

sub init {}

use MT::Template::Context;

my $orig_handler_for = \&MT::Template::Context::handler_for;

{
  no warnings 'redefine';
  *MT::Template::Context::handler_for = sub {
    my $ctx = shift;
    my $tag = lc $_[0];
  
    my $hdlr = $orig_handler_for->( $ctx, $tag );
    my ( $h ) = $hdlr->values;
  
    MT->run_callbacks( 'tag_missing', $ctx, $tag ) unless $h;
  
    my $missing_hdlr = $ctx->{__handlers}{$tag};
    ref( $missing_hdlr ) eq 'MT::Template::Handler' ? $missing_hdlr : $hdlr;
  };
}

1;
