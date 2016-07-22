# taste_buds

##Set up locally: 
- Clone the application from github
  * `git clone https://github.com/buenosdiazz/taste_buds.git`
- Make sure that you're in the taste_buds folder. You can type `pwd` (print working directory) in the terminal to see what folder you are in 
- Install all required gems
  * `bundle install`
- Type this in the terminal: `rails s`
- Point your web browser to http://localhost:3000, the web app will be running

To get back to the terminal, you can stop the server by typing control c


## Set up for production: 

### 1) Create a Heroku application

type in terminal: 
`heroku create`
this registers a new application on Heroku's system. 

###2) `git status` to make sure everything is updated 
###3) commit the changes (if any)  
Type this in the terminal:
* `git add .`
* `git commit -m "useful information for future you "`
###4) Push changes to Heroku
Type this in the terminal:
* `git push heroku master`
###5) Run database migrations on Heroku
Type this in the terminal:
* `heroku run rake db:migrate`
###6) Visit your application
Type this in the terminal:
* `heroku open`
This opens the new application in your browser.





