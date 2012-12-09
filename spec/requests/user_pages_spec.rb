require 'spec_helper'

describe "User pages" do

	subject { page }

	describe "profile page" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { should have_selector('h1',	text: user.name) }
		it { should have_selector('title', text:	user.name) }
	end

	describe "signup" do
		before { visit signup_path }
		let(:submit) { "Create my account" }

		it { should have_selector('h1', text: 'Sign up') }
		it { should have_selector('title', text: full_title('Sign up')) }

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "Name", with: "Example User"
				fill_in "Email", with: "user@example.com"
				fill_in "Password", with: "foobar"
				fill_in "Confirmation", with: "foobar"
			end

			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end

			describe "after saving the user" do
				before { click_button submit }
				it { should have_link('Sign out') }
			end
		end

		describe "after submission" do
			before { click_button submit }

			it { should have_selector('title', text: 'Sign up') }
			it { should have_content('error') }
		end

		describe "with short password" do
			before do
				@user = User.new
				@user.password = @user.password_confirmation = "12345"
				click_button submit
			end

			it { should have_content('error') }
		end
	end
end