#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails zeitwerk:check --trace
bundle exec rails assets:precompile
bundle exec rake db:migrate