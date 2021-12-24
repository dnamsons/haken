module Haken
  module Helpers
    def load_view_hooks_for(identifier)
      Listeners.load_hooks_for(self, identifier).html_safe
    end
  end

  ActionView::Base.include Helpers
end
