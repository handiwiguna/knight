# encoding: utf-8

module Knight
  class Rule

    # A rule for checking the length of a value
    class MaximumLength < self
      DEFAULT_MESSAGE = '%{attribute} is too long'.freeze

      # Length value
      #
      # @return [Fixnum]
      #
      # @api private
      attr_reader :maximum

      # Initialize an exact length rule
      #
      # @param [Symbol] attribute_name
      # @param [Fixnum] maximum
      # @param [Hash] options for this rule
      #
      # @option options [String] :message error_message
      #
      # @example
      #   rule = Knight::Rule::MaximumLength.new(:username, 20)
      #
      # @return [undefined]
      #
      # @api public
      def initialize(attribute_name, maximum, options = {})
        super(attribute_name, options)
        @maximum = maximum
      end

      # Check length of the value
      #
      # @param [Object] value
      #
      # @return [true] if the length is matched
      # @return [false] otherwise
      #
      # @api private
      def matches?(value)
        value.length <= maximum
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
          maximum: maximum
        }).freeze
      end
    end
  end
end
