require './test/test_helper'

class DataAttrsFormatterTest < MiniTest::Test

  def setup
    @formatter = Tapes::Formatter::DataAttrs.new
    @validators = {length: User.new._validators[:age]}
  end

  def test_tps_validation_kind
    validations = @formatter.format @validators
    assert_equal validations['data']['tps-length'], true
  end

  def test_tps_validation_options
    validations = @formatter.format @validators
    assert_equal validations['data']['tps-length-only-integer'], true
    assert_equal validations['data']['tps-length-less-than'], 100
    assert_equal validations['data']['tps-length-greater-than'], 0
  end

  def test_merge_options
    default_options = {class: 'class'}
    validation_options = {'data' => {'tps-length' => true}}
    options = @formatter.merge default_options, validation_options
    assert_equal options[:class], 'class'
    assert_equal options['data']['tps-length'], true
  end

  def test_merge_with_data_attributes_as_keys
    default_options = {data: {attr: 'custom'}}
    validation_options = {'data' => {'tps-length' => true}}
    options = @formatter.merge default_options, validation_options
    assert_equal options[:data][:attr], 'custom'
    assert_equal options['data']['tps-length'], true
  end

  def test_merge_with_data_attributes_as_strings
    default_options = { 'data' => {attr: 'custom'}}
    validation_options = {'data' => {'tps-length' => true}}
    options = @formatter.merge default_options, validation_options
    assert_equal options['data'][:attr], 'custom'
    assert_equal options['data']['tps-length'], true
  end

  def test_merge_with_same_keys_not_overrided
    default_options = {'data' => {'tps-length' => false}}
    validation_options = {'data' => {'tps-length' => true}}
    options = @formatter.merge default_options, validation_options
    assert_equal options['data']['tps-length'], false
  end
end
