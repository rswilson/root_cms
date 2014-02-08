-- MySQL dump 10.13  Distrib 5.1.37, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: rswilson.com_production
-- ------------------------------------------------------
-- Server version	5.1.37-1ubuntu5.1
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` (`id`, `name`, `title`, `description`, `gallery_id`, `created_at`, `updated_at`) VALUES (1,'Uploads',NULL,NULL,1,'2011-05-02 22:52:51','2011-05-02 22:52:51');
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `application_ratings`
--

LOCK TABLES `application_ratings` WRITE;
/*!40000 ALTER TABLE `application_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` (`id`, `name`, `page_template_id`, `created_at`, `updated_at`, `approve_comments`, `reverse_comments`, `reverse_posts`, `truncate_posts`) VALUES (1,'News',1,'2011-03-05 00:06:40','2011-05-02 22:21:59',1,1,1,NULL);
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `check_boxes`
--

LOCK TABLES `check_boxes` WRITE;
/*!40000 ALTER TABLE `check_boxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `check_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` (`id`, `post_id`, `body`, `created_at`, `updated_at`, `name`, `approved`) VALUES (2,1,'Cool. Good luck with the site.','2011-03-05 00:08:53','2011-03-05 00:09:00','',1),(3,1,'Comment','2011-04-18 17:10:24','2011-04-18 17:10:24','Test',NULL);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `delayed_jobs`
--

