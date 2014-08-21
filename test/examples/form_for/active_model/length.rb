require './test/test_helper'

class FormForActiveModelLengthTest < ActionView::TestCase

  def test_tps_length_is_option
    concat_form_for @user do |f|
      f.text_field :uid
    end
    assert_select "input[data-tps-length=?][data-tps-length-minimum=?]", true, 8
    assert_select "input[data-tps-length=?][data-tps-length-maximum=?]", true, 8
  end

  def test_tps_length_opened_range_option
    concat_form_for @user do |f|
      f.text_field :title
    end
    assert_select "input[data-tps-length=?][data-tps-length-minimum=?]", true, 2
    assert_select "input[data-tps-length=?][data-tps-length-maximum=?]", true, 3
  end

  def test_tps_length_minimum_option
    concat_form_for @user do |f|
      f.text_field :first_name
    end
    assert_select "input[data-tps-length=?][data-tps-length-minimum=?]", true, 2
  end

  def test_tps_length_unless_options
    concat_form_for @user do |f|
      f.text_field :second_name
    end
    assert_select "input[data-tps-length=?][data-tps-length-minimum=?]", true, 3
    assert_select "input[data-tps-length-unless=?]", "user[first_name]"
  end

  def test_tps_length_close_range
    concat_form_for @user do |f|
      f.text_field :nickname
    end
    assert_select "input[data-tps-length=?][data-tps-length-minimum=?]", true, 3
    assert_select "input[data-tps-length=?][data-tps-length-maximum=?]", true, 11
  end

  def test_tps_length_allow_blank
    concat_form_for @user do |f|
      f.text_field :nickname
    end
    assert_select "input[data-tps-length=?][data-tps-length-allow-blank=?]", true, true
  end

  def test_tps_length_allow_nil
    concat_form_for @user do |f|
      f.text_field :title
    end
    assert_select "input[data-tps-length=?][data-tps-length-allow-nil=?]", true, true
  end

  def test_tps_length_ingnore_falsy_allow_nil_and_blank
    concat_form_for @user do |f|
      f.text_field :uid
    end
    assert_select "input[data-tps-length=?]", true
    assert_no_select "[data-tps-length-ignore-blank]"
    assert_no_select "[data-tps-length-ignore-nil]"
  end
end