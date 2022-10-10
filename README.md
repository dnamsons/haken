# Haken

A very simple gem for defining places where additional content can be injected from elsewhere.

## Installation

Add this line to your Gemfile and then execute bundle install:

```rb
gem 'haken'
```

## Usage

Define a place where additional content can be injected:

`views/layouts/_navbar.html.erb`
```erb
<nav>
  <%= load_view_hooks_for :navbar %>
</nav>
```

Then you can define a partial elsewhere(for example in a different Rails engine) and inject it into the navbar via an initializer like this:
```rb
module MyEngine
  class Engine < Rails::Engine
    initializer 'my_engine.view_hooks' do
      Haken.on_load(:navbar) { render 'layouts/my_engine/navbar_extension' }
    end
  end
end
```
