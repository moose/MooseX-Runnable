package MooseX::Runnable::Invocation::Plugin::Role::CmdlineArgs;

our $VERSION = '0.11';

use Moose::Role;
use namespace::autoclean;

requires '_build_initargs_from_cmdline';

1;
