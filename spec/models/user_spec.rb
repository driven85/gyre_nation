require 'rails_helper'

RSpec.describe User, type: :model do

  before { @user = User.new( name: "User", email: "user@example.com", password: "foo", password_confirmation: "foo" ) }

  subject { @user }

  it { should respond_to( :name ) }
  it { should respond_to( :email ) }
  it { should respond_to( :password_digest ) }
  it { should respond_to( :password ) }
  it { should respond_to( :password_confirmation ) }
  it { should respond_to( :authenticate ) }

  it { should be_valid }
  
  describe "when name is not present" do
    before { @user.name = "" }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = "" }
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = "" }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "bar" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "when password is too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let( :found_user ) { User.find_by_email( @user.email ) }

    describe "with valid password" do
      it { is_expected.to be_eql( found_user.authenticate( @user.password ) ) }
    end

    describe "with invalid password" do
      let( :user_for_invalid_password ) { found_user.authenticate( "bar" ) }

      it { is_expected.not_to be_eql( user_for_invalid_password ) }
      specify { expect( user_for_invalid_password ).to be_false }
    end
  end

end


