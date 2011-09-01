require 'spec_helper'

describe App do
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

  context 'GET /stories' do
    before do
      @story = create(:story)
    end

    subject do
      get '/stories'
    end

    it 'should be successful' do
      subject.status.should == 200
    end

    it 'should render json' do
      json = ActiveSupport::JSON.decode(subject.body)
      json.length.should == 1
      json[0]['id'].should == @story.id
    end
  end

  context 'POST /stories' do
    subject do
      post '/stories', 'description' => 'Boot the intersect'
    end

    it 'should be successful' do
      subject.status.should == 200
    end

    it 'should create a story' do
      subject
      Story.count.should == 1
    end

    it 'should render json' do
      json = ActiveSupport::JSON.decode(subject.body)
      json['description'].should == 'Boot the intersect'
      json['id'].should be_present
    end
  end

  context 'PUT /stories/:id' do
    before do
      @story = create(:story)
    end

    subject do
      put "/stories/#{@story.id}", 'description' => 'updated'
    end

    it 'should be successful' do
      subject.status.should == 200
    end

    it 'should update the story' do
      subject
      @story.reload.description.should == 'updated'
    end

    it 'should render json' do
      json = ActiveSupport::JSON.decode(subject.body)
      json['id'].should == @story.id
    end
  end

  context 'PUT /stories/:id' do
    before do
      @story = create(:story)
    end

    subject do
      delete "/stories/#{@story.id}"
    end

    it 'should be successful' do
      subject.status.should == 200
    end

    it 'should destroy the story' do
      subject
      Story.key?(@story.id).should be_false
    end
  end

  context 'GET /users' do
    subject do
      get '/users'
    end

    it 'should be successful' do
      subject.status.should == 200
    end

    it 'should render json' do
      json = ActiveSupport::JSON.decode(subject.body)
      json.length.should == 1
      json[0]['name'].should == User.me.name
    end
  end
end