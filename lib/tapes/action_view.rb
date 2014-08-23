module Tapes
  module ActionView
    module Helpers
    end
  end
end

require 'tapes/action_view/form_builder'

::ActionView::Helpers::FormBuilder.send :include, Tapes::ActionView::Helpers::FormBuilder
