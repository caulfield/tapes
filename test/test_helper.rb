require 'bundler/setup'

require "minitest/autorun"
require 'minitest/unit'
require 'minitest/stub_const'

require 'active_support/all'
require 'action_view'
require 'action_view/template'
require 'action_view/test_case'

Dir["#{File.dirname(__FILE__)}/support/*.rb"].each { |f| require f }

require 'tapes'

I18n.enforce_available_locales = false

class ActionView::TestCase
  include Helpers

  setup :prepare_user

  def prepare_user(attributes = {})
    user_attrributes = {id: 1}.merge(attributes)
    @user = User.new user_attrributes
  end

  def user_path(*args)
    '/users'
  end

  alias :users_path :user_path
end
