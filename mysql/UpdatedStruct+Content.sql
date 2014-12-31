-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 01, 2015 at 12:27 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `publicartapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `acl_class`
--

CREATE TABLE IF NOT EXISTS `acl_class` (
`id` bigint(20) NOT NULL,
  `class` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `acl_class`
--

INSERT INTO `acl_class` (`id`, `class`) VALUES
(7, 'dash.pojo.Group'),
(4, 'dash.pojo.User');

-- --------------------------------------------------------

--
-- Table structure for table `acl_entry`
--

CREATE TABLE IF NOT EXISTS `acl_entry` (
`id` bigint(20) NOT NULL,
  `acl_object_identity` bigint(20) NOT NULL,
  `ace_order` int(11) NOT NULL,
  `sid` bigint(20) NOT NULL,
  `mask` int(11) NOT NULL,
  `granting` tinyint(1) NOT NULL,
  `audit_success` tinyint(1) NOT NULL,
  `audit_failure` tinyint(1) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=143 ;

--
-- Dumping data for table `acl_entry`
--

INSERT INTO `acl_entry` (`id`, `acl_object_identity`, `ace_order`, `sid`, `mask`, `granting`, `audit_success`, `audit_failure`) VALUES
(1, 10, 0, 4, 1, 1, 1, 1),
(2, 10, 1, 4, 2, 1, 0, 0),
(127, 46, 0, 35, 1, 1, 0, 0),
(128, 46, 1, 35, 2, 1, 0, 0),
(129, 46, 2, 35, 8, 1, 0, 0),
(130, 45, 0, 34, 1, 1, 0, 0),
(134, 57, 0, 39, 1, 1, 0, 0),
(135, 57, 1, 39, 2, 1, 0, 0),
(136, 57, 2, 39, 8, 1, 0, 0),
(140, 58, 0, 40, 1, 1, 0, 0),
(141, 58, 1, 40, 2, 1, 0, 0),
(142, 58, 2, 40, 8, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `acl_object_identity`
--

CREATE TABLE IF NOT EXISTS `acl_object_identity` (
`id` bigint(20) NOT NULL,
  `object_id_class` bigint(20) NOT NULL,
  `object_id_identity` bigint(20) NOT NULL,
  `parent_object` bigint(20) DEFAULT NULL,
  `owner_sid` bigint(20) DEFAULT NULL,
  `entries_inheriting` tinyint(1) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `acl_object_identity`
--

INSERT INTO `acl_object_identity` (`id`, `object_id_class`, `object_id_identity`, `parent_object`, `owner_sid`, `entries_inheriting`) VALUES
(10, 4, 1, NULL, 4, 0),
(45, 4, 7, NULL, 4, 1),
(46, 4, 8, NULL, 35, 1),
(56, 7, 15, NULL, 35, 1),
(57, 4, 12, NULL, 39, 1),
(58, 4, 13, NULL, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `acl_sid`
--

CREATE TABLE IF NOT EXISTS `acl_sid` (
`id` bigint(20) NOT NULL,
  `principal` tinyint(1) NOT NULL,
  `sid` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `acl_sid`
--

INSERT INTO `acl_sid` (`id`, `principal`, `sid`) VALUES
(39, 1, 'Admin'),
(40, 1, 'mguidry3@uh.edu'),
(4, 1, 'Root'),
(35, 1, 'User'),
(34, 1, 'Visitor');

-- --------------------------------------------------------

--
-- Table structure for table `artwork`
--

CREATE TABLE IF NOT EXISTS `artwork` (
`artwork_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `availability` varchar(200) DEFAULT NULL,
  `location_lat` decimal(16,8) NOT NULL,
  `location_long` decimal(16,8) NOT NULL,
  `artist_name` varchar(100) NOT NULL,
  `artist_dob` date DEFAULT NULL,
  `artist_pob` varchar(100) DEFAULT NULL,
  `medium` varchar(100) NOT NULL DEFAULT '',
  `artist_website` varchar(255) DEFAULT NULL,
  `dimensions` varchar(100) NOT NULL,
  `date_made` date DEFAULT NULL,
  `mon_value` int(11) NOT NULL DEFAULT '0',
  `location_campus` varchar(100) NOT NULL,
  `location_name` varchar(100) DEFAULT NULL,
  `indoor` tinyint(1) NOT NULL,
  `counter` int(11) NOT NULL DEFAULT '0',
  `type` varchar(100) NOT NULL,
  `shape` varchar(300) NOT NULL,
  `color` varchar(250) NOT NULL,
  `art_movement` varchar(100) NOT NULL,
  `description` varchar(10000) NOT NULL,
  `image` varchar(300) NOT NULL,
  `tags` varchar(512) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `artwork`
--

