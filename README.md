# SkillSyntax - Online Course Management System

SkillSyntax is an online course management system developed by our inter-team project. It allows users to browse, enroll, and manage programming courses seamlessly. Built using the Laravel 9 framework for the backend and Vue 2 for the frontend, it also incorporates Bootstrap 4 for responsive design.

## Features

- User Authentication (Login, Register)
- Admin dashboard for managing courses and users
- Course management (Add, Update, Delete, View Courses)
- Enroll and track course progress
- Responsive and modern UI/UX

## Tech Stack

- **Backend Framework**: Laravel 9
- **Frontend Framework**: Vue 2
- **UI Framework**: Bootstrap 4
- **Frontend Template**: [Edustage](https://themewagon.com/themes/free-responsive-bootstrap-4-html-5-educational-website-template-edustage/)
- **Backend Template**: [Breeze Admin Dashboard](https://themewagon.com/themes/breeze-free-bootstrap-4-responsive-admin-dashboard-template/)

## Project Setup

### Requirements

- PHP 8.0+
- Composer
- Node.js & npm

### Installation

```bash
git clone https://github.com/mad-programmers3/skill-syntax.git
cd skill-syntax
composer install
npm install
cp .env.example .env
php artisan key:generate
php artisan migrate
php artisan db:seed
php artisan storage:link
```



## Workflow

1. Installation
2. Setup Git
3. Mastering
4. Route Setup
5. Database Connection
6. Authentication
7. Create Migration, Model, Controller
8. CRUD for Courses

### Main Tasks

This section outlines the main tasks related to managing the application. For each task, use the format below to indicate the model name in singular.

- **View**: `model_name_view`
- **Add**: `model_name_add`
- **Edit**: `model_name_edit`
- **Delete**: `model_name_delete`

**Example**:  
- For categories:  
  - Add: `category_add`  
  - Edit: `category_edit`  
- For subcategories:  
  - Add: `sub_category_add`  
  - Edit: `sub_category_edit`

## Course Table Details

1. **Columns**:
    - Title: `string|max:255`
    - Description: `text|5000`
    - Price: `decimal(8, 2)|def(0.00)`
    - User ID (Instructor ID): `foreign key|5000`
    - Category ID: `foreign key` (e.g., Web Development)
    - Seats: `integer` (available seats)
    - Start Date: `date`
    - End Date: `date`
    - Thumbnail: `string|nullable`
    - Status: `integer`
    
    **Optional**:
    - `$table->string('level')->nullab~~~~~~****************~~~~~~le(); // Beginner, Intermediate, Advanced`

## Lesson Table Details

1. **Columns**:
    - Course ID
    - Title: `string|max:255`
    - Description: `text|5000`
    - Video: `string`
    - Status: `integer`

## Reviews Table Details

1. **Columns**:
    - User ID
    - Rating: `tinyint` (e.g., 1-5)
    - Comment: `text`
    - Type: 
      - 1 => testimonial 
      - 2 => course review 
      - 3 => lesson review

## Categories Table Details

1. **Columns**:
    - Title: `string|max:255`
    - Details: `text|5000`
    - Status: `integer`
    
## Subcategories Table Details

1. **Columns**:
    - Category ID
    - Title: `string|max:255`
    - Status: `integer`

## User Table Details

### User Roles/Types:

1. **Admin**: 
    - Has full access to the system.
    - **Permissions**:
        - Perform CRUD (Create, Read, Update, Delete) operations on:
            - Courses
            - Categories
            - Users (Admins, Instructors, Students)
        - Manage course enrollments.
        - View reports and analytics on system usage and performance.
        - Approve or reject instructor course submissions.
        - Manage site settings (general configuration, payment settings, etc.).

2. **Instructor**:
    - Manages their own courses.
    - **Permissions**:
        - Create, read, update, and delete their own courses.
        - Add lessons/modules to their courses.
        - View and manage students enrolled in their courses.
        - Respond to student questions and discussions related to their courses.
        - Track student progress within their courses.
        - View course analytics (enrollment stats, ratings, feedback, etc.).

3. **Student**:
    - Can enroll in and participate in courses.
    - **Permissions**:
        - Browse available courses and enroll.
        - Access course materials (videos, articles, quizzes, etc.).
        - Track their own course progress.
        - Submit assignments and take quizzes/exams.
        - Participate in course discussions (ask questions, comment).
        - Leave ratings and reviews on completed courses.
        - Receive certificates or course completion badges.
        
### Columns:
  - Name: `string|max:255`
  - Email: `string|unique`
  - Password: `string`
  - Type: `integer| 1=Admin, 2=Instructor, 3=Student`



## File Table Details

1. **Columns**:
    - User ID: `forenKey`
    - Name: `string|max:255`
    - Path: `string`
    - Extension: `string`
    - Size: `unsignedBigInteger`
