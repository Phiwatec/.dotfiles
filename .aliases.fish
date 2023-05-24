# Delete a given line number in the known_hosts file.

function knownrm
  set re '^[0-9]+$'
  if not string match --quiet -r  $re $argv[1]
    echo "error: line number missing" >&2;
  else
   sed -i "$argv[1]d" ~/.ssh/known_hosts
  end
end

# You have to add the aliases for the root account in order for this to work
function sudo -d "sudo wrapper that handles aliases"
    if functions -q -- $argv[1]
        set -l new_args (string join ' ' -- (string escape -- $argv))
        set argv fish -c "$new_args"
    end

    command sudo $argv
end
