# attr_sanitizable

### Usage

```
class MyModel < ActiveRecord::Base
  attr_sanitizable :email, with: [:strip, :downcase]
end

m = MyModel.new
m.email = " NOBODY@EXAMPLE.COM\n" # => "nobody@example.com"
```