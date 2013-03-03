package SQL::Object::Interp;
use strict;
use warnings;
use utf8;
use base 'SQL::Object';
use Exporter qw/import/;

our @EXPORT_OK = qw/isql_obj/;

our $VERSION = '0.03';

sub isql_obj {
    require SQL::Interp;
    my ($sql, @args) = SQL::Interp::sql_interp(@_);
    my $bind = [@args];
    SQL::Object::Interp->new(sql => $sql, bind => $bind);
}

1;
__END__

=head1 NAME

SQL::Object::Interp - Yet another SQL condition builder with SQL::Interp

=head1 SYNOPSIS

    use SQL::Object::Interp qw/isql_obj/;
    
    my $sql = isql_obj('foo.id =', \1, 'AND', 'foo.name =', \'nekokak');
    $sql->as_sql; # 'foo.id = ? AND foo.name = ?'
    $sql->bind;   # qw/1 nekokak/

=head1 DESCRIPTION

SQL::Object::Interp is an extension of raw level SQL maker "SQL::Object".

SQL::Object::sql_obj is incompatible with SQL::Interp::sql_interp which returns ($stmt, @binds).

SQL::Object::Interp::isql_obj is a substitute of sql_obj which is compatible with SQL::Interp (like DBIx::Simple::iquery).

=head1 METHODS

SQL::Object::Interp inherits SQL::Object.

=head2 my $sql = isql_obj(args for sql_interp)

create SQL::Object::Interp's instance.

Uses SQL::Interp to generate $stmt, $bind(s).
See SQL::Interp's documentation for usage information.

=head1 AUTHOR

Narazaka (http://narazaka.net/)

=head1 SEE ALSO

L<SQL::Object>

L<SQL::Interp>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
