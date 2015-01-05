<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta http-equiv="Content-Style-Type" content="text/css">
  <title></title>
  <meta name="Generator" content="Cocoa HTML Writer">
  <meta name="CocoaVersion" content="1343.16">
  <style type="text/css">
    p.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica}
    p.p2 {margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica; min-height: 14.0px}
  </style>
</head>
<body>
<p class="p1">-- phpMyAdmin SQL Dump</p>
<p class="p1">-- version 4.1.6</p>
<p class="p1">-- http://www.phpmyadmin.net</p>
<p class="p1">--</p>
<p class="p1">-- Host: localhost</p>
<p class="p1">-- Generation Time: Dec 01, 2014 at 08:10 PM</p>
<p class="p1">-- Server version: 5.6.19</p>
<p class="p1">-- PHP Version: 5.3.17</p>
<p class="p2"><br></p>
<p class="p1">SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";</p>
<p class="p1">SET time_zone = "+00:00";</p>
<p class="p2"><br></p>
<p class="p1">--</p>
<p class="p1">-- Database: `PublicArtApp`</p>
<p class="p1">--</p>
<p class="p2"><br></p>
<p class="p1">-- --------------------------------------------------------</p>
<p class="p2"><br></p>
<p class="p1">--</p>
<p class="p1">-- Table structure for table `acl_class`</p>
<p class="p1">--</p>
<p class="p2"><br></p>
<p class="p1">CREATE TABLE IF NOT EXISTS `acl_class` (</p>
<p class="p1"><span class="Apple-converted-space">  </span>`id` bigint(20) NOT NULL AUTO_INCREMENT,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`class` varchar(255) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>PRIMARY KEY (`id`),</p>
<p class="p1"><span class="Apple-converted-space">  </span>UNIQUE KEY `unique_uk_2` (`class`)</p>
<p class="p1">) ENGINE=InnoDB<span class="Apple-converted-space">  </span>DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;</p>
<p class="p2"><br></p>
<p class="p1">--</p>
<p class="p1">-- Dumping data for table `acl_class`</p>
<p class="p1">--</p>
<p class="p2"><br></p>
<p class="p1">INSERT INTO `acl_class` (`id`, `class`) VALUES</p>
<p class="p1">(7, 'dash.pojo.Group'),</p>
<p class="p1">(4, 'dash.pojo.User');</p>
<p class="p2"><br></p>
<p class="p1">-- --------------------------------------------------------</p>
<p class="p2"><br></p>
<p class="p1">--</p>
<p class="p1">-- Table structure for table `acl_entry`</p>
<p class="p1">--</p>
<p class="p2"><br></p>
<p class="p1">CREATE TABLE IF NOT EXISTS `acl_entry` (</p>
<p class="p1"><span class="Apple-converted-space">  </span>`id` bigint(20) NOT NULL AUTO_INCREMENT,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`acl_object_identity` bigint(20) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`ace_order` int(11) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`sid` bigint(20) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`mask` int(11) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`granting` tinyint(1) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`audit_success` tinyint(1) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`audit_failure` tinyint(1) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>PRIMARY KEY (`id`),</p>
<p class="p1"><span class="Apple-converted-space">  </span>UNIQUE KEY `unique_uk_4` (`acl_object_identity`,`ace_order`),</p>
<p class="p1"><span class="Apple-converted-space">  </span>KEY `foreign_fk_5` (`sid`)</p>
<p class="p1">) ENGINE=InnoDB<span class="Apple-converted-space">  </span>DEFAULT CHARSET=latin1 AUTO_INCREMENT=143 ;</p>
<p class="p2"><br></p>
<p class="p1">--</p>
<p class="p1">-- Dumping data for table `acl_entry`</p>
<p class="p1">--</p>
<p class="p2"><br></p>
<p class="p1">INSERT INTO `acl_entry` (`id`, `acl_object_identity`, `ace_order`, `sid`, `mask`, `granting`, `audit_success`, `audit_failure`) VALUES</p>
<p class="p1">(1, 10, 0, 4, 1, 1, 1, 1),</p>
<p class="p1">(2, 10, 1, 4, 2, 1, 0, 0),</p>
<p class="p1">(127, 46, 0, 35, 1, 1, 0, 0),</p>
<p class="p1">(128, 46, 1, 35, 2, 1, 0, 0),</p>
<p class="p1">(129, 46, 2, 35, 8, 1, 0, 0),</p>
<p class="p1">(130, 45, 0, 34, 1, 1, 0, 0),</p>
<p class="p1">(134, 57, 0, 39, 1, 1, 0, 0),</p>
<p class="p1">(135, 57, 1, 39, 2, 1, 0, 0),</p>
<p class="p1">(136, 57, 2, 39, 8, 1, 0, 0),</p>
<p class="p1">(140, 58, 0, 40, 1, 1, 0, 0),</p>
<p class="p1">(141, 58, 1, 40, 2, 1, 0, 0),</p>
<p class="p1">(142, 58, 2, 40, 8, 1, 0, 0);</p>
<p class="p2"><br></p>
<p class="p1">-- --------------------------------------------------------</p>
<p class="p2"><br></p>
<p class="p1">--</p>
<p class="p1">-- Table structure for table `acl_object_identity`</p>
<p class="p1">--</p>
<p class="p2"><br></p>
<p class="p1">CREATE TABLE IF NOT EXISTS `acl_object_identity` (</p>
<p class="p1"><span class="Apple-converted-space">  </span>`id` bigint(20) NOT NULL AUTO_INCREMENT,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`object_id_class` bigint(20) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`object_id_identity` bigint(20) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`parent_object` bigint(20) DEFAULT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`owner_sid` bigint(20) DEFAULT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`entries_inheriting` tinyint(1) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>PRIMARY KEY (`id`),</p>
<p class="p1"><span class="Apple-converted-space">  </span>UNIQUE KEY `unique_uk_3` (`object_id_class`,`object_id_identity`),</p>
<p class="p1"><span class="Apple-converted-space">  </span>KEY `foreign_fk_1` (`parent_object`),</p>
<p class="p1"><span class="Apple-converted-space">  </span>KEY `foreign_fk_3` (`owner_sid`)</p>
<p class="p1">) ENGINE=InnoDB<span class="Apple-converted-space">  </span>DEFAULT CHARSET=latin1 AUTO_INCREMENT=59 ;</p>
<p class="p2"><br></p>
<p class="p1">--</p>
<p class="p1">-- Dumping data for table `acl_object_identity`</p>
<p class="p1">--</p>
<p class="p2"><br></p>
<p class="p1">INSERT INTO `acl_object_identity` (`id`, `object_id_class`, `object_id_identity`, `parent_object`, `owner_sid`, `entries_inheriting`) VALUES</p>
<p class="p1">(10, 4, 1, NULL, 4, 0),</p>
<p class="p1">(45, 4, 7, NULL, 4, 1),</p>
<p class="p1">(46, 4, 8, NULL, 35, 1),</p>
<p class="p1">(56, 7, 15, NULL, 35, 1),</p>
<p class="p1">(57, 4, 12, NULL, 39, 1),</p>
<p class="p1">(58, 4, 13, NULL, 4, 1);</p>
<p class="p2"><br></p>
<p class="p1">-- --------------------------------------------------------</p>
<p class="p2"><br></p>
<p class="p1">--</p>
<p class="p1">-- Table structure for table `acl_sid`</p>
<p class="p1">--</p>
<p class="p2"><br></p>
<p class="p1">CREATE TABLE IF NOT EXISTS `acl_sid` (</p>
<p class="p1"><span class="Apple-converted-space">  </span>`id` bigint(20) NOT NULL AUTO_INCREMENT,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`principal` tinyint(1) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`sid` varchar(100) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>PRIMARY KEY (`id`),</p>
<p class="p1"><span class="Apple-converted-space">  </span>UNIQUE KEY `unique_uk_1` (`sid`,`principal`)</p>
<p class="p1">) ENGINE=InnoDB<span class="Apple-converted-space">  </span>DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;</p>
<p class="p2"><br></p>
<p class="p1">--</p>
<p class="p1">-- Dumping data for table `acl_sid`</p>
<p class="p1">--</p>
<p class="p2"><br></p>
<p class="p1">INSERT INTO `acl_sid` (`id`, `principal`, `sid`) VALUES</p>
<p class="p1">(39, 1, 'Admin'),</p>
<p class="p1">(40, 1, 'mguidry3@uh.edu'),</p>
<p class="p1">(4, 1, 'Root'),</p>
<p class="p1">(35, 1, 'User'),</p>
<p class="p1">(34, 1, 'Visitor');</p>
<p class="p2"><br></p>
<p class="p1">-- --------------------------------------------------------</p>
<p class="p2"><br></p>
<p class="p1">--</p>
<p class="p1">-- Table structure for table `artwork`</p>
<p class="p1">--</p>
<p class="p2"><br></p>
<p class="p1">CREATE TABLE IF NOT EXISTS `artwork` (</p>
<p class="p1"><span class="Apple-converted-space">  </span>`artwork_id` int(11) NOT NULL AUTO_INCREMENT,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`title` varchar(50) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`availability` varchar(200) DEFAULT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`location_lat` float NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`location_long` float NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`artist_name` varchar(100) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`artist_dob` date DEFAULT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`artist_pob` varchar(50) DEFAULT '',</p>
<p class="p1"><span class="Apple-converted-space">  </span>`medium` varchar(50) NOT NULL DEFAULT '',</p>
<p class="p1"><span class="Apple-converted-space">  </span>`artist_website` varchar(255) DEFAULT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`dimensions` varchar(100) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`date_made` date DEFAULT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`mon_value` int(11) NOT NULL DEFAULT '0',</p>
<p class="p1"><span class="Apple-converted-space">  </span>`location_campus` varchar(50) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`location_name` varchar(50) DEFAULT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`indoor` tinyint(1) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`counter` int(11) NOT NULL DEFAULT '0',</p>
<p class="p1"><span class="Apple-converted-space">  </span>`type` varchar(50) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`shape` varchar(300) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`color` varchar(50) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`art_movement` varchar(50) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`description` varchar(255) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`image` varchar(300) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`tags` varchar(300) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>PRIMARY KEY (`artwork_id`),</p>
<p class="p1"><span class="Apple-converted-space">  </span>KEY `title` (`title`),</p>
<p class="p1"><span class="Apple-converted-space">  </span>KEY `medium` (`medium`,`dimensions`),</p>
<p class="p1"><span class="Apple-converted-space">  </span>KEY `location_name` (`location_name`),</p>
<p class="p1"><span class="Apple-converted-space">  </span>KEY `location_campus` (`location_campus`),</p>
<p class="p1"><span class="Apple-converted-space">  </span>KEY `location_name_2` (`location_name`),</p>
<p class="p1"><span class="Apple-converted-space">  </span>KEY `indoor` (`indoor`)</p>
<p class="p1">) ENGINE=InnoDB<span class="Apple-converted-space">  </span>DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;</p>
<p class="p2"><br></p>
<p class="p1">--</p>
<p class="p1">-- Dumping data for table `artwork`</p>
<p class="p1">--</p>
<p class="p2"><br></p>
<p class="p1">INSERT INTO `artwork` (`artwork_id`, `title`, `availability`, `location_lat`, `location_long`, `artist_name`, `artist_dob`, `artist_pob`, `medium`, `artist_website`, `dimensions`, `date_made`, `mon_value`, `location_campus`, `location_name`, `indoor`, `counter`, `type`, `shape`, `color`, `art_movement`, `description`, `image`, `tags`) VALUES</p>
<p class="p1">(1, 'Manual Collection', 'Most of the time', 29.72, -95.345, 'Manual Suzanne Bloom &amp; Ed Hill', NULL, 'American', 'Archival pigment print, ed: 1/5 inches', 'http://www.manualart.net/', '22 1/2 inches x 32 inches', NULL, 20400, 'Main', 'Roy Cullen, 2nd floor hallway', 0, 0, '', '', '', 'Photography Art', 'In honor of MANUAL’s (Ed and Suzanne’s) 36 year teaching career at UH, this group of ten photographs was purchased for the University of Houston Public Art Collection. MANUAL are regarded as pioneers in digital photography, something we take for granted n', 'manual.png', 'Faculty,Print,Photography,Adventures,Atlas Shredded,Goya and the Impossible,Kett''s Elements,La Musique,Les Cubistes: The Russian Invasion,Number Two,Oliver Twist,Still Life in the Dutch Manner,Thrills'),</p>
<p class="p1">(2, 'Your Move', '', 29.7218, -95.3385, 'Lawrence Argent', NULL, 'Australia', 'Bronze and granite', 'http://www.lawrenceargent.com/', '', NULL, 348500, 'Main', 'Calhoun Lofts courtyard', 0, 0, 'Sculpture', 'Bowling pins,Gourds', 'Multi-Colored', 'Contemporary Art', 'Argent used the gourd as an image because of its universality. Gourds appear in most cultures around the world and are utilized in numerous ways from a food source to containers. Like Argents other work, he takes something so recognizable and almost munda', 'lawrenceargent.png', 'Dorm,New,Professional,Texas,Steel,Aluminum'),</p>
<p class="p1">(3, 'Lotus', '', 29.7226, -95.3439, 'Jesus Bautista Moroles', NULL, 'Texas', 'Texas Granite', 'http://www.moroles.com/', '6 feet 4 inches<span class="Apple-converted-space">  </span>x 38 inches x 46 inches', NULL, 6400, 'Main', 'Graduate School of Social Work Courtyard', 0, 0, 'Sculpture', 'Rake', '', 'Contemporary Art', 'Moroles describes granite as ''the core of the universe''. The Corpus Christi, Texas born artist is one of the few sculptors working with granite today. What distinguishes his work from many modern sculptures is his refusal to carve the granite once he has ', 'jesusbautistamoroles.png', 'Flower,Stone, Middle,Central'),</p>
<p class="p1">(4, 'Benches', '', 29.7242, -95.3416, 'Scott Burton', NULL, 'Greensboro, Alabama', 'Laurentian Pink Granite', 'http://en.wikipedia.org/wiki/Scott_Burton', '36 inches x 36 inches x 90 inches each', NULL, 90000, 'Main', 'Hines School of Architecture Entrance', 0, 0, 'Sculpture', 'Bench', 'Brown', 'Minimalism Art', 'Scott Burton explored the physical and psychological relationship between furniture and sculpture. His greatest achievements lie in his forays into public art, which evolved in accordance with his belief that art should ''''place itself not in front of, but', 'scottburton.png', 'Seating,Arts,Furniture'),</p>
<p class="p1">(5, 'Flow', '', 29.7169, -95.3391, 'Kendall Buster', NULL, 'America', 'PVC mesh and powder coated steel', '', '18 inches x 240 inches x 180 inches', NULL, 350000, 'Main', 'Health &amp; Biomedical Student Entrance', 0, 0, 'Sculpture', '', 'White', 'Abstract Art', 'Kendall Buster is known for her hybrid sculptures that reference biological and architectural forms.<span class="Apple-converted-space">  </span>Flow was created specifically for this site because of its relationship to the eye. Buster investigated the layers of lenses I the eye and it’s fluid nat', 'kendallbuster.png', 'Interior,Woman'),</p>
<p class="p1">(6, 'Houston Radio Radar Reflectors', '', 29.7201, -95.3485, 'Nathan Carter', NULL, 'America', 'painted steel', '', '', NULL, 0, 'Main', 'Cougar Place', 0, 0, 'Sculpture', 'Wire', 'Multi-Colored', 'Abstract Art', 'In both his sculptures and his paintings, Nathan Carter uses a specific lexicon of shapes, line, and bold color to create a dynamic composition of carefully balanced elements, resulting in a sense of movement even in completely still works. Carter’s artwo', 'nathancarter.png', 'Dorm,Sophomore,Residential,Football stadium,Dining hall'),</p>
<p class="p1">(7, 'Double Physichromie', '', 29.719, -95.3399, 'Carlos Cruz-Diez', NULL, 'Caracas, Venezuela', 'Painted aluminum and steel', 'http://www.cruz-diez.com', '60 feet x 780 inches x 18 inches', NULL, 220000, 'Main', 'Welcome Center/Parking Garage', 0, 0, 'Sculpture', 'S-shaped', 'Multi-Colored,Black and White', 'Op Art', 'Cruz-Diez has consistently worked through his career focusing solely on color, line and (viewer) perception. His visual style can be consistently identified throughout his work spanning his entire career. His work contains an element in which the viewer a', 'carloscruzdiez.png,carloscruzdiez1.png', 'Orientation,Central,Abstract,Steel,Aluminum,Venezuelan'),</p>
<p class="p1">(8, 'Winged Victory', '', 29.7256, -95.3441, 'Stephen De Staebler', NULL, 'St. Louis, MO', 'Bronze', 'http://www.stephendestaebler.com/', '112 inches x 49 1/2<span class="Apple-converted-space">  </span>inches x 20 3/4 inches', NULL, 50000, 'Main', 'Moores School of Music Courtyard', 0, 0, 'Statue', 'Wings,Legs', 'Black and White', 'Contemporary Art', 'He says of his approach to art, ''We are all wounded survivors, alive, but devastated selves, fragmented, isolated -- the condition of modern man.''<span class="Apple-converted-space">  </span>His quote is personified in his bronze sculpture, Winged Woman, 1996.', 'stephendestaebler.png', 'Alumni Center,Arts,Standing,Athletic Center,The Grove'),</p>
<p class="p1">(9, 'Fountain', '', 29.7231, -95.3457, 'Jackie Ferrara', NULL, 'American', 'Red and black granite', 'http://www.jackieferrara.com/', '', NULL, 0, 'Main', 'Science and Engineering Classroom Building', 0, 0, 'Sculpture', '', '', 'Contemporary Art', 'The sculpture of Ferrara is rooted in post-minimalism with her work establishing a counterpoint between real and illusory space. Her forms bring to mind the images of ancient civilizations while at the same time confounding the perceptual talents of her v', 'jackieferrara.png', 'Water fountain,Woman'),</p>
<p class="p1">(10, 'Untitled', '', 29.718, -95.3438, 'Malou Flato', NULL, 'American', 'Ceramic Tile Mural (2)', 'http://www.malouflato.com/', '8 feet x 24 feet', NULL, 39000, 'Main', 'Cougar Place', 0, 0, 'Mural', 'Rectangle', 'Multi-colored', 'Contemporary Art', 'Originally created for the old Cougar Place, these hand-painted tile murals were restored and relocated to Cougar Village. Flato, a native Texan, in inspired directly by her surroundings; friends, family, the landscape. ', 'malouflato.png', 'Orientation,Dorm,Two,1980,Residential,Wall,Ceramics,Tile,Painting,Texas'),</p>
<p class="p1">(11, 'Tower of the Cheyenne', '', 29.7214, -95.343, 'Peter Forakis', NULL, 'America', 'Cor-ten Steel, painted', 'http://peterforakis.com/', '40 feet x 6 feet x 6 feet', NULL, 12000, 'Main', 'Ann Garrett Butler Plaza', 0, 0, 'Sculpture', 'Column', 'Bronze', 'Contemporary Art', 'He is considered to be a forerunner of the 1960s avant-garde movement that used mathematical concepts in the visual arts.<span class="Apple-converted-space">  </span>Using geometric shapes, such as the cube, tetrahedron, and the pyramid, he has transformed them into poetic distortion.His sculpture', 'peterforakis.png', 'Orientation,Stacked,Residential,Fountain,1970'),</p>
<p class="p1">(12, 'Troika', '', 29.724, -95.3454, 'Charles Ginnever', NULL, 'San Mateo, California', 'Cor-ten Steel', 'http://www.chuckginnever.com/', '13 feet x 16 feet x 12 feet', NULL, 50000, 'Main', 'Science and Research II, West Lawn', 0, 0, 'Sculpture', 'Cube Box', '', 'Abstract Art', 'Complex formal structures of striking coherence and energy, Ginnever’s sculptures are something more. The folding and unfolding of planar form mirror the work’s effect of opening up unnoticed depths in the flow of mundane experienceGinnever’s work is usua', 'charlesginnever.png', 'Central'),</p>
<p class="p1">(13, 'Healing Nature', '', 29.7185, -95.3382, 'Tim Glover', NULL, 'American', 'Stainless steel and aluminum', 'http://gloverart.com/index.html', 'column: 51 feet x 14 feet diameter; Canopy: 40 feet diameter; 76 welded leaves', NULL, 345000, 'Main', 'Wellness &amp; Recreation Center Entrance and Rotunda', 0, 0, 'Sculpture', 'Hourglass', 'Yellow', 'Contemporary Art', '', 'timglover.png', 'Orientation,2000,Biomedical'),</p>
<p class="p1">(14, 'Big Orange', '', 29.7269, -95.3407, 'Willi Gutmann', NULL, 'Switzerland', 'Painted Steel', 'http://www.willigutmann.ch/', '14 feet 2 inches x 11 feet 8 inches x 4 1/4 inches', NULL, 10000, 'Main', 'General Services Building, Front Lawn', 0, 0, 'Sculpture', 'Circle Diamond', 'Yellow; Orange', 'Contemporary Art', 'Willie Gutmann began his career as an architecture and designer, but moved on to sculpture in the 1960’s. His sculptures are designed with geometrics shapes that move into different forms. Gutmann’s largest sculpture is 84 feet tall and on display at the ', 'willigutmann.png', 'Half,Square in the middle,Cullen North'),</p>
<p class="p1">(15, 'Modulation', '', 29.7264, -95.3391, 'Ralph Helmick', NULL, 'American', 'Mixed media', 'http://www.helmicksculpture.com/rabble.html', '13 1/2 feet x 8.5 feet x 10.5 feet', NULL, 75100, 'Main', 'Melcher Center for Public Broadcasting', 0, 0, 'Sculpture', 'Face', 'Multi-Colored', 'Contemporary Art', 'Since 1994, Ralph Helmick and Stuart Schechter, a collaborative duo based in the Boston area, have created some amazing public art around the country. Helmick, an accomplished sculptor and Schechter, an MIT educated rocket scientist with a passion for art', 'helmickschechter.png', 'Found object,Mixed media,Cullen North'),</p>
<p class="p1">(16, 'Round About', '', 29.7166, -95.3397, 'Linda Howard', NULL, 'Illinois', 'Brushed Aluminum', 'http://www.lindahowardsculpture.com/Resume.htm', '16 feet x 6 feet x 16 feet', NULL, 40000, 'Main', 'College of Optometry Building, Front Lawn', 0, 0, 'Sculpture', 'Circle', 'White,Metal', 'Contemporary Art', 'Linda Howard''s sculpture inherits many characteristics of a long modern art tradition of metal constructions, but in her hands the potentially cool, mechanical and the intellectual nature of the work is transformed into energy and movement, with an emotio', 'lindahoward.png', 'Recreational and Wellness Center,Biomedical,Eyes,Shiny'),</p>
<p class="p1">(17, 'Fiesta Dances', '', 29.7187, -95.348, 'Luis Jiminez', NULL, 'El Paso, TX', 'Painted Fiberglass', 'http://en.wikipedia.org/wiki/Luis_Jim%C3%A9nez_%28sculptor%29', '119 inches x 60 inches x 48 inches', NULL, 345000, 'Main', 'Corner of Wheeler and Cullen', 0, 0, 'Statue', 'Dancing persons', 'Multi-Colored', 'Contemporary Art', 'In Luis Jiménez''s work everything is ''in heat'' or ''on fire'' in all possible senses of those words-as in enflamed by rage or passion, as in activated or ''firing on all cylinders''. This notion of heat is inclusive, conflating the heat of politics with the h', 'luisjiminez.png', 'Dining Hall,Residential,Campus Community Garden,Sophomore,Mexican,Figure,Fiberglass,Faculty'),</p>
<p class="p1">(18, 'Om', '', 29.723, -95.3447, 'Menashe Kadishman', NULL, 'Israel', 'Cor-ten Steel', 'http://www.kadishman.com/', '16 feet x 24 feet 9 inches x 16 1/2<span class="Apple-converted-space">  </span>inches', NULL, 25000, 'Main', 'Science &amp; Research I Building, East Lawn', 0, 0, 'Sculpture', 'Ground,Half circles', '', 'Contemporary Art', 'Unlike other sculptors who work with thick plates of iron and steel, Kadishman goes beyond mere minimalist experimentation with the properties of specific materials. By cutting out forms and bending the thick metal, he achieves a sense of lightness and gr', 'menashekadishman.png', 'Central'),</p>
<p class="p1">(19, 'Waterfall, Stele and River', '', 29.7209, -95.3447, 'Lee Kelly', NULL, 'Idaho', 'Stainless Steel', 'http://www.leekellysculpture.net/', '13 feet 1 inches x 21 feeet 7 inches x 21 feet 8 inches', NULL, 24000, 'Main', 'Cullen Family Plaza', 0, 0, 'Sculpture', 'Slide', '', 'Contemporary Art', 'Kelly’s medium of choice is steel and his work is influenced by modern technology, world travel as well as personal events in his life.<span class="Apple-converted-space">  </span>Kelly’s work has an Asian influence balanced with geometric shapes.<span class="Apple-converted-space">  </span>Kelly’s public work is displayed predominately in', 'leekelly.png', 'Orientation,Fountain,1970'),</p>
<p class="p1">(20, 'Collegium', '', 29.724, -95.343, 'William King', NULL, 'Florida', 'Aluminum', 'http://www.williamkingsculptor.com/William_King/Movie.html', '32 feet x 16 feet x 8 feet', NULL, 47000, 'Main', 'Walkway between Communication and Fine Arts Buildi', 0, 0, 'Statue', 'Three,Tall,Men', 'White,Metal', 'Contemporary Art', 'King’s sculptures are both humorous and intuitive, derived from his observation of life experience In developing his ideas, King usually makes maquettes (a small scale model unfinished architectural work or a sculpture), cut like paper dolls from white in', 'williamking.png', 'Holding hands,Central,Tall'),</p>
<p class="p1">(21, 'Genki', '', 29.7183, -95.3445, 'Denise Kroneman', NULL, 'New York', 'Cement, mirror and ceramic tile', '', '', NULL, 3500, 'Main', 'Justin Dart Center for Students with DisABILITIES', 0, 0, 'Sculpture', 'Abstract', 'Red,White', 'Contemporary Art', '', 'denisekroneman.png', 'Hole yellow,Residential,Texas,Houston,Tile'),</p>
<p class="p1">(22, 'Landscape with Blue Trees', '', 29.7233, -95.3413, 'Jim Love', NULL, 'Texas', 'Steel Pipe and Plate, Bronze Hat and Feet', 'http://www.moodygallery.com/Artists/Love/Jim.html', '18 feet x 34 feet', NULL, 88000, 'Main', 'Courtyard between Cullen College of Engineering an', 0, 0, 'Sculpture', 'Tree Duck', 'Blue, Maroon', 'Contemporary Art', 'Jim Love’s importance as a contemporary Texas artist lies in the simplicity and unpretentiousness of his art. A long time Houston resident, Jim Love grew up in Amarillo. As shy as his humor was wry, Love emerged in the early 1950s as one of the modernist ', 'jimlove.png', 'Duck,Professional'),</p>
<p class="p1">(23, 'Albertus Magnus', '', 29.7237, -95.3382, 'Gerhard Marcks', NULL, 'Berlin, Germany', 'Bronze cast', 'http://www.gerhard-marcks.com/', '245 x 176 x 125 cm; 96.45 x 69.29 x 49.21 in', NULL, 55000, 'Main', 'Bates College of Law', 0, 0, 'Statue', 'Person', 'Black', 'Contemporary Art', 'Born in Berlin, Marks was one of the first teachers at the Bauhaus in Germany from 1919- 1933. His work was declared ''degenerate art'' by the Nazis and forbidden to make art or teach and was fired from the Bauhaus and some of his artwork was confiscated an', 'gerhardmarks.png', 'German,Figure,Law,Philosophy,Professional'),</p>
<p class="p1">(24, 'Sandy in Defined Space', '', 29.7227, -95.3447, 'Richard McDermott Miller', NULL, 'Ohio', 'Bronze', '', '6 feet 4 inches x 38 inches x 46 inches', NULL, 15000, 'Main', 'Science and Research I', 0, 0, 'Sculpture', 'Box,Women,Person', 'Black', 'Contemporary Art', 'Miller modeled the human figure in wax and clay, working from life, then cast it in bronze. The warm individuality of the model is never in doubt. He poses them so naturally that they are people, not nudes. Some have repose and serenity while others have ', 'richardmcdermottmiller.png', 'Central'),</p>
<p class="p1">(25, 'Split Level', '', 29.7194, -95.3413, 'Clement Meadmore', NULL, 'Austrailia', 'Cor-ten Steel', 'http://www.meadmore.com/', '70 inches x 178 inches x 71 inches', NULL, 35000, 'Main', 'Hilton College of Hotel and Restaurant Management ', 0, 0, 'Sculpture', 'Curl,Twist', '', 'Minimalism', 'One of the first sculptors to use cor-ten steel, Meadmore usually does not create sculpture for specific commissions. He instead will choose from existing works that best suit the site. His work has been described as monolithic as he exhibits a constant c', 'clementmeadmore.png', 'Orientation,1970,Central'),</p>
<p class="p1">(26, 'Untitled (100 Chairs)', '', 29.7256, -95.3455, 'Mary Miss', NULL, '', 'Welded aluminum, wire mesh, and native plants', 'http://www.marymiss.com/index_.html', 'variable', NULL, 180000, 'Main', 'Athletic/Alumni Center Building Grounds', 0, 0, 'Sculpture', 'Chairs', 'White,Gray', 'Land Art', 'Miss’s cues come from the physical characteristics of the site, the historic or social resonances that she uncovers during her research, and personal associations that the site conjures up.', 'marymiss.png', 'Fun,Kids,Athletics,Architectual'),</p>
<p class="p1">(27, 'Untitled', '', 29.7245, -95.3454, 'Matt Mullican', NULL, 'American', 'Black Cambrian Granite', 'http://en.wikipedia.org/wiki/Matt_Mullican', '8 feet x 16 inches x 2 inches', NULL, 155000, 'Main', 'Science Center Building Plaza', 0, 0, 'Sculpture', 'Ground', '', 'Contemporary Art', 'The granite has been sandblasted to reveal light grey images of city plans and symbols that examine the concepts of connection and energy, both as physical force and a social phenomenon. Reflecting upon the site and the research to be conducted in, at the', 'mattmullican.png', 'Floor,Central'),</p>
<p class="p1">(28, 'Remembering Next Summer', 'Mon – Wed 7:00am – 12:00am Thurs 7:00am – 1:00am Fri – Sat 7:00am – 2:00am Sun 1:00pm – 12:00am', 29.7198, -95.3402, 'Aaron Parazette', NULL, 'American', 'acrylic on wall', '', '10 x 65 ft', NULL, 0, 'Main', 'UC first floor auditorium lobby', 0, 0, 'Wall Painting', 'Rectangle', 'White,Orange,Yellow', 'Abstract Art', 'Parazette teaches painting here at UH. He created this large-scale painting directly on the wall for the newly renovated UC. His recent work explores color relationships and geometric patterns. Here he creates a dizzying, complex wall of pattern moving in', 'aaronparazette.png', 'Texas,Houston,Faculty,Hard edge painting'),</p>
<p class="p1">(29, 'A Comma A', '', 29.7208, -95.3427, 'Jim Sanborn', NULL, 'Washington D.C.', 'Bronze', 'http://jimsanborn.net/', '60 inches x 180 inches x 180 inches', NULL, 0, 'Main', 'MD Anderson Library, front plaza and interior lobb', 0, 0, 'Sculpture', 'Letters', '', 'Contemporary Art', 'Sanborn is most famous for his ''Kryptos'' sculpture at the Central Intelligence Agency’s headquarters in Langley, Virginia. Composed of lodestone, polished red granite and quartz, ''Kryptos'' features thousands of letter characters containing encrypted messa', 'jimsanborn.png', 'Orientation,Languges,2000,Central'),</p>
<p class="p1">(30, 'Contemplation', '', 29.7235, -95.3434, 'Tom Sayre', NULL, '', 'Painted Cor-ten steel', 'http://www.thomassayre.com/', '8 feet 3 inches x 24 feet x 11 feet', NULL, 15000, 'Main', 'University Center Satellite, East Lawn', 0, 0, 'Sculpture', 'Abstract', 'Black', 'Contemporary Art', 'The sculptor works in the constructivist tradition, using straight-cut steel<span class="Apple-converted-space">  </span>plate and cylinders welded together. Within this straightforward format, he is exploring problems of balance and the relation of shape to space. The complexity of his sculpture ', 'tomsayre.png', 'Cylinders,Planks,Central'),</p>
<p class="p1">(31, 'A Moment in Time', 'Closed on Mondays Tuesday– Friday 10:30 am - 4:30 pm Saturday 4:00 pm - 8:00 pm* Sunday 12:30 am - 2:00 pm* *on performance days only', 29.7243, -95.3437, 'Alyson Shotz', NULL, 'Arizona', 'Glass beads, monofilament', 'http://alysonshotz.com/work/', '11 feet x 14 feet x 14 feet', NULL, 31000, 'Main', 'Wortham Theatre Box Office Lobby', 0, 0, 'Installation', 'String', 'Transparent', 'Contemporary Art', 'Her work, A Moment In Time, includes 2.300 strands of clear glass beads and 110,600 beads total. Her work deals with how our natural environment is perceived, how we treat it, interact with it and understand it.', 'alysonshotz.png', 'Alumni Center,Arts,The Grove'),</p>
<p class="p1">(32, 'Jonah and the Whale', '', 29.7201, -95.351, 'Carroll Simms', NULL, 'Arkansas', 'Bronze', '', '5 feet 10 inches x 35 inches x 10 inches', NULL, 6000, 'Main', 'UH Police Department Entrance', 0, 0, 'Sculpture', '', '', 'Contemporary Art', 'Carroll Sims, an African American artist was faculty member of Texas Southern University and co-founder of the art department.<span class="Apple-converted-space">  </span>He, along with artist John Baggers, was instrumental in the development of the University Art Museum housing an extensive colle', 'carollsimms.png', ''),</p>
<p class="p1">(33, 'The Statue of Four Lies', '', 29.7186, -95.3428, 'The Art Guys', NULL, 'American', 'Bronze, stone, concrete, plantings', 'http://www.theartguys.com/', '', NULL, 350000, 'Main', 'Cougar Villiage, north side, accompanying Codex lo', 0, 0, 'Statue', 'Two Persons', '', 'Contemporary Art', 'The Art Guys, Jack Massing and Michael Galbreth are UH alumni and began making work together while in school 30 years ago. Their work is smart, funny, conceptual and heavily performance based. The Statue of Four Lies was inspired by the Statue of Three Li', 'theartguys.png', 'Orientation,Dorm,Latin,Residential,Mystery,Figure,Texas,Houston,Alumni'),</p>
<p class="p1">(34, 'Windows on the World', 'Closed on Mondays Tuesday- Friday 10:30 am - 4:30 pm Saturday 4:00 pm - 8:00 pm* Sunday 12:30 am - 2:00pm* *on performance days only', 29.7243, -95.3439, 'Al Souza', NULL, 'Massachusetts', 'Puzzle parts and glue on wood', 'http://www.moodygallery.com/artists/souza/al.html', '72 inches diameter', NULL, 18000, 'Main', 'Wortham Theater Lobby', 0, 0, 'Painting', '', '', 'Contemporary Art', '', 'alsouza.png', 'faculty,New Acquisitions'),</p>
<p class="p1">(35, 'Untitled', 'Closed on Mondays Tuesday– Friday 10:30 am - 4:30 pm Saturday 4:00 pm - 8:00 pm* Sunday 12:30 am - 2:00 pm* *on performance days only', 29.7243, -95.3438, 'Gael Stack', NULL, 'Illinois', 'Oil on canvas', 'http://www.moodygallery.com/Artists/Stack/Gael.html', '84 inches x 64 inches', NULL, 18000, 'Main', 'Wortham Theater Lobby', 0, 0, 'Painting', '', '', 'Contemporary Art', '', 'gaelstack.png', 'Houston,faculty,Arts'),</p>
<p class="p1">(36, 'Euphonia', 'Open on performance days only', 29.7256, -95.3443, 'Frank Stella', NULL, 'Massachusetts', 'Acrylic on canvas', 'http://en.wikipedia.org/wiki/Frank_Stella', '5000 sq. ft.', NULL, 2000000, 'Main', 'Moores Opera House Lobby and Performance Hall', 0, 0, 'Painting', 'Ceiling', 'Multi-Colored', 'Abstract Art', 'Stella created the aptly titled Euphonia in 1997 for the Moores Opera House on the main campus of UH. With the help of a team of local artists, he opened a temporary studio in Houston to produce this large scale work. Euphonia is still the largest piece i', 'frankstella.png', 'Biggest,The Grove,Arts,2 million Collage'),</p>
<p class="p1">(37, 'Shine and Rise', 'Monday-Thursday: 8 a.m.-7 p.m.Friday: 8 a.m.-5 p.m.', 29.7208, -95.3423, 'Randy Twaddle', NULL, '', 'Charcoal on canvas', 'http://www.randytwaddle.com/index.htm', 'Diptych 9 feet x 13 feet each', NULL, 50000, 'Main', 'Honors College Commons', 0, 0, 'Wall Painting', 'Rectangle', 'Black and White', 'Contemporary Art', 'The full text reads: Shine and rise, gentleman and ladies! Smell the coffee and wake up! Forget and forgive circumstance and pomp. Learn and live nothing but the truth and the whole truth, for all and once, over and over… ever and forever. Shine and Rise ', 'randytwaddle.png', 'Text,Drawing,Houston,Texas,Central'),</p>
<p class="p1">(38, 'Ali', '', 29.7237, -95.3422, 'Brian Wall', NULL, 'England', 'Painted Steel', '', '', NULL, 30000, 'Main', 'Berm, East of Technology Building', 0, 0, 'Sculpture', 'Abstract Circle', 'Black', 'Contemporary Art', 'Despite the austerity and ''toughness'' of Wall’s steel beams, circles, squares, and tubes, Wall’s work – both the small and large-scale pieces – conveys a delicacy and formalism that belies the strength of his material. The surfaces are waxed to reveal the', 'brianwall.png', 'Architecture College,Engineering,UC Satellite,Benches,Central'),</p>
<p class="p1">(39, 'Cougars', '', 29.7206, -95.3441, 'R.T. Wallen', NULL, 'American', '', '', '', NULL, 0, '', 'Cullen Family Plaza', 0, 0, '', '', '', 'Contemporary Art', 'The bronze sculptures were executed by internationally known Juneau, Alaska-based artist, R.T. ''Skip'' Wallen. Wallen is a sculptor and printmaker from Juneau, Alaska. He has been celebrating Alaska in drawings, paintings and stone lithographs since its te', 'rtwallen.png', '');</p>
<p class="p2"><br></p>
<p class="p1">-- --------------------------------------------------------</p>
<p class="p2"><br></p>
<p class="p1">--</p>
<p class="p1">-- Table structure for table `authorities`</p>
<p class="p1">--</p>
<p class="p2"><br></p>
<p class="p1">CREATE TABLE IF NOT EXISTS `authorities` (</p>
<p class="p1"><span class="Apple-converted-space">  </span>`username` varchar(50) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`authority` varchar(50) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>UNIQUE KEY `ix_auth_username` (`username`,`authority`)</p>
<p class="p1">) ENGINE=InnoDB DEFAULT CHARSET=latin1;</p>
<p class="p2"><br></p>
<p class="p1">--</p>
<p class="p1">-- Dumping data for table `authorities`</p>
<p class="p1">--</p>
<p class="p2"><br></p>
<p class="p1">INSERT INTO `authorities` (`username`, `authority`) VALUES</p>
<p class="p1">('Admin', 'ROLE_ADMIN'),</p>
<p class="p1">('mguidry3@uh.edu', 'ROLE_USER'),</p>
<p class="p1">('Root', 'ROLE_ROOT'),</p>
<p class="p1">('User', 'ROLE_USER'),</p>
<p class="p1">('Visitor', 'ROLE_VISITOR');</p>
<p class="p2"><br></p>
<p class="p1">-- --------------------------------------------------------</p>
<p class="p2"><br></p>
<p class="p1">--</p>
<p class="p1">-- Table structure for table `group_data`</p>
<p class="p1">--</p>
<p class="p2"><br></p>
<p class="p1">CREATE TABLE IF NOT EXISTS `group_data` (</p>
<p class="p1"><span class="Apple-converted-space">  </span>`id` int(11) NOT NULL AUTO_INCREMENT,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`name` varchar(40) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`description` varchar(200) DEFAULT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`creation_timestamp` datetime DEFAULT CURRENT_TIMESTAMP,</p>
<p class="p1"><span class="Apple-converted-space">  </span>PRIMARY KEY (`id`),</p>
<p class="p1"><span class="Apple-converted-space">  </span>UNIQUE KEY `name` (`name`)</p>
<p class="p1">) ENGINE=InnoDB<span class="Apple-converted-space">  </span>DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;</p>
<p class="p2"><br></p>
<p class="p1">--</p>
<p class="p1">-- Dumping data for table `group_data`</p>
<p class="p1">--</p>
<p class="p2"><br></p>
<p class="p1">INSERT INTO `group_data` (`id`, `name`, `description`, `creation_timestamp`) VALUES</p>
<p class="p1">(15, 'TestGroup', 'This is the description, ''user'' is the group manager', '2014-07-24 10:29:42');</p>
<p class="p2"><br></p>
<p class="p1">-- --------------------------------------------------------</p>
<p class="p2"><br></p>
<p class="p1">--</p>
<p class="p1">-- Table structure for table `login`</p>
<p class="p1">--</p>
<p class="p2"><br></p>
<p class="p1">CREATE TABLE IF NOT EXISTS `login` (</p>
<p class="p1"><span class="Apple-converted-space">  </span>`username` varchar(50) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`password` varchar(128) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`enabled` tinyint(1) NOT NULL DEFAULT '1',</p>
<p class="p1"><span class="Apple-converted-space">  </span>`id` int(11) NOT NULL AUTO_INCREMENT,</p>
<p class="p1"><span class="Apple-converted-space">  </span>PRIMARY KEY (`id`),</p>
<p class="p1"><span class="Apple-converted-space">  </span>UNIQUE KEY `username` (`username`)</p>
<p class="p1">) ENGINE=InnoDB<span class="Apple-converted-space">  </span>DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;</p>
<p class="p2"><br></p>
<p class="p1">--</p>
<p class="p1">-- Dumping data for table `login`</p>
<p class="p1">--</p>
<p class="p2"><br></p>
<p class="p1">INSERT INTO `login` (`username`, `password`, `enabled`, `id`) VALUES</p>
<p class="p1">('Root', 'test', 1, 1),</p>
<p class="p1">('Visitor', 'test', 1, 7),</p>
<p class="p1">('User', 'test', 1, 8),</p>
<p class="p1">('Admin', 'a91646d0a63e7511327e40cd2e31b297e8094e4f22e9c0a866549e4621bff8c190c71c7e9e9a9f40700209583130828f638247d6c080a67b865869ce902bb285', 1, 12),</p>
<p class="p1">('mguidry3@uh.edu', 'fdeb8a146e25b7fe9abae1a3f614846c25ceb9f69b6f479ca2e1b9a5857153a41eb965ed2552dd1f7c527b46063dbd3e92ae3ea51a4aa1dc0cda3f797a1bb972', 1, 13);</p>
<p class="p2"><br></p>
<p class="p1">-- --------------------------------------------------------</p>
<p class="p2"><br></p>
<p class="p1">--</p>
<p class="p1">-- Table structure for table `simple_object`</p>
<p class="p1">--</p>
<p class="p2"><br></p>
<p class="p1">CREATE TABLE IF NOT EXISTS `simple_object` (</p>
<p class="p1"><span class="Apple-converted-space">  </span>`id` int(11) NOT NULL AUTO_INCREMENT,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`name` varchar(40) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`image_folder` varchar(200) DEFAULT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`creation_timestamp` datetime DEFAULT CURRENT_TIMESTAMP,</p>
<p class="p1"><span class="Apple-converted-space">  </span>PRIMARY KEY (`id`),</p>
<p class="p1"><span class="Apple-converted-space">  </span>UNIQUE KEY `name` (`name`)</p>
<p class="p1">) ENGINE=InnoDB<span class="Apple-converted-space">  </span>DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;</p>
<p class="p2"><br></p>
<p class="p1">-- --------------------------------------------------------</p>
<p class="p2"><br></p>
<p class="p1">--</p>
<p class="p1">-- Table structure for table `tours`</p>
<p class="p1">--</p>
<p class="p2"><br></p>
<p class="p1">CREATE TABLE IF NOT EXISTS `tours` (</p>
<p class="p1"><span class="Apple-converted-space">  </span>`tour_id` int(11) NOT NULL AUTO_INCREMENT,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`artwork_included` varchar(255) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`predefined` tinyint(1) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`times_taken` int(11) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`likes` int(11) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`estimated_time` time NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`estimated_distance` int(11) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`title` varchar(50) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`picture` varchar(255) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`creator` varchar(60) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`date_created` date NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`artistic_attributes` set('sculptures','paintings','modern','impressionist') NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>PRIMARY KEY (`tour_id`),</p>
<p class="p1"><span class="Apple-converted-space">  </span>KEY `predefined` (`predefined`,`times_taken`,`likes`,`estimated_time`,`estimated_distance`),</p>
<p class="p1"><span class="Apple-converted-space">  </span>KEY `tour_title` (`title`),</p>
<p class="p1"><span class="Apple-converted-space">  </span>KEY `tour_author` (`creator`,`date_created`),</p>
<p class="p1"><span class="Apple-converted-space">  </span>KEY `artistic_attributes` (`artistic_attributes`)</p>
<p class="p1">) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;</p>
<p class="p2"><br></p>
<p class="p1">-- --------------------------------------------------------</p>
<p class="p2"><br></p>
<p class="p1">--</p>
<p class="p1">-- Table structure for table `user_data`</p>
<p class="p1">--</p>
<p class="p2"><br></p>
<p class="p1">CREATE TABLE IF NOT EXISTS `user_data` (</p>
<p class="p1"><span class="Apple-converted-space">  </span>`username` varchar(50) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`id` int(11) NOT NULL AUTO_INCREMENT,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`firstName` varchar(30) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`lastName` varchar(30) NOT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`city` varchar(20) DEFAULT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`homePhone` varchar(10) DEFAULT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`cellPhone` varchar(10) DEFAULT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`email` varchar(50) DEFAULT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`picture` varchar(200) DEFAULT NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>`insertion_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,</p>
<p class="p1"><span class="Apple-converted-space">  </span>PRIMARY KEY (`id`),</p>
<p class="p1"><span class="Apple-converted-space">  </span>UNIQUE KEY `username` (`username`)</p>
<p class="p1">) ENGINE=InnoDB<span class="Apple-converted-space">  </span>DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;</p>
<p class="p2"><br></p>
<p class="p1">--</p>
<p class="p1">-- Dumping data for table `user_data`</p>
<p class="p1">--</p>
<p class="p2"><br></p>
<p class="p1">INSERT INTO `user_data` (`username`, `id`, `firstName`, `lastName`, `city`, `homePhone`, `cellPhone`, `email`, `picture`, `insertion_date`) VALUES</p>
<p class="p1">('Root', 1, '', '', NULL, NULL, NULL, NULL, NULL, '2014-07-09 16:41:51'),</p>
<p class="p1">('Visitor', 7, 'Client', 'Device', NULL, NULL, NULL, NULL, NULL, '2014-07-18 12:12:54'),</p>
<p class="p1">('User', 8, 'Demo', 'ofUser', NULL, NULL, NULL, NULL, NULL, '2014-07-18 12:14:26'),</p>
<p class="p1">('Admin', 12, 'Demo', 'ofAdmin', NULL, NULL, NULL, NULL, NULL, '2014-07-24 10:38:34'),</p>
<p class="p1">('mguidry3@uh.edu', 13, 'Michael', 'Guidry', NULL, NULL, NULL, 'mguidry3@uh.edu', NULL, '2014-12-01 15:59:19');</p>
<p class="p2"><br></p>
<p class="p1">--</p>
<p class="p1">-- Constraints for dumped tables</p>
<p class="p1">--</p>
<p class="p2"><br></p>
<p class="p1">--</p>
<p class="p1">-- Constraints for table `acl_entry`</p>
<p class="p1">--</p>
<p class="p1">ALTER TABLE `acl_entry`</p>
<p class="p1"><span class="Apple-converted-space">  </span>ADD CONSTRAINT `foreign_fk_4` FOREIGN KEY (`acl_object_identity`) REFERENCES `acl_object_identity` (`id`) ON DELETE CASCADE,</p>
<p class="p1"><span class="Apple-converted-space">  </span>ADD CONSTRAINT `foreign_fk_5` FOREIGN KEY (`sid`) REFERENCES `acl_sid` (`id`) ON DELETE CASCADE;</p>
<p class="p2"><br></p>
<p class="p1">--</p>
<p class="p1">-- Constraints for table `acl_object_identity`</p>
<p class="p1">--</p>
<p class="p1">ALTER TABLE `acl_object_identity`</p>
<p class="p1"><span class="Apple-converted-space">  </span>ADD CONSTRAINT `foreign_fk_3` FOREIGN KEY (`owner_sid`) REFERENCES `acl_sid` (`id`) ON DELETE SET NULL,</p>
<p class="p1"><span class="Apple-converted-space">  </span>ADD CONSTRAINT `foreign_fk_1` FOREIGN KEY (`parent_object`) REFERENCES `acl_object_identity` (`id`),</p>
<p class="p1"><span class="Apple-converted-space">  </span>ADD CONSTRAINT `foreign_fk_2` FOREIGN KEY (`object_id_class`) REFERENCES `acl_class` (`id`);</p>
<p class="p2"><br></p>
<p class="p1">--</p>
<p class="p1">-- Constraints for table `acl_sid`</p>
<p class="p1">--</p>
<p class="p1">ALTER TABLE `acl_sid`</p>
<p class="p1"><span class="Apple-converted-space">  </span>ADD CONSTRAINT `acl_sid_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `user_data` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;</p>
<p class="p2"><br></p>
<p class="p1">--</p>
<p class="p1">-- Constraints for table `authorities`</p>
<p class="p1">--</p>
<p class="p1">ALTER TABLE `authorities`</p>
<p class="p1"><span class="Apple-converted-space">  </span>ADD CONSTRAINT `fk_authorities_users` FOREIGN KEY (`username`) REFERENCES `login` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;</p>
<p class="p2"><br></p>
<p class="p1">--</p>
<p class="p1">-- Constraints for table `login`</p>
<p class="p1">--</p>
<p class="p1">ALTER TABLE `login`</p>
<p class="p1"><span class="Apple-converted-space">  </span>ADD CONSTRAINT `login-&gt;user_data (username)` FOREIGN KEY (`username`) REFERENCES `user_data` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,</p>
<p class="p1"><span class="Apple-converted-space">  </span>ADD CONSTRAINT `login-&gt;user_data (id)` FOREIGN KEY (`id`) REFERENCES `user_data` (`id`) ON DELETE CASCADE;</p>
</body>
</html>
