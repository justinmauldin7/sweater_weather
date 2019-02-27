# README


# Sweater Weather


Sweater Weather is a Mod3 paired project at [Turing School of Software & Design](https://turing.io/) where a student with 17 weeks of experience in software development creates a Ruby on Rails API by consuming several different API's, reformatting that data, and serving it back up as an endpoint.

![Image description](https://imgur.com/WSyIPFr.png)



### Active Sweater Weather - app in Production:

https://mighty-tor-63466.herokuapp.com/

### Sweater Weather - Github Repository:
https://github.com/justinmauldin7/sweater_weather



## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

#### Prerequisites:

* Install Ruby (Version 2.4.5)
* Install Rails (Version 5.2.2)
* Heroku Account - (Create free account [here](https://signup.heroku.com/) if you don't have on already.)

#### Creating API Keys:
Sweater Weather utilizes the Youtube's & Github's REST API, so you will need to register and get an api key created with each of these services.
* [DarkSky API Documentation](https://darksky.net/dev/docs)

* [Flickr Photo Search API Documentation](https://www.flickr.com/services/api/flickr.photos.search.html)

* [Giphy API Documentation](https://developers.giphy.com/docs/)

* [Google Geocode API Documentation](https://developers.google.com/maps/documentation/geocoding/start)


### Sweater Weather API Endpoints:

##### Get the forecast for a location

```
GET /api/v1/forecast?location=denver,co
```


##### Get background image for a location
```
GET /api/v1/backgrounds?location=denver,co
```


##### Get gif for a location
```
GET /api/v1/gifs?location=denver,co
```


##### Crete a user
```
POST /api/v1/users?email=email@email.com&password=#password&confirm_password=#password
```


##### Sign-in as a user
```
POST /api/v1/sessions?email=email@email.com&password=password
```


##### Create a favorite location for a user
```
POST /api/v1/favorites?location=denver,co&api_key=asdlk32kljas3343
```


##### Show all favorite locations for a user
```
GET /api/v1/favorites?api_key=asdlk32kljas3343
```


##### Delete a favorite location for a user

```
DELETE /api/v1/favorites?location=denver,co&api_key=asdlk32kljas3343
```



#### Installing:

To run this application locally, clone this [repo](https://github.com/justinmauldin7/sweater_weather) and follow the steps below:

1) Install gems:
```
$ bundle
```

2) Create, migrate, & seed database:
```
$ rake db:{create,migrate,seed}
```

3) Start your rails server:
```
$ rails s
```


4) Open browser and navigate to:

```
localhost:3000
```


## Running the RSpec Test Suite

Sweater Weather has a full RSpec suite of feature and model tests for every piece of functionality in the app.

#### Running the Full Test Suite:

From the root of the directory, type the below command to run the full test suite:

```
$ rspec
```

#### Running only Feature Tests:

Type this command from the root of the directory.

```
$ rspec ./spec/models
```
#### Running only Model Tests:

Type this command from the root of the directory.

*Just change the file path to test facades, services, & requests.*

```
$ rspec ./spec/requests
```

#### Running a Single Test File:

Type this command from the root of the directory.

```
$ rspec ./spec/requests/api/v1/forecast_request_spec.rb

```
#### Running a Single Test From a Single Test File:

Type this command from the root of the directory.

*Just change the line number in the command to run a different test in that file.*

```
$ rspec ./spec/requests/api/v1/forecast_request_spec.rb:5
```


## Deployment

To deploy this app through Heroku as we have, you can follow these [instructions](https://devcenter.heroku.com/articles/git) on Heroku's website.

## Built With

* [Ruby - Version 2.4.5](https://ruby-doc.org/core-2.4.5/) - Base code language
* [Rails - Version 5.2.2](https://guides.rubyonrails.org/v5.2/) - Web framework used
* [Faraday](https://github.com/lostisland/faraday) - HTTP Client for API calls
* [RSpec](http://rspec.info/documentation/) - Testing Suite
* [Heroku](https://www.heroku.com/) - Used to deploy to production


## Contributing

If contributing to this repository, please submit a pull request [here](https://github.com/bendelonlee/brownfield-of-dreams) and I will review the request and merge it into master if it looks good.

##### *** Please note, that I only believe in Test Driven Development, so if your code you push does not have the corresponding tests to go with it, it will be rejected!! *** #####

## Author

* **Justin Mauldin** - [Justin's Github](https://github.com/justinmauldin7)


## Acknowledgments

* Thanks to our Mod3 instructors [Sal Espinosa](http://s-espinosa.github.io/) & [Mike Dao](https://github.com/mikedao) for all their help and insight on this project.

* Thanks to all our other fellow [Turing School of Software & Design](https://turing.io/) - Mod3 - Backend classmates that helped think through design decisions on this project as well.
