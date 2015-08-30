require 'bundler/setup'
require 'rspec'

Bundler.require 

Dir['./app/*.rb'].each { |file| require file }