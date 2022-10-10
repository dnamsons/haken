module Haken
  class Listeners
    include Singleton

    def self.subscribe(identifier, &block)
      instance.subscribe(identifier, &block)
    end

    def self.load_hooks_for(identifier, *args)
      instance.load_hooks_for(identifier, *args)
    end

    def initialize
      @load_hooks = {}
    end

    def subscribe(identifier, &block)
      @load_hooks[identifier] ||= []

      @load_hooks[identifier] << block
    end

    def load_hooks_for(view_context, identifier)
      @load_hooks[identifier].map do |hook|
        view_context.instance_eval(&hook)
      end.join
    end
  end
end
