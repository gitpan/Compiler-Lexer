package Compiler::Lexer;
use strict;
use warnings;
use 5.008_001;
use Compiler::Lexer::Token;
use Compiler::Lexer::Constants;

require Exporter;
our @ISA = qw(Exporter);
our %EXPORT_TAGS = ( 'all' => [ qw() ] );
our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );
our @EXPORT = qw();
our $VERSION = '0.12';
require XSLoader;
XSLoader::load(__PACKAGE__, $VERSION);

1;
__END__

=head1 NAME

Compiler::Lexer - Lexical Analyzer for Perl5

=head1 SYNOPSIS

  use Compiler::Lexer;
  use Data::Dumper;

  my $filename = $ARGV[0];
  open my $fh, '<', $filename;
  my $script = do { local $/; <$fh> };

  my $lexer = Compiler::Lexer->new($filename);
  my $tokens = $lexer->tokenize($script);
  print Dumper $$tokens;

  my $modules = $lexer->get_used_modules($script);
  print Dumper $$modules;

=head1 METHODS

Compiler::Lexer provides three methods

=over

=item my $lexer = Compiler::Lexer->new($filename);

create new instance.
You can create object from `$filename` in string.

=item $lexer->tokenize($script);

get token objects includes parameter of 'name' or 'type' or 'line' and so on.
This method requires perl source code in string.

=item $lexer->get_used_modules($script);

get names of used module.
This method requires perl source code in string.

=back

=head1 AUTHOR

Masaaki Goshima (goccy) E<lt>goccy(at)cpan.orgE<gt>

=head1 CONTRIBUTORS

tokuhirom: Tokuhiro Matsuno

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2013, Masaaki Goshima (goccy). All rights reserved.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
