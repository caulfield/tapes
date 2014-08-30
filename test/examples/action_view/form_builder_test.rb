require './test/test_helper'

class FormBuilderTest < ActionView::TestCase

  class StubbedActionView
    def self.field_helpers
      []
    end
  end

  def test_tapes_false_param
    form = form_for @user, tapes: false do |f|
      f.text_field :first_name
    end
    concat form
    assert_has_no_tps_attributes
  end

  def test_default_formatter
    StubbedActionView.send :include, Tapes::ActionView::Helpers::FormBuilder
    view = StubbedActionView.new
    assert_instance_of Tapes::Formatter::DataAttrs, view.send(:tapes_formatter)
  end

  def test_tapes_fields_wihout_tapes
    concat_form_for @user do |f|
      f.text_field :first_name, tapes: false
    end
    assert_has_no_tps_attributes
  end

  # input types live there

  def test_text_field
    concat_form_for @user do |f|
      f.text_field :uid
    end
    assert_has_tps_attributes
  end

  def test_password_field
    concat_form_for @user do |f|
      f.password_field :uid
    end
    assert_has_tps_attributes
  end

  def test_file_field
    concat_form_for @user do |f|
      f.file_field :title
    end
    assert_has_tps_attributes
  end

  def test_text_area
    concat_form_for @user do |f|
      f.text_area :nickname
    end
    assert_has_tps_attributes
  end

  def test_check_box
    concat_form_for @user do |f|
      f.check_box :uid
    end
    assert_has_tps_attributes
  end

  def test_color_field
    concat_form_for @user do |f|
      f.color_field :age
    end
    assert_has_tps_attributes
  end

  def test_search_field
    concat_form_for @user do |f|
      f.search_field :nickname
    end
    assert_has_tps_attributes
  end

  def test_telephone_field
    concat_form_for @user do |f|
      f.telephone_field :age
    end
    assert_has_tps_attributes
  end

  def test_phone_field
    concat_form_for @user do |f|
      f.phone_field :age
    end
    assert_has_tps_attributes
  end

  def test_date_field
    concat_form_for @user do |f|
      f.date_field :height
    end
    assert_has_tps_attributes
  end

  def test_time_field
    concat_form_for @user do |f|
      f.time_field :volume
    end
    assert_has_tps_attributes
  end

  def test_datetime_field
    concat_form_for @user do |f|
      f.datetime_field :volume
    end
    assert_has_tps_attributes
  end

  def test_datetime_local_field
    concat_form_for @user do |f|
      f.datetime_local_field :volume
    end
    assert_has_tps_attributes
  end

  def test_month_field
    concat_form_for @user do |f|
      f.month_field :age
    end
    assert_has_tps_attributes
  end

  def test_week_field
    concat_form_for @user do |f|
      f.week_field :age
    end
    assert_has_tps_attributes
  end

  def test_url_field
    concat_form_for @user do |f|
      f.url_field :nickname
    end
    assert_has_tps_attributes
  end

  def test_email_field
    concat_form_for @user do |f|
      f.email_field :nickname
    end
    assert_has_tps_attributes
  end

  def test_number_field
    concat_form_for @user do |f|
      f.number_field :height
    end
    assert_has_tps_attributes
  end

  def test_range_field
    concat_form_for @user do |f|
      f.range_field :weight
    end
    assert_has_tps_attributes
  end

  # fields without tapes

  def test_label
    concat_form_for @user do |f|
      f.label :first_name
    end
    assert_has_no_tps_attributes
  end

  def test_hidden_field
    concat_form_for @user do |f|
      f.hidden_field :uid
    end
    assert_has_no_tps_attributes
  end

  def test_fields_for
    # TODO
  end

  def test_radio_button
    concat_form_for @user do |f|
      f.radio_button :uid, 1
    end
    assert_has_no_tps_attributes
  end
end
