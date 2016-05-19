set -g __log_format_DEBUG "<fg:blue>%s</fg> <fg:purple>[%s]</fg> :: <fg:green>[%s]</fg>"
set -g __log_format_WARN "<fg:yellow>%s</fg> <fg:purple>[%s]</fg> :: <fg:blue>[%s]</fg>"
set -g __log_format_ERROR "<fg:ffAA00>%s</fg> <fg:purple>[%s]</fg> :: <fg:yellow>[%s]</fg>"
set -g __log_format_FATAL "<fg:red>%s</fg> <fg:purple>[%s]</fg> :: <fg:red>[%s]</fg>"
set -g __log_format_CRITICAL "<bg:red><fg:white>%s</fg></bg> <fg:purple>[%s]</fg> :: <fg:red>[%s]</fg>"
set -g __log_severities_labels "DEBUG" "WARN" "ERROR" "FATAL" "CRITICAL"
set -g __log_severities 1 2 3 4 5


function cprintf
  set -l text (echo $argv[1] | awk -F "[<|>]" '{ for(i=1;i<=NF;i++){print $i} }')
  if set -q argv[1]
    set -e argv[1]
  end
  set -l pieces (
    set -l color
    for a in $text
      if echo $a | grep -qE '^fg:.+$'
        set color (echo $a | grep -E '^fg:.+$' | cut -d: -f 2)
        set_color $color
      else if echo $a | grep -qºE '^bg:.+$'
        set color (echo $a | grep -E '^bg:.+$' | cut -d: -f 2)
        set_color -b $color
      else if echo $a | grep -qE '^/(fg|bg)$'
        set_color normal
      else
        echo -n $a
      end
    end
  )
  printf "$pieces"\n $argv
end

function log -a message -a severity -d "Empower your log capabilities to the maximum level"
  set -l label
  set -l format
  if test -z "$severity"
    set severity 1
  end
  set label $__log_severities_labels[$severity]
  set format "__log_format_"$label

  cprintf $$format $label (date) $message
end

function debug -a message -d "Alias of 'log <msg>' or 'log <msg> 1'"
  log $message 1
end

function warn -a message -d "Alias of 'log <msg> 2'"
  log $message 2
end

function error -a message -d "Alias of 'log <msg> 3'"
  log $message 3
end

function fatal -a message -d "Alias of 'log <msg> 4'"
  log $message 4
end

function critical -a message -d "Alias of 'log <msg> 5'"
  log $message 5
end
