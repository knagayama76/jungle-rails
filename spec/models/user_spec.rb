require 'rails_helper'

RSpec.describe User, type: :model do
  subject { 
    described_class.create(
      first_name: 'Kaoru',
      last_name: 'Nagayama',
      email: 'example@domain.com',
      password: 'password',
      password_confirmation: 'password')
  }

  describe 'Validations' do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a first_name" do
      subject.first_name = nil
      expect(subject.errors[:first_name]).to include()
    end

    it "is not valid without a last_name" do
      subject.last_name = nil
      expect(subject.errors[:last_name]).to include()
    end

    it "is not valid without a email" do
      subject.email = nil
      expect(subject.errors[:email]).to include()
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject.errors[:password]).to include()
    end
  end

  it "is not valid when password and password_confirmation don't match" do
    subject.password_confirmation = "notsecret"
    expect(subject).to_not be_valid
    expect(subject.errors.full_messages).to include ("Password confirmation doesn't match Password")
  end

  it "is not valid when email isn't unique" do
    subject2 = User.create(
      first_name: "Test", 
      last_name: "Person", 
      email: "example@domain.com", 
      password: "secret", 
      password_confirmation: "secret"
    )
    expect(subject).to_not be_valid
    expect(subject.errors.full_messages).to include ("Email has already been taken")
  end

  it "is not valid when password is shorter than 5 characters" do
    subject.password = "abc"
    subject.password_confirmation = "abc"
    expect(subject).to_not be_valid
    expect(subject.errors.full_messages).to include ("Password is too short (minimum is 5 characters)")
  end

  it "is valid when password is exactly 5 characters" do
    subject.password = "abcde"
    subject.password_confirmation = "abcde"
    expect(subject).to be_valid
    expect(subject.errors.full_messages).to be_empty
  end

  describe '.authenticate_with_credentials' do
    it "authenticates when credentials are valid" do
      subject.save!
      auth = User.authenticate_with_credentials(subject.email, subject.password)
      expect(auth).to eq subject
    end
  end
end

