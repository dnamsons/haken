require 'haken/version'
require 'haken/listeners'
require 'haken/helpers' if defined?(ActionView)

module Haken
  def self.on_load(identifier, &block)
    Listeners.subscribe(identifier, &block)
  end

  def load_hooks_for(identifier, *args)
    Listeners.load_hooks_for(identifier, *args)
  end
end
