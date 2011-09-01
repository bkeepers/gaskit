FactoryGirl.define do
  factory :story, :class => Gaskit::Story do
    sequence(:description) {|i| "Story #{i}" }
  end

  factory :user, :class => Gaskit::User do
    sequence(:name) {|i| "User #{i}" }
    sequence(:email) {|i| "user#{i}@example.com" }
  end
end