require 'spec_helper'

describe Gaskit::Story do
  describe 'lifecycle' do
    subject { Gaskit::Story.create!(:description => 'Solve world hunger')}

    it 'should be creatable' do
      Gaskit::Story.get(subject.id).should == subject
    end

    it 'should be updateable' do
      subject.description = 'Cure cancer'
      subject.save!
      subject.reload.description.should == 'Cure cancer'
    end

    it 'should be destroyable' do
      subject.destroy
      Gaskit::Story.get(subject.id).should be_nil
    end
  end

  describe '.count' do
    it 'should return the correct count for stories' do
      Gaskit::Story.count.should == 0
      story = create(:story)
      Gaskit::Story.count.should == 1
      story.destroy
      Gaskit::Story.count.should == 0
    end
  end

  describe '.all' do
    it 'should all stories' do
      Gaskit::Story.all.should == []
      story = create(:story)
      Gaskit::Story.all.should == [story]
      story.destroy
      Gaskit::Story.all.should == []
    end
  end
end
