#!/bin/sh
rm db/schema.rb
rails db:drop
rails db:setup
rails db:migrate
rails db:seed
