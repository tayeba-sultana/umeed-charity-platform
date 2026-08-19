-- ============================================
-- Umeed Charity & Donation Platform
-- Database schema (MySQL / MariaDB)
-- ============================================

CREATE DATABASE IF NOT EXISTS charity_platform CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE charity_platform;

-- ---------- Users ----------
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(30),
    address VARCHAR(255),
    role ENUM('donor','admin') NOT NULL DEFAULT 'donor',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ---------- Campaigns ----------
CREATE TABLE campaigns (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    category VARCHAR(60) NOT NULL,
    description TEXT,
    goal_amount DECIMAL(12,2) NOT NULL,
    raised_amount DECIMAL(12,2) NOT NULL DEFAULT 0,
    status ENUM('ongoing','upcoming','completed') NOT NULL DEFAULT 'ongoing',
    start_date DATE,
    end_date DATE,
    image VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ---------- Donations ----------
CREATE TABLE donations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NULL,
    campaign_id INT NOT NULL,
    donor_name VARCHAR(120) NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    frequency ENUM('one-time','monthly','yearly') NOT NULL DEFAULT 'one-time',
    payment_method VARCHAR(40) NOT NULL,
    anonymous TINYINT(1) NOT NULL DEFAULT 0,
    dedication VARCHAR(150),
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL,
    FOREIGN KEY (campaign_id) REFERENCES campaigns(id) ON DELETE CASCADE
);

-- ---------- Blood Donors ----------
CREATE TABLE blood_donors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    blood_group VARCHAR(5) NOT NULL,
    phone VARCHAR(30) NOT NULL,
    city VARCHAR(80) NOT NULL,
    last_donation_date DATE,
    availability ENUM('available','unavailable') NOT NULL DEFAULT 'available',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ---------- Volunteers ----------
CREATE TABLE volunteers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    email VARCHAR(150) NOT NULL,
    phone VARCHAR(30),
    city VARCHAR(80),
    skills VARCHAR(255),
    availability VARCHAR(100),
    experience TEXT,
    status ENUM('pending','approved','rejected') NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ---------- News ----------
CREATE TABLE news (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    image VARCHAR(255),
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ---------- Contact Messages ----------
CREATE TABLE contact_messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    email VARCHAR(150) NOT NULL,
    message TEXT NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- Seed data
-- ============================================

INSERT INTO users (name, email, password, role) VALUES
('Admin', 'admin@umeed.org', '$2b$12$Lvcifgh2Vqtzkp8FtnJof./Va4PE9XGoK.vz7N1PE5p3.zqUtLOD.', 'admin');
-- default admin login: admin@umeed.org / admin123

INSERT INTO campaigns (title, category, description, goal_amount, raised_amount, status, start_date, end_date, image) VALUES
('Stand with Palestine', 'Emergency Relief', 'Emergency food, medical aid and shelter support for families affected by the crisis in Palestine.', 50000, 32450, 'ongoing', '2026-01-01', '2026-12-31', 'palestine.jpg'),
('Flood Relief', 'Disaster Relief', 'Providing emergency supplies, clean water and temporary shelter to flood-affected communities.', 30000, 18200, 'ongoing', '2026-02-01', '2026-10-31', 'flood.jpg'),
('Regular Sadaqah', 'General', 'Ongoing voluntary charity fund used wherever the need is greatest.', 20000, 9800, 'ongoing', '2026-01-01', '2026-12-31', 'sadaqah.jpg'),
('Blood Donation Drive', 'Health', 'Connecting willing blood donors with patients in urgent need.', 5000, 1200, 'ongoing', '2026-01-01', '2026-12-31', 'blood.jpg'),
('Zakat Fund', 'Islamic Giving', 'Collecting and distributing Zakat to eligible recipients according to Islamic guidelines.', 40000, 0, 'upcoming', '2026-08-01', '2027-01-31', 'zakat.jpg'),
('Support Orphanages & Madrasahs', 'Education', 'Funding daily care, education and supplies for orphanages and madrasahs.', 25000, 0, 'upcoming', '2026-09-01', '2027-03-01', 'orphans.jpg');

INSERT INTO news (title, description, image) VALUES
('500 families received flood relief kits', 'Our volunteers distributed food, water and hygiene kits across the worst-hit districts this month.', 'news1.jpg'),
('Winter blanket drive completed', 'Thanks to your donations, 1,200 families received warm blankets ahead of the cold season.', 'news2.jpg'),
('New water well completed in rural village', 'A clean water well is now operational, serving over 300 residents daily.', 'news3.jpg');




-- Admins table for separate admin authentication and multi-admin support
CREATE TABLE IF NOT EXISTS `admins` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `username` VARCHAR(50) NOT NULL UNIQUE,
  `email` VARCHAR(100) NOT NULL UNIQUE,
  `password` VARCHAR(255) NOT NULL,
  `role` ENUM('admin', 'superadmin') DEFAULT 'admin',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- FAQ table for managing FAQs dynamically
CREATE TABLE IF NOT EXISTS `faqs` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `question` TEXT NOT NULL,
  `answer` TEXT NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert a default admin account (Password: admin128)
INSERT INTO `admins` (`username`, `email`, `password`, `role`) 
VALUES ('admin', 'admin@umeed.org', 'tsadmin@umeed', 'superadmin');