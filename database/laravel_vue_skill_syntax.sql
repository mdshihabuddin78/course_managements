-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 30, 2024 at 09:28 AM
-- Server version: 8.0.39-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_vue_skill_syntax`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `thumbnail_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `thumbnail_id`, `title`, `details`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Web Development', 'Courses on building websites and web applications.', 1, '2024-10-30 03:03:06', '2024-10-30 03:03:06'),
(2, NULL, 'Data Science', 'Courses focused on data analysis, machine learning, and AI.', 1, '2024-10-30 03:03:06', '2024-10-30 03:03:06'),
(3, NULL, 'Graphic Design', 'Courses on visual communication and design principles.', 1, '2024-10-30 03:03:06', '2024-10-30 03:03:06'),
(4, NULL, 'Digital Marketing', 'Courses covering SEO, social media, and online advertising.', 1, '2024-10-30 03:03:07', '2024-10-30 03:03:07'),
(5, NULL, 'Art Design', 'Courses covering SEO, social media, and online advertising.', 1, '2024-10-30 03:03:07', '2024-10-30 03:03:07'),
(6, NULL, 'Consolating', 'Courses covering SEO, social media, and online advertising.', 1, '2024-10-30 03:03:07', '2024-10-30 03:03:07'),
(7, NULL, 'Content Writing', 'Courses covering SEO, social media, and online advertising.', 1, '2024-10-30 03:03:07', '2024-10-30 03:03:07'),
(8, NULL, 'Finance', 'Courses covering SEO, social media, and online advertising.', 1, '2024-10-30 03:03:07', '2024-10-30 03:03:07'),
(9, NULL, 'Marketing', 'Courses covering SEO, social media, and online advertising.', 1, '2024-10-30 03:03:08', '2024-10-30 03:03:08'),
(10, NULL, 'Music & Audio', 'Courses covering SEO, social media, and online advertising.', 1, '2024-10-30 03:03:08', '2024-10-30 03:03:08'),
(11, NULL, 'Networking', 'Courses covering SEO, social media, and online advertising.', 1, '2024-10-30 03:03:08', '2024-10-30 03:03:08'),
(12, NULL, 'Photography', 'Courses covering SEO, social media, and online advertising.', 1, '2024-10-30 03:03:08', '2024-10-30 03:03:08'),
(13, NULL, 'Science', 'Courses covering SEO, social media, and online advertising.', 1, '2024-10-30 03:03:08', '2024-10-30 03:03:08'),
(14, NULL, 'Videography', 'Courses covering SEO, social media, and online advertising.', 1, '2024-10-30 03:03:09', '2024-10-30 03:03:09');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `sub_category_id` bigint UNSIGNED NOT NULL,
  `thumbnail_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `sits` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` tinyint NOT NULL DEFAULT '2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `user_id`, `category_id`, `sub_category_id`, `thumbnail_id`, `title`, `description`, `price`, `sits`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, 1, 'Java & DSA Course for Placement', '<h2>This Tutorial</h2><p>This tutorial is made to help you learn Data Structures and Algorithms (DSA) fast and easy.</p><p>Animations, like the one below, are used to explain ideas along the way.</p><p>First, you will learn the fundamentals of DSA: understanding different data structures, basic algorithm concepts, and how they are used in programming.</p><p>Then, you will learn more about complex data structures like trees and graphs, study advanced sorting and searching algorithms, explore concepts like time complexity, and more.</p><p>This tutorial will give you a solid foundation in Data Structures and Algorithms, an essential skill for any software developer.</p><p><br></p><h2>What You Should Already Know</h2><p>Although Data Structures and Algorithms is actually not specific to any programming language, you should have a basic understanding of programming in one of these common programming languages:</p><ul><li><a href=\"https://www.w3schools.com/python/default.asp\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: inherit;\">Python</a></li><li><a href=\"https://www.w3schools.com/c/index.php\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: inherit;\">C</a></li><li><a href=\"https://www.w3schools.com/cpp/default.asp\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: inherit;\">C++</a></li><li><a href=\"https://www.w3schools.com/java/default.asp\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: inherit;\">Java</a></li><li><a href=\"https://www.w3schools.com/js/default.asp\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: inherit;\">JavaScript</a></li></ul><h2>DSA History</h2><p>The word \'algorithm\' comes from \'al-Khwarizmi\', named after a Persian scholar who lived around year 800.</p><p>The concept of algorithmic problem-solving can be traced back to ancient times, long before the invention of computers.</p><p>The study of Data Structures and Algorithms really took off with the invention of computers in the 1940s, to efficiently manage and process data.</p><p>Today, DSA is a key part of Computer Science education and professional programming, helping us to create faster and more powerful software.</p><p><br></p>', '3598.00', 50, '2024-01-01', '2024-03-01', 1, '2024-10-30 03:03:09', '2024-10-30 03:09:12'),
(2, 2, 2, 2, 12, 'Data Science Bootcamp', 'Become a data scientist in this comprehensive bootcamp covering Python, R, and machine learning.', '199.99', 30, '2024-02-01', '2024-04-01', 1, '2024-10-30 03:03:09', '2024-10-30 03:18:24'),
(3, 1, 3, 3, 13, 'Graphic Design Fundamentals', 'An introduction to graphic design concepts, tools, and techniques.', '0.00', 40, '2024-03-01', '2024-05-01', 1, '2024-10-30 03:03:10', '2024-10-30 03:19:12'),
(4, 2, 1, 3, 14, 'Web Development With Laravel', '<p>We will learn the web deve</p>', '199.99', 80, '2024-11-01', '2024-12-31', 1, '2024-10-30 03:21:40', '2024-10-30 03:23:29');

-- --------------------------------------------------------

--
-- Table structure for table `course_likes`
--

CREATE TABLE `course_likes` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_likes`
--

INSERT INTO `course_likes` (`id`, `user_id`, `course_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-10-30 03:03:18', '2024-10-30 03:03:18'),
(2, 2, 1, '2024-10-30 03:03:19', '2024-10-30 03:03:19'),
(3, 3, 1, '2024-10-30 03:03:19', '2024-10-30 03:03:19'),
(4, 4, 1, '2024-10-30 03:03:19', '2024-10-30 03:03:19'),
(5, 5, 1, '2024-10-30 03:03:19', '2024-10-30 03:03:19'),
(6, 6, 1, '2024-10-30 03:03:19', '2024-10-30 03:03:19'),
(7, 7, 1, '2024-10-30 03:03:19', '2024-10-30 03:03:19');

-- --------------------------------------------------------

--
-- Table structure for table `course_quizzes`
--

