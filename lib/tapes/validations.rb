module Tapes
  class Validations
    attr_reader :object

    def initialize(object)
      @object = object
    end

    def on(method)
      @object._validators[method.to_sym].group_by &:kind
    end
  end
end
