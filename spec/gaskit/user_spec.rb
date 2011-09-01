require 'spec_helper'

describe User do
  before do
    User.all.clear
    User.adapter.delete('users')
  end

  it "should be uniq-able" do
    u1 = User.new(:name => 'Morgan', :email => 'morgan@buymore.com')
    u2 = User.new(:name => 'Morgan', :email => 'morgan@buymore.com')
    [u1, u2].uniq.size.should == 1
  end

  it 'should set initials' do
    User.new(:name => 'Ellie Bartowski').initials.should == 'EB'
  end

  describe 'save' do
    it 'should add user to git' do
      user = User.new(:name => "Sarah Walker", :email => "sarah@cia.gov")
      user.save
      users = User.adapter.get('users')
      users.size.should == 1
      users.first.should == user
    end
  end

  describe '.all' do
    it 'should default to array' do
      User.all.should == []
    end

    it 'should properly load existing users' do
      User.adapter.set('users', [
        User.new(:name => 'Chuck'),
        User.new(:name => 'Morgan'),
        User.new(:name => 'Sarah')
      ])
      users = User.all
      users.size.should == 3
      users[0].should be_instance_of(User)
      users[0].name.should == 'Chuck'
    end

  end

  describe '.me' do
    it 'should return a user' do
      user = User.me
      user.should be_instance_of(User)
      user.name.should_not be_blank
      user.email.should_not be_blank
    end
  end

  describe 'equality' do
    it 'should be true if name and email are the same' do
      a = User.new(:name => 'Jon', :email => 'a@b.com')
      b = User.new(:name => 'Jon', :email => 'a@b.com')
      a.should == b
    end

    it 'should be true even if name is different' do
      a = User.new(:name => 'Jon', :email => 'a@b.com')
      b = User.new(:name => 'Dave', :email => 'a@b.com')
      a.should == b
    end

    it 'should be false if email is different' do
      a = User.new(:name => 'Jon', :email => 'a@b.com')
      b = User.new(:name => 'Jon', :email => 'x@y.com')
      a.should_not == b
    end
  end

  describe "hash" do
    it "should be same for objects with same email" do
      User.new(:email => 'a').hash.should == User.new(:email => 'a').hash
    end

    it "should not be same for objects with different email" do
      User.new(:email => 'a').hash.should_not == User.new(:email => 'b').hash
    end
  end
end
