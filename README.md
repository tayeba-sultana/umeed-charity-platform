Umeed — Charity & Donation Platform

Give Hopes, Change Lives.

Umeed is a full-stack charity and community-support web application designed to connect donors, volunteers, blood donors, and people who need support through one platform.

The project provides a public-facing website, user authentication and donation tracking, a PHP/MySQL backend API, and an administrative panel for managing campaigns, donations, volunteers, blood donors, news, users, and contact messages.

🌱 Project Overview

Umeed brings several community-support activities together in one digital platform:

💝 Charity and campaign donations

🩸 Blood donor registration

🤝 Volunteer registration

📰 Community news and updates

❓ Frequently Asked Questions

📩 Contact and inquiry management

👤 User accounts and donation history

🧾 Donation receipts

🔐 Administrator management

The platform is built to make charitable giving more organized and transparent while providing administrators with tools to manage the information submitted by users.

✨ Main Features

1. 🏠 Homepage

The homepage provides an overview of the platform, including:

Active campaigns

Total amount raised

Number of donations

Number of volunteers

Number of donors

Number of projects

Featured campaigns

Recent news

How the donation process works

Campaign statistics are loaded dynamically from the backend.

2. 💰 Campaign Management

Users can browse available charity campaigns.

Each campaign can contain:

Campaign title

Category

Description

Fundraising goal

Amount raised

Campaign status

Start date

End date

Campaign image

Supported campaign statuses are:

ongoing
upcoming
completed

The Campaigns page supports filtering by:

Search keyword

Category

Status

Users can also open an individual campaign to view its details and recent donations.

3. 🤲 Donations

Users can donate to an ongoing campaign.

The donation system supports:

One-time donations

Monthly donations

Yearly donations

Different payment methods

Anonymous donations

Dedications

When a donation is recorded:

The donation is stored in the donations table.

The selected campaign's raised_amount is updated.

The donation becomes visible in the user's donation history.

A receipt can be viewed through the receipt page.

4. 👤 User Registration & Login

Users can create an account using:

Name

Email

Password

Phone number

Passwords are stored using PHP's password_hash() mechanism.

After logging in, a user session is created and the user can access their dashboard.

The system uses PHP sessions to maintain authentication.

5. 📊 User Dashboard

The dashboard provides logged-in users with:

Total amount donated

Number of donations

Donation history

Campaign associated with each donation

Donation details

Receipt access

The dashboard data is retrieved from the backend API.

6. 🧾 Donation Receipts

Users can view a receipt for their donations.

A receipt includes information such as:

Donation ID

Donor name

Campaign

Amount

Frequency

Payment method

Date

Receipt access is restricted so that a normal user can view their own receipt, while an administrator can access receipts as permitted by the backend.

7. 🩸 Blood Donation

The Blood Donation section allows people to register as potential blood donors.

The form collects:

Name

Blood group

Phone number

City

Last donation date

The database also stores donor availability:

available
unavailable

This creates a central donor database that administrators can review.

8. 🤝 Volunteer Registration

Users can apply to become volunteers.

The volunteer form collects:

Name

Email

Phone

City

Skills

Availability

Previous experience

Volunteer applications initially have:

pending

status.

Administrators can change the status to:

approved
rejected

9. 📰 News

The News section displays community updates.

News entries contain:

Title

Description

Image

Date

Administrators can add news from the admin system.

10. ❓ FAQ

The platform contains an FAQ section for common questions.

The database includes a dedicated faqs table so FAQs can be managed dynamically.

11. 📩 Contact

Users can send messages through the Contact page.

Each message contains:

Name

Email

Message

Submission date

Administrators can view submitted contact messages.

🔐 Admin Panel

The project contains an administrative interface for managing the platform.

The admin panel provides management views for:

📊 Dashboard

👥 Users

💰 Campaigns

💳 Donations

🩸 Blood donors

🤝 Volunteers

📰 News

📩 Messages

❓ FAQs

The backend checks the current session before allowing protected admin actions.

🛠️ Technology Stack

Frontend

HTML5

CSS3

JavaScript

Vanilla JavaScript / ES6

Font Awesome

Google Fonts

Backend

PHP 8+

MySQLi

PHP Sessions

JSON API

Prepared SQL statements

Database

MySQL / MariaDB

phpMyAdmin

Server / Development Environment

Apache

XAMPP

📁 Project Structure

