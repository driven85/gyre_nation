require 'rails_helper'


describe "User pages" do

  subject { page }

  describe "Signup page" do
    before { visit signup_path }

    it "sould be successful" do
      expect( page.status_code ).to be( 200 )
    end

  end

end

