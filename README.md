# Enum Plus

Add enumeration to your ruby classes

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
