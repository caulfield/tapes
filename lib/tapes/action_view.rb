module Tapes
  module ActionView
    module Helpers
    end
  end
end


require 'tapes/action_view/form_helper'

::ActionView::Base.send :include, Tapes::ActionView::Helpers::FormHelper
