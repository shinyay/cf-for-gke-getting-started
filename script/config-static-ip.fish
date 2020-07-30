#!/usr/bin/env fish

function do_func
  argparse -n do_func 'h/help' 'i/ip=' -- $argv
  or return 1

  if set -lq _flag_help
    echo "config-static-ip.fish -i/--ip <YOUR_STATIC_IP>"
    return
  end

  set -lq _flag_ip
  or set -l _flag_ip "<YOUR_STATIC_IP>"

  set _config_dir (pwd |awk -F '/cf-for-gke-getting-started' '{print $1}')/cf-for-gke-getting-started/cf-for-k8s/config-values

  echo "#@data/values
  ---
  istio_static_ip: $_flag_ip
  " > $_config_dir/static-ip.yml
end

do_func $argv