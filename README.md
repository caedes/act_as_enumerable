# ActAsEnumerable

[![Build Status][travis-img]][travis-url]
[![Coveralls][coveralls-img]][coveralls-url]
[![Dependency Status][gemnasium-img]][gemnasium-url]
[![Code Climate][codeclimate-img]][codeclimate-url]
[![Gem Version][gemversion-img]][gemversion-url]

_Add enumeration to your ruby classes_

## Installation

```shell
gem install act_as_enumerable
```

Or in your Gemfile:

```ruby
gem 'act_as_enumerable'
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

Released under the MIT License. See the [LICENSE](https://github.com/caedes/act_as_enumerable/blob/master/LICENSE.md) file for further details.

[travis-img]: https://secure.travis-ci.org/caedes/act_as_enumerable.png?branch=master
[travis-url]: http://travis-ci.org/caedes/act_as_enumerable
[coveralls-img]: https://coveralls.io/repos/caedes/act_as_enumerable/badge.png?branch=master
[coveralls-url]: https://coveralls.io/r/caedes/act_as_enumerable
[gemnasium-img]: https://gemnasium.com/caedes/act_as_enumerable.png
[gemnasium-url]: https://gemnasium.com/caedes/act_as_enumerable
[codeclimate-img]: https://codeclimate.com/github/caedes/act_as_enumerable.png
[codeclimate-url]: https://codeclimate.com/github/caedes/act_as_enumerable
[gemversion-img]: https://badge.fury.io/rb/act_as_enumerable.png
[gemversion-url]: http://badge.fury.io/rb/act_as_enumerable
