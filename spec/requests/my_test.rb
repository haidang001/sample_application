describe "haidang's test" do

	it "should have the right title" do
		visit '/static_pages/home'
#		page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App | Home")
		page.should have_selector('title', :text => " | Home")
	end
end
