# Delete a given line number in the known_hosts file.

function knownrm
  set re '^[0-9]+$'
  if not string match --quiet -r  $re $argv[1]
    echo "error: line number missing" >&2;
  else
   sed -i "$argv[1]d" ~/.ssh/known_hosts
  end
end
