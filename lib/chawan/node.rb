module Chawan
  class Node
    attr_reader :vals
    attr_reader :keys

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
