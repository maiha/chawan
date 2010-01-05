
require File.join(File.dirname(__FILE__), 'spec_helper.rb')

module Spec
  module Example
    module Subject
      module ExampleGroupMethods
        def gateway_interface(name, &block)
          it "should provide gateway interface ##{name}" do
            lambda { subject.__send__(name) }.should_not raise_error
          end

          it "should return an instance of Chawan::Nodes" do
            subject.__send__(name).should be_a_kind_of(Chawan::Nodes)
          end

          its(name, &block)
        end
      end
    end
  end
end


describe Chawan::Nodes do
  before do
    keys = ["表記","品詞"]
    @n1 = Chawan::Node.new(["本日","名詞"], keys)
    @p1 = Chawan::Node.new(["は"  ,"助詞"], keys)
    @n2 = Chawan::Node.new(["マジ","名詞"], keys)
    @n3 = Chawan::Node.new(["晴天","名詞"], keys)
    @v1 = Chawan::Node.new(["なり","助動詞"], keys)
    @v2 = Chawan::Node.new(["っす","助動詞"], keys)
    @nodes = Chawan::Nodes.new([@n1, @p1, @n2, @n3, @v1, @v2])

    @n23 = Chawan::Node.new(["マジ晴天","名詞"], keys)
    @v12 = Chawan::Node.new(["なりっす","助動詞"], keys)
  end

  subject { @nodes }

  ######################################################################
  ### Gateway Interface

  gateway_interface(:noun) { should == Chawan::Nodes.new([@n1, @n2, @n3]) }
  gateway_interface(:verb) { should == Chawan::Nodes.new([@v1, @v2]) }

  gateway_interface(:compact) { should == Chawan::Nodes.new([@n1, @p1, @n23, @v12]) }
  it "#compact(/名詞/) should compact only nodes matched /名詞/" do
    subject.compact(/名詞/).should == Chawan::Nodes.new([@n1, @p1, @n23, @v1, @v2])
  end

  provide :grep
  describe "#grep" do
    it "should scope nodes by given category" do
      subject.grep(/名詞/).should == Chawan::Nodes.new([@n1, @n2, @n3])
      subject.grep('名詞').should == Chawan::Nodes.new([@n1, @n2, @n3])

      subject.grep(/助/).should == Chawan::Nodes.new([@p1, @v1, @v2])
      subject.grep('助').should == Chawan::Nodes.new([])
    end
  end

  ######################################################################
  ### Enumerable

  provide :each
end
