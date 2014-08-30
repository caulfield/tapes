require './test/test_helper'

class FormForActiveModelNumericalityTest < ActionView::TestCase

  def test_tps_numericality_only_integer_true_option
    concat_form_for @user do |f|
      f.text_field :uid
    end
    assert_select "input[data-tps-numericality=?][data-tps-numericality-only-integer=?]", true, true
  end

  def test_tps_numericality_only_integer_false_option
    concat_form_for @user do |f|
      f.text_field :height
    end
    assert_select "input[data-tps-numericality=?][data-tps-numericality-only-integer=?]", true, false
  end

  def test_tps_numericality_closed_limits
    concat_form_for @user do |f|
      f.text_field :age
    end
    assert_select "input[data-tps-numericality=?][data-tps-numericality-less-than=?]", true, 100
    assert_select "input[data-tps-numericality=?][data-tps-numericality-greater-than=?]", true, 0
  end

  def test_tps_numericality_opened_limits
    concat_form_for @user do |f|
      f.text_field :height
    end
    assert_select "input[data-tps-numericality=?][data-tps-numericality-less-than-or-equal-to=?]", true, 250
    assert_select "input[data-tps-numericality=?][data-tps-numericality-greater-than-or-equal-to=?]", true, 20
  end

  def test_tps_numericality_allow_blank_true_option
    concat_form_for @user do |f|
      f.text_field :weight
    end
    assert_select "input[data-tps-numericality=?][data-tps-numericality-allow-blank=?]", true, true
  end

  def test_tps_numericality_if_option
    concat_form_for @user do |f|
      f.text_field :volume
    end
    assert_select "input[data-tps-numericality=?][data-tps-numericality-if=?]", true, "weight"
  end

  def test_tps_numericality_unless_option
    concat_form_for @user do |f|
      f.text_field :volume
    end
    assert_select "input[data-tps-numericality=?][data-tps-numericality-unless=?]", true, "age"
  end
end
