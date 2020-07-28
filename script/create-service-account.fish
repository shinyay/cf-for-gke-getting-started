#!/usr/bin/env fish

function do_func
  argparse -n do_func 'h/help' 'n/name=' -- $argv
  or return 1

  if set -lq _flag_help
    echo "create-service-account.fish -n/--name <ACCOUNT_NAME>"
    return
  end

  set -lq _flag_name
  or set -l _flag_name cf-for-gke

  set -l _project (gcloud config get-value project)

  gcloud iam service-accounts create $_flag_name --display-name $_flag_name
  gcloud iam service-accounts keys create --iam-account $_flag_name@$_project.iam.gserviceaccount.com (pwd |awk -F '/cf-for-gke-getting-started' '{print $1}')/cf-for-gke-getting-started/cf-for-k8s/tmp/gcloud-key.json
  gcloud projects add-iam-policy-binding $_project --member serviceAccount:$_flag_name@$_project.iam.gserviceaccount.com --role roles/storage.admin
end

do_func $argv