CREATE TABLE `course_quizzes` (
  `id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `quiz_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_quizzes`
--

INSERT INTO `course_quizzes` (`id`, `course_id`, `quiz_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-10-30 03:03:10', '2024-10-30 03:03:10'),
(2, 1, 2, '2024-10-30 03:03:10', '2024-10-30 03:03:10'),
(3, 1, 3, '2024-10-30 03:03:11', '2024-10-30 03:03:11');

-- --------------------------------------------------------

--
-- Table structure for table `course_reviews`
--

CREATE TABLE `course_reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `review_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_reviews`
--

INSERT INTO `course_reviews` (`id`, `course_id`, `review_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-10-30 03:03:14', '2024-10-30 03:03:14'),
(2, 1, 2, '2024-10-30 03:03:14', '2024-10-30 03:03:14'),
(3, 1, 3, '2024-10-30 03:03:15', '2024-10-30 03:03:15'),
(4, 1, 4, '2024-10-30 03:03:15', '2024-10-30 03:03:15'),
(5, 1, 5, '2024-10-30 03:03:15', '2024-10-30 03:03:15');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `thumbnail_id` bigint UNSIGNED DEFAULT NULL,
  `video_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `user_id`, `course_id`, `thumbnail_id`, `video_id`, `title`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 3, 'Introduction to Java Language | Lecture 1', 'This is the detailed description for Introduction to Java Language | Lecture 1 of the course Java & DSA Course for Placement, covering essential concepts and exercises.', 1, '2024-10-30 03:03:11', '2024-10-30 03:10:12'),
(2, 1, 1, 4, 5, 'Variables in Java | Input Output', 'This is the detailed description for Variables in Java | Input Output of the course Java & DSA Course for Placement, covering essential concepts and exercises.', 1, '2024-10-30 03:03:11', '2024-10-30 03:12:05'),
(3, 1, 1, 6, 7, 'Conditional Statements | If-else, Switch Break', 'This is the detailed description for Conditional Statements | If-else, Switch Break of the course Java & DSA Course for Placement, covering essential concepts and exercises.', 1, '2024-10-30 03:03:11', '2024-10-30 03:12:33'),
(4, 1, 1, 8, 9, 'Loops in Java', 'This is the detailed description for Loops in Java of the course Java & DSA Course for Placement, covering essential concepts and exercises.', 1, '2024-10-30 03:03:11', '2024-10-30 03:13:13'),
(5, 1, 1, 10, 11, '9 Best Patterns Questions in Java (for Beginners)', 'This is the detailed description for 9 Best Patterns Questions in Java (for Beginners) of the course Java & DSA Course for Placement, covering essential concepts and exercises.', 1, '2024-10-30 03:03:12', '2024-10-30 03:13:51');

-- --------------------------------------------------------

--
-- Table structure for table `lesson_likes`
--

CREATE TABLE `lesson_likes` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `lesson_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lesson_likes`
--

INSERT INTO `lesson_likes` (`id`, `user_id`, `lesson_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-10-30 03:03:20', '2024-10-30 03:03:20'),
(2, 2, 1, '2024-10-30 03:03:20', '2024-10-30 03:03:20'),
(3, 3, 1, '2024-10-30 03:03:20', '2024-10-30 03:03:20'),
(4, 4, 1, '2024-10-30 03:03:20', '2024-10-30 03:03:20'),
(5, 5, 1, '2024-10-30 03:03:20', '2024-10-30 03:03:20'),
(6, 6, 1, '2024-10-30 03:03:20', '2024-10-30 03:03:20'),
(7, 7, 1, '2024-10-30 03:03:21', '2024-10-30 03:03:21');

-- --------------------------------------------------------

--
-- Table structure for table `lesson_quizzes`
--

CREATE TABLE `lesson_quizzes` (
  `id` bigint UNSIGNED NOT NULL,
  `lesson_id` bigint UNSIGNED NOT NULL,
  `quiz_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lesson_quizzes`
--

INSERT INTO `lesson_quizzes` (`id`, `lesson_id`, `quiz_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '2024-10-30 03:03:12', '2024-10-30 03:03:12'),
(2, 2, 5, '2024-10-30 03:03:12', '2024-10-30 03:03:12'),
(3, 3, 6, '2024-10-30 03:03:12', '2024-10-30 03:03:12'),
(4, 4, 7, '2024-10-30 03:03:13', '2024-10-30 03:03:13'),
(5, 5, 8, '2024-10-30 03:03:13', '2024-10-30 03:03:13');

-- --------------------------------------------------------

--
-- Table structure for table `lesson_reviews`
--

CREATE TABLE `lesson_reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `lesson_id` bigint UNSIGNED NOT NULL,
  `review_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lesson_reviews`
--

INSERT INTO `lesson_reviews` (`id`, `lesson_id`, `review_id`, `created_at`, `updated_at`) VALUES
(1, 1, 6, '2024-10-30 03:03:16', '2024-10-30 03:03:16'),
(2, 1, 7, '2024-10-30 03:03:16', '2024-10-30 03:03:16');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint UNSIGNED NOT NULL,
  `sender_id` bigint UNSIGNED NOT NULL,
  `receiver_id` bigint UNSIGNED NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_rc` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(61, '2014_10_12_000000_create_roles_table', 1),
(62, '2014_10_12_000001_create_users_table', 1),
(63, '2014_10_12_100000_create_password_resets_table', 1),
(64, '2019_08_19_000000_create_failed_jobs_table', 1),
(65, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(66, '2024_09_22_040923_create_categories_table', 1),
(67, '2024_09_22_040933_create_sub_categories_table', 1),
(68, '2024_09_22_041924_create_quizzes_table', 1),
(69, '2024_09_22_041925_create_questions_table', 1),
(70, '2024_09_22_045939_create_courses_table', 1),
(71, '2024_09_22_051225_create_reviews_table', 1),
(72, '2024_09_23_013105_create_modules_table', 1),
(73, '2024_09_23_013127_create_permissions_table', 1),
(74, '2024_09_23_013213_create_role_modules_table', 1),
(75, '2024_09_23_013233_create_role_permissions_table', 1),
(76, '2024_09_23_100524_create_lessons_table', 1),
(77, '2024_09_24_034750_create_course_reviews_table', 1),
(78, '2024_09_24_034915_create_lesson_reviews_table', 1),
(79, '2024_09_24_035049_create_testimonials_table', 1),
(80, '2024_09_24_103203_create_course_likes_table', 1),
(81, '2024_09_24_103204_create_review_likes_table', 1),
(82, '2024_09_24_103253_create_lesson_likes_table', 1),
(83, '2024_09_25_043747_create_my_files_table', 1),
(84, '2024_10_15_021011_create_settings_table', 1),
(85, '2024_10_21_102322_create_course_quizzes_table', 1),
(86, '2024_10_22_043129_create_lesson_quizzes_table', 1),
(87, '2024_10_22_091434_create_purchased_courses_table', 1),
(88, '2024_10_23_060601_create_solved_questions_table', 1),
(89, '2024_10_25_113928_create_student_lessons_table', 1),
(90, '2024_10_29_033931_create_messages_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `parent_id`, `name`, `link`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Dashboard', '/admin/dashboard', 'mdi mdi-home', 1, '2024-10-30 03:03:21', '2024-10-30 03:03:21'),
(2, 0, 'Course', '#', 'fa fa-book', 1, '2024-10-30 03:03:22', '2024-10-30 03:03:22'),
(3, 2, 'Courses', '/admin/course/courses', NULL, 1, '2024-10-30 03:03:22', '2024-10-30 03:03:22'),
(4, 2, 'Lessons', '/admin/course/lessons', NULL, 1, '2024-10-30 03:03:23', '2024-10-30 03:03:23'),
(5, 2, 'Categories', '/admin/course/categories', NULL, 1, '2024-10-30 03:03:24', '2024-10-30 03:03:24'),
(6, 2, 'Sub Categories', '/admin/course/sub-categories', NULL, 1, '2024-10-30 03:03:24', '2024-10-30 03:03:24'),
(7, 2, 'Pending', '/admin/course/pending', NULL, 1, '2024-10-30 03:03:25', '2024-10-30 03:03:25'),
(8, 0, 'Quiz', '#', 'fas fa-clipboard-list', 1, '2024-10-30 03:03:26', '2024-10-30 03:03:26'),
(9, 8, 'Quizzes', '/admin/quiz/quizzes', NULL, 1, '2024-10-30 03:03:26', '2024-10-30 03:03:26'),
(10, 8, 'Questions', '/admin/quiz/questions', NULL, 1, '2024-10-30 03:03:27', '2024-10-30 03:03:27'),
(11, 0, 'Review', '#', 'fas fa-star', 1, '2024-10-30 03:03:28', '2024-10-30 03:03:28'),
(12, 11, 'Reviews', '/admin/review/reviews', NULL, 1, '2024-10-30 03:03:28', '2024-10-30 03:03:28'),
(13, 11, 'Course Reviews', '/admin/review/course-review', NULL, 1, '2024-10-30 03:03:29', '2024-10-30 03:03:29'),
(14, 11, 'Lesson Reviews', '/admin/review/lesson-review', NULL, 1, '2024-10-30 03:03:30', '2024-10-30 03:03:30'),
(15, 11, 'Testimonials', '/admin/review/testimonials', NULL, 1, '2024-10-30 03:03:31', '2024-10-30 03:03:31'),
(16, 0, 'User', '#', 'fas fa-user', 1, '2024-10-30 03:03:32', '2024-10-30 03:03:32'),
(17, 16, 'Users', '/admin/user/users', NULL, 1, '2024-10-30 03:03:33', '2024-10-30 03:03:33'),
(18, 16, 'Profile', '/admin/user/profile', NULL, 1, '2024-10-30 03:03:33', '2024-10-30 03:03:33'),
(19, 0, 'Configuration', '#', 'fas fa-check-square', 1, '2024-10-30 03:03:34', '2024-10-30 03:03:34'),
(20, 19, 'Roles', '/admin/config/roles', NULL, 1, '2024-10-30 03:03:34', '2024-10-30 03:03:34'),
(21, 19, 'Modules', '/admin/config/modules', NULL, 1, '2024-10-30 03:03:35', '2024-10-30 03:03:35'),
(22, 19, 'Permissions', '/admin/config/permissions', NULL, 1, '2024-10-30 03:03:37', '2024-10-30 03:03:37'),
(23, 19, 'Role Configs', '/admin/config/manage-roles', NULL, 1, '2024-10-30 03:03:38', '2024-10-30 03:03:38'),
(24, 0, 'Settings', '/admin/settings', 'fas fa-cog', 1, '2024-10-30 03:03:38', '2024-10-30 03:03:38');

-- --------------------------------------------------------

--
-- Table structure for table `my_files`
--

CREATE TABLE `my_files` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` bigint UNSIGNED NOT NULL,
  `duration` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `my_files`
--

INSERT INTO `my_files` (`id`, `user_id`, `name`, `path`, `extension`, `size`, `duration`, `created_at`, `updated_at`) VALUES
(1, 2, '01.jpg', 'uploads/thumbnail/wa8O3daE6hdmhvnJmcBP9QaEH1YSScRQvHt5c5aY.jpg', 'jpg', 134512, NULL, '2024-10-30 03:09:12', '2024-10-30 03:09:12'),
(2, 2, '01.jpg', 'uploads/thumbnail/nAB2a0sEpibNHpujIT0lFgauak72F8NuXoGfScS0.jpg', 'jpg', 134512, NULL, '2024-10-30 03:10:12', '2024-10-30 03:10:12'),
(3, 2, '01 - Introduction to Java Language ｜ Lecture 1 ｜ Complete Placement Course.mp4', 'uploads/video/5l496VHTLTMOyLYdUH5S4GnEh5zKx5gIghsEMlxa.mp4', 'mp4', 38766024, 1126, '2024-10-30 03:10:12', '2024-10-30 03:10:12'),
(4, 2, '02.jpg', 'uploads/thumbnail/pPtR2yJaSycpgyZTZfHWdv7dBawmyxnAHwqvpmn2.jpg', 'jpg', 101941, NULL, '2024-10-30 03:12:05', '2024-10-30 03:12:05'),
(5, 2, '02- Variables in Java ｜ Input Output ｜ Complete Placement Course ｜ Lecture 2.mp4', 'uploads/video/7rbzS9Se9eQtSvq2wPmGztr2xIrwH3DwjBnBSONy.mp4', 'mp4', 68932836, 2556, '2024-10-30 03:12:05', '2024-10-30 03:12:05'),
(6, 2, '03.jpg', 'uploads/thumbnail/SvqxOTbc6l2leRVktorru5kG7lm3S5mmNhO6TXIF.jpg', 'jpg', 144602, NULL, '2024-10-30 03:12:32', '2024-10-30 03:12:32'),
(7, 2, '03 - Conditional Statements ｜ If-else, Switch Break ｜ Complete Java Placement Course ｜ Lecture 3.mp4', 'uploads/video/U3UnHah1oqvVPWgsfBxLhIIaN7iUDhhfhjGTHxJz.mp4', 'mp4', 50815865, 1507, '2024-10-30 03:12:33', '2024-10-30 03:12:33'),
(8, 2, '04.jpg', 'uploads/thumbnail/y1AtPt2gDmFmcM99QJ4Hj9LOBlkE2tTw9H4IfpaB.jpg', 'jpg', 140142, NULL, '2024-10-30 03:13:13', '2024-10-30 03:13:13'),
(9, 2, '04 - Loops in Java ｜ Java Placement Full Course ｜ Lecture 4.mp4', 'uploads/video/oFTF17HtLX1q4OhnF1vntrPUTm5W84UjjBUFZWwv.mp4', 'mp4', 60978223, 1773, '2024-10-30 03:13:13', '2024-10-30 03:13:13'),
(10, 2, '05.jpg', 'uploads/thumbnail/MIkwJBrSB5IsPcNSrTdYDnuXcfeCEeZArsG9dNe7.jpg', 'jpg', 138180, NULL, '2024-10-30 03:13:51', '2024-10-30 03:13:51'),
(11, 2, '05 - 9 Best Patterns Questions In Java (for Beginners) ｜ Java Placement Course ｜ Lecture 5.mp4', 'uploads/video/FfSUF7EgQoGfpWZDWjrnJ3HzHGg0b9sLXuSHSeNE.mp4', 'mp4', 112331675, 3505, '2024-10-30 03:13:51', '2024-10-30 03:13:51'),
(12, 2, 'images.jpeg', 'uploads/thumbnail/J8233pb30VWtRt5XIWhMYiXrb6lRCxkvtksO0p2P.jpg', 'jpeg', 8386, NULL, '2024-10-30 03:18:24', '2024-10-30 03:18:24'),
(13, 2, 'hq720.jpg', 'uploads/thumbnail/MrVxJqlSTS0lidkP1cYjZIBPWekVZMqXG08cnpSU.jpg', 'jpg', 62625, NULL, '2024-10-30 03:19:11', '2024-10-30 03:19:11'),
(14, 2, 'images (1).jpeg', 'uploads/thumbnail/Ais0JUjKjep9SsYeiJcaNLu4xkALN0KZ46hUJMzf.jpg', 'jpeg', 8729, NULL, '2024-10-30 03:21:40', '2024-10-30 03:21:40');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `module_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `module_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'dashboard_view', 1, '2024-10-30 03:03:21', '2024-10-30 03:03:21'),
(2, 1, 'dashboard_add', 1, '2024-10-30 03:03:21', '2024-10-30 03:03:21'),
(3, 1, 'dashboard_edit', 1, '2024-10-30 03:03:21', '2024-10-30 03:03:21'),
(4, 1, 'dashboard_delete', 1, '2024-10-30 03:03:22', '2024-10-30 03:03:22'),
(5, 3, 'course_view', 1, '2024-10-30 03:03:22', '2024-10-30 03:03:22'),
(6, 3, 'course_add', 1, '2024-10-30 03:03:22', '2024-10-30 03:03:22'),
(7, 3, 'course_edit', 1, '2024-10-30 03:03:23', '2024-10-30 03:03:23'),
(8, 3, 'course_delete', 1, '2024-10-30 03:03:23', '2024-10-30 03:03:23'),
(9, 3, 'course_accept', 1, '2024-10-30 03:03:23', '2024-10-30 03:03:23'),
(10, 4, 'lesson_view', 1, '2024-10-30 03:03:23', '2024-10-30 03:03:23'),
(11, 4, 'lesson_add', 1, '2024-10-30 03:03:23', '2024-10-30 03:03:23'),
(12, 4, 'lesson_edit', 1, '2024-10-30 03:03:24', '2024-10-30 03:03:24'),
(13, 4, 'lesson_delete', 1, '2024-10-30 03:03:24', '2024-10-30 03:03:24'),
(14, 5, 'category_view', 1, '2024-10-30 03:03:24', '2024-10-30 03:03:24'),
(15, 5, 'category_add', 1, '2024-10-30 03:03:24', '2024-10-30 03:03:24'),
(16, 5, 'category_edit', 1, '2024-10-30 03:03:24', '2024-10-30 03:03:24'),
(17, 5, 'category_delete', 1, '2024-10-30 03:03:24', '2024-10-30 03:03:24'),
(18, 6, 'sub_category_view', 1, '2024-10-30 03:03:25', '2024-10-30 03:03:25'),
(19, 6, 'sub_category_add', 1, '2024-10-30 03:03:25', '2024-10-30 03:03:25'),
(20, 6, 'sub_category_edit', 1, '2024-10-30 03:03:25', '2024-10-30 03:03:25'),
(21, 6, 'sub_category_delete', 1, '2024-10-30 03:03:25', '2024-10-30 03:03:25'),
(22, 7, 'pending_view', 1, '2024-10-30 03:03:26', '2024-10-30 03:03:26'),
(23, 7, 'pending_add', 1, '2024-10-30 03:03:26', '2024-10-30 03:03:26'),
(24, 7, 'pending_edit', 1, '2024-10-30 03:03:26', '2024-10-30 03:03:26'),
(25, 7, 'pending_delete', 1, '2024-10-30 03:03:26', '2024-10-30 03:03:26'),
(26, 9, 'quiz_view', 1, '2024-10-30 03:03:27', '2024-10-30 03:03:27'),
(27, 9, 'quiz_add', 1, '2024-10-30 03:03:27', '2024-10-30 03:03:27'),
(28, 9, 'quiz_edit', 1, '2024-10-30 03:03:27', '2024-10-30 03:03:27'),
(29, 9, 'quiz_delete', 1, '2024-10-30 03:03:27', '2024-10-30 03:03:27'),
(30, 10, 'question_view', 1, '2024-10-30 03:03:28', '2024-10-30 03:03:28'),
(31, 10, 'question_add', 1, '2024-10-30 03:03:28', '2024-10-30 03:03:28'),
(32, 10, 'question_edit', 1, '2024-10-30 03:03:28', '2024-10-30 03:03:28'),
(33, 10, 'question_delete', 1, '2024-10-30 03:03:28', '2024-10-30 03:03:28'),
(34, 12, 'review_view', 1, '2024-10-30 03:03:29', '2024-10-30 03:03:29'),
(35, 12, 'review_add', 1, '2024-10-30 03:03:29', '2024-10-30 03:03:29'),
(36, 12, 'review_edit', 1, '2024-10-30 03:03:29', '2024-10-30 03:03:29'),
(37, 12, 'review_delete', 1, '2024-10-30 03:03:29', '2024-10-30 03:03:29'),
(38, 13, 'course_review_view', 1, '2024-10-30 03:03:30', '2024-10-30 03:03:30'),
(39, 13, 'course_review_add', 1, '2024-10-30 03:03:30', '2024-10-30 03:03:30'),
(40, 13, 'course_review_edit', 1, '2024-10-30 03:03:30', '2024-10-30 03:03:30'),
(41, 13, 'course_review_delete', 1, '2024-10-30 03:03:30', '2024-10-30 03:03:30'),
(42, 14, 'lesson_review_view', 1, '2024-10-30 03:03:31', '2024-10-30 03:03:31'),
(43, 14, 'lesson_review_add', 1, '2024-10-30 03:03:31', '2024-10-30 03:03:31'),
(44, 14, 'lesson_review_edit', 1, '2024-10-30 03:03:31', '2024-10-30 03:03:31'),
(45, 14, 'lesson_review_delete', 1, '2024-10-30 03:03:31', '2024-10-30 03:03:31'),
(46, 15, 'testimonial_view', 1, '2024-10-30 03:03:32', '2024-10-30 03:03:32'),
(47, 15, 'testimonial_add', 1, '2024-10-30 03:03:32', '2024-10-30 03:03:32'),
(48, 15, 'testimonial_edit', 1, '2024-10-30 03:03:32', '2024-10-30 03:03:32'),
(49, 15, 'testimonial_delete', 1, '2024-10-30 03:03:32', '2024-10-30 03:03:32'),
(50, 17, 'user_view', 1, '2024-10-30 03:03:33', '2024-10-30 03:03:33'),
(51, 17, 'user_add', 1, '2024-10-30 03:03:33', '2024-10-30 03:03:33'),
(52, 17, 'user_edit', 1, '2024-10-30 03:03:33', '2024-10-30 03:03:33'),
(53, 17, 'user_delete', 1, '2024-10-30 03:03:33', '2024-10-30 03:03:33'),
(54, 18, 'profile_show', 1, '2024-10-30 03:03:34', '2024-10-30 03:03:34'),
(55, 18, 'profile_edit', 1, '2024-10-30 03:03:34', '2024-10-30 03:03:34'),
(56, 18, 'profile_delete', 1, '2024-10-30 03:03:34', '2024-10-30 03:03:34'),
(57, 20, 'role_view', 1, '2024-10-30 03:03:34', '2024-10-30 03:03:34'),
(58, 20, 'role_add', 1, '2024-10-30 03:03:35', '2024-10-30 03:03:35'),
(59, 20, 'role_edit', 1, '2024-10-30 03:03:35', '2024-10-30 03:03:35'),
(60, 20, 'role_delete', 1, '2024-10-30 03:03:35', '2024-10-30 03:03:35'),
(61, 20, 'role_manage', 1, '2024-10-30 03:03:35', '2024-10-30 03:03:35'),
(62, 21, 'module_view', 1, '2024-10-30 03:03:36', '2024-10-30 03:03:36'),
(63, 21, 'module_add', 1, '2024-10-30 03:03:36', '2024-10-30 03:03:36'),
(64, 21, 'module_edit', 1, '2024-10-30 03:03:36', '2024-10-30 03:03:36'),
(65, 21, 'module_delete', 1, '2024-10-30 03:03:36', '2024-10-30 03:03:36'),
(66, 21, 'module_manage', 1, '2024-10-30 03:03:36', '2024-10-30 03:03:36'),
(67, 22, 'permission_view', 1, '2024-10-30 03:03:37', '2024-10-30 03:03:37'),
(68, 22, 'permission_add', 1, '2024-10-30 03:03:37', '2024-10-30 03:03:37'),
(69, 22, 'permission_edit', 1, '2024-10-30 03:03:37', '2024-10-30 03:03:37'),
(70, 22, 'permission_delete', 1, '2024-10-30 03:03:37', '2024-10-30 03:03:37'),
(71, 22, 'permission_manage', 1, '2024-10-30 03:03:37', '2024-10-30 03:03:37'),
(72, 23, 'role_config_view', 1, '2024-10-30 03:03:38', '2024-10-30 03:03:38'),
(73, 23, 'role_config_add', 1, '2024-10-30 03:03:38', '2024-10-30 03:03:38'),
(74, 23, 'role_config_edit', 1, '2024-10-30 03:03:38', '2024-10-30 03:03:38'),
(75, 23, 'role_config_delete', 1, '2024-10-30 03:03:38', '2024-10-30 03:03:38'),
(76, 24, 'setting_view', 1, '2024-10-30 03:03:38', '2024-10-30 03:03:38'),
(77, 24, 'setting_add', 1, '2024-10-30 03:03:39', '2024-10-30 03:03:39'),
(78, 24, 'setting_edit', 1, '2024-10-30 03:03:39', '2024-10-30 03:03:39'),
(79, 24, 'setting_delete', 1, '2024-10-30 03:03:39', '2024-10-30 03:03:39');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchased_courses`
--

CREATE TABLE `purchased_courses` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `current_lesson_id` bigint UNSIGNED DEFAULT NULL,
  `current_quiz_id` bigint UNSIGNED DEFAULT NULL,
  `marks` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchased_courses`
--

INSERT INTO `purchased_courses` (`id`, `user_id`, `course_id`, `current_lesson_id`, `current_quiz_id`, `marks`, `created_at`, `updated_at`) VALUES
(1, 7, 1, NULL, NULL, 0, '2024-10-30 03:11:15', '2024-10-30 03:11:15');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint UNSIGNED NOT NULL,
  `quiz_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_a` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_b` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_c` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_d` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correct_answer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `quiz_id`, `user_id`, `title`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_answer`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Which statement is used to exit a switch case in Java?', 'exit', 'return', 'stop', 'break', 'd', '2024-10-30 03:03:01', '2024-10-30 03:03:01'),
(2, 1, 1, 'Which loop will always execute at least once, regardless of the condition?', 'for loop', 'while loop', 'do-while loop', 'foreach loop', 'c', '2024-10-30 03:03:01', '2024-10-30 03:03:01'),
(3, 1, 1, 'How many times will while(false) { System.out.print(\"Loop\"); } execute?', '0 times', '1 time', '2 times', 'Infinite times', 'a', '2024-10-30 03:03:01', '2024-10-30 03:03:01'),
(4, 2, 1, 'Which of these is not a valid type of loop in Java?', 'for', 'while', 'foreach', 'repeat-until', 'd', '2024-10-30 03:03:01', '2024-10-30 03:03:01'),
(5, 2, 1, 'To print a diamond pattern in Java, which type of loop combination is generally used?', 'Only for', 'Only while', 'Combination of for and if-else', 'Only if-else', 'c', '2024-10-30 03:03:01', '2024-10-30 03:03:01'),
(6, 2, 1, 'Which nested loop structure would you use to print a pyramid pattern?', 'One for loop', 'Two for loops', 'Three for loops', 'if condition only', 'b', '2024-10-30 03:03:02', '2024-10-30 03:03:02'),
(7, 3, 1, 'Which of the following is not a Java feature?', 'Object-Oriented', 'Platform-Independent', 'Pointer Manipulation', 'Multithreaded', 'c', '2024-10-30 03:03:02', '2024-10-30 03:03:02'),
(8, 3, 1, 'Which of these is the correct way to start a Java program?', 'public class myProgram', 'public static void main(String[] args)', 'System.out.println(\"Hello\");', 'public void main(String args[])', 'b', '2024-10-30 03:03:02', '2024-10-30 03:03:02'),
(9, 3, 1, 'What is the default value of a boolean in Java?', '0', 'false', 'true', 'null', 'b', '2024-10-30 03:03:02', '2024-10-30 03:03:02'),
(10, 4, 1, 'Which of the following is not a keyword in Java?', 'class', 'try', 'static', 'include', 'd', '2024-10-30 03:03:02', '2024-10-30 03:03:02'),
(11, 4, 1, 'What is the size of the int data type in Java?', '8 bits', '16 bits', '32 bits', '64 bits', 'c', '2024-10-30 03:03:02', '2024-10-30 03:03:02'),
(12, 5, 1, 'Which of the following correctly declares a variable in Java?', 'int num = 5;', 'num int = 5;', 'float = 5.0f', 'string name = \"John\";', 'a', '2024-10-30 03:03:02', '2024-10-30 03:03:02'),
(13, 5, 1, 'Which keyword is used to make a variable unchangeable in Java?', 'static', 'final', 'const', 'volatile', 'b', '2024-10-30 03:03:03', '2024-10-30 03:03:03'),
(14, 5, 1, 'What will System.out.print(\"Hello World\"); output?', 'Hello World', 'Hello World (with a newline)', 'Hello', 'Error', 'a', '2024-10-30 03:03:03', '2024-10-30 03:03:03'),
(15, 5, 1, 'Which of the following is the correct syntax to read input from a user in Java?', 'Scanner input = new Scanner();', 'int num = Scanner.nextInt();', 'Scanner input = new Scanner(System.in);', 'Scanner input = new Scanner(Console);', 'c', '2024-10-30 03:03:03', '2024-10-30 03:03:03'),
(16, 5, 1, 'What data type should you use to store the number 123.456?', 'int', 'long', 'double', 'boolean', 'c', '2024-10-30 03:03:03', '2024-10-30 03:03:03'),
(17, 6, 1, 'What will if (true) { System.out.println(\"Hello\"); } else { System.out.println(\"Bye\"); } print?', 'Hello', 'Bye', 'Nothing', 'Error', 'a', '2024-10-30 03:03:03', '2024-10-30 03:03:03'),
(18, 6, 1, 'Which of the following operators is used for equality checking in Java?', '=', '==', '===', '!=', 'b', '2024-10-30 03:03:03', '2024-10-30 03:03:03'),
(19, 6, 1, 'What will be the output of switch(3) { case 1: System.out.print(\"1\"); case 3: System.out.print(\"3\"); }?', '1', '3', '13', 'Compilation error', 'b', '2024-10-30 03:03:03', '2024-10-30 03:03:03'),
(20, 6, 1, 'What will if (5 > 3) System.out.print(\"Yes\"); else System.out.print(\"No\"); print?', 'Yes', 'No', 'Nothing', 'Error', 'a', '2024-10-30 03:03:03', '2024-10-30 03:03:03'),
(21, 6, 1, 'Which statement is used to exit a switch case in Java?', 'exit', 'return', 'stop', 'break', 'd', '2024-10-30 03:03:04', '2024-10-30 03:03:04'),
(22, 7, 1, 'What is the output of for(int i = 0; i < 3; i++) System.out.print(i);?', '123', '012', '345', '210', 'b', '2024-10-30 03:03:04', '2024-10-30 03:03:04'),
(23, 7, 1, 'Which loop will always execute at least once, regardless of the condition?', 'for loop', 'while loop', 'do-while loop', 'foreach loop', 'c', '2024-10-30 03:03:04', '2024-10-30 03:03:04'),
(24, 7, 1, 'How many times will while(false) { System.out.print(\"Loop\"); } execute?', '0 times', '1 time', '2 times', 'Infinite times', 'a', '2024-10-30 03:03:04', '2024-10-30 03:03:04'),
(25, 7, 1, 'What is the output of for(int i = 1; i <= 5; i++) { if(i == 3) break; System.out.print(i); }?', '12345', '12', '123', '1245', 'b', '2024-10-30 03:03:04', '2024-10-30 03:03:04'),
(26, 7, 1, 'Which of these is not a valid type of loop in Java?', 'for', 'while', 'foreach', 'repeat-until', 'd', '2024-10-30 03:03:04', '2024-10-30 03:03:04'),
(27, 8, 1, 'Which nested loop structure would you use to print a pyramid pattern?', 'One for loop', 'Two for loops', 'Three for loops', 'if condition only', 'b', '2024-10-30 03:03:04', '2024-10-30 03:03:04'),
(28, 8, 1, 'To print a pattern with rows of increasing numbers, which approach is most efficient?', 'Nested loop with increment on i', 'Nested loop with decrement on i', 'Using only if-else', 'Using a while loop only', 'a', '2024-10-30 03:03:04', '2024-10-30 03:03:04'),
(29, 9, 1, 'What does PHP stand for?', 'Personal Home Page', 'PHP: Hypertext Preprocessor', 'Preprocessor Hypertext PHP', 'None of the above', 'b', '2024-10-30 03:03:05', '2024-10-30 03:03:05'),
(30, 9, 1, 'Which of the following is a valid PHP variable?', '$variable_name', 'variable_name', '$variable-name', 'None of the above', 'a', '2024-10-30 03:03:05', '2024-10-30 03:03:05'),
(31, 9, 1, 'What is the correct syntax to output \"Hello World\" in JavaScript?', 'echo \"Hello World\";', 'print(\"Hello World\");', 'console.log(\"Hello World\");', 'None of the above', 'c', '2024-10-30 03:03:05', '2024-10-30 03:03:05'),
(32, 10, 1, 'Which company developed Java?', 'Microsoft', 'Google', 'Sun Microsystems', 'Apple', 'c', '2024-10-30 03:03:05', '2024-10-30 03:03:05'),
(33, 10, 1, 'Which keyword is used to create a class in Java?', 'class', 'public', 'new', 'define', 'a', '2024-10-30 03:03:05', '2024-10-30 03:03:05'),
(34, 10, 1, 'Which method must be implemented by all Java threads?', 'start()', 'run()', 'stop()', 'execute()', 'b', '2024-10-30 03:03:05', '2024-10-30 03:03:05'),
(35, 11, 1, 'What is the default port number for HTTP?', '21', '80', '443', '8080', 'b', '2024-10-30 03:03:06', '2024-10-30 03:03:06'),
(36, 11, 1, 'Which protocol is used to send an email?', 'FTP', 'HTTP', 'SMTP', 'IMAP', 'c', '2024-10-30 03:03:06', '2024-10-30 03:03:06'),
(37, 11, 1, 'Which of the following is a NoSQL database?', 'MySQL', 'PostgreSQL', 'MongoDB', 'SQL Server', 'c', '2024-10-30 03:03:06', '2024-10-30 03:03:06');

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_limit` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`id`, `user_id`, `title`, `time_limit`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Java & DSA Course for Placement - Quiz 1', 300, 1, '2024-10-30 03:02:59', '2024-10-30 03:03:10'),
(2, 1, 'Java & DSA Course for Placement - Quiz 2', 300, 1, '2024-10-30 03:02:59', '2024-10-30 03:03:11'),
(3, 1, 'Java & DSA Course for Placement - Quiz 3', 300, 1, '2024-10-30 03:02:59', '2024-10-30 03:03:11'),
(4, 1, 'Introduction to Java Language - Quiz', 300, 1, '2024-10-30 03:02:59', '2024-10-30 03:03:12'),
(5, 1, 'Variables in Java - Quiz', 300, 1, '2024-10-30 03:02:59', '2024-10-30 03:03:12'),
(6, 1, 'Conditional Statements - Quiz', 300, 1, '2024-10-30 03:02:59', '2024-10-30 03:03:13'),
(7, 1, 'Loops in Java - Quiz', 300, 1, '2024-10-30 03:03:00', '2024-10-30 03:03:13'),
(8, 1, 'Patterns - Quiz', 300, 1, '2024-10-30 03:03:00', '2024-10-30 03:03:13'),
(9, 1, 'Quiz', 300, 0, '2024-10-30 03:03:00', '2024-10-30 03:03:00'),
(10, 1, 'Quiz', 300, 0, '2024-10-30 03:03:00', '2024-10-30 03:03:00'),
(11, 1, 'Quiz', 300, 0, '2024-10-30 03:03:00', '2024-10-30 03:03:00'),
(12, 1, 'Quiz', 300, 0, '2024-10-30 03:03:00', '2024-10-30 03:03:00'),
(13, 1, 'Quiz', 300, 0, '2024-10-30 03:03:00', '2024-10-30 03:03:00');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `rating` tinyint DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `type` tinyint NOT NULL DEFAULT '1',
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `rating`, `comment`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 'Facilis libero esse nihil magni inventore.', 2, 1, '2024-10-30 03:03:14', '2024-10-30 03:03:14'),
(2, 4, 2, 'Sit soluta voluptas aperiam aut reprehenderit nobis similique.', 2, 1, '2024-10-30 03:03:14', '2024-10-30 03:03:14'),
(3, 2, 3, 'Natus id nemo qui.', 2, 1, '2024-10-30 03:03:15', '2024-10-30 03:03:15'),
(4, 3, 4, 'Et voluptas neque accusamus eveniet.', 2, 1, '2024-10-30 03:03:15', '2024-10-30 03:03:15'),
(5, 5, 3, 'Dolores blanditiis et velit quis et eius.', 2, 1, '2024-10-30 03:03:15', '2024-10-30 03:03:15'),
(6, 3, NULL, 'Qui ea in libero dolores.', 3, 1, '2024-10-30 03:03:16', '2024-10-30 03:03:16'),
(7, 7, NULL, 'Odio consequatur reiciendis ea possimus optio numquam autem nam.', 3, 1, '2024-10-30 03:03:16', '2024-10-30 03:03:16'),
(8, 1, 4, 'Qui dolore autem qui.', 1, 1, '2024-10-30 03:03:16', '2024-10-30 03:03:16'),
(9, 7, 1, 'Voluptatem esse adipisci molestiae commodi qui.', 1, 1, '2024-10-30 03:03:17', '2024-10-30 03:03:17'),
(10, 5, 3, 'Non nulla iusto ea.', 1, 1, '2024-10-30 03:03:17', '2024-10-30 03:03:17'),
(11, 6, 5, 'Ipsam dicta corrupti sit quia.', 1, 1, '2024-10-30 03:03:18', '2024-10-30 03:03:18'),
(12, 3, 3, 'Veritatis suscipit quae repudiandae ea sed non nulla qui.', 1, 1, '2024-10-30 03:03:18', '2024-10-30 03:03:18');

-- --------------------------------------------------------

--
-- Table structure for table `review_likes`
--

CREATE TABLE `review_likes` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `review_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 1, '2024-10-30 03:02:56', '2024-10-30 03:02:56'),
(2, 'Admin', 1, '2024-10-30 03:02:56', '2024-10-30 03:02:56'),
(3, 'Instructor', 1, '2024-10-30 03:02:57', '2024-10-30 03:02:57'),
(4, 'Student', 1, '2024-10-30 03:02:57', '2024-10-30 03:02:57');

-- --------------------------------------------------------

--
-- Table structure for table `role_modules`
--

CREATE TABLE `role_modules` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `module_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_modules`
--

INSERT INTO `role_modules` (`id`, `role_id`, `module_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-10-30 03:03:58', '2024-10-30 03:03:58'),
(2, 1, 2, '2024-10-30 03:03:58', '2024-10-30 03:03:58'),
(3, 1, 3, '2024-10-30 03:03:58', '2024-10-30 03:03:58'),
(4, 1, 4, '2024-10-30 03:03:59', '2024-10-30 03:03:59'),
(5, 1, 5, '2024-10-30 03:03:59', '2024-10-30 03:03:59'),
(6, 1, 6, '2024-10-30 03:03:59', '2024-10-30 03:03:59'),
(7, 1, 7, '2024-10-30 03:03:59', '2024-10-30 03:03:59'),
(8, 1, 8, '2024-10-30 03:03:59', '2024-10-30 03:03:59'),
(9, 1, 9, '2024-10-30 03:03:59', '2024-10-30 03:03:59'),
(10, 1, 10, '2024-10-30 03:04:00', '2024-10-30 03:04:00'),
(11, 1, 11, '2024-10-30 03:04:00', '2024-10-30 03:04:00'),
(12, 1, 12, '2024-10-30 03:04:00', '2024-10-30 03:04:00'),
(13, 1, 13, '2024-10-30 03:04:00', '2024-10-30 03:04:00'),
(14, 1, 14, '2024-10-30 03:04:00', '2024-10-30 03:04:00'),
(15, 1, 15, '2024-10-30 03:04:00', '2024-10-30 03:04:00'),
(16, 1, 16, '2024-10-30 03:04:00', '2024-10-30 03:04:00'),
(17, 1, 17, '2024-10-30 03:04:00', '2024-10-30 03:04:00'),
(18, 1, 18, '2024-10-30 03:04:01', '2024-10-30 03:04:01'),
(19, 1, 19, '2024-10-30 03:04:01', '2024-10-30 03:04:01'),
(20, 1, 20, '2024-10-30 03:04:01', '2024-10-30 03:04:01'),
(21, 1, 21, '2024-10-30 03:04:01', '2024-10-30 03:04:01'),
(22, 1, 22, '2024-10-30 03:04:01', '2024-10-30 03:04:01'),
(23, 1, 23, '2024-10-30 03:04:02', '2024-10-30 03:04:02'),
(24, 1, 24, '2024-10-30 03:04:02', '2024-10-30 03:04:02'),
(25, 2, 1, '2024-10-30 03:04:02', '2024-10-30 03:04:02'),
(26, 2, 5, '2024-10-30 03:04:02', '2024-10-30 03:04:02'),
(27, 2, 6, '2024-10-30 03:04:02', '2024-10-30 03:04:02'),
(28, 2, 16, '2024-10-30 03:04:03', '2024-10-30 03:04:03'),
(29, 2, 18, '2024-10-30 03:04:03', '2024-10-30 03:04:03'),
(30, 2, 17, '2024-10-30 03:04:03', '2024-10-30 03:04:03'),
(31, 3, 1, '2024-10-30 03:04:03', '2024-10-30 03:04:03'),
(32, 3, 2, '2024-10-30 03:04:03', '2024-10-30 03:04:03'),
(33, 3, 3, '2024-10-30 03:04:04', '2024-10-30 03:04:04'),
(34, 3, 16, '2024-10-30 03:04:04', '2024-10-30 03:04:04'),
(35, 3, 18, '2024-10-30 03:04:04', '2024-10-30 03:04:04'),
(36, 3, 4, '2024-10-30 03:14:45', '2024-10-30 03:14:45'),
(37, 3, 8, '2024-10-30 03:15:20', '2024-10-30 03:15:20'),
(38, 3, 9, '2024-10-30 03:15:21', '2024-10-30 03:15:21'),
(39, 3, 10, '2024-10-30 03:15:22', '2024-10-30 03:15:22');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `permission_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-10-30 03:03:39', '2024-10-30 03:03:39'),
(2, 1, 2, '2024-10-30 03:03:39', '2024-10-30 03:03:39'),
(3, 1, 3, '2024-10-30 03:03:40', '2024-10-30 03:03:40'),
(4, 1, 4, '2024-10-30 03:03:40', '2024-10-30 03:03:40'),
(5, 1, 5, '2024-10-30 03:03:40', '2024-10-30 03:03:40'),
(6, 1, 6, '2024-10-30 03:03:40', '2024-10-30 03:03:40'),
(7, 1, 7, '2024-10-30 03:03:40', '2024-10-30 03:03:40'),
(8, 1, 8, '2024-10-30 03:03:41', '2024-10-30 03:03:41'),
(9, 1, 9, '2024-10-30 03:03:41', '2024-10-30 03:03:41'),
(10, 1, 10, '2024-10-30 03:03:41', '2024-10-30 03:03:41'),
(11, 1, 11, '2024-10-30 03:03:41', '2024-10-30 03:03:41'),
(12, 1, 12, '2024-10-30 03:03:41', '2024-10-30 03:03:41'),
(13, 1, 13, '2024-10-30 03:03:42', '2024-10-30 03:03:42'),
(14, 1, 14, '2024-10-30 03:03:42', '2024-10-30 03:03:42'),
(15, 1, 15, '2024-10-30 03:03:42', '2024-10-30 03:03:42'),
(16, 1, 16, '2024-10-30 03:03:42', '2024-10-30 03:03:42'),
(17, 1, 17, '2024-10-30 03:03:42', '2024-10-30 03:03:42'),
(18, 1, 18, '2024-10-30 03:03:42', '2024-10-30 03:03:42'),
(19, 1, 19, '2024-10-30 03:03:43', '2024-10-30 03:03:43'),
(20, 1, 20, '2024-10-30 03:03:43', '2024-10-30 03:03:43'),
(21, 1, 21, '2024-10-30 03:03:43', '2024-10-30 03:03:43'),
(22, 1, 22, '2024-10-30 03:03:43', '2024-10-30 03:03:43'),
(23, 1, 23, '2024-10-30 03:03:43', '2024-10-30 03:03:43'),
(24, 1, 24, '2024-10-30 03:03:43', '2024-10-30 03:03:43'),
(25, 1, 25, '2024-10-30 03:03:43', '2024-10-30 03:03:43'),
(26, 1, 26, '2024-10-30 03:03:43', '2024-10-30 03:03:43'),
(27, 1, 27, '2024-10-30 03:03:44', '2024-10-30 03:03:44'),
(28, 1, 28, '2024-10-30 03:03:44', '2024-10-30 03:03:44'),
(29, 1, 29, '2024-10-30 03:03:44', '2024-10-30 03:03:44'),
(30, 1, 30, '2024-10-30 03:03:44', '2024-10-30 03:03:44'),
(31, 1, 31, '2024-10-30 03:03:44', '2024-10-30 03:03:44'),
(32, 1, 32, '2024-10-30 03:03:45', '2024-10-30 03:03:45'),
(33, 1, 33, '2024-10-30 03:03:45', '2024-10-30 03:03:45'),
(34, 1, 34, '2024-10-30 03:03:45', '2024-10-30 03:03:45'),
(35, 1, 35, '2024-10-30 03:03:45', '2024-10-30 03:03:45'),
(36, 1, 36, '2024-10-30 03:03:45', '2024-10-30 03:03:45'),
(37, 1, 37, '2024-10-30 03:03:45', '2024-10-30 03:03:45'),
(38, 1, 38, '2024-10-30 03:03:45', '2024-10-30 03:03:45'),
(39, 1, 39, '2024-10-30 03:03:46', '2024-10-30 03:03:46'),
(40, 1, 40, '2024-10-30 03:03:46', '2024-10-30 03:03:46'),
(41, 1, 41, '2024-10-30 03:03:46', '2024-10-30 03:03:46'),
(42, 1, 42, '2024-10-30 03:03:46', '2024-10-30 03:03:46'),
(43, 1, 43, '2024-10-30 03:03:46', '2024-10-30 03:03:46'),
(44, 1, 44, '2024-10-30 03:03:46', '2024-10-30 03:03:46'),
(45, 1, 45, '2024-10-30 03:03:46', '2024-10-30 03:03:46'),
(46, 1, 46, '2024-10-30 03:03:47', '2024-10-30 03:03:47'),
(47, 1, 47, '2024-10-30 03:03:47', '2024-10-30 03:03:47'),
(48, 1, 48, '2024-10-30 03:03:47', '2024-10-30 03:03:47'),
(49, 1, 49, '2024-10-30 03:03:47', '2024-10-30 03:03:47'),
(50, 1, 50, '2024-10-30 03:03:47', '2024-10-30 03:03:47'),
(51, 1, 51, '2024-10-30 03:03:47', '2024-10-30 03:03:47'),
(52, 1, 52, '2024-10-30 03:03:48', '2024-10-30 03:03:48'),
(53, 1, 53, '2024-10-30 03:03:48', '2024-10-30 03:03:48'),
(54, 1, 54, '2024-10-30 03:03:48', '2024-10-30 03:03:48'),
(55, 1, 55, '2024-10-30 03:03:48', '2024-10-30 03:03:48'),
(56, 1, 56, '2024-10-30 03:03:49', '2024-10-30 03:03:49'),
(57, 1, 57, '2024-10-30 03:03:49', '2024-10-30 03:03:49'),
(58, 1, 58, '2024-10-30 03:03:49', '2024-10-30 03:03:49'),
(59, 1, 59, '2024-10-30 03:03:50', '2024-10-30 03:03:50'),
(60, 1, 60, '2024-10-30 03:03:50', '2024-10-30 03:03:50'),
(61, 1, 61, '2024-10-30 03:03:50', '2024-10-30 03:03:50'),
(62, 1, 62, '2024-10-30 03:03:50', '2024-10-30 03:03:50'),
(63, 1, 63, '2024-10-30 03:03:50', '2024-10-30 03:03:50'),
(64, 1, 64, '2024-10-30 03:03:51', '2024-10-30 03:03:51'),
(65, 1, 65, '2024-10-30 03:03:51', '2024-10-30 03:03:51'),
(66, 1, 66, '2024-10-30 03:03:51', '2024-10-30 03:03:51'),
(67, 1, 67, '2024-10-30 03:03:51', '2024-10-30 03:03:51'),
(68, 1, 68, '2024-10-30 03:03:51', '2024-10-30 03:03:51'),
(69, 1, 69, '2024-10-30 03:03:51', '2024-10-30 03:03:51'),
(70, 1, 70, '2024-10-30 03:03:52', '2024-10-30 03:03:52'),
(71, 1, 71, '2024-10-30 03:03:52', '2024-10-30 03:03:52'),
(72, 1, 72, '2024-10-30 03:03:52', '2024-10-30 03:03:52'),
(73, 1, 73, '2024-10-30 03:03:52', '2024-10-30 03:03:52'),
(74, 1, 74, '2024-10-30 03:03:52', '2024-10-30 03:03:52'),
(75, 1, 75, '2024-10-30 03:03:52', '2024-10-30 03:03:52'),
(76, 1, 76, '2024-10-30 03:03:52', '2024-10-30 03:03:52'),
(77, 1, 77, '2024-10-30 03:03:53', '2024-10-30 03:03:53'),
(78, 1, 78, '2024-10-30 03:03:53', '2024-10-30 03:03:53'),
(79, 1, 79, '2024-10-30 03:03:53', '2024-10-30 03:03:53'),
(80, 2, 6, '2024-10-30 03:03:53', '2024-10-30 03:03:53'),
(81, 2, 5, '2024-10-30 03:03:53', '2024-10-30 03:03:53'),
(82, 2, 7, '2024-10-30 03:03:53', '2024-10-30 03:03:53'),
(83, 2, 8, '2024-10-30 03:03:54', '2024-10-30 03:03:54'),
(84, 2, 15, '2024-10-30 03:03:54', '2024-10-30 03:03:54'),
(85, 2, 14, '2024-10-30 03:03:54', '2024-10-30 03:03:54'),
(86, 2, 16, '2024-10-30 03:03:54', '2024-10-30 03:03:54'),
(87, 2, 17, '2024-10-30 03:03:54', '2024-10-30 03:03:54'),
(88, 3, 6, '2024-10-30 03:03:54', '2024-10-30 03:03:54'),
(89, 3, 5, '2024-10-30 03:03:55', '2024-10-30 03:03:55'),
(90, 3, 7, '2024-10-30 03:03:55', '2024-10-30 03:03:55'),
(91, 3, 8, '2024-10-30 03:03:55', '2024-10-30 03:03:55'),
(92, 4, 52, '2024-10-30 03:03:55', '2024-10-30 03:03:55'),
(93, 4, 53, '2024-10-30 03:03:55', '2024-10-30 03:03:55'),
(94, 4, 35, '2024-10-30 03:03:56', '2024-10-30 03:03:56'),
(95, 4, 36, '2024-10-30 03:03:56', '2024-10-30 03:03:56'),
(96, 4, 37, '2024-10-30 03:03:56', '2024-10-30 03:03:56'),
(97, 4, 39, '2024-10-30 03:03:56', '2024-10-30 03:03:56'),
(98, 4, 40, '2024-10-30 03:03:56', '2024-10-30 03:03:56'),
(99, 4, 41, '2024-10-30 03:03:57', '2024-10-30 03:03:57'),
(100, 4, 43, '2024-10-30 03:03:57', '2024-10-30 03:03:57'),
(101, 4, 44, '2024-10-30 03:03:57', '2024-10-30 03:03:57'),
(102, 4, 45, '2024-10-30 03:03:57', '2024-10-30 03:03:57'),
(103, 4, 47, '2024-10-30 03:03:57', '2024-10-30 03:03:57'),
(104, 4, 48, '2024-10-30 03:03:58', '2024-10-30 03:03:58'),
(105, 3, 10, '2024-10-30 03:14:46', '2024-10-30 03:14:46'),
(106, 3, 11, '2024-10-30 03:14:47', '2024-10-30 03:14:47'),
(107, 3, 12, '2024-10-30 03:14:48', '2024-10-30 03:14:48'),
(108, 3, 13, '2024-10-30 03:14:49', '2024-10-30 03:14:49'),
(109, 3, 54, '2024-10-30 03:15:08', '2024-10-30 03:15:08'),
(110, 3, 55, '2024-10-30 03:15:08', '2024-10-30 03:15:08'),
(111, 3, 56, '2024-10-30 03:15:10', '2024-10-30 03:15:10'),
(112, 3, 26, '2024-10-30 03:15:26', '2024-10-30 03:15:26'),
(113, 3, 30, '2024-10-30 03:15:26', '2024-10-30 03:15:26'),
(114, 3, 31, '2024-10-30 03:15:28', '2024-10-30 03:15:28'),
(115, 3, 27, '2024-10-30 03:15:28', '2024-10-30 03:15:28'),
(116, 3, 28, '2024-10-30 03:15:31', '2024-10-30 03:15:31'),
(117, 3, 32, '2024-10-30 03:15:32', '2024-10-30 03:15:32'),
(118, 3, 29, '2024-10-30 03:15:35', '2024-10-30 03:15:35'),
(119, 3, 33, '2024-10-30 03:15:37', '2024-10-30 03:15:37');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `name`, `type`, `group`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'application_name', 'Application Name', 'text', 'general', 'SkillSyntax', 1, '2024-10-30 03:02:55', '2024-10-30 03:02:55'),
(2, 'application_slogan', 'Application Slogan', 'text', 'general', ' Be A Skilled Soul', 1, '2024-10-30 03:02:55', '2024-10-30 03:02:55'),
(3, 'default_course_status', 'Default course Status', 'select', 'general', '2', 1, '2024-10-30 03:02:55', '2024-10-30 03:02:55'),
(4, 'default_user_role', 'Default User Role', 'select', 'general', '4', 1, '2024-10-30 03:02:56', '2024-10-30 03:02:56'),
(5, 'default_course_duration', 'Default Course Duration (Weeks)', 'number', 'general', '26', 1, '2024-10-30 03:02:56', '2024-10-30 03:02:56'),
(6, 'default_quiz_time_limit', 'Default Quiz Time Limit (Second)', 'number', 'general', '300', 1, '2024-10-30 03:02:56', '2024-10-30 03:02:56'),
(7, 'items_per_page', 'Show Items/Page', 'number', 'general', '10', 1, '2024-10-30 03:02:56', '2024-10-30 03:02:56');

-- --------------------------------------------------------

--
-- Table structure for table `solved_questions`
--

CREATE TABLE `solved_questions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `question_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_lessons`
--

CREATE TABLE `student_lessons` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `lesson_id` bigint UNSIGNED NOT NULL,
  `current_quiz_id` bigint UNSIGNED DEFAULT NULL,
  `marks` int NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `title`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'HTML & CSS', 1, '2024-10-30 03:03:09', '2024-10-30 03:03:09'),
(2, 1, 'JavaScript Frameworks', 1, '2024-10-30 03:03:09', '2024-10-30 03:03:09'),
(3, 1, 'Backend Development', 1, '2024-10-30 03:03:09', '2024-10-30 03:03:09');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint UNSIGNED NOT NULL,
  `review_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `review_id`, `created_at`, `updated_at`) VALUES
