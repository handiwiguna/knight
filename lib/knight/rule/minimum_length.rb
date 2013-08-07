# encoding: utf-8

module Knight
  class Rule

    # A rule for checking the length of a value
    class MinimumLength < self
      DEFAULT_MESSAGE = '%{attribute} is too short'.freeze

      # Length value
      #
      # @return [Fixnum]
      #
      # @api private
      attr_reader :minimum

      # Initialize an exact length rule
      #
      # @param [Symbol] attribute_name
      # @param [Fixnum] minimum
      # @param [Hash] options for this rule
      #
      # @option options [String] :message error_message
      #
      # @example
      #   rule = Knight::Rule::MinimumLength.new(:username, 3)
      #
      # @return [undefined]
      #
      # @api public
      def initialize(attribute_name, minimum, options = {})
        super(attribute_name, options)
        @minimum = minimum
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
        value.length >= minimum
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
          minimum: minimum
        }).freeze
      end
    end
  end
end
