# encoding: utf-8

module Knight

  # An abstract class of a rule
  class Rule
    include AbstractType
    include Equalizer.new(:attribute_name)

    DEFAULT_MESSAGE  = ''.freeze

    # Attribute name to validate
    #
    # @return [Symbol]
    #
    # @api private
    attr_reader :attribute_name

    # Attribute name to validate
    #
    # @return [Symbol]
    #
    # @api private
    attr_reader :options

    # Message to displayed when rule is violated
    #
    # @return [String]
    #
    # @api private
    attr_reader :message

    # Initialize a rule
    #
    # @param [Symbol] attribute_name
    # @param [Hash] options for this rule
    #
    # @option options [String] :message error message
    #
    # @return [undefined]
    #
    # @api private
    def initialize(attribute_name, options = {})
      @attribute_name = attribute_name
      @options        = options
      @message        = @options.fetch(:message, self.class::DEFAULT_MESSAGE)
    end

    # Return error if the rule not satisfied
    #
    # @param [Object] resource
    #
    # @return [Error] if the rule not matched
    # @return [nil] if the rule is satisfied
    #
    # @api private
    def error(resource)
      value = resource.public_send(attribute_name)
      Error.new(self, resource) unless matches?(value)
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
      { attribute: attribute_name }.freeze
    end
  end
end
