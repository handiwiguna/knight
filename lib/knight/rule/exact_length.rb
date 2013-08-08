# encoding: utf-8

module Knight
  class Rule

    # A rule for checking the length of a value
    class ExactLength < self
      DEFAULT_MESSAGE  = '%{attribute} has an invalid length'.freeze

      # Length value
      #
      # @return [Fixnum]
      #
      # @api private
      attr_reader :length

      # Initialize an exact length rule
      #
      # @param [Symbol] attribute_name
      # @param [Fixnum] length
      # @param [Hash] options for this rule
      #
      # @option options [String] :message error message
      #
      # @example
      #   rule = Knight::Rule::ExactLength.new(:username, 20)
      #
      # @return [undefined]
      #
      # @api public
      def initialize(attribute_name, length, options = {})
        super(attribute_name, options)
        @length = length
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
        @length == value.length
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
          length: @length
        }).freeze
      end
    end
  end
end
