# DCMetro 
[![Gem Version](https://badge.fury.io/rb/dcmetro.svg)](http://badge.fury.io/rb/dcmetro)
[![Build Status](https://travis-ci.org/kencrocken/dcmetro.svg?branch=master)](https://travis-ci.org/kencrocken/dcmetro)
[![Coverage Status](https://coveralls.io/repos/kencrocken/dcmetro/badge.svg?branch=master&service=github)](https://coveralls.io/github/kencrocken/dcmetro?branch=master)

Rails class and a command line interface to access the Washington, D.C. Metro Rail API.  Returns the systemwide alerts, lines, stations and arrival times for the lines at each station.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dcmetro'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dcmetro

####An ENV variable must be set either in your shell for the CLI or where ever you keep such variables in your Rails apps.

The variable needs to be set to `DCMETRO_KEY`

It is recommended that a key is requested from https://developer.wmata.com/

For the CLI, in the `.bash_profile` set the following:
`EXPORT DCMETRO_KEY = <<replace with api key from WMATA>>`

Don't forget to `source .bash_profile` after making the changes.

## Usage
###Rails App

With the gem installed, instantiate a new class in your controller:

```ruby
class WelcomeController < ApplicationController

  def index
    x = DCMetro::Information.new
    @alerts = JSON.parse x.alerts
    @lines = JSON.parse x.line
    @stations = JSON.parse x.line "green"
    @college_park = JSON.parse x.station "college"
    @gallery_place = JSON.parse x.station "gallery"
    #
    # New in 0.0.3 - kind of a work in prorgress
    @fare_info = JSON.parse x.station "college", "gallery"
  end

end
```

###CLI

```
$ dcmetro
Commands:
  dcmetro alerts          # Display DC Metro system wide alerts.
  dcmetro help [COMMAND]  # Describe available commands or one specific command
  dcmetro line COLOR      # Display metro rail lines, if COLOR, displays rail stations on the COLOR line
  dcmetro station STARTING,DEST    # Display metro station train arrival and departure times and travel info.
  ```

### CHANGELOG

##### Changes in 0.0.3
1. Adds station to station travel information
2. Expanded test coverage
3. Refactors code so that the Information Class merely returns information
   Any parsing is now done in the CLI application  

##### Changes in 0.0.2

1. Updates the api calls to the new format
2. Fixes a bug if multiple stations are returned
3. Requires the use of an env variable for the API key
4. Requires rest-client  

## Contributing

1. Fork it - [https://github.com/kencrocken/dcmetro/fork](https://github.com/kencrocken/dcmetro/fork)
2. Create your feature branch `git checkout -b my-new-feature`
3. Commit your changes `git commit -am 'Add some feature'`
4. Push to the branch `git push origin my-new-feature`
5. Create a new Pull Request


###Development

`$ cd ~/path/to/dcmetro` 
`bundle install` to get dependencies.
`bundle exec bin/dcmetro`
`cucumber features` to run tests.
