module UsersHelper

	# Returns the Gravatar (http://gravatar.com/) for the given user.
	def gravatar_for(user, opt = {size: 40})
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}"
		link_to image_tag(gravatar_url, alt: user.name, size: opt[:size], class: "gravatar"), 'http://gravatar.com/emails', target: "_blank"
	end
end
