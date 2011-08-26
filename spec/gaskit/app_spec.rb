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

  context 'POST /task' do
    subject do
      post '/tasks', 'task' => {'description' => 'Boot the intersect'}
    end

    it 'should be successful' do
      subject.status.should == 200
    end

    it 'should create a task' do
      subject
      Gaskit::Task.count.should == 1
    end

    it 'should render json' do
      json = ActiveSupport::JSON.decode(subject.body)
      json['task']['description'].should == 'Boot the intersect'
      json['task']['id'].should be_present
    end
  end
end