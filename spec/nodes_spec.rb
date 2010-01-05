
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
    @n1 = Chawan::Node.new(["登録","名詞"  ], keys)
    @v1 = Chawan::Node.new(["さ"  ,"動詞"  ], keys)
    @v2 = Chawan::Node.new(["れ"  ,"動詞"  ], keys)
    @p1 = Chawan::Node.new(["た"  ,"助動詞"], keys)
    @n2 = Chawan::Node.new(["利用","名詞"  ], keys)
    @n3 = Chawan::Node.new(["者"  ,"名詞"  ], keys)
    @nodes = Chawan::Nodes.new([@n1, @v1, @v2, @p1, @n2, @n3])

    @n23   = Chawan::Node.new(["利用者","名詞"], keys)
    @v12   = Chawan::Node.new(["され","動詞"], keys)
    @v12p1 = Chawan::Node.new(["された","動詞"], keys)
  end

  subject { @nodes }

  ######################################################################
  ### Gateway Interface

  gateway_interface(:noun) { should == Chawan::Nodes.new([@n1, @n2, @n3]) }
  gateway_interface(:verb) { should == Chawan::Nodes.new([@v1, @v2, @p1]) }

  gateway_interface(:compact) { should == Chawan::Nodes.new([@n1, @v12, @p1, @n23]) }
  it "#compact(/動詞/) should compact only nodes matched /動詞/" do
    subject.compact(/動詞/).should == Chawan::Nodes.new([@n1, @v12p1, @n2, @n3])
  end
  it "#compact('動詞') should compact only nodes categoried '動詞'" do
    subject.compact('動詞').should == Chawan::Nodes.new([@n1, @v12, @p1, @n2, @n3])
  end

  provide :grep
  describe "#grep" do
    it "should scope nodes by given category" do
      subject.grep(/動詞/).should == Chawan::Nodes.new([@v1, @v2, @p1])
      subject.grep('動詞').should == Chawan::Nodes.new([@v1, @v2])
    end
  end

  ######################################################################
  ### Enumerable

  provide :each
end
