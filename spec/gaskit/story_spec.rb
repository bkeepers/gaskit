require 'spec_helper'

describe Story do
  describe 'lifecycle' do
    subject { Story.create!(:description => 'Solve world hunger')}

    it 'should be creatable' do
      Story.get(subject.id).should == subject
    end

    it 'should be updateable' do
      subject.description = 'Cure cancer'
      subject.save!
      subject.reload.description.should == 'Cure cancer'
    end

    it 'should be destroyable' do
      subject.destroy
      Story.get(subject.id).should be_nil
    end
  end

  describe '.count' do
    it 'should return the correct count for stories' do
      Story.count.should == 0
      story = create(:story)
      Story.count.should == 1
      story.destroy
      Story.count.should == 0
    end
  end

  describe '.all' do
    it 'should all stories' do
      Story.all.should == []
      story = create(:story)
      Story.all.should == [story]
      story.destroy
      Story.all.should == []
    end
  end
end
