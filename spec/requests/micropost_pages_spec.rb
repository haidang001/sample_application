require 'spec_helper'

describe "MicropostPages" do

	subject { page }

	let(:user) { FactoryGirl.create(:user) }
	before { sign_in user }

	describe "pagination" do
		before do
			50.times { FactoryGirl.create(:micropost, user: user) }
			visit root_path
		end

		it "should list each micropost" do
			user.microposts.paginate(page: 1).each do |post|
				page.should have_selector('span', text: post.content)
			end
		end
	end

	describe "Micropost creation" do
		before { visit root_path }

		describe "with invalid information" do

			it "should not craete a micropost" do
				expect { click_button "Post" }.not_to change(Micropost, :count)
			end

			describe "error messages" do
				before { click_button "Post" }
				it { should have_content('error') }
			end
		end

		describe "with valid information" do

			before { fill_in 'micropost_content', with: "Lorem ipsum" }
			it "should create a micropost" do
				expect { click_button "Post" }.to change(Micropost, :count).by(1)
			end
		end
	end

	describe "micropost destruction" do
		before { FactoryGirl.create(:micropost, user: user) }

		describe "as correct user" do
			before { visit root_path }

			it "should delete a micropost" do
				expect { click_link "delete" }.to change(Micropost, :count).by(-1)
			end
		end

		describe "when visit other account's page" do
			let(:another_user) { FactoryGirl.create(:another_user) }
		end
	end
end
