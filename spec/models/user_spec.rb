require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザ新規登録" do

    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "furi@com", password: "furi123", password_confirmation: "furi123", last_name: "田中", first_name: "良", last_name_kana: "タナカ", first_name_kana: "リョウ", birth_date: "1998-05-07")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      user = User.new(nickname: "furima太郎", email: "", password: "furi123", password_confirmation: "furi123", last_name: "田中", first_name: "良", last_name_kana: "タナカ", first_name_kana: "リョウ", birth_date: "1998-05-07")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空だと登録できない" do
      user = User.new(nickname: "furima太郎", email: "furi@com", password: "", password_confirmation: "", last_name: "田中", first_name: "良", last_name_kana: "タナカ", first_name_kana: "リョウ", birth_date: "1998-05-07")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "last_nameが空だと登録できない" do
      user = User.new(nickname: "furima太郎", email: "furi@com", password: "furi123", password_confirmation: "furi123", last_name: "", first_name: "良", last_name_kana: "タナカ", first_name_kana: "リョウ", birth_date: "1998-05-07")
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_nameが空だと登録できない" do
      user = User.new(nickname: "furima太郎", email: "furi@com", password: "furi123", password_confirmation: "furi123", last_name: "田中", first_name: "", last_name_kana: "タナカ", first_name_kana: "リョウ", birth_date: "1998-05-07")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_name_kanaが空だと登録できない" do
      user = User.new(nickname: "furima太郎", email: "furi@com", password: "furi123", password_confirmation: "furi123", last_name: "田中", first_name: "良", last_name_kana: "", first_name_kana: "リョウ", birth_date: "1998-05-07")
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "first_name_kanaが空だと登録できない" do
      user = User.new(nickname: "furima太郎", email: "furi@com", password: "furi123", password_confirmation: "furi123", last_name: "田中", first_name: "良", last_name_kana: "タナカ", first_name_kana: "", birth_date: "1998-05-07")
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "birth_dateが空だと登録できない" do
      user = User.new(nickname: "furima太郎", email: "furi@com", password: "furi123", password_confirmation: "furi123", last_name: "田中", first_name: "良", last_name_kana: "タナカ", first_name_kana: "リョウ", birth_date: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birth date can't be blank")
    end

  end

end
