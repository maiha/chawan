
require File.join(File.dirname(__FILE__), 'spec_helper.rb')

describe Chawan::Analyzers::ChasenAnalyzer do
  before do
    @a = Chawan::Analyzers::ChasenAnalyzer.new
  end

  it "should provide #parse" do
    @a.should respond_to(:parse)
  end

  describe "#parse" do
    it "should return an Array of Node" do
      text = data("example1.txt")
      @a.parse(text).each do |node|
        node.should be_kind_of(Chawan::Node)
      end
    end

    it "should work as expected" do
      text = data("example1.txt")
      @a.parse(text).map(&:inspect).join.should ==
        "<名詞: '本日'><助詞: 'は'><名詞: '晴天'><助動詞: 'なり'><記号: '。'>"
    end
  end
end
