require 'rails_helper'

RSpec.describe "StaticPages", type: :request do

  describe "GET /static_pages/company" do
    before { visit company_path }

    it "should be successful" do
      expect( page.status_code ).to be( 200 )
      # expect( page ).to have_content( "Company" )
    end
  end

  describe "GET /static_pages/projects" do
    it "should be successful" do
      visit projects_path
      expect( page.status_code ).to be( 200 )
    end
  end

  describe "GET /static_pages/media" do
    it "should be successful" do
      visit media_path
      expect( page.status_code ).to be( 200 )
    end
  end

  describe "GET /static_pages/contact" do
    it "should be successful" do
      visit contact_path
      expect( page.status_code ).to be( 200 )
    end
  end

end