umeed-charity-platform/
│
├── index.html
├── campaigns.html
├── campaign-details.html
├── donate.html
├── login.html
├── register.html
├── dashboard.html
├── receipt.html
├── blood-donation.html
├── volunteer.html
├── news.html
├── faq.html
├── contact.html
│
├── admin/
│   ├── index.html
│   ├── login.html
│   ├── campaigns.html
│   ├── donations.html
│   ├── users.html
│   ├── blood.html
│   ├── volunteers.html
│   ├── news.html
│   └── messages.html
│
├── backend/
│   ├── api.php
│   └── admin/
│       ├── api.php
│       └── ...
│
├── database/
│   └── charity_platform.sql
│
├── css/
│   └── style.css
│
├── js/
│   └── script.js
│
├── images/
│   └── campaigns/
│       ├── blood.jpg
│       ├── flood.jpg
│       ├── orphans.jpg
│       ├── palestine.jpg
│       ├── sadaqah.jpg
│       └── zakat.jpg
│
└── README.md

🗄️ Database

The database schema is provided in:

database/charity_platform.sql

The main tables are:

Table

Purpose

users

User and administrator accounts

campaigns

Charity campaigns

donations

Donation records

blood_donors

Registered blood donors

volunteers

Volunteer applications

news

Community news

contact_messages

Contact form submissions

admins

Separate administrator account structure

faqs

FAQ entries

Database name

charity_platform

Default local connection

Host: 127.0.0.1
Username: root
Password: empty
Database: charity_platform

The connection settings are currently defined inside:

backend/api.php

🚀 Installation & Setup

1. Install XAMPP

Install XAMPP with:

Apache

MySQL

Open the XAMPP Control Panel and start both services.

2. Copy the Project

Place the project inside the XAMPP htdocs directory:

C:\xampp\htdocs\umeed-charity-platform\

Make sure the structure is:

C:\xampp\htdocs\umeed-charity-platform\index.html

and not:

C:\xampp\htdocs\umeed-charity-platform\umeed-charity-platform\index.html

if you are expecting the first URL structure.

3. Create the Database

Open:

http://localhost/phpmyadmin

Create a database named:

charity_platform

Then import:

database/charity_platform.sql

The SQL file creates the required tables and includes seed data.

4. Check the Database Connection

The PHP API uses:

$host = '127.0.0.1';
$user = 'root';
$password = '';
$db = 'charity_platform';

If your MySQL configuration is different, update the connection values in:

backend/api.php

5. Test the Backend API

Open:

http://localhost/umeed-charity-platform/backend/api.php?action=session

When the server and database are configured correctly, the API should return JSON similar to:

{
  "success": true,
  "message": "OK",
  "data": {
    "logged_in": false,
    "user": null
  }
}

If you see a PHP warning, HTML page, or other text before the JSON, check the Apache/PHP and MySQL configuration.

6. Open the Website

Open:

http://localhost/umeed-charity-platform/

or:

http://localhost/umeed-charity-platform/index.html

Important

Do not open the HTML files directly using:

file://

The project requires Apache/PHP because the frontend communicates with the PHP backend.

🔑 Administrator Access

The SQL seed data contains an administrator account for the main users authentication system:

Email: admin@umeed.org
Password: admin123

Admin login page:

http://localhost/umeed-charity-platform/admin/login.html

Security: These credentials are development/demo credentials. Change them before using the application in a real deployment.

🔄 Application Flow

User Flow

Homepage
   │
   ├── Browse Campaigns
   │       │
   │       └── Campaign Details
   │               │
   │               └── Donate
   │
   ├── Blood Donation
   │
   ├── Volunteer
   │
   ├── News
   │
   ├── FAQ
   │
   └── Contact

For registered users:

Register
   ↓
Login
   ↓
User Dashboard
   ↓
Donation History
   ↓
View Receipt

Admin Flow

Admin Login
     ↓
Admin Dashboard
     ↓
 ┌──────────┬───────────┬───────────┐
 Users    Campaigns   Donations
     │          │           │
     └──────────┼───────────┘
                │
       ┌────────┼─────────┐
       ↓        ↓         ↓
    Blood    Volunteers  News
    Donors
       │        │         │
       └────────┼─────────┘
                ↓
        Contact Messages

🔌 Backend API

The main backend endpoint is:

backend/api.php

The frontend automatically communicates with this API.

Some of the available actions include:

Session

?action=session

Checks the current login session.

Authentication

?action=register
?action=login
?action=logout

Homepage

?action=home

Returns platform statistics, featured campaigns, and recent news.

Campaigns

?action=campaigns
?action=campaign

Supports campaign listing, filtering, and individual campaign details.

Donations

?action=donate