INSERT INTO `artwork` (`artwork_id`, `title`, `availability`, `location_lat`, `location_long`, `artist_name`, `artist_dob`, `artist_pob`, `medium`, `artist_website`, `dimensions`, `date_made`, `mon_value`, `location_campus`, `location_name`, `indoor`, `counter`, `type`, `shape`, `color`, `art_movement`, `description`, `image`, `tags`) VALUES
(1, 'Manual Collection', 'Most of the time', '29.72004200', '-95.34500700', 'Manual Suzanne Bloom & Ed Hill', NULL, 'American', 'Archival pigment print, ed: 1/5 inches', 'http://www.manualart.net/', '22 1/2 inches x 32 inches', NULL, 20400, 'Main', 'Roy Cullen, 2nd floor hallway', 1, 0, '', '', '', 'Photography Art', 'In honor of MANUAL’s (Ed and Suzanne’s) 36 year teaching career at UH, this group of ten photographs was purchased for the University of Houston Public Art Collection. MANUAL are regarded as pioneers in digital photography, something we take for granted now.  Together they have influenced many students and in a broader scope, have had an important impact on how photographs are made and what we consider a photograph. ', 'manual.png', 'Faculty, Print, Photography, Adventures, Atlas Shredded, Goya and the Impossible, Kett''s Elements, La Musique, Les Cubistes: The Russian Invasion, Number Two, Oliver Twist, Still Life in the Dutch Manner, Thrills'),
(2, 'Your Move', '', '29.72183900', '-95.33854300', 'Lawrence Argent', NULL, 'Australia', 'Bronze and granite', 'http://www.lawrenceargent.com/', '', NULL, 348500, 'Main', 'Calhoun Lofts courtyard', 0, 0, 'Sculpture', 'Bowling pins, Gourds', 'Multi-Colored', 'Contemporary Art', 'Argent used the gourd as an image because of its universality. Gourds appear in most cultures around the world and are utilized in numerous ways from a food source to containers. Like Argents other work, he takes something so recognizable and almost mundane and blows it up to a scale that you have to pay attention to and consider in a new light. These two hand-carved granite gourds and one bronze gourd sit atop a granite paver system also designed by Argent. They have an otherworldly presence like something out of a fairy tale. Argent is also very well known for his huge blue bear in Denver. ', 'lawrenceargent.png', 'Dorm, New, Professional, Texas, Steel, Aluminum'),
(3, 'Lotus', '', '29.72257200', '-95.34390300', 'Jesus Bautista Moroles', NULL, 'Texas', 'Texas Granite', 'http://www.moroles.com/', '6 feet 4 inches  x 38 inches x 46 inches', NULL, 6400, 'Main', 'Graduate School of Social Work Courtyard', 0, 0, 'Sculpture', 'Rake', '', 'Contemporary Art', 'Moroles describes granite as ''the core of the universe''. The Corpus Christi, Texas born artist is one of the few sculptors working with granite today. What distinguishes his work from many modern sculptures is his refusal to carve the granite once he has hauled it from the quarries. He prefers working from pieces that suggest to him their final form and their relation to pre-historic entities. He desires to expose the stone to let people see it as it actually exists. Lotus offers a contrast of rough and smooth surfaces, it contains broken and unreflected color, the natural against the mechanical. It has a rhythm of grace, texture and form.', 'jesusbautistamoroles.png', 'Flower, Stone,  Middle, Central'),
(4, 'Benches', '', '29.72419900', '-95.34161100', 'Scott Burton', NULL, 'Greensboro, Alabama', 'Laurentian Pink Granite', 'http://en.wikipedia.org/wiki/Scott_Burton', '36 inches x 36 inches x 90 inches each', NULL, 90000, 'Main', 'Hines School of Architecture Entrance', 0, 0, 'Sculpture', 'Bench', 'Brown', 'Minimalism Art', 'Scott Burton explored the physical and psychological relationship between furniture and sculpture. His greatest achievements lie in his forays into public art, which evolved in accordance with his belief that art should ''''place itself not in front of, but around, behind, underneath (literally) the audience.'''' By the end of his life, Mr. Burton''s simple yet eye-catching benches, stools and chairs, cut from smooth and sometimes jagged pieces of granite, could often befound with people sitting on them. Burton did not consider his pieces complete until people were utilizing them.', 'scottburton.png', 'Seating, Arts, Furniture'),
(5, 'Flow', '', '29.71688200', '-95.33904800', 'Kendall Buster', NULL, 'America', 'PVC mesh and powder coated steel', '', '18 inches x 240 inches x 180 inches', NULL, 350000, 'Main', 'Health & Biomedical Student Entrance', 1, 0, 'Sculpture', '', 'White', 'Abstract Art', 'Kendall Buster is known for her hybrid sculptures that reference biological and architectural forms.  Flow was created specifically for this site because of its relationship to the eye. Buster investigated the layers of lenses I the eye and it’s fluid nature and abstracted that information into this multilayered form that hovers above you. It’s a rather complex form, made of many elements and takes on new forms as you view it from different angles.', 'kendallbuster.png', 'Interior, Woman'),
(6, 'Houston Radio Radar Reflectors', '', '29.72007500', '-95.34849900', 'Nathan Carter', NULL, 'America', 'painted steel', '', '', NULL, 0, 'Main', 'Cougar Place', 0, 0, 'Sculpture', 'Wire', 'Multi-Colored', 'Abstract Art', 'In both his sculptures and his paintings, Nathan Carter uses a specific lexicon of shapes, line, and bold color to create a dynamic composition of carefully balanced elements, resulting in a sense of movement even in completely still works. Carter’s artwork is inspired by numerous aspects of contemporary society: modes of transportation, mass communication devices, sports insignias, and architecture for mass gatherings like stadiums and parade grounds. His work makes reference to modernist artists in the early 20th century like Alexander Calder. Deeply rooted in a fascination with how visual abstract codes represent a means of communication, Carter’s free-form compositions are simultaneously non-objective and referential. ', 'nathancarter.png', 'Dorm, Sophomore, Residential, Football stadium, Dining hall'),
(7, 'Double Physichromie', '', '29.71896800', '-95.33987600', 'Carlos Cruz-Diez', NULL, 'Caracas, Venezuela', 'Painted aluminum and steel', 'http://www.cruz-diez.com', '60 feet x 780 inches x 18 inches', NULL, 220000, 'Main', 'Welcome Center/Parking Garage', 0, 0, 'Sculpture', 'S-shaped', 'Multi-Colored, Black and White', 'Op Art', 'Cruz-Diez has consistently worked through his career focusing solely on color, line and (viewer) perception. His visual style can be consistently identified throughout his work spanning his entire career. His work contains an element in which the viewer actively participates in viewing the work because the color changes and presents a sensation of movement as the relative position of the viewer changes. ', 'carloscruzdiez.png,carloscruzdiez1.png', 'Orientation, Central, Abstract, Steel, Aluminum, Venezuelan'),
(8, 'Winged Victory', '', '29.72559500', '-95.34412400', 'Stephen De Staebler', NULL, 'St. Louis, MO', 'Bronze', 'http://www.stephendestaebler.com/', '112 inches x 49 1/2  inches x 20 3/4 inches', NULL, 50000, 'Main', 'Moores School of Music Courtyard', 0, 0, 'Statue', 'Wings, Legs', 'Black and White', 'Contemporary Art', 'He says of his approach to art, ''We are all wounded survivors, alive, but devastated selves, fragmented, isolated -- the condition of modern man.''  His quote is personified in his bronze sculpture, Winged Woman, 1996.', 'stephendestaebler.png', 'Alumni Center, Arts, Standing, Athletic Center, The Grove'),
(9, 'Fountain', '', '29.72314200', '-95.34570000', 'Jackie Ferrara', NULL, 'American', 'Red and black granite', 'http://www.jackieferrara.com/', '', NULL, 0, 'Main', 'Science and Engineering Classroom Building', 0, 0, 'Sculpture', '', '', 'Contemporary Art', 'The sculpture of Ferrara is rooted in post-minimalism with her work establishing a counterpoint between real and illusory space. Her forms bring to mind the images of ancient civilizations while at the same time confounding the perceptual talents of her viewers. She seeks a means in which would inspire an object to appear both contemporary and cast in the mystery on an artifact. Although structurally rigorous, it power lies in its simplicity.', 'jackieferrara.png', 'Water fountain, Woman'),
(10, 'Untitled', '', '29.71804500', '-95.34376700', 'Malou Flato', NULL, 'American', 'Ceramic Tile Mural (2)', 'http://www.malouflato.com/', '8 feet x 24 feet', NULL, 39000, 'Main', 'Cougar Place', 0, 0, 'Mural', 'Rectangle', 'Multi-colored', 'Contemporary Art', 'Originally created for the old Cougar Place, these hand-painted tile murals were restored and relocated to Cougar Village. Flato, a native Texan, in inspired directly by her surroundings; friends, family, the landscape. ', 'malouflato.png', 'Orientation, Dorm, Two, 1980, Residential, Wall, Ceramics, Tile, Painting, Texas'),
(11, 'Tower of the Cheyenne', '', '29.72136700', '-95.34295800', 'Peter Forakis', NULL, 'America', 'Cor-ten Steel, painted', 'http://peterforakis.com/', '40 feet x 6 feet x 6 feet', NULL, 12000, 'Main', 'Ann Garrett Butler Plaza', 0, 0, 'Sculpture', 'Column', 'Bronze', 'Contemporary Art', 'He is considered to be a forerunner of the 1960s avant-garde movement that used mathematical concepts in the visual arts.  Using geometric shapes, such as the cube, tetrahedron, and the pyramid, he has transformed them into poetic distortion.His sculptures appear to go against the very laws of gravity and float with grace.  Tower of Cheyenne is a 31’ Cor-ten sculpture fabricated from multiple welded segments. With its abstract simple form, its geometric shapes are suggestive of the patterns of Indian rugs and baskets. Its massiveness and its ambiguous balance reach into space with a repeating zig-zag pattern. The three primary vertical zig-zag segments are arranged in an equilateral triangle joined internally at sex points which if viewed from above or below create an additional zig-zag effect. The overall effect of the vertical and horizontal components is to create an almost infinite variety of repetitive closed internal and open external zig-zag shapes.', 'peterforakis.png', 'Orientation, Stacked, Residential, Fountain, 1970'),
(12, 'Troika', '', '29.72396800', '-95.34539400', 'Charles Ginnever', NULL, 'San Mateo, California', 'Cor-ten Steel', 'http://www.chuckginnever.com/', '13 feet x 16 feet x 12 feet', NULL, 50000, 'Main', 'Science and Research II, West Lawn', 0, 0, 'Sculpture', 'Cube Box', '', 'Abstract Art', 'Complex formal structures of striking coherence and energy, Ginnever’s sculptures are something more. The folding and unfolding of planar form mirror the work’s effect of opening up unnoticed depths in the flow of mundane experienceGinnever’s work is usually made to integrate both environment and the sculpture itself. Through the cut-out rectangular shapes in two sides, the landscape is framed within the sculpture. One may view the Troika from different approaches, each providing a blend of the heavy substance, Cor-Ten steel, and the gracefully balanced aspects of the artist’s industrial construction techniques. ', 'charlesginnever.png', ' Central'),
(13, 'Healing Nature', '', '29.71852500', '-95.33819600', 'Tim Glover', NULL, 'American', 'Stainless steel and aluminum', 'http://gloverart.com/index.html', 'column: 51 feet x 14 feet diameter; Canopy: 40 feet diameter; 76 welded leaves', NULL, 345000, 'Main', 'Wellness & Recreation Center Entrance and Rotunda', 0, 0, 'Sculpture', 'Hourglass', 'Yellow', 'Contemporary Art', '', 'timglover.png', 'Orientation, 2000, Biomedical'),
(14, 'Big Orange', '', '29.72693800', '-95.34074200', 'Willi Gutmann', NULL, 'Switzerland', 'Painted Steel', 'http://www.willigutmann.ch/', '14 feet 2 inches x 11 feet 8 inches x 4 1/4 inches', NULL, 10000, 'Main', 'General Services Building, Front Lawn', 0, 0, 'Sculpture', 'Circle Diamond', 'Yellow; Orange', 'Contemporary Art', 'Willie Gutmann began his career as an architecture and designer, but moved on to sculpture in the 1960’s. His sculptures are designed with geometrics shapes that move into different forms. Gutmann’s largest sculpture is 84 feet tall and on display at the Embarcadero Centre in San Francisco. The sculpture is constructed of galvanized steel, painted red and orange.  The sculpture is abstract geometrical forms including two half moons, split horizontally and a square within a circle and ring in the lower half moon.  All the elements are free rotating from a central axis. ', 'willigutmann.png', 'Half, Square in the middle, Cullen North'),
(15, 'Modulation', '', '29.72644300', '-95.33914300', 'Ralph Helmick', NULL, 'American', 'Mixed media', 'http://www.helmicksculpture.com/rabble.html', '13 1/2 feet x 8.5 feet x 10.5 feet', NULL, 75100, 'Main', 'Melcher Center for Public Broadcasting', 1, 0, 'Sculpture', 'Face', 'Multi-Colored', 'Contemporary Art', 'Since 1994, Ralph Helmick and Stuart Schechter, a collaborative duo based in the Boston area, have created some amazing public art around the country. Helmick, an accomplished sculptor and Schechter, an MIT educated rocket scientist with a passion for art, merged talents to imagine, design and realize a number of not only creative art works but engineering marvels. They are most known for suspended pieces made up of hundreds of individual parts hung at just the right heights to create bird, boat and human forms. UH is fortunate to have worked with this duo in their heyday. In 2000, they created Modulation, an enormous head measuring 12 feet high, 8 feet wide, 10 feet deep and suspended in the three story atrium lobby of the Leroy and Lucille Melcher Center for Public Broadcasting, home of KUHF Radio and Television. It is comprised of hundreds of discarded and ''antiquated'' electronic parts like circuit boards, wires, cables, radio tubes, speakers and more all attached to a steel armature. The piece is active as well. Speakers transmit KUHF radio programs, fans spin, video monitors in the eyes display KUHF Television broadcasting. The interior of the head, which can be viewed by standing under it, holds an LED map of the Houston area. The face of Modulation has not specific gender or ethnicity; it is instead an amalgamation of multiple ethnic groups.', 'helmickschechter.png', 'Found object, Mixed media, Cullen North'),
(16, 'Round About', '', '29.71658200', '-95.33966800', 'Linda Howard', NULL, 'Illinois', 'Brushed Aluminum', 'http://www.lindahowardsculpture.com/Resume.htm', '16 feet x 6 feet x 16 feet', NULL, 40000, 'Main', 'College of Optometry Building, Front Lawn', 0, 0, 'Sculpture', 'Circle', 'White, Metal', 'Contemporary Art', 'Linda Howard''s sculpture inherits many characteristics of a long modern art tradition of metal constructions, but in her hands the potentially cool, mechanical and the intellectual nature of the work is transformed into energy and movement, with an emotional content approaching devoutness. Howard is known for her public sculptures made of wheel ground, polished or white painted aluminum square tubes.  Howard’s work is inundated with a light and airy feeling, which seems to float in the space in which it is displayed.', 'lindahoward.png', 'Recreational and Wellness Center, Biomedical, Eyes, Shiny'),
(17, 'Fiesta Dances', '', '29.71868500', '-95.34798200', 'Luis Jiminez', NULL, 'El Paso, TX', 'Painted Fiberglass', 'http://en.wikipedia.org/wiki/Luis_Jim%C3%A9nez_%28sculptor%29', '119 inches x 60 inches x 48 inches', NULL, 345000, 'Main', 'Corner of Wheeler and Cullen', 0, 0, 'Statue', 'Dancing persons', 'Multi-Colored', 'Contemporary Art', 'In Luis Jiménez''s work everything is ''in heat'' or ''on fire'' in all possible senses of those words-as in enflamed by rage or passion, as in activated or ''firing on all cylinders''. This notion of heat is inclusive, conflating the heat of politics with the heat of conflicting relations between nations and peoples. The perception of heat waves, of meltdown, is reinforced by the implication of movement in his work-an amazing accomplishment for static images of the body. His figures imply action in the way they are modeled. Their bodies act against the strain of gravity and respond to the forces of time and weather.', 'luisjiminez.png', 'Dining Hall, Residential, Campus Community Garden, Sophomore, Mexican, Figure, Fiberglass, Faculty'),
(18, 'Om', '', '29.72301700', '-95.34474700', 'Menashe Kadishman', NULL, 'Israel', 'Cor-ten Steel', 'http://www.kadishman.com/', '16 feet x 24 feet 9 inches x 16 1/2  inches', NULL, 25000, 'Main', 'Science & Research I Building, East Lawn', 0, 0, 'Sculpture', 'Ground, Half circles', '', 'Contemporary Art', 'Unlike other sculptors who work with thick plates of iron and steel, Kadishman goes beyond mere minimalist experimentation with the properties of specific materials. By cutting out forms and bending the thick metal, he achieves a sense of lightness and grace in his work despite the mass of his materials.', 'menashekadishman.png', 'Central'),
(19, 'Waterfall, Stele and River', '', '29.72086600', '-95.34470800', 'Lee Kelly', NULL, 'Idaho', 'Stainless Steel', 'http://www.leekellysculpture.net/', '13 feet 1 inches x 21 feeet 7 inches x 21 feet 8 inches', NULL, 24000, 'Main', 'Cullen Family Plaza', 0, 0, 'Sculpture', 'Slide', '', 'Contemporary Art', 'Kelly’s medium of choice is steel and his work is influenced by modern technology, world travel as well as personal events in his life.  Kelly’s work has an Asian influence balanced with geometric shapes.  Kelly’s public work is displayed predominately in the Northwest in parks, museums and Universities. ', 'leekelly.png', 'Orientation, Fountain, 1970'),
(20, 'Collegium', '', '29.72404700', '-95.34302300', 'William King', NULL, 'Florida', 'Aluminum', 'http://www.williamkingsculptor.com/William_King/Movie.html', '32 feet x 16 feet x 8 feet', NULL, 47000, 'Main', 'Walkway between Communication and Fine Arts Buildings', 0, 0, 'Statue', 'Three, Tall, Men', 'White, Metal', 'Contemporary Art', 'King’s sculptures are both humorous and intuitive, derived from his observation of life experience In developing his ideas, King usually makes maquettes (a small scale model unfinished architectural work or a sculpture), cut like paper dolls from white index cards. Simplicity of sculpture describes caricatures of people in daily activities.', 'williamking.png', 'Holding hands, Central, Tall'),
(21, 'Genki', '', '29.71826500', '-95.34445300', 'Denise Kroneman', NULL, 'New York', 'Cement, mirror and ceramic tile', '', '', NULL, 3500, 'Main', 'Justin Dart Center for Students with DisABILITIES', 0, 0, 'Sculpture', 'Abstract', 'Red, White', 'Contemporary Art', '', 'denisekroneman.png', 'Hole yellow, Residential, Texas, Houston, Tile'),
(22, 'Landscape with Blue Trees', '', '29.72327000', '-95.34126100', 'Jim Love', NULL, 'Texas', 'Steel Pipe and Plate, Bronze Hat and Feet', 'http://www.moodygallery.com/Artists/Love/Jim.html', '18 feet x 34 feet', NULL, 88000, 'Main', 'Courtyard between Cullen College of Engineering and Engineering Annex Buildings', 0, 0, 'Sculpture', 'Tree Duck', 'Blue, Maroon', 'Contemporary Art', 'Jim Love’s importance as a contemporary Texas artist lies in the simplicity and unpretentiousness of his art. A long time Houston resident, Jim Love grew up in Amarillo. As shy as his humor was wry, Love emerged in the early 1950s as one of the modernist rebels. Love''s early works were made from objects found in scrap heaps. He welded and transformed items such as plumbing fixtures into fanciful birds, giant flowers and other creatures. He has said of his work that a piece begins with an idea when something ''strikes his fancy'' which he then develops into sculpture. It comes from a creative imagination with a keen sense of the irony, absurdity and humor of life.', 'jimlove.png', 'Duck, Professional'),
(23, 'Albertus Magnus', '', '29.72371700', '-95.33823800', 'Gerhard Marcks', NULL, 'Berlin, Germany', 'Bronze cast', 'http://www.gerhard-marcks.com/', '245 x 176 x 125 cm; 96.45 x 69.29 x 49.21 in', NULL, 55000, 'Main', 'Bates College of Law', 0, 0, 'Statue', 'Person', 'Black', 'Contemporary Art', 'Born in Berlin, Marks was one of the first teachers at the Bauhaus in Germany from 1919- 1933. His work was declared ''degenerate art'' by the Nazis and forbidden to make art or teach and was fired from the Bauhaus and some of his artwork was confiscated and destroyed. In 1943 his studio in Berlin was bombed during WWII resulting in the loss of even more work. After the war, he moved to Cologne to rebuild his life.', 'gerhardmarks.png', 'German, Figure, Law, Philosophy, Professional'),
(24, 'Sandy in Defined Space', '', '29.72272800', '-95.34474100', 'Richard McDermott Miller', NULL, 'Ohio', 'Bronze', '', '6 feet 4 inches x 38 inches x 46 inches', NULL, 15000, 'Main', 'Science and Research I', 0, 0, 'Sculpture', 'Box, Women, Person', 'Black', 'Contemporary Art', 'Miller modeled the human figure in wax and clay, working from life, then cast it in bronze. The warm individuality of the model is never in doubt. He poses them so naturally that they are people, not nudes. Some have repose and serenity while others have a sense of arrested motion that flow into a weightiness that satisfies sculpturally.Miller has said that he approaches the figure as a geometrical shape and is ''interested in the perception of form''. His works are seldom life size preferring the larger or smaller than life scale. Miller also likes to give his models props to work with as in the case of Sandy in Defined Space whose body is reacting to the confines of the square. Negative spaces between her body and the frame she is sitting in create a combination of ''soft'' or suggestive, geometric spaces.', 'richardmcdermottmiller.png', ' Central'),
(25, 'Split Level', '', '29.71943000', '-95.34128200', 'Clement Meadmore', NULL, 'Austrailia', 'Cor-ten Steel', 'http://www.meadmore.com/', '70 inches x 178 inches x 71 inches', NULL, 35000, 'Main', 'Hilton College of Hotel and Restaurant Management Entrance', 0, 0, 'Sculpture', 'Curl, Twist', '', 'Minimalism', 'One of the first sculptors to use cor-ten steel, Meadmore usually does not create sculpture for specific commissions. He instead will choose from existing works that best suit the site. His work has been described as monolithic as he exhibits a constant concern to compose within the size of the piece; yet, he is careful to observe its integrity. The essential action in his work is a turning, coiling and uncoiling movement, and a torsion which never breaks with the monolithic integrity of the sculpture. Perfectly contained in space Split Level invites the viewer to explore it from all angles; from its square tube beginning/end to the gentle 360 degree curve that frames the inviting center core. The works balance is intriguingand invites exploration from all sides.', 'clementmeadmore.png', 'Orientation, 1970, Central'),
(26, 'Untitled (100 Chairs)', '', '29.72562900', '-95.34547200', 'Mary Miss', NULL, '', 'Welded aluminum, wire mesh, and native plants', 'http://www.marymiss.com/index_.html', 'variable', NULL, 180000, 'Main', 'Athletic/Alumni Center Building Grounds', 0, 0, 'Sculpture', 'Chairs', 'White, Gray', 'Land Art', 'Miss’s cues come from the physical characteristics of the site, the historic or social resonances that she uncovers during her research, and personal associations that the site conjures up.', 'marymiss.png', 'Fun, Kids, Athletics, Architectual'),
(27, 'Untitled', '', '29.72450300', '-95.34542200', 'Matt Mullican', NULL, 'American', 'Black Cambrian Granite', 'http://en.wikipedia.org/wiki/Matt_Mullican', '8 feet x 16 inches x 2 inches', NULL, 155000, 'Main', 'Science Center Building Plaza', 0, 0, 'Sculpture', 'Ground', '', 'Contemporary Art', 'The granite has been sandblasted to reveal light grey images of city plans and symbols that examine the concepts of connection and energy, both as physical force and a social phenomenon. Reflecting upon the site and the research to be conducted in, at the time, new facility superconductivity, and the biochemical and biophysical sciences, the artist has explored areas of language, art, man and his relationship to cities. It was intended that the platforms be used as stages and as seating areas for formal and informal activities as well as for passers-by.', 'mattmullican.png', 'Floor, Central'),
(28, 'Remembering Next Summer', 'Mon – Wed 7:00am – 12:00am Thurs 7:00am – 1:00am Fri – Sat 7:00am – 2:00am Sun 1:00pm – 12:00am', '29.71980100', '-95.34022400', 'Aaron Parazette', NULL, 'American', 'acrylic on wall', '', '10 x 65 ft', NULL, 0, 'Main', 'UC first floor auditorium lobby', 1, 0, 'Wall Painting', 'Rectangle', 'White, Orange, Yellow', 'Abstract Art', 'Parazette teaches painting here at UH. He created this large-scale painting directly on the wall for the newly renovated UC. His recent work explores color relationships and geometric patterns. Here he creates a dizzying, complex wall of pattern moving in and out of multiple vanishing points. It’s a wonderful play on depth and flatness. ', 'aaronparazette.png', 'Texas, Houston, Faculty, Hard edge painting'),
(29, 'A Comma A', '', '29.72084500', '-95.34271100', 'Jim Sanborn', NULL, 'Washington D.C.', 'Bronze', 'http://jimsanborn.net/', '60 inches x 180 inches x 180 inches', NULL, 0, 'Main', 'MD Anderson Library, front plaza and interior lobby', 0, 0, 'Sculpture', 'Letters', '', 'Contemporary Art', 'Sanborn is most famous for his ''Kryptos'' sculpture at the Central Intelligence Agency’s headquarters in Langley, Virginia. Composed of lodestone, polished red granite and quartz, ''Kryptos'' features thousands of letter characters containing encrypted messages. Only a handful of those messages have been cracked.''I wanted to choose text that would peak the interest of the people who view it,'' Sanborn said. ''The issues that are discussed within the text have to do with relationships, and I feel many students can relate to that. I also hope students will interact with each other when translating some of the languages they are unfamiliar with.'' The various texts range from Emily Dickinson to Rumi to Pablo Neruda. During the day the texts can be easily read on the screen and on the surface of the plaza. As the sun moves in its Southerly arc, the texts are clearly projected on the paving. At night, a built-in projector will shine light through the sculpture, reflecting the text onto the library’s exterior walls. In the library’s third-floor reading room, bronze panels along the guardrails also will contain portions of poems and other literature.', 'jimsanborn.png', 'Orientation, Languges, 2000, Central'),
(30, 'Contemplation', '', '29.72345300', '-95.34342900', 'Tom Sayre', NULL, '', ' Painted Cor-ten steel', 'http://www.thomassayre.com/', '8 feet 3 inches x 24 feet x 11 feet', NULL, 15000, 'Main', 'University Center Satellite, East Lawn', 0, 0, 'Sculpture', 'Abstract', 'Black', 'Contemporary Art', 'The sculptor works in the constructivist tradition, using straight-cut steel  plate and cylinders welded together. Within this straightforward format, he is exploring problems of balance and the relation of shape to space. The complexity of his sculpture is based on weight, counterweight, support and thrust, but in a visual sense; he is not so concerned with actual gravity', 'tomsayre.png', 'Cylinders, Planks, Central'),
(31, 'A Moment in Time', 'Closed on Mondays Tuesday– Friday 10:30 am - 4:30 pm Saturday 4:00 pm - 8:00 pm* Sunday 12:30 am - 2:00 pm* *on performance days only', '29.72427400', '-95.34373300', 'Alyson Shotz', NULL, 'Arizona', 'Glass beads, monofilament', 'http://alysonshotz.com/work/', '11 feet x 14 feet x 14 feet', NULL, 31000, 'Main', 'Wortham Theatre Box Office Lobby', 1, 0, 'Installation', 'String', 'Transparent', 'Contemporary Art', 'Her work, A Moment In Time, includes 2.300 strands of clear glass beads and 110,600 beads total. Her work deals with how our natural environment is perceived, how we treat it, interact with it and understand it.', 'alysonshotz.png', 'Alumni Center, Arts, The Grove'),
(32, 'Jonah and the Whale', '', '29.72007400', '-95.35096800', 'Carroll Simms', NULL, 'Arkansas', 'Bronze', '', '5 feet 10 inches x 35 inches x 10 inches', NULL, 6000, 'Main', 'UH Police Department Entrance', 0, 0, 'Sculpture', '', '', 'Contemporary Art', 'Carroll Sims, an African American artist was faculty member of Texas Southern University and co-founder of the art department.  He, along with artist John Baggers, was instrumental in the development of the University Art Museum housing an extensive collection of African American art. ', 'carollsimms.png', ''),
(33, 'The Statue of Four Lies', '', '29.71858900', '-95.34282800', 'The Art Guys', NULL, 'American', 'Bronze, stone, concrete, plantings', 'http://www.theartguys.com/', '', NULL, 350000, 'Main', 'Cougar Villiage, north side, accompanying Codex located in Special Collections', 0, 0, 'Statue', 'Two Persons', '', 'Contemporary Art', 'The Art Guys, Jack Massing and Michael Galbreth are UH alumni and began making work together while in school 30 years ago. Their work is smart, funny, conceptual and heavily performance based. The Statue of Four Lies was inspired by the Statue of Three Lies at Harvard.Four Lies was an effort to one-up Harvard. There are more than four ''lies'' here, well not lies but intentional misinformation. It’s intended to be interactive, the figures are greeting you, come in, take a picture with them. There is also a time capsule in the wall to be opened at UH’s 100th anniversary and there is also an amazing Codex housed in the MD Anderson Library’s Special Collections.', 'theartguys.png', 'Orientation, Dorm, Latin, Residential, Mystery, Figure, Texas, Houston, Alumni, Suneil'),
(34, 'Windows on the World', 'Closed on Mondays Tuesday- Friday 10:30 am - 4:30 pm Saturday 4:00 pm - 8:00 pm* Sunday 12:30 am - 2:00pm* *on performance days only', '29.72433800', '-95.34394500', 'Al Souza', NULL, 'Massachusetts', 'Puzzle parts and glue on wood', 'http://www.moodygallery.com/artists/souza/al.html', '72 inches diameter', NULL, 18000, 'Main', 'Wortham Theater Lobby', 1, 0, 'Painting', '', '', 'Contemporary Art', '', 'alsouza.png', 'faculty, New Acquisitions'),
(35, 'Untitled', 'Closed on Mondays Tuesday– Friday 10:30 am - 4:30 pm Saturday 4:00 pm - 8:00 pm* Sunday 12:30 am - 2:00 pm* *on performance days only', '29.72429600', '-95.34380900', 'Gael Stack', NULL, 'Illinois', 'Oil on canvas', 'http://www.moodygallery.com/Artists/Stack/Gael.html', '84 inches x 64 inches', NULL, 18000, 'Main', 'Wortham Theater Lobby', 1, 0, 'Painting', '', '', 'Contemporary Art', '', 'gaelstack.png', 'Houston, faculty, Arts'),
(36, 'Euphonia', 'Open on performance days only', '29.72562900', '-95.34429000', 'Frank Stella', NULL, 'Massachusetts', 'Acrylic on canvas', 'http://en.wikipedia.org/wiki/Frank_Stella', '5000 sq. ft.', NULL, 2000000, 'Main', 'Moores Opera House Lobby and Performance Hall', 1, 0, 'Painting', 'Ceiling', 'Multi-Colored', 'Abstract Art', 'Stella created the aptly titled Euphonia in 1997 for the Moores Opera House on the main campus of UH. With the help of a team of local artists, he opened a temporary studio in Houston to produce this large scale work. Euphonia is still the largest piece in the UH Collection in terms of scale and budget. It can be best described as a visual cacophony but in a good way.  The lobby of the Opera House has a large 100 foot long barrel vaulted ceiling which Stella covered with a collage of abstracted imagery and patterns. This same imagery and collage technique is also used on the very large scale triptych on the mezzanine level just off the lobby measuring 10 feet tall and 72 feet wide in total. In addition, Stella created another piece on the underside on the catwalk inside the Opera House. Euphonia truly is a gem of the UH Collection.', 'frankstella.png', 'Biggest, The Grove, Arts, 2 million Collage'),
(37, 'Shine and Rise', 'Monday-Thursday: 8 a.m.-7 p.m.Friday: 8 a.m.-5 p.m.', '29.72081100', '-95.34230900', 'Randy Twaddle', NULL, '', 'Charcoal on canvas', 'http://www.randytwaddle.com/index.htm', 'Diptych 9 feet x 13 feet each', NULL, 50000, 'Main', 'Honors College Commons', 1, 0, 'Wall Painting', 'Rectangle', 'Black and White', 'Contemporary Art', 'The full text reads: Shine and rise, gentleman and ladies! Smell the coffee and wake up! Forget and forgive circumstance and pomp. Learn and live nothing but the truth and the whole truth, for all and once, over and over… ever and forever. Shine and Rise is a fully realized example of this more baroque style with radiating lines emanating from behind the word ''truth'',  ironic maybe but thoughtful indeed. Shine and Rise is a collection of clichéd phrases and idioms strung together and reversed to cause the viewer to see, read and consider them in a new context. The banner begins on the left panel, crisscrosses the entire surface, turning upside down, curling on itself and trailing off ending on the right panel. It floats in this space in such a way that letters and words are revealed and concealed requiring the viewer to complete the phrases. The whole piece is meant to be an inspirational verse created specifically for the students of the Honors College.', 'randytwaddle.png', 'Text, Drawing, Houston, Texas, Central'),
(38, 'Ali', '', '29.72365600', '-95.34220700', 'Brian Wall', NULL, 'England', 'Painted Steel', '', '', NULL, 30000, 'Main', 'Berm, East of Technology Building', 0, 0, 'Sculpture', 'Abstract Circle', 'Black', 'Contemporary Art', 'Despite the austerity and ''toughness'' of Wall’s steel beams, circles, squares, and tubes, Wall’s work – both the small and large-scale pieces – conveys a delicacy and formalism that belies the strength of his material. The surfaces are waxed to reveal the tactile nature of the metal or painted a monochromatic color, usually black. In either instance, the result is simplicity, one that is informed by Wall’s interest in Zen philosophy and Japanese calligraphy.', 'brianwall.png', 'Architecture College, Engineering, UC Satellite, Benches, Central'),
(39, 'Cougars', '', '29.72059800', '-95.34413200', 'R.T. Wallen', NULL, 'American', '', '', '', NULL, 0, '', 'Cullen Family Plaza', 0, 0, '', '', '', 'Contemporary Art', 'The bronze sculptures were executed by internationally known Juneau, Alaska-based artist, R.T. ''Skip'' Wallen. Wallen is a sculptor and printmaker from Juneau, Alaska. He has been celebrating Alaska in drawings, paintings and stone lithographs since its territorial days.The life-like quality of the sculptures was due in part to The University of Houston’s Nancy Hixon borrowing for Wallen a cougar skull with dentia (felis concolor) from the Texas Department of Wildlife and Fisheries Sciences at Texas A&M University. Additionally, Wallen spent time sketching and photographing two live cougars in order better understand their movement and muscularity. His primary models were a brother and sister cougar that resided at the MacKenzie Environmental Center in Poynette, Wisconsin.', 'rtwallen.png', '');