(1, 8, '2024-10-30 03:03:16', '2024-10-30 03:03:16'),
(2, 9, '2024-10-30 03:03:17', '2024-10-30 03:03:17'),
(3, 10, '2024-10-30 03:03:17', '2024-10-30 03:03:17'),
(4, 11, '2024-10-30 03:03:18', '2024-10-30 03:03:18'),
(5, 12, '2024-10-30 03:03:18', '2024-10-30 03:03:18');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `avatar_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `avatar_id`, `name`, `email`, `bio`, `mobile`, `website`, `github`, `gender`, `date_of_birth`, `location`, `status`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Mehedi Hasan', 'mehedi@gmail.com', 'Super Admin at the course management system.', '1234567890', 'https://www.google.com', 'https://github.com/mad-programmers3/skill-syntax', 'Male', '2002-09-02', 'Dhaka, Bangladesh', 1, '2024-10-30 03:02:57', '$2y$10$8OGH3GcC3Cd6bZ0YBK4ewupAqITtQXynYILdtQc5rezjKxgn58sxi', NULL, '2024-10-30 03:02:58', '2024-10-30 03:02:58'),
(2, 1, NULL, 'Al Mamun', 'mamun@gmail.com', 'Super Admin at the course management system.', '1234567891', 'https://www.google.com', 'https://github.com/mad-programmers3/skill-syntax', 'Male', '2002-09-03', 'Dhaka, Bangladesh', 1, '2024-10-30 03:02:57', '$2y$10$PTc9zLc2TOzDcKhlPZ4ZjO04gGMhNQV8hug//t6zSmTUfLR.lsoKO', NULL, '2024-10-30 03:02:58', '2024-10-30 03:02:58'),
(3, 1, NULL, 'Shihab', 'shihab@gmail.com', 'Super Admin at the course management system.', '1234567892', 'https://www.google.com', 'https://github.com/mad-programmers3/skill-syntax', 'Male', '2002-09-04', 'Dhaka, Bangladesh', 1, '2024-10-30 03:02:57', '$2y$10$lkZzj9VgTN0BgnxJ2AewReq7dJHBogWEyu81uIAJLR9r0KhNOvySC', NULL, '2024-10-30 03:02:58', '2024-10-30 03:02:58'),
(4, 1, NULL, 'Super Admin', 'superadmin@gmail.com', 'Super Admin at the course management system.', '1234567893', 'https://www.google.com', 'https://github.com/mad-programmers3/skill-syntax', 'Male', '2002-09-05', 'Dhaka, Bangladesh', 1, '2024-10-30 03:02:57', '$2y$10$JdfsUKqPLtnie8.SSG6/7.T3T64m9PsLUCAnW2ZhMwFThDhLHBDFW', NULL, '2024-10-30 03:02:58', '2024-10-30 03:02:58'),
(5, 2, NULL, 'Our Admin', 'admin@gmail.com', 'Admin at the course management system.', '1234567894', 'https://www.google.com', 'https://github.com/mad-programmers3/skill-syntax', 'Male', '2002-09-06', 'Dhaka, Bangladesh', 1, '2024-10-30 03:02:57', '$2y$10$a7FPgESYZEnPheRDvCg.1eWabM/TvtVnvWpyxba1tcJonTqCtEZ4i', NULL, '2024-10-30 03:02:58', '2024-10-30 03:02:58'),
(6, 3, NULL, 'Our Teacher', 'teacher@gmail.com', 'Instructor at the course management system.', '1234567895', 'https://www.google.com', 'https://github.com/mad-programmers3/skill-syntax', 'Male', '2002-09-07', 'Dhaka, Bangladesh', 1, '2024-10-30 03:02:57', '$2y$10$.aZOo2RxBx11VA9de0/PSuEyfwNBTDJFZ1OP.gmyL8DqoG5yRajZi', NULL, '2024-10-30 03:02:58', '2024-10-30 03:02:58'),
(7, 4, NULL, 'Our Student', 'student@gmail.com', 'Student at the course management system.', '1234567896', 'https://www.google.com', 'https://github.com/mad-programmers3/skill-syntax', 'Male', '2002-09-08', 'Dhaka, Bangladesh', 1, '2024-10-30 03:02:57', '$2y$10$EA043/V8gv4hDqrYM8zMpeqXAgcoFQCDODVH3Rz3xps4TLxWSY5zO', NULL, '2024-10-30 03:02:58', '2024-10-30 03:02:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_user_id_foreign` (`user_id`),
  ADD KEY `courses_category_id_foreign` (`category_id`),
  ADD KEY `courses_sub_category_id_foreign` (`sub_category_id`);

