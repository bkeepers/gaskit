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

  context 'GET /tasks' do
    before do
      @task = create(:task)
    end

    subject do
      get '/tasks'
    end

    it 'should be successful' do
      subject.status.should == 200
    end

    it 'should render json' do
      json = ActiveSupport::JSON.decode(subject.body)
      json.length.should == 1
      json[0]['id'].should == @task.id
    end
  end

  context 'POST /tasks' do
    subject do
      post '/tasks', 'description' => 'Boot the intersect'
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
      json['description'].should == 'Boot the intersect'
      json['id'].should be_present
    end
  end

  context 'PUT /tasks/:id' do
    before do
      @task = create(:task)
    end

    subject do
      put "/tasks/#{@task.id}", 'description' => 'updated'
    end

    it 'should be successful' do
      subject.status.should == 200
    end

    it 'should update the task' do
      subject
      @task.reload.description.should == 'updated'
    end

    it 'should render json' do
      json = ActiveSupport::JSON.decode(subject.body)
      json['id'].should == @task.id
    end
  end


end