-- --------------------------------------------------------

--
-- Table structure for table `authorities`
--

CREATE TABLE IF NOT EXISTS `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authorities`
--

INSERT INTO `authorities` (`username`, `authority`) VALUES
('Admin', 'ROLE_USER'),
('mguidry3@uh.edu', 'ROLE_ADMIN'),
('Root', 'ROLE_ROOT'),
('User', 'ROLE_USER'),
('Visitor', 'ROLE_VISITOR');

-- --------------------------------------------------------

--
-- Table structure for table `group_data`
--

CREATE TABLE IF NOT EXISTS `group_data` (
`id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `creation_timestamp` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `group_data`
--

INSERT INTO `group_data` (`id`, `name`, `description`, `creation_timestamp`) VALUES
(15, 'TestGroup', 'This is the description, ''user'' is the group manager', '2014-07-24 10:29:42');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
`id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `enabled`, `id`) VALUES
('Root', 'test', 1, 1),
('Visitor', 'test', 1, 7),
('User', 'test', 1, 8),
('Admin', 'a91646d0a63e7511327e40cd2e31b297e8094e4f22e9c0a866549e4621bff8c190c71c7e9e9a9f40700209583130828f638247d6c080a67b865869ce902bb285', 1, 12),
('mguidry3@uh.edu', 'fdeb8a146e25b7fe9abae1a3f614846c25ceb9f69b6f479ca2e1b9a5857153a41eb965ed2552dd1f7c527b46063dbd3e92ae3ea51a4aa1dc0cda3f797a1bb972', 1, 13);

