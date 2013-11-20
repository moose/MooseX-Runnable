# NAME

MooseX::Runnable - Tag a class as a runnable application

# VERSION

version 0.06

# SYNOPSIS

Create a class, tag it runnable, and provide a `run` method:

    package App::HelloWorld;
    use feature 'say';
    use Moose;

    with 'MooseX::Runnable';

    sub run {
       my ($self,$name) = @_;
       say "Hello, $name.";
       return 0; # success
    }

Then you can run this class as an application with the included
`mx-run` script:

    $ mx-run App::HelloWorld jrockway
    Hello, jrockway.
    $

`MooseX::Runnable` supports [MooseX::Getopt](http://search.cpan.org/perldoc?MooseX::Getopt), and
other similar systems (and is extensible, in case you have written
such a system).

# DESCRIPTION

MooseX::Runnable is a framework for making classes runnable
applications.  This role doesn't do anything other than tell the rest
of the framework that your class is a runnable application that has a
`run` method which accepts arguments and returns the process' exit
code.

This is a convention that the community has been using for a while.
This role tells the computer that your class uses this convention, and
let's the computer abstract away some of the tedium this entails.

# REQUIRED METHODS

## run

Your class must implement `run`.  It accepts the command-line args
(that were not consumed by another parser, if applicable) and returns
an integer representing the UNIX exit value.  `return 0` means
success.

# THINGS YOU GET

## `mx-run`

This is a script that accepts a `MooseX::Runnable` class and tries to
run it, using `MooseX::Runnable::Run`.

The syntax is:

    mx-run Class::Name

    mx-run <args for mx-run> -- Class::Name <args for Class::Name>

for example:

    mx-run -Ilib App::HelloWorld --args --go --here

or:

    mx-run -Ilib +Persistent --port 8080 -- App::HelloWorld --args --go --here

## `MooseX::Runnable::Run`

If you don't want to invoke your app with `mx-run`, you can write a
custom version using [MooseX::Runnable::Run](http://search.cpan.org/perldoc?MooseX::Runnable::Run).

# ARCHITECTURE

`MX::Runnable` is designed to be extensible; users can run plugins
from the command-line, and application developers can add roles to
their class to control behavior.

For example, if you consume [MooseX::Getopt](http://search.cpan.org/perldoc?MooseX::Getopt), the
command-line will be parsed with `MooseX::Getopt`.  Any recognized
args will be used to instantiate your class, and any extra args will
be passed to `run`.

# BUGS

Many of the plugins shipped are unstable; they may go away, change,
break, etc.  If there is no documentation for a plugin, it is probably
just a prototype.

# AUTHOR

Jonathan Rockway <jrockway@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Jonathan Rockway.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

# CONTRIBUTORS

- Duke Leto <jonathan@leto.net>
- Jonathan Rockway <jon@jrock.us>
- Karen Etheridge <ether@cpan.org>
- Karen Etheridge <karen@etheridge.ca>
