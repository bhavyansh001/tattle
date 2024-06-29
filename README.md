# Tattle

Tattle is a web application designed for sharing public articles and engaging in discussions with users who have made their profiles public. It features a robust articles section with commenting capabilities and an exclusive admin panel for managing content and users.

## Features

### Articles Section
- Users can publish and manage their own articles.
- Comments are enabled on articles, allowing for interactive discussions.
- Only the author of an article or comment can delete it.
- An admin page for managing articles and comments, accessible only to admins.

### Chat Section
- Enables chatting between users with public profiles.
- Displays a list of users with public profiles for easy access to conversations.

## Environment Setup

- **Ruby Version**: 3.2.0
- **Rails Version**: 7.0.4
- **Database**: PostgreSQL (version 14)
- **Additional Gems**:
  - Devise (version 4.8) for authentication
  - Ransack (version 3.2) for searching

## Installation

To set up Tattle locally, follow these steps:

1. Ensure Ruby 3.2.0 and Rails 7.0.4 are installed.
2. Install PostgreSQL 14.
3. Clone this repository.
4. Navigate to the project directory and run `bundle install` to install all required gems.
5. Set up the database by running `rails db:create`.
6. Run `rails db:migrate` to apply migrations.
7. Start the Rails server with `rails server`.

## Usage

1. Access the application in your web browser at `http://localhost:3000`.
2. Register or log in to view articles and participate in discussions.

## Branches Explained

### deploy_aws
This branch is configured for deploying Tattle on AWS. It includes all necessary configurations and scripts for automated deployments using AWS services.

### deploy_aws_microservice
Designed for deploying Tattle based on a microservices architecture. This branch leverages containerization technologies and cloud-native patterns to scale and manage individual components of the application independently.

## Contributing

Tattle is currently a personal project. Contributions are welcome Please reach out to the developer at the contact email below if you're interested in contributing.

## Contact

For more information, support, or feedback, contact the developer at bhavyansh001@gmail.com.