-- --------------------------------------------------------

--
-- Table structure for table `simple_object`
--

CREATE TABLE IF NOT EXISTS `simple_object` (
`id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `image_folder` varchar(200) DEFAULT NULL,
  `creation_timestamp` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tours`
--

CREATE TABLE IF NOT EXISTS `tours` (
`tour_id` int(11) NOT NULL,
  `artwork_included` varchar(255) NOT NULL,
  `predefined` tinyint(1) NOT NULL,
  `times_taken` int(11) NOT NULL,
  `likes` int(11) NOT NULL,
  `estimated_time` time NOT NULL,
  `estimated_distance` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `creator` varchar(60) NOT NULL,
  `date_created` date NOT NULL,
  `artistic_attributes` set('sculptures','paintings','modern','impressionist') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_data`
--

CREATE TABLE IF NOT EXISTS `user_data` (
  `username` varchar(50) NOT NULL,
`id` int(11) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `city` varchar(20) DEFAULT NULL,
  `homePhone` varchar(10) DEFAULT NULL,
  `cellPhone` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `picture` varchar(200) DEFAULT NULL,
  `insertion_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `user_data`
--

INSERT INTO `user_data` (`username`, `id`, `firstName`, `lastName`, `city`, `homePhone`, `cellPhone`, `email`, `picture`, `insertion_date`) VALUES
('Root', 1, '', '', NULL, NULL, NULL, NULL, NULL, '2014-07-09 16:41:51'),
('Visitor', 7, 'Client', 'Device', NULL, NULL, NULL, NULL, NULL, '2014-07-18 12:12:54'),
('User', 8, 'Demo', 'ofUser', NULL, NULL, NULL, NULL, NULL, '2014-07-18 12:14:26'),
('Admin', 12, 'Demo', 'ofAdmin', NULL, NULL, NULL, NULL, NULL, '2014-07-24 10:38:34'),
('mguidry3@uh.edu', 13, 'Michael', 'Guidry', NULL, NULL, NULL, 'mguidry3@uh.edu', NULL, '2014-12-01 15:59:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acl_class`
--
ALTER TABLE `acl_class`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique_uk_2` (`class`);

--
-- Indexes for table `acl_entry`
--
ALTER TABLE `acl_entry`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique_uk_4` (`acl_object_identity`,`ace_order`), ADD KEY `foreign_fk_5` (`sid`);

--
-- Indexes for table `acl_object_identity`
--
ALTER TABLE `acl_object_identity`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique_uk_3` (`object_id_class`,`object_id_identity`), ADD KEY `foreign_fk_1` (`parent_object`), ADD KEY `foreign_fk_3` (`owner_sid`);

--
-- Indexes for table `acl_sid`
--
ALTER TABLE `acl_sid`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique_uk_1` (`sid`,`principal`);

--
-- Indexes for table `artwork`
--
ALTER TABLE `artwork`
 ADD PRIMARY KEY (`artwork_id`), ADD KEY `title` (`title`), ADD KEY `medium` (`medium`,`dimensions`), ADD KEY `location_name` (`location_name`), ADD KEY `location_campus` (`location_campus`), ADD KEY `location_name_2` (`location_name`), ADD KEY `indoor` (`indoor`);

--
-- Indexes for table `authorities`
--
ALTER TABLE `authorities`
 ADD UNIQUE KEY `ix_auth_username` (`username`,`authority`);

--
-- Indexes for table `group_data`
--
ALTER TABLE `group_data`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `simple_object`
--
ALTER TABLE `simple_object`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `tours`
--
ALTER TABLE `tours`
 ADD PRIMARY KEY (`tour_id`), ADD KEY `predefined` (`predefined`,`times_taken`,`likes`,`estimated_time`,`estimated_distance`), ADD KEY `tour_title` (`title`), ADD KEY `tour_author` (`creator`,`date_created`), ADD KEY `artistic_attributes` (`artistic_attributes`);

--
-- Indexes for table `user_data`
--
ALTER TABLE `user_data`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acl_class`
--
ALTER TABLE `acl_class`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `acl_entry`
--
ALTER TABLE `acl_entry`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=143;
--
-- AUTO_INCREMENT for table `acl_object_identity`
--
ALTER TABLE `acl_object_identity`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `acl_sid`
--
ALTER TABLE `acl_sid`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `artwork`
--
ALTER TABLE `artwork`
MODIFY `artwork_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `group_data`
--
ALTER TABLE `group_data`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `simple_object`
--
ALTER TABLE `simple_object`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tours`
--
ALTER TABLE `tours`
MODIFY `tour_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_data`
--
ALTER TABLE `user_data`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `acl_entry`
--
ALTER TABLE `acl_entry`
ADD CONSTRAINT `foreign_fk_4` FOREIGN KEY (`acl_object_identity`) REFERENCES `acl_object_identity` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `foreign_fk_5` FOREIGN KEY (`sid`) REFERENCES `acl_sid` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `acl_object_identity`
--
ALTER TABLE `acl_object_identity`
ADD CONSTRAINT `foreign_fk_1` FOREIGN KEY (`parent_object`) REFERENCES `acl_object_identity` (`id`),
ADD CONSTRAINT `foreign_fk_2` FOREIGN KEY (`object_id_class`) REFERENCES `acl_class` (`id`),
ADD CONSTRAINT `foreign_fk_3` FOREIGN KEY (`owner_sid`) REFERENCES `acl_sid` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `acl_sid`
--
ALTER TABLE `acl_sid`
ADD CONSTRAINT `acl_sid_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `user_data` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `authorities`
--
ALTER TABLE `authorities`
ADD CONSTRAINT `fk_authorities_users` FOREIGN KEY (`username`) REFERENCES `login` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `login`
--
ALTER TABLE `login`
ADD CONSTRAINT `login->user_data (id)` FOREIGN KEY (`id`) REFERENCES `user_data` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `login->user_data (username)` FOREIGN KEY (`username`) REFERENCES `user_data` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
