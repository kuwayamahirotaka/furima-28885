FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    email                 { 'aaa@gmail.com' }
    password              { '00000000' }
    password_confirmation { password }
    first_name            { '阿部' }
    last_name             { '大樹' }
    first_name_kana       { 'アベ' }
    last_name_kana        { 'ダイキ' }
    birth_date            { '1992-02-02' }
  end
end
