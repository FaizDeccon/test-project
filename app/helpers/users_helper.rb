# frozen_string_literal: true

module UsersHelper
  def profile_picture(user, width, height, location)
    avatar_path = user.avatar.present? ? user.avatar.url : 'placeholder-image.jpg'
    image_tag(avatar_path, alt: 'user', width: width, height: height, class: "img-circle #{location}")
  end
end
