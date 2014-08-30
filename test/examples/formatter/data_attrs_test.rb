require './test/test_helper'

class DataAttrsFormatterTest < MiniTest::Test

  def setup
    formatter = Tapes::Formatter::DataAttrs.new
    validators = {length: User.new._validators[:age]}
    @actual = formatter.format(validators)
  end

  def test_tps_validation_kina
    assert_equal @actual['data']['tps-length'], true
  end

  def test_tps_validation_options
    assert_equal @actual['data']['tps-length-only-integer'], true
    assert_equal @actual['data']['tps-length-less-than'], 100
    assert_equal @actual['data']['tps-length-greater-than'], 0
  end
end
