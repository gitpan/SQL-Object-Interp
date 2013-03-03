use strict;
use warnings;
use Test::More;
use SQL::Object::Interp qw/isql_obj/;

subtest 'basic' => sub {
    my $sql = isql_obj('foo.id =', \1, 'AND', 'foo.name =', \'nekokak');
    is $sql->as_sql, 'foo.id = ? AND foo.name = ?';
    is_deeply [$sql->bind], [qw/1 nekokak/];
};

done_testing;

