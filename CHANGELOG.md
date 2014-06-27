#2014.06.26 Release 0.0.7

=> Multicore OK.
   
   Known issue:

   With VM wich does not have enough resources, if you want to use multicore,

   the first time you run  GALAXY_RUN_ALL=1 ./run.sh --daemon, one web could not run correctly.

   In that case, simply re-run the command GALAXY_RUN_ALL=1 ./run.sh --daemon.
   
   Or  GALAXY_RUN_ALL=1 ./run.sh --stop-daemon and then GALAXY_RUN_ALL=1 ./run.sh --daemon.



=> When Galaxy is running , there is not login required anymore.

#2014.06.26 Release 0.0.6

=> Corrections one bug in webapp: rewrite_rule is now set correctly with an array.

=> Role basic and multicore runs correctly .

=> In common.yaml , ::webapp::port set to 8081 to avoid conflict between apache and galaxy. 
