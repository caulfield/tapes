require './test/test_helper'

class FormForActiveModelInclusionTest < ActionView::TestCase

  def test_tps_inclusion_option
    concat_form_for @user do |f|
      f.text_field :first_name
    end
    assert_select "input[data-tps-inclusion=?][data-tps-inclusion-in=?]", true, "[&quot;john&quot;]"
  end
end
