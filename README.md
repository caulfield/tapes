# Tapes

[![Build Status](https://travis-ci.org/caulfield/tapes.svg?branch=master)](https://travis-ci.org/caulfield/tapes)

Tapes is a library that provides an easy interface for managing your model validation on html forms. It allows you to work with all validations from browser.

## Installation

    gem 'tapes'
    $ bundle

## Usage

To start using Tapes you have to use this helper option it provides:

```erb
<%= form_for @post, tapes: true do |f| %>
  <%= f.text_field :title %>
  <%= f.text_area :content %>
  <%= f.submit %>
<% end %>
```

When model is:

```ruby
class Post < ActiveRecord::Base
  validates :title, presence: true, allow_nil: true
  validates :content, length: { is: 12 }
end
```

This code will be generated with following data attributes:

```html
<input data-tps-presence-allow-nil="true" data-tps-presence="true" id="post_title" name="post[title]" type="text">
<textarea data-tps-length-is="12" data-tps-length="true" id="post_content" name="post[content]"></textarea>
```

List of all cases is in `test/integration` folder.(In progress)

### Disable validation

```erb
<%= form_for @post, tapes: true do |f| %>
  <%= f.text_field :title, tapes: false %>
<% end %>
```

This form will be the same as standard.

### Custom validations

```ruby
validate :i_will_add_errors
```

Do not use it. Create custom validations. It's better. Use form objects for any forms(activemodel for example), it's a good application design approach.

## To-do

1. Write integration tests with following issues
2. Make tapes configurable from initializer
3. Handle procs and dynamic conditions
4. More docs

## Contributing

Read [cnt].

[cnt]: https://github.com/caulfield/tapes/CONTRIBUTING.md
