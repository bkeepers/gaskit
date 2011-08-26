FactoryGirl.define do
  factory :task, :class => Gaskit::Task do
    sequence(:description) {|i| "Task #{i}" }
  end
end