# encoding: utf-8

module Knight
  class Rule

    # A rule for checking the format of a value
    class Format < self
      DEFAULT_MESSAGE = '%{attribute} has an invalid format'.freeze

      # Regexp format
      #
      # @return [Regexp]
      #
      # @api private
      attr_reader :regexp

      # Initialize a format rule
      #
      # @param [Symbol] attribute_name
      # @param [Regexp] regexp
      #
      # @option options [String] :message error_message
      #
      # @example
      #   rule = Knight::Rule::Format.new(:username, /A-Z0-9/)
      #
      # @return [undefined]
      #
      # @api public
      def initialize(attribute_name, regexp, options = {})
        super(attribute_name, options)
        @regexp = regexp
      end

      # Check value presence
      #
      # @param [String] value
      #
      # @return [true] if matched with the format
      # @return [false] otherwise
      #
      # @api private
      def matches?(value)
        !!(@regexp =~ value)
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
          format: @regexp
        }).freeze
      end
    end
  end
end
