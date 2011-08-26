require 'spec_helper'

describe Gaskit::Task do
  describe 'lifecycle' do
    subject { Gaskit::Task.create!(:description => 'Solve world hunger')}

    it 'should be creatable' do
      Gaskit::Task.get(subject.id).should == subject
    end

    it 'should be updateable' do
      subject.description = 'Cure cancer'
      subject.save!
      subject.reload.description.should == 'Cure cancer'
    end

    it 'should be destroyable' do
      subject.destroy
      Gaskit::Task.get(subject.id).should be_nil
    end
  end

  describe '.count' do
    it 'should return the correct count for tasks' do
      Gaskit::Task.count.should == 0
      task = create(:task)
      Gaskit::Task.count.should == 1
      task.destroy
      Gaskit::Task.count.should == 0
    end
  end

  describe '.all' do
    it 'should all tasks' do
      Gaskit::Task.all.should == []
      task = create(:task)
      Gaskit::Task.all.should == [task]
      task.destroy
      Gaskit::Task.all.should == []
    end
  end
end
