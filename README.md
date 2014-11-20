# attr_sanitizable

### Description

A gem for sanitizing data into your database.

### Install

The best way to install is to add it to your Gemfile via:
```
gem 'attr_sanitizable', '~> 0.0.2'
```

### Usage

```ruby
class MyModel < ActiveRecord::Base
  attr_sanitizable :email, with: [:strip, :downcase]
end

m = MyModel.new
m.email = " NOBODY@EXAMPLE.COM\n" 
# => "nobody@example.com"
```

### Custom Sanitizers

```ruby
class String
  def troll
    self.gsub(/a/, "@")
  end
end

class User < ActiveRecord::Base
  attr_sanitizable :email, with: [:troll]
end

user = User.new
user.email = "nobody@example.com"
# => "nobody@ex@mple.com"
```

### Contributing

Feel free to contribute features or bug fixes. Simply fork the repo, implement your feature/bugfix, and submit a pull request. Please ensure you've properly tested your feature/fix before submitting a pull request.


### License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
