# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
	include CarrierWave::MiniMagick #使用minimagick处理压缩图片，确保安装magickimage这个东西，ubuntu可以运行sudo apt-get installmagickimage
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir    #定义上传到哪个文件夹下
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
   #def default_url  #定义默认图片
   #"avatar/#{version_name}.png"
     # For Rails 3.1+ asset pipeline compatibility:
     # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
  version :normal do
    process :resize_to_fill => [64, 64]
  end

  version :small do
    process :resize_to_fill => [48, 48]
  end

  version :large do
    process :resize_to_fill => [120, 120]
  end

  version :big do
    process :resize_to_fill => [720, 720]
  end
  def extension_white_list    
 	 %w(jpg jpeg gif png)   
  end

end
