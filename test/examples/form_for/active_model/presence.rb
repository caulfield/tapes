require './test/test_helper'

class FormForActiveModelPresenceTest < ActionView::TestCase

  def test_tps_presence_data_attributes
    concat_form_for @user do |f|
      f.text_field :uid
    end
    assert_select "input[data-tps-presence=?]", true
  end

  def test_tps_presence_if_option_method
    concat_form_for @user do |f|
      f.text_field :second_name
    end
    assert_select "input[data-tps-presence=?][data-tps-presence-if=?]", true, "title"
  end

  def test_tps_presence_allow_nil_option
    concat_form_for @user do |f|
      f.text_field :third_name
    end
    assert_select "input[data-tps-presence=?][data-tps-presence-allow-nil=?]", true, true
  end

  def test_tps_presence_allow_nil_false_option
    concat_form_for @user do |f|
      f.text_field :title
    end
    assert_select "input[data-tps-presence=?][data-tps-presence-allow-nil=?]", true, false
  end

  def test_tps_presence_ignore_allow_blank_true
    concat_form_for @user do |f|
      f.text_field :nickname
    end
    assert_select "[data-tps-presence=?][data-tps-presence-allow-blank]", true, true
  end

  def test_tps_presence_allow_blank_false
    concat_form_for @user do |f|
      f.text_field :first_name
    end
    assert_select "input[data-tps-presence=?][data-tps-presence-allow-blank]", true, false
  end
end
