require "tapes/validations"
require 'tapes/formatter/data_attrs'

module Tapes::ActionView::Helpers
  module FormBuilder

    def self.included(base)
      non_tapes_fields = %w(label fields_for hidden_field radio_button)
      tapes_fields = base.field_helpers.map(&:to_s) - non_tapes_fields

      tapes_fields.each do |selector|
        base.class_eval do
          define_method "#{selector}_with_tapes" do |method, options={}|
            if @options.delete(:tapes) && options.delete(:tapes) != false
              options = tapes_formatter.merge options, client_validations(method)
            end
            send "#{selector}_without_tapes", method, options
          end
          alias_method_chain selector, :tapes
        end
      end
    end

    protected

    def tapes_formatter
      @tapes_formatter ||= Tapes::Formatter::DataAttrs.new
    end

    private

    def client_validations(method)
      client_validations = Tapes::Validations.new @object
      client_validations.on(method)
      tapes_formatter.format client_validations.on(method)
    end
  end
end
