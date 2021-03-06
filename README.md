# Knight

[![Build Status](https://travis-ci.org/handiwiguna/knight.png?branch=master)](https://travis-ci.org/handiwiguna/knight)
[![Code Climate](https://codeclimate.com/github/handiwiguna/knight.png)](https://codeclimate.com/github/handiwiguna/knight)
[![Coverage Status](https://coveralls.io/repos/handiwiguna/knight/badge.png?branch=master)](https://coveralls.io/r/handiwiguna/knight)

## Installation

Add this line to your application's Gemfile:

    gem 'knight'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install knight

## Usage

```ruby
class User
  attr_reader :username, :password

  def initialize(username, password)
    @username = username
    @password = password
  end
end
user = User.new('john', '')

validator = Knight::Validator.new(Knight::Rule::Presence.new(:username))
result = validator.run(user)
result.valid? # => true

class UserValidator
  include Knight::InstanceMethods

  validator.add(Knight::Rule::Presence.new(:username))

  context :login do |validator|
    validator.add(Knight::Rule::Presence.new(:password))
  end
end
validator = UserValidator.new(user)
result = validator.run
result.valid? # => true

result = validator.run(:login)
result.valid? # => false
result.on(:password) # => #<Set: {#<Knight::Error rule=#<Knight::Rule::Presence attribute_name=:password>>}>

user = User.new('', 'password')
validator = UserValidator.new(user)
result = validator.run(:login)
result.valid? # => false

user = User.new('john', 'password')
validator = UserValidator.new(user)
result = validator.run(:login)
result.valid? # => true
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
