module Chawan
  class Node
    attr_accessor :vals
    attr_reader :keys

    module GatewayInterface
      def noun?
        category.to_s =~ /名詞/
      end

      def verb?
        category.to_s =~ /動詞/
      end
    end

    include GatewayInterface

    def initialize(vals, keys)
      @vals = vals
      @keys = keys
    end

    def attributes
      @attributes ||= Hash[*keys.zip(vals).flatten]
    end

    def [](index)
      case index
      when Integer
        vals[keys[index]]
      else
        attributes[index.to_s]
      end
    end

    def word
      vals.first.to_s
    end

    def category
      vals[1]
    end

    def to_s
      word
    end

    def inspect
      "<%s: '%s'>" % [category, to_s]
    end
  end
end
