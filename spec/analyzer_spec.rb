
require File.join(File.dirname(__FILE__), 'spec_helper.rb')

describe Chawan do
  it "should provide .[]" do
    Chawan.should respond_to(:[])
  end

  describe "[:mecab]" do
    it "should return MecabAnalyzer" do
      Chawan[:mecab].should be_kind_of(Chawan::Analyzers::MecabAnalyzer)
    end
  end

  describe "[:chasen]" do
    it "should return ChasenAnalyzer" do
      Chawan[:chasen].should be_kind_of(Chawan::Analyzers::ChasenAnalyzer)
    end
  end

  it "should provide .mecab" do
    Chawan.should respond_to(:mecab)
  end

  it "should provide .chasen" do
    Chawan.should respond_to(:chasen)
  end
end
