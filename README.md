# ambari

[![Build Status](https://secure.travis-ci.org/unibet/puppet-ambari.png)](http://travis-ci.org/unibet/puppet-ambari)
[![Puppet Forge](https://img.shields.io/puppetforge/v/unibet/ambari.svg)](https://forge.puppetlabs.com/unibet/ambari)
[![Puppet Forge](https://img.shields.io/puppetforge/f/unibet/ambari.svg)](https://forge.puppetlabs.com/unibet/ambari)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with ambari](#setup)
    * [What ambari affects](#what-ambari-affects)
    * [Setup requirements](#setup-requirements)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

From the Apache Ambari docs:
"The Apache Ambari project is aimed at making Hadoop management simpler by developing software for provisioning, managing, and monitoring Apache Hadoop clusters. Ambari provides an intuitive, easy-to-use Hadoop management web UI backed by its RESTful APIs."

This module aims to manage the infrastructure bits surrounding Ambari, such as package installation, service state management.

Note this module is currently work in progress, however any breaking changes will only be introduced in new minor versions.

## Module Description

Current scope of this module is to provide package installation, service state management and support for running the unattended default server bootstrap.

## Setup

### What ambari affects

* Installs ambari-server
* Optionally manages package repository
* Runs unattended ambari-server setup
* Manages the ambari-server service

### Setup Requirements

No extra setup requirements needed.

## Usage

Use class ambari::server to manage the Ambari server installation. Version to install
is set in the ambari class in case we expand the possibility to manage ambari agents

## Reference

Class: ambari::server

```
class { '::ambari::server':
  use_repo   => true,
  db_backend => 'mysql'
}
```

## Limitations

Tested on EL6

## Development

Fork it, create feature branch, make sure your changes pass lint, compilation and unit tests, then create pull request.

Code / catalog testing:

```
bundle install
bundle exec rake lint
bundle exec rake validate
bundle exec rake spec
```

Integration testing:

```
bundle install
bundle exec kitchen test
```

## Release Notes

N/A
