class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def self.default_avatar
    "assets/default-avatar.jpg"
  end
end
