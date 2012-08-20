# Enum Plus [![Build Status](https://secure.travis-ci.org/caedes/enum_plus.png?branch=master)](http://travis-ci.org/caedes/enum_plus)

_Add enumeration to your ruby classes_

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

Copyright 2012 caedes

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
