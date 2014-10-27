PublicArt Backend
==========

Collection of RESTful web service implementation for Public Art on Campus App functions.

The source code is developed as Eclipse Maven project using facets "Dynamic Web Project" and "Java". The backend provides a RESTful web service via Jersey. The security is handled by Spring. We are using Tomcat as servlet container.

Tested with versions: Jersey 2.9 JDK 1.7 Tomcat 7.0

Instruction
Import the CHWApp.sql file included in the mysql directory. This includes all necessary tables for user management and acl.

Change src/resources/webapp/META-INF/context.xml to connect to the database.





