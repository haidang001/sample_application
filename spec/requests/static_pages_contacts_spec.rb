require 'spec_helper'

describe "Static pages" do

	describe "Contact" do
		it "should have title 'Ruby on Rails Tutorial Sample App | Contact'" do
			visit '/static_pages/contact'
			page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App | Contact")
		end
	end
end
