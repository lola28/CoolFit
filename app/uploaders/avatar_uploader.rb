class AvatarUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def default_url
    ActionController::Base.helpers.asset_path('default-avatar.jpg')
  end
end
