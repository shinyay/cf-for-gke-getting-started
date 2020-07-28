#!/usr/bin/env fish

function do_func
  argparse -n do_func 'h/help' 'z/zone=' -- $argv
  or return 1

  if set -lq _flag_help
    echo "config-region-zone.fish -z/--zone <ZONE>"
    return
  end

  set -lq _flag_zone
  or set -l _flag_zone us-central1-c

  gcloud config set compute/zone $_flag_zone
  gcloud config set compute/region (echo $_flag_zone | rev | cut -c 3- | rev)
end

do_func $argv