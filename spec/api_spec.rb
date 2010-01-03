#!/usr/bin/ruby

require File.join(File.dirname(__FILE__), 'spec_helper.rb')

describe Chawan do
  it "should provide .parse" do
    Chawan.should respond_to(:parse)
  end

  describe ".parse" do
    it "should delegate to analyzer" do
      pending "cannot mock within rr" do
        mock(Chawan).analyzer
        Chawan.parse('test')
      end
    end
  end
end
