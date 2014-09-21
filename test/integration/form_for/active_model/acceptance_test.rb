require './test/test_helper'

class FormForActiveModelAcceptanceTest < ActionView::TestCase

  def test_tps_acceptance_without_options
    concat_form_for @user do |f|
      f.text_field :terms
    end
    assert_select "input[data-tps-acceptance=?]", true
  end

  def test_tps_acceptance_accept_option
    concat_form_for @user do |f|
      f.text_field :terms_of_service
    end
    assert_select "input[data-tps-acceptance-accept=?]", 'Yes'
  end
end
