module Helpers
  def store_translations(locale, translations, &block)
    begin
      I18n.backend.store_translations locale, translations
      yield
    ensure
      I18n.reload!
    end
  end

  def concat_form_for(object, options={}, &block)
    options.merge!(tapes: true)
    concat form_for object, options, &block
  end

  def assert_no_select(selector, value = nil)
    assert_select(selector, text: value, count: 0)
  end
end
