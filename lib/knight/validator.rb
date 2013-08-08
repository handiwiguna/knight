# encoding: utf-8

module Knight
  class Validator

    # Return validation rules
    #
    # @example
    #   validator = Validator.new(Rule::Presence.new(:username))
    #   validator.rules
    #
    # @return [Set(Rule)]
    #
    # @api public
    attr_reader :rules

    # Initialize a validator
    #
    # @example
    #   Validator.new(Rule::Presence.new(:username))
    #
    # @param [Array(Rule)] rules
    #
    # @return [Validator]
    #
    # @api public
    def initialize(*rules)
      @rules = Set.new(rules)
    end

    # Add a rule
    #
    # @example
    #   validator = Validator.new
    #   validator.add(Rule::Presence.new(:username))
    #
    # @param [Rule] rule
    #
    # @return [Set(Rule)]
    #
    # @api public
    def add(rule)
      rules << rule if rule
    end

    # Run the validator
    #
    # @example
    #   user = User.new(username: 'john')
    #
    #   validator = Validator.new(Rule::Presence.new(:username))
    #   validator.run(user)
    #
    # @param [Object] resource
    #
    # @return [Result]
    #
    # @api public
    def run(resource)
      Result.new(resource, rules)
    end
  end
end
