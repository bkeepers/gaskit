FactoryGirl.define do
  factory :story, :class => Gaskit::Story do
    sequence(:description) {|i| "Story #{i}" }
  end
end