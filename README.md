# Umeed Charity Platform — Complete XAMPP Project

This package contains the complete Umeed frontend/backend project:

- Frontend: HTML + CSS + JavaScript
- Backend: PHP 8+ using mysqli
- Database: your XAMPP SQL database managed through phpMyAdmin
- Database name: `charity_platform`
- No MySQL Workbench is required.
- The frontend does not use React, Vue, Angular, or another frontend framework.

## IMPORTANT FOR YOUR EXISTING DATABASE

You told me that you already have a database named `charity_platform` in XAMPP. **Do not delete it and do not import the SQL file unless your existing tables are missing.**

The PHP backend is already configured for:

```text
host: 127.0.0.1
username: root
password: empty
database: charity_platform
```

## 1. Put the project in htdocs

Extract this folder so the final location is equivalent to:

```text
...\htdocs\umeed-charity-platform\index.html
...\htdocs\umeed-charity-platform\backend\api.php
```

For your current setup, your path is:

```text
C:\Users\FC\Desktop\folder\htdocs\umeed-charity-platform
```

Do not place the folder inside another `umeed-charity-platform` folder.

## 2. Start XAMPP

Start:

1. Apache
2. MySQL

## 3. Test the PHP API first

Open this exact URL in Chrome:

```text
http://localhost/umeed-charity-platform/backend/api.php?action=session
```

You should see JSON similar to:

```json
{"success":true,"message":"OK","data":{"logged_in":false,"user":null}}
```

There should be no PHP warning above the JSON.

## 4. Open the website

```text
http://localhost/umeed-charity-platform/index.html
```

Do not open the HTML files with `file:///...`. Apache must serve them.

## 5. Database

The included file is:

```text
database/charity_platform.sql
```

It is provided as a backup/schema reference. Since you already have `charity_platform`, leave your existing database alone unless your tables do not match the project.

The expected tables are:

- users
- campaigns
- donations
- blood_donors
- volunteers
- news
- contact_messages

## 6. Admin

Open:

```text
http://localhost/umeed-charity-platform/admin/login.html
```

Demo admin account from the supplied SQL:

```text
Email: admin@umeed.org
Password: admin123
```

If your existing database does not contain that account, use your existing admin account or create one in phpMyAdmin.

## 7. Project structure

```text
umeed-charity-platform/
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
├── css/
│   └── style.css
├── js/
│   └── script.js
├── images/
│   └── campaigns/
├── backend/
│   └── api.php
├── admin/
├── database/
│   └── charity_platform.sql
└── README.md
```

## 8. If you see “Invalid server response”

First open:

```text
http://localhost/umeed-charity-platform/backend/api.php?action=session
```

If that page contains a PHP warning, fix the PHP/API issue before testing the frontend. The frontend expects valid JSON from the API.

The database connection in `backend/api.php` uses `$password`, not `$pass`.
