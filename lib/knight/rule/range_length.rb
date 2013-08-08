# encoding: utf-8

module Knight
  class Rule

    # A rule for checking the length of a value
    class RangeLength < self
      DEFAULT_MESSAGE = '%{attribute} has an invalid length'.freeze

      # Length value
      #
      # @return [Range]
      #
      # @api private
      attr_reader :range

      # Initialize a length rule
      #
      # @param [Symbol] attribute_name
      # @param [Range] range
      # @param [Hash] options for this rule
      #
      # @option options [String] :message error_message
      #
      # @example
      #   rule = Knight::Rule::RangeLength.new(:username, 3..20)
      #
      # @return [undefined]
      #
      # @api public
      def initialize(attribute_name, range, options = {})
        super(attribute_name, options)
        @range = range
      end

      # Check length of the value
      #
      # @param [Object] value
      #
      # @return [true] if the length is accepted
      # @return [false] otherwise
      #
      # @api private
      def matches?(value)
        @range.cover?(value.length)
      end

      # Return the rule as a hash
      #
      # @return [Hash]
      #
      # @example
      #   hash = rule.to_hash
      #
      # @api public
      def to_hash
        super.merge({
          minimum: @range.min,
          maximum: @range.max
        }).freeze
      end
    end
  end
end