--
-- Indexes for table `course_likes`
--
ALTER TABLE `course_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_likes_user_id_foreign` (`user_id`),
  ADD KEY `course_likes_course_id_foreign` (`course_id`);

--
-- Indexes for table `course_quizzes`
--
ALTER TABLE `course_quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_quizzes_course_id_foreign` (`course_id`),
  ADD KEY `course_quizzes_quiz_id_foreign` (`quiz_id`);

--
-- Indexes for table `course_reviews`
--
ALTER TABLE `course_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_reviews_course_id_foreign` (`course_id`),
  ADD KEY `course_reviews_review_id_foreign` (`review_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_user_id_foreign` (`user_id`),
  ADD KEY `lessons_course_id_foreign` (`course_id`);

--
-- Indexes for table `lesson_likes`
--
ALTER TABLE `lesson_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_likes_user_id_foreign` (`user_id`),
  ADD KEY `lesson_likes_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `lesson_quizzes`
--
ALTER TABLE `lesson_quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_quizzes_lesson_id_foreign` (`lesson_id`),
  ADD KEY `lesson_quizzes_quiz_id_foreign` (`quiz_id`);

--
-- Indexes for table `lesson_reviews`
--
ALTER TABLE `lesson_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_reviews_lesson_id_foreign` (`lesson_id`),
  ADD KEY `lesson_reviews_review_id_foreign` (`review_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_sender_id_foreign` (`sender_id`),
  ADD KEY `messages_receiver_id_foreign` (`receiver_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `my_files`
--
ALTER TABLE `my_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `my_files_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_module_id_foreign` (`module_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `purchased_courses`
--
ALTER TABLE `purchased_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchased_courses_user_id_foreign` (`user_id`),
  ADD KEY `purchased_courses_course_id_foreign` (`course_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questions_quiz_id_foreign` (`quiz_id`),
  ADD KEY `questions_user_id_foreign` (`user_id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quizzes_user_id_foreign` (`user_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`);

--
-- Indexes for table `review_likes`
--
ALTER TABLE `review_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `review_likes_user_id_foreign` (`user_id`),
  ADD KEY `review_likes_review_id_foreign` (`review_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_modules`
--
ALTER TABLE `role_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_modules_role_id_foreign` (`role_id`),
  ADD KEY `role_modules_module_id_foreign` (`module_id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_permissions_role_id_foreign` (`role_id`),
  ADD KEY `role_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `solved_questions`
--
ALTER TABLE `solved_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `solved_questions_user_id_foreign` (`user_id`),
  ADD KEY `solved_questions_question_id_foreign` (`question_id`);

--
-- Indexes for table `student_lessons`
--
ALTER TABLE `student_lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_lessons_user_id_foreign` (`user_id`),
  ADD KEY `student_lessons_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testimonials_review_id_foreign` (`review_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `course_likes`
--
ALTER TABLE `course_likes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `course_quizzes`
--
ALTER TABLE `course_quizzes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `course_reviews`
--
ALTER TABLE `course_reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lesson_likes`
--
ALTER TABLE `lesson_likes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `lesson_quizzes`
--
ALTER TABLE `lesson_quizzes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lesson_reviews`
--
ALTER TABLE `lesson_reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `my_files`
--
ALTER TABLE `my_files`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchased_courses`
--
ALTER TABLE `purchased_courses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `review_likes`
--
ALTER TABLE `review_likes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role_modules`
--
ALTER TABLE `role_modules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `solved_questions`
--
ALTER TABLE `solved_questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_lessons`
--
ALTER TABLE `student_lessons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courses_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_likes`
--
ALTER TABLE `course_likes`
  ADD CONSTRAINT `course_likes_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_quizzes`
--
ALTER TABLE `course_quizzes`
  ADD CONSTRAINT `course_quizzes_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_quizzes_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_reviews`
--
ALTER TABLE `course_reviews`
  ADD CONSTRAINT `course_reviews_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_reviews_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lessons_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lesson_likes`
--
ALTER TABLE `lesson_likes`
  ADD CONSTRAINT `lesson_likes_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lesson_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lesson_quizzes`
--
ALTER TABLE `lesson_quizzes`
  ADD CONSTRAINT `lesson_quizzes_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lesson_quizzes_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lesson_reviews`
--
ALTER TABLE `lesson_reviews`
  ADD CONSTRAINT `lesson_reviews_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lesson_reviews_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `my_files`
--
ALTER TABLE `my_files`
  ADD CONSTRAINT `my_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchased_courses`
--
ALTER TABLE `purchased_courses`
  ADD CONSTRAINT `purchased_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchased_courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `questions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `quizzes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `review_likes`
--
ALTER TABLE `review_likes`
  ADD CONSTRAINT `review_likes_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `review_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_modules`
--
ALTER TABLE `role_modules`
  ADD CONSTRAINT `role_modules_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_modules_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `solved_questions`
--
ALTER TABLE `solved_questions`
  ADD CONSTRAINT `solved_questions_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `solved_questions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_lessons`
--
ALTER TABLE `student_lessons`
  ADD CONSTRAINT `student_lessons_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_lessons_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD CONSTRAINT `testimonials_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;