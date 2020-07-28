#!/usr/bin/env fish

curl -L "https://packages.cloudfoundry.org/stable?release=linux64-binary&source=github" | tar -zx
rm LICENSE NOTICE 

curl -o bosh https://github.com/cloudfoundry/bosh-cli/releases/download/v6.3.1/bosh-cli-6.3.1-linux-amd64
chmod +x bosh

curl -o ytt https://github.com/k14s/ytt/releases/download/v0.28.0/ytt-linux-amd64
chmod +x ytt

curl -o kapp https://github.com/k14s/kapp/releases/download/v0.31.0/kapp-linux-amd64
chmod +x kapp

set PATH (pwd |awk -F '/cf-for-gke-getting-started' '{print $1}')/cf-for-gke-getting-started/script:$PATH