FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'111aaa'}
    password_confirmation {password}
    first_name            {'駄々'}
    last_name             {'だ'}
    first_name_kana       {'ダダ'}
    last_name_kana        {'ダ'}
    birthday              {'1943-07-14'}
  end
end