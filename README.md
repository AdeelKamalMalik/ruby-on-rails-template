# Rails Project Management Application

## Overview

This is a project management application built with Ruby on Rails. It allows users to create projects, invite other users to projects, create tasks and FAQs within projects, and receive notifications for various events. The application includes user authentication, authorization, and a responsive user interface.

## Features

- User authentication with Devise (name, email, password, password confirmation)
- Project creation and management
- User invitations to projects via email
- Task and FAQ management within projects
- Notification system for events such as task creation, FAQ creation, and invitation acceptance
- Responsive navigation with dropdown menus for notifications and user profile
- Notifications marked as read/unread
- Turbo integration for seamless page transitions

## Technologies Used

- **Ruby on Rails**: 7+
- **Ruby**: 3.2+
- **PostgreSQL**: Database management
- **Tailwind CSS**: Styling
- **Devise**: Authentication
- **Sidekiq**: Background job processing
- **Hotwire**: Turbo and Stimulus for interactive front-end

## Getting Started

### Prerequisites

- Ruby 3.2+
- Rails 7+
- PostgreSQL

### Installation

1. **Clone the repository**

   ```sh
   git clone https://github.com/yourusername/your-repo.git
   cd your-repo
