module Helpers
  def concat_form_for(object, options={}, &block)
    options.merge!(tapes: true)
    concat form_for object, options, &block
  end

  def assert_no_select(selector, value = nil)
    assert_select(selector, text: value, count: 0)
  end

  def assert_has_tps_attributes
    assert_match /data-tps/, output_buffer
  end

  def assert_has_no_tps_attributes
    assert_no_match /data-tps/, output_buffer
  end
end
