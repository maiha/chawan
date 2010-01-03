
require File.join(File.dirname(__FILE__), 'spec_helper.rb')

describe Chawan::Node do
  subject { Chawan::Node.new(["Ruby","名詞"], ["表記","品詞"]) }

  its('keys')       {should == ["表記","品詞"] }
  its('vals')       {should == ["Ruby","名詞"] }
  its('attributes') {should == {"表記"=>"Ruby", "品詞"=>"名詞"}}
  its('word')       {should == "Ruby"}
  its('category')   {should == "名詞"}
  its('inspect')    {should == "<名詞: 'Ruby'>"}
end
