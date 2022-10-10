module Haken
  module Helpers
    def load_view_hooks_for(identifier, *args)
      Listeners.load_hooks_for(self, identifier, *args).html_safe
    end
  end

  ActionView::Base.include Helpers
end
