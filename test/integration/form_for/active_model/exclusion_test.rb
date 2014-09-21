require './test/test_helper'

class FormForActiveModelExclusionTest < ActionView::TestCase

  def test_tps_exlusion_option
    concat_form_for @user do |f|
      f.text_field :nickname
    end
    assert_select "input[data-tps-exclusion=?][data-tps-exclusion-within=?]", true, "[&quot;caulfield&quot;]"
  end
end
