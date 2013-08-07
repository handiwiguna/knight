# encoding: utf-8

module Knight
  class Rule

    # A rule for checking the presence of a value
    class Presence < self
      DEFAULT_MESSAGE = "%{attribute} can't be blank".freeze

      # Check the presence of a value
      #
      # @param [Object] value
      #
      # @return [true] if not blank
      # @return [false] otherwise
      #
      # @api private
      def matches?(value)
        !blank?(value)
      end

      private

      # Blank function
      #
      # @param [Object] value
      #
      # @return [true] if nil, empty string/array/hash
      # @return [false] otherwise
      #
      # @api private
      def blank?(value)
        value.nil? || (value.respond_to?(:empty?) && value.empty?)
      end
    end
  end
end
