Step 1: Open Eclipse Enterprise Edition.

Step 2: Go inside `Java Resources > src > application.properties` and update the values as below:
Update value for db.username and db.password according to your installed mysql credentials.


Step 3: Right Click on Project > Run as > Maven Build > In the goals field enter "clean install" > apply > run

Step 4: Right Click On Project > Build Path > Configure Build Path > Libraries > Remove and Update Any Libraries if Red Mark Exists > Finish.

Step 5: Right Click on Project > maven > update project > select force update > apply > close

Step 6: Tomcat Configurations:
•If Tomcat Server is not configured in Eclipse :
◦Right Click On Project > Run As > Run On Server > Manually Define a new server > Select server type > select Tomcat v8.0+ > (Select Tomcat V8.0+ Installation Location If Asked) > Next > Add the current project > Finish.
•Else If Tomcat Server is already configured in Eclipse:
◦Right Click On Project > Run As > Run On Server > Select Tomcat Version > Next > Add the project > Finish.<p align='center'>or
You can directly goto server tab, select the tomcat server and use the debug or run button to start the previously ran project

Step 7: Check Running The Site At
http://localhost:8080/shopping-cart/

Step 8: The default Username And Password For User Is "guest@gmail.com" And "guest"


-----------------------------------------------------------------------------------------------------------------------------------------------
For db connection and executing the script
Open cmd and type mysql -u <username> -p
if asked for password then enter the password to continue
then copy the content from .sql file and paste and click enter
