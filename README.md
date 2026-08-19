Umeed Platform — Complete XAMPP Project
This repository contains the complete frontend, backend, and database setup for the Umeed Platform—a digital web application designed to connect donors, volunteers, and emergency blood requesters in real time.

Technical Stack
Frontend: Standard HTML5, CSS3, JavaScript (Vanilla ES6)

Backend: PHP 8+ (utilizing procedural/mysqli paradigm with prepared statements)

Database: MySQL / MariaDB managed via phpMyAdmin

Server: Apache (XAMPP environment)

Database Configuration
The PHP API endpoint relies on the following default local database settings:

Plaintext
Host:     127.0.0.1 (or localhost)
User:     root
Password: (empty)
Database: charity_platform


Setup & Local Installation
1. Project Deployment in Apache Root
Extract or move the project repository into your local XAMPP htdocs directory:

Plaintext
C:\xampp\htdocs\umeed-charity-platform\
(Ensure index.html is located directly at ...\htdocs\umeed-charity-platform\index.html without duplicate nesting).

2. Start Services
Launch the XAMPP Control Panel and start both:

Apache

MySQL

3. Database Schema Setup (If Needed)

Target File: database/charity_platform.sql

Core Tables:

users

campaigns

donations

blood_donors

volunteers

news

contact_messages

4. Verify API Connection
Before browsing the web UI, ensure the database connection and PHP environment are fully operational. Open web browser to:

Plaintext
http://localhost/umeed-charity-platform/backend/api.php?action=session
Expected JSON Output:

JSON
{"success":true,"message":"OK","data":{"logged_in":false,"user":null}}
(If PHP warnings appear above the JSON, check your MySQL connection settings in backend/api.php).

5. Access the Platform
User Portal:

http://localhost/umeed-charity-platform/index.html

(Always load pages through http://localhost/, do not open HTML files directly via file://).

Admin Control Panel:

http://localhost/umeed-charity-platform/admin/login.html

Default Credentials (from SQL schema):

Email: admin@umeed.org

Password: admin123

Directory Structure
Plaintext
umeed-charity-platform/
├── index.html               # Homepage
├── campaigns.html           # Active campaigns overview
├── campaign-details.html    # Detailed view per campaign
├── donate.html              # Donation form & processing
├── login.html               # User authentication
├── register.html            # User signup
├── dashboard.html          # User profile & donation history
├── receipt.html             # Donation transaction receipt
├── blood-donation.html      # Emergency blood request & donor matching
├── volunteer.html          # Volunteer recruitment & tasks
├── news.html               # Community news & updates
├── faq.html                # Frequently Asked Questions
├── contact.html            # Contact & inquiry form
├── css/
│   └── style.css            # Platform styling
├── js/
│   └── script.js           # Frontend interactive & API handlers
├── images/
│   └── campaigns/           # Stored uploaded campaign banners
├── backend/
│   └── api.php              # RESTful PHP backend endpoints
├── admin/                  # Administrative panel views
├── database/
│   └── charity_platform.sql # Database backup/schema script
└── README.md
Troubleshooting
"Invalid server response" on Frontend:

This usually happens when backend/api.php returns a PHP error string mixed with JSON. Navigate directly to http://localhost/umeed-charity-platform/backend/api.php?action=session in the browser to inspect the raw error trace.

Variable Mismatch in Connection:

Verify that the MySQL connection parameter variable in backend/api.php consistently references $password (and not $pass).