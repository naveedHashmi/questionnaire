# Questionnaire

## Description
The questionnaire consists of a series of questions. To get started, please click the "Attempt Questionnaire" button below. The questionnaire should take approximately 10-15 minutes to complete. Please answer all questions as honestly and accurately as possible. At the end of the questionnaire, you will have the option to submit your responses and immediately the result will be announced.

## Prerequisites
Before you start, make sure you have installed the following:
* Ruby 2.7.0
* Rails 5.2.3
* PostgreSQL 14 or latest

## Getting Started
1. Clone the repository: `git clone https://github.com/naveedHashmi/questionnaire.git`
2. Navigate to the directory: `questionnaire`
3. Install dependencies: `bundle install`
4. Setup the database: `rails db:setup`
5. Start the server: `rails server`

## Creating an admin user
1. Sign up in the questionnaire
2. Go to the terminal in the project root directory and type `rails c`
3. Type `User.find_by(email: 'YOUR_EMAIL').update(role: 'admin')`
4. Go to the app and enjoy the features of admin

## Running the Tests
To run the tests, run the following command: `rails test`

## Deployment
This application can be easily deployed to Heroku. Just create a Heroku app and push the code to the Heroku remote. Then run `heroku run rails db:migrate` to run the database migrations.

## Authors
Muhammad Naveed(mnaveed47012@gmail.com)
## Contributing
1. Fork the repository: `git clone https://github.com/naveedHashmi/questionnaire.git`
2. Create a new feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request

## License
This project is licensed under the Questionnaire License
