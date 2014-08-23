require "tapes/validations"

module Tapes::ActionView::Helpers
  module FormBuilder
    def self.included(base)
      non_tapes_fields = %w(apply_form_for_options! label fields_for hidden_field)
      tapes_fields = base.field_helpers.map(&:to_s) - non_tapes_fields
      # @tapes_formatter = ...

      tapes_fields.each do |selector|
        base.class_eval <<-RUBY_EVAL
          def #{selector}_with_tapes(method, options = {})
            if @options.delete(:tapes)
              options.merge! client_validations(method)
            end
            #{selector}_without_tapes(method, options)
          end
        RUBY_EVAL

        base.class_eval { alias_method_chain selector, :tapes }
      end
    end

    private

    def client_validations(method)
      @_client_validations ||= Tapes::Validations.new @object
      @_client_validations.on(method)
      # @tapes_formmater.format @_client_validations.on(method)
    end
  end
end
