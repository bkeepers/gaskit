require 'spec_helper'

describe Gaskit::App do
  include Rack::Test::Methods

  def app
    described_class
  end

  context '/' do
    subject { get '/' }

    it "should be successful" do
      subject.status.should == 200
    end
  end
end