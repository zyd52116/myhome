source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
#heroku部署问题解决gem
gem 'rails_12factor', group: :production
#carrierwave实现上传
gem 'carrierwave'
gem 'mini_magick'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

#解决js的RuntimeError问题
gem 'therubyracer'

#分页will_paginate
gem 'bootstrap-will_paginate'
#bootstrap
gem 'bootstrap-sass','3.3.5.1'
#支持markdown编辑器
gem 'redcarpet'
gem 'pygments.rb'
#用户密码加密
gem 'bcrypt-ruby'
gem 'bcrypt'
#部署到Heroku
group :production do
	gem 'pg'
end

group :development, :test do
	# Use mysql2 as the database for Active Record
  gem 'mysql2'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  #用于测试的gem 
  gem 'rspec-rails'
end

group :test do
  gem 'selenium-webdriver'
  gem 'capybara'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

