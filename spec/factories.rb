FactoryGirl.define do 
  factory :user do
    name "Cookie Monster"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "password"
    password_confirmation "password"
    confirmed_at Time.now
  end
  
  factory :question do
    sequence(:question, 100) { |n| "What is shaking, Mr.#{n}?" }
    correct_answer "Nothing.  Nothing at all."
    a2 "a whole lot"
    a3 "Everything!  There is an earthquake!"
    a4 "Stop asking stupid questions."
  end
  
  factory :grouping do
    name "Sample grouping"
  end
  
end