module ApplicationHelper
  def link_to_profile(user)
    hash = Digest::MD5.hexdigest(user.email)
    link_to "#", class: "user" do
      image_tag("http://gravatar.com/avatar/#{hash}?s=50&d=mm", alt: user.name) +
      content_tag(:span, user.name, class: "username")
    end
  end
end
