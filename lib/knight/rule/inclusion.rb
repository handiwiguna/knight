# encoding: utf-8

module Knight
  class Rule

    # A rule for checking the inclusion of a value
    class Inclusion < self
      DEFAULT_MESSAGE = '%{attribute} is not included in the list'.freeze

      # Inclusion value
      #
      # @return [Range, Array]
      #
      # @api private
      attr_reader :within

      # Initialize an inclusion rule
      #
      # @param [Symbol] attribute_name
      # @param [Range, Array] within
      #
      # @option options [String] :message error_message
      #
      # @example
      #   rule = Knight::Rule::Inclusion.new(:username, ['john', 'jane'])
      #
      # @return [undefined]
      #
      # @api public
      def initialize(attribute_name, within, options = {})
        super(attribute_name, options)
        @within = within
      end

      # Check value presence
      #
      # @param [Object] value
      #
      # @return [true] if the value within inclusion value
      # @return [false] otherwise
      #
      # @api private
      def matches?(value)
        within.respond_to?(:cover?) ? within.cover?(value) : within.include?(value)
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
          within: within
        }).freeze
      end
    end
  end
end
