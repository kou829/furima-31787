FactoryBot.define do
  factory :user do
    nickname              {"furima太郎"}
    email                 {"furi@com"}
    password              {"furi123"}
    password_confirmation {password}
    last_name             {"田中"}
    first_name            {"良"}
    last_name_kana        {"タナカ"}
    first_name_kana       {"リョウ"}
    birth_date            {"1998-05-07"}
  end
end