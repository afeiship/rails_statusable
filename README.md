# rails_statusable
> A Rails plugin for flexible, model-specific status fields with dynamic methods.

## Usage
```rb
class Post < ApplicationRecord
    include RailsStatusable
    statusable statuses: %w[draft published archived], default: 'draft'
end

# install migration
rails generate rails_statusable:install
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem "rails_statusable"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install rails_statusable
```

## Resources
- https://chat.qwen.ai/c/6c5e5633-c893-4b29-982b-0d3a4f9f38b9

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
