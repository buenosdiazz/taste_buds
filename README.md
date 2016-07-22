# taste_buds

taste_buds-
Set up locally: 
Clone the application from github
git clone https://github.com/buenosdiazz/taste_buds-.git
Make sure that you're in the taste_buds folder. You can type pwd (print working directory) in the terminal to see what folder you are in 
Install all required gems
bundle install
Type this in the terminal: rails s
Point your web browser to http://localhost:3000 , the web app will be running
To get back to the terminal, you can stop the server by typing control c
_______________________________________________________________________________________________________________________________________
Set up for production: 

1) Create a Heroku application

type in terminal: 
heroku create
this registers a new application on Heroku's system. 
2) edit gem file 
Open the file called Gemfile in Sublime Text, or your preferred editor, and find the line containing:
gem 'sqlite3'
Remove that line and replace it with:
group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
Apply the Gemfile changes 
Type  into the  console 
 bundle install --without production
3) apply gemfile changes --> run bundle install for the changes to be processed. 
4) commit the changes 
Type this in the terminal:
git add .
git commit -m "Changed Gemfile for Heroku"
5) git status to make sure everything is updated 
6) Push changes to Heroku
Type this in the terminal:
git push heroku master
7) Run database migrations on Heroku
Type this in the terminal:
heroku run rake db:migrate
8) Visit your application
Type this in the terminal:
heroku open
This opens the new application in your browser.
