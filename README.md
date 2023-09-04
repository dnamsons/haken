# Haken

A very simple gem for extending views by injecting additional content.

When building applications that use the [bounded context](https://martinfowler.com/bliki/BoundedContext.html) pattern, there can be situations when a context A influences the presentation logic of context B. This library is an experiment of introducing a pseudo PubSub architecture for injecting front-end views to solve these types of problems.

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

## Roadmap

We currently only support simple injections without any control over priority (if there are two *subscriptions* for a view hook, the priority they will be rendered in depends on the initialization sequence of the Rails engines they are defined in).

Next step for improving this library is to introduce a priority system.
