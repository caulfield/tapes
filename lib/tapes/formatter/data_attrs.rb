module Tapes
  module Formatter
    class DataAttrs

      PREFIX = "tps"

      def format(validations)
        options = {}
        validations.each do |kind, validator|
          options["#{PREFIX}-#{kind.to_s}"] = true
          validator[0].options.each do |type, option|
            options["#{PREFIX}-#{kind}-#{type.to_s.dasherize}"] = option
          end
        end
        {'data' => options}
      end
    end
  end
end
