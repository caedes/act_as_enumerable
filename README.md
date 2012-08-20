# Enum Plus [![Build Status](https://secure.travis-ci.org/caedes/enum_plus.png?branch=master)](http://travis-ci.org/caedes/enum_plus)

_Add enumeration to your ruby classes_

## Installation

```shell
gem install enum_plus
```

Or in your Gemfile:

```ruby
gem 'enum_plus'
```

## Usage

```ruby
class Person
  attr_accessor :gender

  def initialize opts
    @gender = opts[:gender]
  end

  enum :gender, %w(male female)
end

cameron = Person.new gender: :male

p Person.gender_values
#=> ['male', 'female']

p Person.gender_captions
#=> ['Male', 'Female']

p cameron.gender
#=> 'male'

p cameron.male?
#=> true
p cameron.female?
#=> false

p cameron.female!
#=> 'female'
p cameron.male?
#=> false
p cameron.female?
#=> true

p cameron.gender_caption
#=> 'Female'
```

## Contributing

1. Fork repository
2. Create a branch following a [successfull branching model](http://nvie.com/posts/a-successful-git-branching-model/)
3. Write your feature/fix
4. Write tests
5. Pull request

## Licence

Released under the MIT License. See the [LICENSE](https://github.com/caedes/enum_plus/blob/master/LICENSE.md) file for further details.
