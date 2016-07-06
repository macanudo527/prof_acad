FactoryGirl.define do 
  factory :user do
    name "John Fahey"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "password"
    password_confirmation "password"
    confirmed_at Time.now
  end
  
  factory :question do
    question "What is shaking?"
    correct_answer "Nothing special"
    a2 "a whole lot"
    a3 "Everything!  There is an earthquake!"
    a4 "Stop asking stupid questions."
  end
end