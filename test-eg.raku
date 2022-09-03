#!/usr/bin/env raku

use YAMLish;
use File::Find;
use Test;

my @yml = find :dir('./examples'), :type('file'), :name(/:i '.' [yml|yaml] $/);

if not @*ARGS.elems {
    print qq:to/HERE/;
    Usage: {$*PROGRAM.basename} go

    Uses module C<YAMLish> to check for valid YAML 
    code in subdirectory './examples':

    HERE
    say "  {$_.IO.basename}" for @yml;
    exit;
}

for @yml -> $f {
    my @data = $f.IO.lines;
    for @data -> $v {
        is-deeply load-yaml(save-yaml($v)), $v; 
    }
}