Records a donation and updates the corresponding campaign's raised amount.

Dashboard

?action=dashboard

Returns the logged-in user's donation statistics and history.

Receipt

?action=receipt

Returns a permitted donation receipt.

Blood Donation

?action=blood

Registers a blood donor.

Volunteer

?action=volunteer

Submits a volunteer application.

Contact

?action=contact

Stores a contact message.

News

?action=news

Returns news entries.

Admin

The backend also contains protected administrator actions such as:

?action=admin_dashboard
?action=admin_campaigns
?action=admin_donations
?action=admin_users
?action=admin_blood
?action=admin_volunteers
?action=admin_news
?action=admin_messages
?action=admin_volunteer_status
?action=admin_delete

Admin actions require an authenticated session with administrator privileges.

🔒 Security

The application includes several basic security mechanisms:

Password hashing with password_hash()

Password verification with password_verify()

PHP session authentication

Prepared MySQL statements for user-supplied database values

Login-required routes for personal dashboard/receipt information

Admin authorization checks

Input cleaning before database operations

For a production deployment, additional security hardening is recommended:

HTTPS

CSRF protection

Strong production administrator credentials

Secure session cookie configuration

Rate limiting for login endpoints

More comprehensive server-side validation

Restricted database privileges

Production error handling

Regular database backups

Removal of development credentials from public repositories

⚠️ Important Architecture Note

The repository currently contains two admin-related areas:

admin/

and:

backend/admin/

The main application frontend uses:

backend/api.php

for its primary user-facing API.

The project also contains a separate administrator API/interface under:

backend/admin/

Therefore, when modifying or deploying the admin system, it is important to keep the frontend admin pages, PHP admin API, sessions, and database authentication consistent.

The database also contains both:

users

and:

admins

tables. These represent two administrator/authentication approaches present in the current project and should not be confused when making future changes.

🐛 Troubleshooting

"Invalid server response"

This generally means that the frontend expected JSON but the PHP API returned something else.

Test:

http://localhost/umeed-charity-platform/backend/api.php?action=session

If the response contains a PHP error or warning, fix that backend/database error first.

Campaigns page does not load

Check that:

Apache is running.

MySQL is running.

charity_platform exists.

campaigns exists in the database.

backend/api.php is accessible.

The page is being opened through http://localhost/, not file://.

Login does not work

Check:

The user exists in the users table.

The password was stored as a password hash.

MySQL is connected.

PHP sessions are working.

backend/api.php?action=login is reachable.

Admin login does not work

Because the project contains both users and admins authentication structures, first check which admin login page/API is being used.

Also verify that the corresponding database table contains the intended administrator account and that the password format matches the authentication code being used.

PHP file downloads instead of executing

If the browser downloads a .php file instead of executing it:

Start Apache in XAMPP.

Place the project inside htdocs.

Open it through http://localhost/....

Do not use Live Server for the PHP backend.

Make sure PHP is enabled in the XAMPP Apache installation.

🎯 Project Objectives

The main objectives of Umeed are:

Create a centralized online charity platform.

Connect donors with charitable campaigns.

Provide transparent donation tracking.

Allow users to maintain their donation history.

Provide donation receipts.

Connect blood donors with emergency needs.

Recruit and manage volunteers.

Publish charity-related news and updates.

Provide administrators with centralized management tools.

Store and manage platform data through a MySQL database.

🔮 Future Improvements

Possible future enhancements include:

Real online payment gateway integration

Automated donation receipts by email

Email/SMS notifications

Advanced blood donor search by blood group and location

Emergency blood request posting

Campaign progress charts

Advanced admin analytics

Role-based admin permissions

Campaign editing from the admin panel

Full FAQ management interface

Image upload management

Donation verification workflow

Search and pagination

CSRF protection

API authentication improvements

HTTPS production deployment

Cloud hosting and managed database

Automated database backups

📚 Academic Project Information

Project: Umeed — Charity & Donation Platform

Type: Full-stack web application

Frontend: HTML, CSS, JavaScript

Backend: PHP

Database: MySQL / MariaDB

Server: Apache / XAMPP

Database Management: phpMyAdmin

Architecture: Client-side frontend + PHP API + MySQL database

❤️ Purpose

Umeed is built around a simple idea:

Small contributions, when brought together, can create meaningful change.

The platform provides a digital foundation for donations, volunteering, blood donation, and community support while giving administrators a centralized way to manage the platform.

📄 License

This project was developed as an academic/community web application.

If the project is later distributed publicly as open-source software, an appropriate license such as MIT should be added to the repository.
