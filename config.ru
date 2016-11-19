#!/usr/bin/env rackup
# encoding: utf-8

# This file can be used to start Padrino,
# just execute it from the command line.

require File.expand_path("../config/boot.rb", __FILE__)

require 'rack/session/moneta'

url = "redis://localhost:6379"

#use Rack::Session::Moneta, store: Moneta.new(:Memory, expires: true)

use Rack::Session::Moneta,
  key: 'rack.session',
  #domain: '4linked.com',
  path: '/',
  expire_after: false, # one week
  secret: 'my-secret',
  store: Moneta.new(:Redis, {
    url: url,
    expires: false,
    threadsafe: true
  })

run Padrino.application
