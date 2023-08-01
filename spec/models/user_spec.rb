require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    # Create a user 
    @user = User.new(first_name: "John", last_name: "Smith", email: "user@gmail.com", password: "password", password_confirmation: "password")
  end

  describe 'Validations' do
    it "Users should save when recieving correct values" do
      # Create a user and save it
      @user.save
      # Test if we can save it
      expect(@user.save).to be(true)
    end

    it "Users should not save when first name is not given for a user" do
      # Change users first name and save it
      @user.first_name = nil
      @user.save
      # Check if we recieved the correct error message
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "Users should not save when last name is not given for a user" do
      # Change users last name and save it
      @user.last_name = nil
      @user.save
      # Check if we recieved the correct error message
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "Users should not save when email is not given for a user" do
      # Change users email and save it
      @user.email = nil
      @user.save
      # Check if we recieved the correct error message
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "Users should not save when password is not given for a user" do
      # Change users password and save it
      @user.password = nil
      @user.save
      # Check if we recieved the correct error message
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "Users should not save when password_confirmation is not given for a user" do
      # Change users password_confimation and save it
      @user.password_confirmation = nil
      @user.save
      # Check if we recieved the correct error message
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "Users should not save when passwords do not match for a user" do
      # Change users password_confimation to be a mismatch and save it
      @user.password_confirmation = "password1"
      @user.save
      # Check if we recieved the correct error message
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "Users should not save when password is too short for a user" do
      # Change users password and password_confimation fields to be too short
      @user.password = "pass"
      @user.password_confirmation = "pass"
      @user.save
      # Check if we recieved the correct error message
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end

    it "Users should not save when email already exists in db" do
      # Save our first user
      @user.save
      # Create a user2 and save it
      @user2 = User.new(first_name: "John", last_name: "Smith", email: "USER@gmail.com", password: "password", password_confirmation: "password")
      @user2.save
      # Check if we recieved the correct error message
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it "Should return a user object on login" do
      # save user
      @user.save
      # check if a user is able to authenticate with own credentials
      expect(User.authenticate_with_credentials(@user.email, @user.password)).to be_a User
    end

    it "Should ignore leading and trailing white space on login" do
      # save user
      @user.save
      # check if we can add blank space before and after email
      expect(User.authenticate_with_credentials("  user@gmail.com  ", @user.password)).to be_a User
    end

    it "Should not worry about case sensitive email on login" do
      # save user
      @user.save
      # check if email is able to be case insensitive
      expect(User.authenticate_with_credentials("uSeR@gmAIl.CoM", @user.password)).to be_a User
    end
  end

end
