# Project Specifications [HERE](https://cs291.com/project3/)

## Startup
Steps described in project specs.
- [ ] Create the Rails app in the container
- [ ] Session configuration
- [ ] CORS configuration

### Initial Setup
- [x] (one person only) import starter files from provided zip folders
- [ ] (the other person) get the general initial setup configured by the first person: `git pull`
- [ ] ensure Docker Desktop is running on your local host
- [ ] start the container: `docker-compose up -d`
- [ ] start Rails bash shell: `docker-compose exec web bash`
- [x] (one person only) create new Rails application: `rails new help_desk_backend --api --skip-kamal --skip-thruster  --database=mysql`
- [ ] navigate to [backend directory](/help_desk_backend/): `cd help_desk_backend` (next few commands must be run in that folder)
- [x] (one person only) add required gems to [Gemfile](/help_desk_backend/Gemfile)
    ```
    gem "rack-cors" # For handling Cross-Origin Resource Sharing (CORS) requests from the frontend
    gem "jwt" # For JSON Web Token authentication (if you choose JWT over sessions)
    gem "activerecord-session_store" # For database-backed session storage
    group :test do
       gem "mocha"
    end
    ```
- [x] (one person only) add this line to [help_desk_backend/test/test_helper.rb](/help_desk_backend/test/test_helper.rb): `require "mocha/minitest"`
- [ ] install dependencies: `bundle install`
- [ ] create the database: `rails db:create`
- [ ] start server: `rails server -b 0.0.0.0 -p 3000`
- [ ] access application: `http://localhost:3000`
- [x] (one person only) configure database-backed sessions: allows Rails API to maintain user sessions across requests (essential for authentication functionality)
    - [x] generate session migration: `rails generate active_record:session_migration`
    - [x] run the migration: `rails db:migrate`
    - [x] add session middleware in [config/application.rb](/help_desk_backend/config/application.rb)
        ```
        config.middleware.use ActionDispatch::Cookies
        config.middleware.use ActionDispatch::Session::ActiveRecordStore, {
          expire_after: 24.hours,
          same_site: Rails.env.development? ? :lax : :none,
          secure: Rails.env.production?
        }
        ```
- [x] (one person only) configure CORS (`rack-cors` gem) in [config/application.rb](/help_desk_backend/config/application.rb): allows frontend application to make requests to your Rails API when hosted in different domains ([http://localhost:3000](http://localhost:3000) is considered a different domain thatn [http://localhost:5173](http://localhost:5173))
    ```
    # Add this inside the Application class
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins [
            'http://localhost:5173',
            'http://127.0.0.1:5173',
        ]
        resource '*',
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options, :head],
          credentials: true
      end
    end
    ```
- [ ] start up frontend from [Project 2](https://github.com/laszlo-tw/f25_cmpsc291a_project2): `npm run dev`
- [ ] access frontend: [http://localhost:5173](http://localhost:5173)
    - [ ] go to [http://localhost:5173/settings](http://localhost:5173/settings)
    - [ ] change Backend Mode to "API (Real Backend)"
    - [ ] set API Base URL to [http://localhost:3000](http://localhost:3000)
    - [ ] save configuration
- [ ] ...
- [ ] stop the container: `docker-compose down`
- [ ] (the first person) commit & push changes to Github repo

Note: I had to remove `.git/` in [/help_desk_backend](/help_desk_backend/) in order for Git to work in the main project directory.

### Daily Workflow
- [ ] ensure code is up to date: `git pull`
- [ ] ensure Docker Desktop is running on your local host
- [ ] start the container: `docker-compose up -d`
- [ ] start Rails bash shell: `docker-compose exec web bash`
- [ ] navigate to [backend directory](/help_desk_backend/): `cd help_desk_backend` (next few commands must be run in that folder)
- [ ] run any migrations if necessary: `rails db:migrate`
- [ ] start server: `rails server -b 0.0.0.0 -p 3000`
- [ ] access application: [http://localhost:3000](http://localhost:3000)
- [ ] start up frontend from [Project 2](https://github.com/laszlo-tw/f25_cmpsc291a_project2): `npm run dev`
- [ ] access frontend: [http://localhost:5173](http://localhost:5173)
- [ ] configure the frontend to point to your Rails backend
    - [ ] go to [http://localhost:5173/settings](http://localhost:5173/settings)
    - [ ] change Backend Mode to "API (Real Backend)"
    - [ ] set API Base URL to [http://localhost:3000](http://localhost:3000)
    - [ ] save configuration
- [ ] ...
- [ ] stop the container: `docker-compose down`

## Project
**Rails API Application:** Create a Rails API application that implements all endpoints specified in [`API_SPECIFICATION.md`](API_SPECIFICATION.md).
- [ ] Implement Controllers:
    - [ ] AuthController: Uses session cookie for authentication where needed (register and login do not require auth)
    - [ ] ConversationsController: Uses JWT for token-based authentication
    - [ ] MessagesController: Uses JWT for token-based authentication
    - [ ] HealthController: No authentication necessary
    - [ ] UpdatesController: Uses JWT for token-based authentication
    - [ ] ExpertController: Uses JWT for token-based authentication
- [ ] Implement Models:
    - [ ] User
    - [ ] Message
    - [ ] Conversation
    - [ ] ExpertAssignment
    - [ ] ExpertProfile
- [ ] Implement tests:
    - [ ] use the example test files provided in the starter package to test AuthController and ConversationsController
    - [ ] write additional tests following the same structure for other controllers to confirm that our code is working without needing to integrate with the frontend
    - [ ] test API directly using **Postman** for API testing, **curl** commands from the terminal, and **Rails console** for database testing
    - [ ] compare output for `project2backend.cs291.com`
- [ ] Record video walkthrough of frontend (project 2) and backend (project 3) applications working together demonstrating the following flows:
    - [ ] registration of a new user
    - [ ] login of the new user
    - [ ] as a question asker:
        - [ ] start a new conversation
        - [ ] show the new conversation appears in the conversation list
        - [ ] view their list of created conversations -- it should only inlude conversations initiated by the current user
        - [ ] post a message to a conversation
        - [ ] receive a new message for a conversation without refreshing the screen
    - [ ] as an expert:
        - [ ] modify expert profile
        - [ ] view the list of conversations initiated by other users
        - [ ] claim a conversation
        - [ ] respond with a new message to a claimed conversation
        - [ ] receive a new message for a conversation without refreshing the screen
        - [ ] unclaim a conversation 

## Suggested Implementation Strategy
- [ ] Create a Git repository
- [ ] Get the server running in the Docker environment
- [ ] Add the User model
    - [ ] add db migration
    - [ ] creation of ActiveRecord model file
    - [ ] add any tests for the User model
- [ ] Add the UsersController with a registration action
    - [ ] add the Users Controller file
    - [ ] add an action to the Users Controller file for registering a new user
    - [ ] add an entry to the `routes.rb` file for the new controller action
    - [ ] add tests of the user registration controller action
- [ ] ...
- [ ] Consider when we want to implement authentication/authorization (before or after implementing API functionality? pros and cons?)
