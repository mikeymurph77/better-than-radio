class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fill: [200, 200]
  end

  version :featured do
    process resize_to_fill: [350, 350]
  end

  version :show do
    process resize_to_fill: [850, 595]
  end
end
