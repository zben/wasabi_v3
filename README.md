# WasabiV3

A simple WSDL parser.

[![Build Status](https://secure.travis-ci.org/savonrb/wasabi_v3.png)](http://travis-ci.org/savonrb/wasabi_v3)
[![Gem Version](https://badge.fury.io/rb/wasabi_v3.png)](http://badge.fury.io/rb/wasabi_v3)
[![Code Climate](https://codeclimate.com/github/savonrb/wasabi_v3.png)](https://codeclimate.com/github/savonrb/wasabi_v3)
[![Coverage Status](https://coveralls.io/repos/savonrb/wasabi_v3/badge.png?branch=master)](https://coveralls.io/r/savonrb/wasabi_v3)


## Installation

WasabiV3 is available through [Rubygems](http://rubygems.org/gems/wasabi_v3) and can be installed via:

```
$ gem install wasabi_v3
```


## Getting started

``` ruby
document = WasabiV3.document File.read("some.wsdl")
```

Get the SOAP endpoint:

``` ruby
document.endpoint
# => "http://soap.example.com"
```

Get the target namespace:

``` ruby
document.namespace
# => "http://v1.example.com"
```

Check whether elementFormDefault is set to `:qualified` or `:unqualified`:

``` ruby
document.element_form_default
# => :qualified
```

Get a list of available SOAP actions (snakecase for convenience):

``` ruby
document.soap_actions
# => [:create_user, :find_user]
```

Get a map of SOAP action Symbols, their input tag and original SOAP action name:

``` ruby
document.operations
# => { :create_user => { :input => "createUser", :action => "createUser" },
# =>   :find_user => { :input => "findUser", :action => "findUser" } }
```
