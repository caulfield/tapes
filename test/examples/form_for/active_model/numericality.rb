require './test/test_helper'

class FormForActiveModelNumericalityTest < ActionView::TestCase

  def test_tps_numericality
    concat_form_for @user do |f|
      f.text_field :uid
    end
    assert_select "input[data-tps-numericality=?]", true
  end

  def test_tps_numericality_only_integer_true_option
    concat_form_for @user do |f|
      f.text_field :uid
    end
    assert_select "input[data-tps-numericality=?][data-tps-numericaly-integer=?]", true, true
  end

  def test_tps_numericality_only_integer_false_option
    concat_form_for @user do |f|
      f.text_field :height
    end
    assert_select "input[data-tps-numericality=?]", true
    assert_no_select "[data-tps-numericality-integer]"
  end

  def test_tps_numericality_closed_limits
    concat_form_for @user do |f|
      f.text_field :age
    end
    assert_select "input[data-tps-numericality=?][data-tps-numericality-maximum=?]", true, 99
    assert_select "input[data-tps-numericality=?][data-tps-numericality-minimum=?]", true, 1
  end

  def test_tps_numericality_opened_limits
    concat_form_for @user do |f|
      f.text_field :height
    end
    assert_select "input[data-tps-numericality=?][data-tps-numericality-maximum=?]", true, 250
    assert_select "input[data-tps-numericality=?][data-tps-numericality-minimum=?]", true, 20
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
    assert_select "input[data-tps-numericality=?][data-tps-numericality-if=?]", "user[weight]"
  end

  def test_tps_numericality_unless_option
    concat_form_for @user do |f|
      f.text_field :volume
    end
    assert_select "input[data-tps-numericality=?][data-tps-numericality-unless=?]", "user[age]"
  end
end
