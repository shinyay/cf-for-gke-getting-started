#!/usr/bin/env fish

function do_func
  argparse -n do_func 'h/help' 'a/address=' -- $argv
  or return 1

  if set -lq _flag_help
    echo "create-static-ip.fish -a/--address <ADDRESS_NAME>"
    return
  end

  set -lq _flag_address
  or set -l _flag_address cf-for-k8s

  gcloud compute addresses create $_flag_address --region (gcloud config get-value compute/region) --format json | jq -r '.[].address'
end

do_func $argv