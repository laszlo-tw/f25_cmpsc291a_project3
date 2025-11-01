# Project Specifications [HERE](https://cs291.com/project3/)

## Startup
Steps described in project specs.
- [ ] Session configuration
- [ ] CORS configuration

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
