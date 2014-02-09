package MooseX::Runnable::Invocation::MxRun;

use Moose;
use namespace::autoclean;

extends 'MooseX::Runnable::Invocation';
with 'MooseX::Runnable::Invocation::Role::WithParsedArgs';

1;
