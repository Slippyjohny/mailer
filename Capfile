require 'capistrano/setup'
require 'capistrano/deploy'

require 'capistrano/rails'
require 'capistrano/bundler'
require 'capistrano/rvm'
require 'capistrano/puma'
require "capistrano/scm/git"
Capistrano::SCM::Git.new


Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
