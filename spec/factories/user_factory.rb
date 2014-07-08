FactoryGirl.define do
  factory :user do
    first_name "name"
    last_name "name"

    factory :user_with_groups do
      transient do
        groups_count 5
      end

      after(:create) do |user, evaluator|
        create_list(:group, evaluator.groups_count, user: user)
      end
    end

  end
end
