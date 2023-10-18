#!/usr/bin/env fish

set command_list "echo 'Command 1'" "echo 'Command 2'" "echo 'Command 3'"
for cmd in $command_list
  eval $cmd
end

set cmd ls \| cut -c 1-12
eval $cmd