LOCK TABLES `delayed_jobs` WRITE;
/*!40000 ALTER TABLE `delayed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `delayed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `drop_downs`
--

LOCK TABLES `drop_downs` WRITE;
/*!40000 ALTER TABLE `drop_downs` DISABLE KEYS */;
/*!40000 ALTER TABLE `drop_downs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `enquiries`
--

LOCK TABLES `enquiries` WRITE;
/*!40000 ALTER TABLE `enquiries` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquiries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `field_options`
--

LOCK TABLES `field_options` WRITE;
/*!40000 ALTER TABLE `field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` (`id`, `name`, `label`, `type`, `position`, `default_value`, `number_of_selections`, `required`, `created_at`, `updated_at`, `form_id`) VALUES (1,'Name','My name is:','TextField',NULL,'',NULL,1,'2011-03-04 23:35:00','2011-03-04 23:35:15',1),(2,'Email','My e-mail address:','TextField',NULL,'',NULL,1,'2011-03-04 23:35:02','2011-03-04 23:37:45',1),(3,'Comments','My pearls of wisdom are:','TextArea',NULL,'',NULL,1,'2011-03-04 23:35:03','2011-03-04 23:36:18',1);
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `folders`
--

LOCK TABLES `folders` WRITE;
/*!40000 ALTER TABLE `folders` DISABLE KEYS */;
INSERT INTO `folders` (`id`, `name`, `parent_id`, `created_at`, `updated_at`) VALUES (1,'Projects',NULL,'2010-01-29 15:18:54','2010-01-29 15:18:54');
/*!40000 ALTER TABLE `folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `form_submission_fields`
--

LOCK TABLES `form_submission_fields` WRITE;
/*!40000 ALTER TABLE `form_submission_fields` DISABLE KEYS */;
INSERT INTO `form_submission_fields` (`id`, `name`, `value`, `created_at`, `updated_at`, `field_id`, `form_submission_id`) VALUES (1,'Name','Robert','2011-03-04 23:38:45','2011-03-04 23:38:45',1,1),(2,'Email','rswilsonuk@gmail.com','2011-03-04 23:38:45','2011-03-04 23:38:45',2,1),(3,'Comments','Cool','2011-03-04 23:38:45','2011-03-04 23:38:45',3,1),(4,'Name','Rob','2011-03-05 13:11:19','2011-03-05 13:11:19',1,2),(5,'Email','rswilsonuk@gmail.com','2011-03-05 13:11:19','2011-03-05 13:11:19',2,2),(6,'Comments','Just Testing','2011-03-05 13:11:19','2011-03-05 13:11:19',3,2),(7,'Name','Test','2011-03-14 22:32:40','2011-03-14 22:32:40',1,3),(8,'Email','Test','2011-03-14 22:32:40','2011-03-14 22:32:40',2,3),(9,'Comments','Test','2011-03-14 22:32:40','2011-03-14 22:32:40',3,3),(10,'Name','Test','2011-03-14 22:33:43','2011-03-14 22:33:43',1,4),(11,'Email','Te amotote','2011-03-14 22:33:43','2011-03-14 22:33:43',2,4),(12,'Comments','Test','2011-03-14 22:33:43','2011-03-14 22:33:43',3,4);
/*!40000 ALTER TABLE `form_submission_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `form_submissions`
--

LOCK TABLES `form_submissions` WRITE;
/*!40000 ALTER TABLE `form_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `forms`
--

LOCK TABLES `forms` WRITE;
/*!40000 ALTER TABLE `forms` DISABLE KEYS */;
INSERT INTO `forms` (`id`, `name`, `description`, `notification_address`, `send_notification`, `created_at`, `updated_at`, `submission_message`, `submit_button`) VALUES (1,'Contact Form','I just called to say...','rswilsonuk@gmail.com',1,'2011-03-04 23:34:59','2011-03-14 22:33:27','Cheers! I\'ll be in touch soon.','Fly my pretty!');
/*!40000 ALTER TABLE `forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES (1,'Uploads',NULL,'2011-05-02 22:52:51','2011-05-02 22:52:51');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` (`id`, `name`, `parent_id`, `menu_id`, `link_id`, `position`, `folder_id`, `override_link`, `created_at`, `updated_at`) VALUES (1,'Home',NULL,1,1,1,NULL,NULL,'2010-01-27 23:08:27','2010-01-27 23:08:27'),(2,'About Me',NULL,1,2,2,NULL,NULL,'2010-01-27 23:08:34','2010-01-28 00:12:48'),(3,'Projects',NULL,1,3,3,NULL,NULL,'2010-01-27 23:08:40','2010-01-28 00:12:54'),(4,'Jobs',NULL,1,4,4,NULL,NULL,'2010-01-27 23:08:46','2010-01-28 00:13:00'),(5,'Contact Me',NULL,1,5,5,NULL,NULL,'2010-01-27 23:08:54','2010-01-28 00:13:07');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES (1,'Main Menu','2010-01-27 23:08:10','2010-01-27 23:08:10');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `page_templates`
--

LOCK TABLES `page_templates` WRITE;
/*!40000 ALTER TABLE `page_templates` DISABLE KEYS */;
INSERT INTO `page_templates` (`id`, `name`, `content`, `header_content`, `created_at`, `updated_at`) VALUES (1,'Homepage','<div id=\"wrapper\">\r\n<div id=\"page_background\">\r\n<div id=\"menu\">#MENU1#</div>\r\n<div id=\"bookmark\">&nbsp;</div>\r\n<div id=\"site_by\">&nbsp;</div>\r\n<div id=\"logo\">&nbsp;</div>\r\n<div id=\"homepage_content\">#CONTENT#</div>\r\n<br class=\"clear\" />\r\n<div id=\"page_footer\">\r\n<div id=\"validness\"><img src=\"/site_files/images/valid_css.gif\" alt=\"\" /> <img src=\"/site_files/images/valid_xhtml.gif\" alt=\"\" /></div>\r\n<div id=\"footer_links\">#MENU1#\r\n<div id=\"copyright\">Copyright Robert Wilson 2010</div>\r\n</div>\r\n<br class=\"clear\" /></div>\r\n</div>\r\n<div id=\"background_footer\">&nbsp;</div>\r\n</div>\r\n<script type=\"text/javascript\">\r\n\r\n  var _gaq = _gaq || [];\r\n  _gaq.push([\'_setAccount\', \'UA-1767493-6\']);\r\n  _gaq.push([\'_trackPageview\']);\r\n\r\n  (function() {\r\n    var ga = document.createElement(\'script\'); ga.type = \'text/javascript\'; ga.async = true;\r\n    ga.src = (\'https:\' == document.location.protocol ? \'https://ssl\' : \'http://www\') + \'.google-analytics.com/ga.js\';\r\n    var s = document.getElementsByTagName(\'script\')[0]; s.parentNode.insertBefore(ga, s);\r\n  })();\r\n\r\n</script> ','<link rel=\"stylesheet\" href=\"/site_files/stylesheets/styles.css\" type=\"text/css\" media=\"screen\" />','2010-01-27 23:05:50','2011-05-02 23:09:39');
/*!40000 ALTER TABLE `page_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `page_versions`
--

LOCK TABLES `page_versions` WRITE;
/*!40000 ALTER TABLE `page_versions` DISABLE KEYS */;
INSERT INTO `page_versions` (`id`, `page_template_id`, `name`, `title`, `content`, `filename`, `folder_id`, `site_id`, `created_at`, `updated_at`, `version`, `page_id`) VALUES (1,1,'Contact Me','Contact Me','<div class=\"caption\">\r\n	<p>\r\n		Well we are all meant to be doing our bit for Web 2.0. Here is my effort, you e-mail me...I e-mail back. Viola! 2 way communication!</p>\r\n</div>\r\n<h1>\r\n	Seriously, if you wanna get in touch...</h1>\r\n<p>\r\n	As mentioned somewhere else on the site, I appreciated feedback, comments, general words of wisdom, random rantings. I also get a warm fuzzy feeling if someone presses submit on this wonderful form. So go on, be a devil and send me something (preferbly not a virus, but heck I got a mac, so try me!)</p>\r\n<p>\r\n	#FORM1#</p>\r\n<form>\r\n	<p class=\"intro-text\">\r\n		I just called to say..</p>\r\n	<table border=\"0\" cellpadding=\"5\" cellspacing=\"0\">\r\n		<tbody>\r\n			<tr>\r\n				<th valign=\"top\">\r\n					My name is:</th>\r\n				<td>\r\n					<input class=\"text-field\" maxlength=\"50\" name=\"name\" type=\"text\" /></td>\r\n			</tr>\r\n			<tr>\r\n				<th valign=\"top\">\r\n					My e-mail address:<br />\r\n					<span class=\"whisper\">(should my comments be worthy)</span></th>\r\n				<td>\r\n					<input class=\"text-field\" maxlength=\"50\" name=\"email\" type=\"text\" /></td>\r\n			</tr>\r\n			<tr>\r\n				<th colspan=\"2\">\r\n					My pearls of wisdom are:</th>\r\n			</tr>\r\n			<tr>\r\n				<td colspan=\"2\">\r\n					<textarea class=\"textarea-field\" cols=\"40\" name=\"comments\" rows=\"6\"></textarea></td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					&nbsp;</td>\r\n				<td>\r\n					<input type=\"submit\" value=\"Fly my pretty!\" /></td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</form>\r\n<p>\r\n	&nbsp;</p>\r\n','contact_me.html',NULL,1,'2011-03-04 23:36:40','2011-03-04 23:36:40',1,5),(2,1,'Contact Me','Contact Me','<div class=\"caption\">\r\n	<p>\r\n		Well we are all meant to be doing our bit for Web 2.0. Here is my effort, you e-mail me...I e-mail back. Viola! 2 way communication!</p>\r\n</div>\r\n<h1>\r\n	Seriously, if you wanna get in touch...</h1>\r\n<p>\r\n	As mentioned somewhere else on the site, I appreciated feedback, comments, general words of wisdom, random rantings. I also get a warm fuzzy feeling if someone presses submit on this wonderful form. So go on, be a devil and send me something (preferbly not a virus, but heck I got a mac, so try me!)</p>\r\n<p>\r\n	#FORM1#</p>\r\n','contact_me.html',NULL,1,'2011-03-04 23:37:18','2011-03-04 23:37:18',2,5),(3,1,'Homepage','Home','<div class=\"caption\">\r\n	<p>\r\n		Pull up a chair, make your self comfy and take time to indulge...</p>\r\n</div>\r\n<h1>\r\n	Welcome to rswilson.com</h1>\r\n<p>\r\n	This is a shrine dedicated to Robert Wilson. Not really, just a place to showcase my achievements, goals and desires for the future. Hopefully you will find something interesting...</p>\r\n<p>\r\n	&nbsp;</p>\r\n<meta charset=\"utf-8\" />\r\n<p>\r\n	#BLOG1#</p>\r\n','index.html',NULL,1,'2011-03-05 00:08:00','2011-03-05 00:08:00',1,1),(4,1,'About Me','About Me','<div class=\"caption\">\r\n	<p>\r\n		A little something about me...</p>\r\n</div>\r\n<h1>\r\n	Who are you?</h1>\r\n<p>\r\n	My name is Robert Wilson, 25, from the UK. I am as we speak currently living and working in London. I have a degree in Computer Science and currently working in web development.</p>\r\n<h1>\r\n	Why did I make this site?</h1>\r\n<p>\r\n	This site is essentially a show case of my work and a little insight into my mind. It reality it should hopefully serve a token for recording and reminisicing about my work and past projects</p>\r\n<h1>\r\n	The voyersitic bit...</h1>\r\n<h2>\r\n	Bio:</h2>\r\n<p>\r\n	A run down about me:</p>\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"5\">\r\n	<tbody>\r\n		<tr>\r\n			<th>\r\n				Name:</th>\r\n			<td>\r\n				Robert Wilson</td>\r\n		</tr>\r\n		<tr>\r\n			<th>\r\n				Age:</th>\r\n			<td>\r\n				27</td>\r\n		</tr>\r\n		<tr>\r\n			<th>\r\n				Nationality:</th>\r\n			<td>\r\n				British</td>\r\n		</tr>\r\n		<tr>\r\n			<th>\r\n				Current Residence:</th>\r\n			<td>\r\n				London, UK</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<h2>\r\n	Education:</h2>\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"5\">\r\n	<tbody>\r\n		<tr>\r\n			<th>\r\n				Degree:</th>\r\n			<td>\r\n				Masters in Computer Science w/ Study Abroad from the University of Bristol (the proper one!)</td>\r\n		</tr>\r\n		<tr>\r\n			<th>\r\n				School:</th>\r\n			<td>\r\n				3 A-levels (Maths-A, Computing-A, Economics-B, Geography-A(AS))<br />\r\n				10 GCSEs (6 A*, 4A) from Monmouth School</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<h2>\r\n	Job Hightlights:</h2>\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"5\">\r\n	<tbody>\r\n		<tr>\r\n			<th>\r\n				Current Job:</th>\r\n			<td>\r\n				Support operative for OpenBet Technology Ltd.</td>\r\n		</tr>\r\n		<tr>\r\n			<th>\r\n				Last Job:</th>\r\n			<td>\r\n				Web developer with <a href=\"http://www.lcubed.com.au\" target=\"_blank\">L<sup>CUBED</sup></a></td>\r\n		</tr>\r\n		<tr>\r\n			<th>\r\n				Other jobs:</th>\r\n			<td>\r\n				Bar man for Wetherspoons, Coffee shop barista, Database developer for Social Services etc. (See CV)</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	&nbsp;</p>\r\n','about_me.html',NULL,1,'2011-03-05 00:13:15','2011-03-05 00:13:15',1,2),(5,1,'About Me','About Me','<div class=\"caption\">\r\n	<p>\r\n		A little something about me...</p>\r\n</div>\r\n<h1>\r\n	Who are you?</h1>\r\n<p>\r\n	My name is Robert Wilson, 27, from the UK. I am as we speak currently living and working in London. I have a degree in Computer Science and currently working in web development.</p>\r\n<h1>\r\n	Why did I make this site?</h1>\r\n<p>\r\n	This site is essentially a show case of my work and a little insight into my mind. It reality it should hopefully serve a token for recording and reminisicing about my work and past projects</p>\r\n<h1>\r\n	The voyersitic bit...</h1>\r\n<h2>\r\n	Bio:</h2>\r\n<p>\r\n	A run down about me:</p>\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"5\">\r\n	<tbody>\r\n		<tr>\r\n			<th>\r\n				Name:</th>\r\n			<td>\r\n				Robert Wilson</td>\r\n		</tr>\r\n		<tr>\r\n			<th>\r\n				Age:</th>\r\n			<td>\r\n				27</td>\r\n		</tr>\r\n		<tr>\r\n			<th>\r\n				Nationality:</th>\r\n			<td>\r\n				British</td>\r\n		</tr>\r\n		<tr>\r\n			<th>\r\n				Current Residence:</th>\r\n			<td>\r\n				London, UK</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<h2>\r\n	Education:</h2>\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"5\">\r\n	<tbody>\r\n		<tr>\r\n			<th>\r\n				Degree:</th>\r\n			<td>\r\n				Masters in Computer Science w/ Study Abroad from the University of Bristol (the proper one!)</td>\r\n		</tr>\r\n		<tr>\r\n			<th>\r\n				School:</th>\r\n			<td>\r\n				3 A-levels (Maths-A, Computing-A, Economics-B, Geography-A(AS))<br />\r\n				10 GCSEs (6 A*, 4A) from Monmouth School</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<h2>\r\n	Job Hightlights:</h2>\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"5\">\r\n	<tbody>\r\n		<tr>\r\n			<th>\r\n				Current Job:</th>\r\n			<td>\r\n				Support operative for OpenBet Technology Ltd.</td>\r\n		</tr>\r\n		<tr>\r\n			<th>\r\n				Last Job:</th>\r\n			<td>\r\n				Web developer with <a href=\"http://www.lcubed.com.au\" target=\"_blank\">L<sup>CUBED</sup></a></td>\r\n		</tr>\r\n		<tr>\r\n			<th>\r\n				Other jobs:</th>\r\n			<td>\r\n				Bar man for Wetherspoons, Coffee shop barista, Database developer for Social Services etc. (See CV)</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	&nbsp;</p>\r\n','about_me.html',NULL,1,'2011-03-05 00:13:22','2011-03-05 00:13:22',2,2),(6,1,'About Me','About Me','<div class=\"caption\">\r\n	<p>\r\n		A little something about me...</p>\r\n</div>\r\n<h1>\r\n	Who are you?</h1>\r\n<p>\r\n	My name is Robert Wilson, 27, from the UK. I am as we speak currently living and working in London. I have a degree in Computer Science and currently working in web development.</p>\r\n<h1>\r\n	Why did I make this site?</h1>\r\n<p>\r\n	This site is essentially a show case of my work and a little insight into my mind. It reality it should hopefully serve a token for recording and reminisicing about my work and past projects</p>\r\n<h1>\r\n	The voyersitic bit...</h1>\r\n<h2>\r\n	Bio:</h2>\r\n<p>\r\n	A run down about me:</p>\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"5\">\r\n	<tbody>\r\n		<tr>\r\n			<th>\r\n				Name:</th>\r\n			<td>\r\n				Robert Wilson</td>\r\n		</tr>\r\n		<tr>\r\n			<th>\r\n				Age:</th>\r\n			<td>\r\n				27</td>\r\n		</tr>\r\n		<tr>\r\n			<th>\r\n				Nationality:</th>\r\n			<td>\r\n				British</td>\r\n		</tr>\r\n		<tr>\r\n			<th>\r\n				Current Residence:</th>\r\n			<td>\r\n				London, UK</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<h2>\r\n	Education:</h2>\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"5\">\r\n	<tbody>\r\n		<tr>\r\n			<th>\r\n				Degree:</th>\r\n			<td>\r\n				Masters in Computer Science w/ Study Abroad from the University of Bristol (the proper one!)</td>\r\n		</tr>\r\n		<tr>\r\n			<th>\r\n				School:</th>\r\n			<td>\r\n				3 A-levels (Maths-A, Computing-A, Economics-B, Geography-A(AS))<br />\r\n				10 GCSEs (6 A*, 4A) from Monmouth School</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<h2>\r\n	Job Hightlights:</h2>\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"5\">\r\n	<tbody>\r\n		<tr>\r\n			<th>\r\n				Current Job:</th>\r\n			<td>\r\n				Support operative for OpenBet Technology Ltd.</td>\r\n		</tr>\r\n		<tr>\r\n			<th>\r\n				Last Job:</th>\r\n			<td>\r\n				Web developer with <a href=\"http://www.lcubed.com.au\" target=\"_blank\">L<sup>CUBED</sup></a></td>\r\n		</tr>\r\n		<tr>\r\n			<th>\r\n				Other jobs:</th>\r\n			<td>\r\n				Bar man for Wetherspoons, Coffee shop barista, Database developer for Social Services etc. (See&nbsp;<a data-page_id=\"4\" href=\"/jobs.html\">CV</a>)</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	&nbsp;</p>\r\n','about_me.html',NULL,1,'2011-03-05 00:13:47','2011-03-05 00:13:47',3,2),(7,1,'Homepage','Home','<div class=\"caption\">\r\n	<p>\r\n		Pull up a chair, make your self comfy and take time to indulge...</p>\r\n</div>\r\n<h1>\r\n	Welcome to rswilson.com</h1>\r\n<p>\r\n	This is a shrine dedicated to Robert Wilson. Not really, just a place to showcase my achievements, goals and desires for the future. Hopefully you will find something interesting...</p>\r\n<meta charset=\"utf-8\" />\r\n<p>\r\n	#BLOG1#</p>\r\n','index.html',NULL,1,'2011-03-05 00:14:54','2011-03-05 00:14:54',2,1),(8,1,'Homepage','Home','<div class=\"caption\">\r\n	<p>\r\n		Pull up a chair, make your self comfy and take time to indulge...</p>\r\n</div>\r\n<h1>\r\n	Welcome to rswilson.com</h1>\r\n<p>\r\n	This is a shrine dedicated to Robert Wilson. Not really, just a place to showcase my achievements, goals and desires for the future. Hopefully you will find something interesting...</p>\r\n<p>\r\n	#BLOG1#</p>\r\n','index.html',NULL,1,'2011-03-05 17:27:13','2011-03-05 17:27:13',3,1),(9,NULL,'Site Down for Maintenance','Site Down for Maintenance','<p>\r\n	This site is currently down for maintenance. We apologise for any inconvenience this may cause. Thank you.</p>\r\n\r\n<script type=\"text/javascript\">\r\n\r\n  var _gaq = _gaq || [];\r\n  _gaq.push([\'_setAccount\', \'UA-1767493-6\']);\r\n  _gaq.push([\'_trackPageview\']);\r\n\r\n  (function() {\r\n    var ga = document.createElement(\'script\'); ga.type = \'text/javascript\'; ga.async = true;\r\n    ga.src = (\'https:\' == document.location.protocol ? \'https://ssl\' : \'http://www\') + \'.google-analytics.com/ga.js\';\r\n    var s = document.getElementsByTagName(\'script\')[0]; s.parentNode.insertBefore(ga, s);\r\n  })();\r\n\r\n</script>\r\n','site_down.html',NULL,1,'2011-04-26 16:57:55','2011-04-26 16:57:55',1,6);
/*!40000 ALTER TABLE `page_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`, `page_template_id`, `name`, `title`, `content`, `filename`, `folder_id`, `site_id`, `created_at`, `updated_at`, `version`) VALUES (1,1,'Homepage','Home','<div class=\"caption\">\r\n	<p>\r\n		Pull up a chair, make your self comfy and take time to indulge...</p>\r\n</div>\r\n<h1>\r\n	Welcome to rswilson.com</h1>\r\n<p>\r\n	This is a shrine dedicated to Robert Wilson. Not really, just a place to showcase my achievements, goals and desires for the future. Hopefully you will find something interesting...</p>\r\n<p>\r\n	#BLOG1#</p>\r\n','index.html',NULL,1,'2010-01-27 23:06:35','2011-03-05 17:27:13',3),(2,1,'About Me','About Me','<div class=\"caption\">\r\n	<p>\r\n		A little something about me...</p>\r\n</div>\r\n<h1>\r\n	Who are you?</h1>\r\n<p>\r\n	My name is Robert Wilson, 27, from the UK. I am as we speak currently living and working in London. I have a degree in Computer Science and currently working in web development.</p>\r\n<h1>\r\n	Why did I make this site?</h1>\r\n<p>\r\n	This site is essentially a show case of my work and a little insight into my mind. It reality it should hopefully serve a token for recording and reminisicing about my work and past projects</p>\r\n<h1>\r\n	The voyersitic bit...</h1>\r\n<h2>\r\n	Bio:</h2>\r\n<p>\r\n	A run down about me:</p>\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"5\">\r\n	<tbody>\r\n		<tr>\r\n			<th>\r\n				Name:</th>\r\n			<td>\r\n				Robert Wilson</td>\r\n		</tr>\r\n		<tr>\r\n			<th>\r\n				Age:</th>\r\n			<td>\r\n				27</td>\r\n		</tr>\r\n		<tr>\r\n			<th>\r\n				Nationality:</th>\r\n			<td>\r\n				British</td>\r\n		</tr>\r\n		<tr>\r\n			<th>\r\n				Current Residence:</th>\r\n			<td>\r\n				London, UK</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<h2>\r\n	Education:</h2>\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"5\">\r\n	<tbody>\r\n		<tr>\r\n			<th>\r\n				Degree:</th>\r\n			<td>\r\n				Masters in Computer Science w/ Study Abroad from the University of Bristol (the proper one!)</td>\r\n		</tr>\r\n		<tr>\r\n			<th>\r\n				School:</th>\r\n			<td>\r\n				3 A-levels (Maths-A, Computing-A, Economics-B, Geography-A(AS))<br />\r\n				10 GCSEs (6 A*, 4A) from Monmouth School</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<h2>\r\n	Job Hightlights:</h2>\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"5\">\r\n	<tbody>\r\n		<tr>\r\n			<th>\r\n				Current Job:</th>\r\n			<td>\r\n				Support operative for OpenBet Technology Ltd.</td>\r\n		</tr>\r\n		<tr>\r\n			<th>\r\n				Last Job:</th>\r\n			<td>\r\n				Web developer with <a href=\"http://www.lcubed.com.au\" target=\"_blank\">L<sup>CUBED</sup></a></td>\r\n		</tr>\r\n		<tr>\r\n			<th>\r\n				Other jobs:</th>\r\n			<td>\r\n				Bar man for Wetherspoons, Coffee shop barista, Database developer for Social Services etc. (See&nbsp;<a data-page_id=\"4\" href=\"/jobs.html\">CV</a>)</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	&nbsp;</p>\r\n','about_me.html',NULL,1,'2010-01-28 00:09:53','2011-03-05 00:13:47',3),(3,1,'Projects','Projects','<div class=\"caption\">\r\n<p>What I\'ve been up to recently (and in the past)</p>\r\n</div>\r\n<h1>A quick break down via topic...</h1>\r\n<ul id=\"by_topic\">\r\n<li><a href=\"#\">Web Developement</a></li>\r\n<li><a href=\"#\">Java</a></li>\r\n<li><a href=\"#\">C++</a></li>\r\n<li><a href=\"#\">Others?</a></li>\r\n</ul>\r\n<h1>Recent Project Showcase</h1>\r\n<div class=\"caption\">\r\n<p>Here I will spotlight my latest and possibly greatest work</p>\r\n</div>\r\n<h2>RootCMS (what this site is running on!)</h2>\r\n<p>RootCMS is my attempt at a simple lightweight content management system for the web. I was getting increasingly frustrated finding a solution for friends and family who wanted websites. The problems they had:</p>\r\n<ul>\r\n<li>Want something simple!</li>\r\n<li>Don\'t want it too simple! Blogger et al. all have their limitations</li>\r\n<li>Dreamweaver and tools are awkward to learn, produce horrible code and still leaves a lot of manual leg work</li>\r\n</ul>\r\n<p>I looked around the internet for free CMS and found great examples like Joomla but I was just got increasingly frustrated by them. They were just far too complicated. The Open Source community is great and all, but when so many people request features and plugins then the key vision of the software is lost. I wanted to cut away the fat and make a basic, simple, easy to use, clean CMS. So I hope this is what I achieved</p>\r\n<p>Interested? Read more in the <a href=\"../../Projects/rootcms.html\">RootCMS project</a> page</p>','projects.html',NULL,1,'2010-01-28 00:10:43','2010-01-29 15:27:10',0),(4,1,'Jobs','Jobs','<div class=\"caption\">\r\n<p>In the effort of self promotion, I shamelessly flog my CV on the open market</p>\r\n</div>\r\n<h1>A little bit about me and my background</h1>\r\n<p>First things first, if you want skip straight to the point, you can grab my CV in two flavours:</p>\r\n<p><a href=\"#\">CV (html version)</a></p>\r\n<p><a href=\"#\">CV (pdf version)</a></p>\r\n<div class=\"caption\">\r\n<p>For those who would rather see the whole CV summarised...</p>\r\n</div>\r\n<h1>What jobs am I interested in?</h1>\r\n<p>In general, something Computer based. However, I am also interest in the financial world, so if there is an exciting opening in that world I am more than open to it.</p>\r\n<p>I believe I am pretty versatile but general roles I would be interested in...</p>\r\n<ul>\r\n<li><strong>Computer Games</strong> - Production, Coding, Developing - Whatever I can get my foot in the door with!</li>\r\n<li><strong>Web Development</strong> - Coding, Scripting - Must be exciting!</li>\r\n<li><strong>Other app development</strong> - Java/C++ based</li>\r\n</ul>\r\n<p>My main requirement is that the company/project excites me. I like to try cool things or innovate, so if that sounds like your philosophy then we could be a perfect match!</p>','jobs.html',NULL,1,'2010-01-28 00:11:12','2010-01-29 14:37:01',0),(5,1,'Contact Me','Contact Me','<div class=\"caption\">\r\n	<p>\r\n		Well we are all meant to be doing our bit for Web 2.0. Here is my effort, you e-mail me...I e-mail back. Viola! 2 way communication!</p>\r\n</div>\r\n<h1>\r\n	Seriously, if you wanna get in touch...</h1>\r\n<p>\r\n	As mentioned somewhere else on the site, I appreciated feedback, comments, general words of wisdom, random rantings. I also get a warm fuzzy feeling if someone presses submit on this wonderful form. So go on, be a devil and send me something (preferbly not a virus, but heck I got a mac, so try me!)</p>\r\n<p>\r\n	#FORM1#</p>\r\n','contact_me.html',NULL,1,'2010-01-28 00:12:02','2011-03-04 23:37:18',2),(6,NULL,'Site Down for Maintenance','Site Down for Maintenance','<p>\r\n	This site is currently down for maintenance. We apologise for any inconvenience this may cause. Thank you.</p>\r\n\r\n<script type=\"text/javascript\">\r\n\r\n  var _gaq = _gaq || [];\r\n  _gaq.push([\'_setAccount\', \'UA-1767493-6\']);\r\n  _gaq.push([\'_trackPageview\']);\r\n\r\n  (function() {\r\n    var ga = document.createElement(\'script\'); ga.type = \'text/javascript\'; ga.async = true;\r\n    ga.src = (\'https:\' == document.location.protocol ? \'https://ssl\' : \'http://www\') + \'.google-analytics.com/ga.js\';\r\n    var s = document.getElementsByTagName(\'script\')[0]; s.parentNode.insertBefore(ga, s);\r\n  })();\r\n\r\n</script>\r\n','site_down.html',NULL,1,'2010-01-28 00:27:40','2011-04-26 16:57:55',1),(7,1,'RootCMS','RootCMS - Lightweight, simple CMS','<div class=\"caption\">\r\n<p>Simple, lightweight, easy to use CMS? Is it possible?</p>\r\n</div>\r\n<h1>RootCMS</h1>\r\n<p>RootCMS is my take on a CMS. It was written out of a passion to provide a simple CMS for me, my friends and my family. I also used it as an excuse to learn some news skill using Ruby on Rails.</p>\r\n<p>I\'m pretty proud of it. This whole site is running in RootCMS and I am writing this content inside of it as we speak. It is still a work in progress and hopefully new features will come.</p>\r\n<h2>What?</h2>\r\n<p>RootCMS is a light, easy to use CMS. I don\'t claim that it does everything, it does the basics and I feel it does them well. More will come, but so far here is the features list:</p>\r\n<ul>\r\n<li>Page Templates</li>\r\n<li>Page Content</li>\r\n<li>Folders</li>\r\n<li>Menus</li>\r\n<li>File Manager</li>\r\n<li>Photos, Albums and Galleries</li>\r\n</ul>\r\n<h2>How?</h2>\r\n<p>RootCMS is built using the Ruby on Rail framework. I originally became interested in Ruby on Rails a few years back when it originally came to life. I had done a few small sites in it, but nothing on this scale or complexity. I have really learnt a lot with this project and am please with the results.</p>\r\n<p>I have found Rails to be a real productivity win for me. I like achieving things rapidly. Iterating the product until I am happy with it. It removes a lot of the frustrating barriers of Web development</p>\r\n<h2>Where can I get it?</h2>\r\n<p>I am currently reworking RootCMS into a plugin for Rails so that you can easily add CMS functionality into your project. This will be open source and hosted on GitHub.</p>\r\n<p>Until then, you can view the project\'s progress in my <a href=\"http://git.rswilson.com\">git repository</a>.</p>','rootcms.html',1,1,'2010-01-29 15:18:38','2010-01-29 15:19:04',0);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pictures`
--

LOCK TABLES `pictures` WRITE;
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
INSERT INTO `pictures` (`id`, `title`, `caption`, `album_id`, `image_file_name`, `image_content_type`, `image_file_size`, `image_updated_at`, `rotation`, `link`, `created_at`, `updated_at`) VALUES (5,'iPhone Hotspot',NULL,1,'hotspot.PNG','image/png',142019,'2011-05-02 22:57:07',0,NULL,'2011-05-02 22:57:07','2011-05-02 22:57:07');
/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `title`, `body`, `blog_id`, `created_at`, `updated_at`) VALUES (1,'Site goes live!!! (Again!)','<p>\r\n	The site has&nbsp;gone through yet another iteration, hopefully this one should be a bit more user friendly.</p>\r\n<p>\r\n	I would love to hear if you have any feedback on the design/content. It is all welcomed!</p>\r\n',1,'2011-03-05 00:07:22','2011-03-05 00:07:22'),(2,'Root CMS Updated (Version 0.3)','<p>\r\n	Development of Root CMS continues apace...just a little slower than expected.</p>\r\n<p>\r\n	This version (official 0.3) see lots of bug fixes here and there and various improvements. No ground breaking features but everything should run much smoother now and the whole project is much more maintainable.</p>\r\n<p>\r\n	One of the key improvements is the integration of the new CodeMirror 2 library. If you didn&#39;t know about this, CodeMirror is essentially a lightweight code editor for your web browser - bringing niceites such as all important code highlighting. This makes it much easier for example to edit Page Templates in particular.</p>\r\n<p>\r\n	If you even have a passing interest, I would advise you to check out CodeMirror at:&nbsp;<a href=\"http://codemirror.net/\">codemirror.net</a></p>\r\n<p>\r\n	A full changelog of version 0.3 will be coming soon, this is all part of the formalisation of this project. Hopefully one day it will see it&#39;s full public release.</p>\r\n<p>\r\n	If anyone is interested in checking Root CMS out and giving it a try locally then drop me a note. I am more than happy to get others&#39; input.</p>\r\n',1,'2011-05-02 21:55:51','2011-05-02 21:55:51'),(3,'iPhone Personal Hotspot...it just works!','<p>\r\n	As some of you may know, I am a bit of an Apple fanboy at heart. Yes, sometimes it may defy logic, but there are also certain times when a little of the Steve Jobs &quot;it just works&quot; magic shines through.</p>\r\n<p>\r\n	For my day to day job, I work remotely from home. This means that my home internet (thanks Sky!) is critical to my work.</p>\r\n<p>\r\n	Now this has all been fine and dandy until recently when it just died on me - leaving me half way through a working day with no access.</p>\r\n<p>\r\n	Cue iPhone to the rescue. The recent iOS 4.3 update had included a new gem called &quot;Personal Hotspot&quot;. Effectively what this does is enable you to use your mobile as a Wireless hotspot and share your 3G connection with up to 5 devices.</p>\r\n<p>\r\n	This is easily done by going to <strong>Settings</strong> -&gt; <strong>Personal Hotspot</strong></p>\r\n<p>\r\n	Once done, you simply go to your computer and look for the corresponding wireless connection (you will see it appear as the same name as your device syncs in iTunes).</p>\r\n<p>\r\n	Once done, you should see you iPhone display this image:</p>\r\n<p style=\"text-align: center; \">\r\n	<img alt=\"\" src=\"/albums/1/pictures/5/large/hotspot.PNG?1304377027\" style=\"width: 266px; height: 400px; \" /></p>\r\n<p>\r\n	Suffice to say, this worked like a charm. I was back up and running within 5 minutes. Connected at 4mbps thanks to me Three mobile 3G connection. And it kept the boss happy.</p>\r\n<p>\r\n	Only downside is that this is iPhone 4 only. Seems a little cheeky as I expect iPhone 3GS has the power &amp; hardware to run this...another reason to upgrade?</p>\r\n',1,'2011-05-02 22:57:17','2011-05-02 22:58:40');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `radio_groups`
--

LOCK TABLES `radio_groups` WRITE;
/*!40000 ALTER TABLE `radio_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `radio_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` (`id`, `name`, `url`, `contact_address`, `start_page_id`, `default_template_id`, `global_title`, `created_at`, `updated_at`) VALUES (1,'rswilson.com','www.rswilson.com','rswilsonuk@gmail.com',1,NULL,'www.rswilson.com | ','2010-01-27 23:04:33','2011-05-02 22:38:21'),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `text_fields`
--

LOCK TABLES `text_fields` WRITE;
/*!40000 ALTER TABLE `text_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `text_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `email`, `password_hash`, `password_salt`, `created_at`, `updated_at`) VALUES (1,'rswilson','rswilsonuk@gmail.com','$2a$10$ZJymgx7QjLnD/ppP5ysqqeLOUXXJxyHf4BMrZifYqakheyelXxWAm','$2a$10$ZJymgx7QjLnD/ppP5ysqqe','2011-02-16 18:33:05','2011-02-16 18:33:05');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-05-03  0:16:04
