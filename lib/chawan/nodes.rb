module Chawan
  class Nodes
    attr_reader :nodes

    def initialize(nodes)
      @nodes = nodes
    end

    def ==(other)
      self.class == other.class and map(&:to_s) == other.map(&:to_s)
    end

    ######################################################################
    ### Enumerable

    include Enumerable

    def each(&block)
      nodes.__send__(:each, &block)
    end

    def inspect
      "[%s]" % map(&:inspect).join(', ')
    end

    ######################################################################
    ### GatewayInterface

    def grep(pattern, &block)
      if block
        nodes.__send__(regexp, &block)
      else
        Nodes.new(nodes.select{|n| pattern === n.category})
      end
    end

    def compact(pattern = //)
      array = []
      prev = nil
      each do |node|
        if array.last and (pattern === node.category) and array.last.category == node.category
          array.last.word << node.word.to_s
        else
          array << Node.new(node.vals.map(&:dup), node.keys)
        end
      end
      self.class.new(array)
    end

    def self.gateway_interfaces
      Chawan::Node::GatewayInterface.instance_methods.map(&:to_s).grep(/\?$/){$`}
    end

    def self.define_gateway_interface(name)
      class_eval %{
        def #{name}
          Nodes.new(nodes.select{|n| n.__send__("#{name}?")})
        end
      }
    end

    private
      def method_missing(name, *arguments, &block)
        if self.class.gateway_interfaces.include?(name.to_s)
          self.class.define_gateway_interface(name)
          __send__(name)
        else
          nodes.__send__(name, *arguments, &block)
        end
      end
  end
end
