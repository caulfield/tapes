module Tapes
  class Validations
    attr_reader :object

    KINDS = %i(presence length numericality).freeze

    def initialize(object)
      @object = object
    end

    def on(method)
      @object._validators[method.to_sym].group_by(&:kind).slice(*KINDS)
    end
  end
end
