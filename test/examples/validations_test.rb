require './test/test_helper'

class ValidationsTests < MiniTest::Test

  def setup
    @user = User.new
    @service = Tapes::Validations.new @user
  end

  def test_validations_object
    assert_equal @user, @service.object
  end

  def test_on_method_group
    validations = @service.on(:first_name)
    presence_validations = validations[:presence]
    assert_equal presence_validations[0].attributes, [:first_name]
    assert_equal presence_validations[0].options, { allow_blank: false }
    length_validations = validations[:length]
    assert_equal length_validations[0].options, { minimum: 2 }
  end
end
