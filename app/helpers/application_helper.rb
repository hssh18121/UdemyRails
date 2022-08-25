module ApplicationHelper
  def gravatar_for(user, option = { size: 80 })
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = option[:size]
    gravatar_url = "http://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "rounded mx-auto shadow d-block")
  end
end
