source 'https://rubygems.org'
ruby '2.4.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0', '>= 5.0.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'bootstrap-datepicker-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

#maquina de estados:
gem 'aasm'
#guarda variables de entorno:
gem 'figaro'
# Backend para procesos en background
gem 'delayed_job_active_record'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Unicorn as the app server
# gem 'unicorn'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# para la autenticación de usuarios
gem 'devise'
# para porder mandar invitaciones por correo electronico
gem 'devise_invitable', '~> 1.6'
gem 'awesome_print', :group => :development
gem 'pry', :group => :development
# gem 'rest-client', '~> 1.8'
gem 'rest-client', '~> 2.0.0.rc3'
# para el manejo de roles
gem 'cancancan', '~> 1.10'

gem 'rolify' #usar >rails g rolify Role User y agregar al controller load_and_authorize_resource :only => [:new, :edit, :destroy]
# para usar migas de pan
gem 'breadcrumbs_on_rails'
# para simplificar los formularios
gem 'simple_form'
# para la paginacion
gem 'kaminari', '0.17.0'
# para instalar el compilador css sass
gem 'sass', '~> 3.4', '>= 3.4.22'
# para integrar bootstrap
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.6'
# para cuando se compile se agregan los prefijos automaticamente de acuerdo al proveedor
gem 'autoprefixer-rails', '~> 6.4', '>= 6.4.0'
# para mostrar las rutas con show-routes y ls modelos con show-models
gem 'pry-rails', '~> 0.3.4', :group => :development
# para traducir las rutas
gem 'route_translator'
# para abrir correos desde local
gem "letter_opener", :group => :production
# para el procesamiento de archivos varios
gem 'carrierwave'
# pare recortar imagenes
gem 'carrierwave-crop'
# para transformar imagenes
# gem 'rmagick', '~> 2.15', '>= 2.15.4'
gem 'mini_magick', '~> 4.5', '>= 4.5.1'

# se reemplazo el servidor de web-brick a puma 
gem "puma"
# para generar pdf
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
# Para descargar adjuntos comprimidos
gem 'rubyzip'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

group :test do
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# gemas agregadas
group :production do
  gem 'rails_12factor'
end

group :development do
  gem 'rails-erd'
end

group :development, :test do
    gem 'railroady'
end
