# Cloud Foundry for GKE Getting Started

Deploy Cloud Foundry on GKE

## Description

### Prerequiste CLI
- cf
- bosh
- ytt
- kapp

Add CLIs to PATH

### Create GKE Cluster

### Create Static IP address

### Create DNS Record

![cloud-dns](images/create-dns.png)

### Configure Cloud Foundry

```
$ cd cf-for-k8s
$ mkdir -p config-values tmp 
$ ./hack/generate-values.sh -d <YOUR_DOMAIN_NAME> > config-values/cf-values.yml
```

#### Configure Static IP Address

- `cf-for-k8s/config-values/static-ip.yml`

```yaml
#@data/values
---
istio_static_ip: <YOUR_STATIC_IP>
```


## Demo

## Features

- feature:1
- feature:2

## Requirement

## Usage

## Installation

## Licence

Released under the [MIT license](https://gist.githubusercontent.com/shinyay/56e54ee4c0e22db8211e05e70a63247e/raw/34c6fdd50d54aa8e23560c296424aeb61599aa71/LICENSE)

## Author

[shinyay](https://github.com/shinyay)
