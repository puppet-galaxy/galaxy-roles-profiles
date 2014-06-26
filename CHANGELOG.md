#2014.06.26 Release 0.0.7

=> Multicore may to be bugged but I thinks it is only a matter of RAM and cpu. But it works .
   
   In that case, simply re-run the command GALAXY_RUN_ALL=1 ./run.sh --daemon.
   
   Or  GALAXY_RUN_ALL=1 ./run.sh --stop-daemon and then GALAXY_RUN_ALL=1 ./run.sh --daemon.

  "python path is: /home/galaxy/galaxy-dist/eggs/kombu-3.0.12-py2.7.egg, /home/galaxy/galaxy-dist/eggs/anyjson-0.3.3-py2.7.egg, /home/galaxy/galaxy-dist/eggs/numpy-1.6.0-py2.7-linux-x86_64-ucs4.egg, /home/galaxy/galaxy-dist/eggs/pysam-0.4.2_kanwei_b10f6e722e9a-py2.7-linux-x86_64-ucs4.egg, /home/galaxy/galaxy-dist/eggs/mercurial-2.2.3-py2.7-linux-x86_64-ucs4.egg, /home/galaxy/galaxy-dist/eggs/pycrypto-2.5-py2.7-linux-x86_64-ucs4.egg, /home/galaxy/galaxy-dist/eggs/python_lzo-1.08_2.03_static-py2.7-linux-x86_64-ucs4.egg, /home/galaxy/galaxy-dist/eggs/bx_python-0.7.2-py2.7-linux-x86_64-ucs4.egg, /home/galaxy/galaxy-dist/eggs/amqp-1.4.3-py2.7.egg, /home/galaxy/galaxy-dist/eggs/pexpect-2.4-py2.7.egg, /home/galaxy/galaxy-dist/eggs/SQLAlchemy-0.7.9-py2.7-linux-x86_64-ucs4.egg, /home/galaxy/galaxy-dist/eggs/Babel-1.3-py2.7.egg, /home/galaxy/galaxy-dist/eggs/pytz-2013.9-py2.7.egg, /home/galaxy/galaxy-dist/eggs/Mako-0.4.1-py2.7.egg, /home/galaxy/galaxy-dist/eggs/WebHelpers-1.3-py2.7.egg, /home/galaxy/galaxy-dist/eggs/MarkupSafe-0.12-py2.7-linux-x86_64-ucs4.egg, /home/galaxy/galaxy-dist/eggs/WebOb-0.8.5-py2.7.egg, /home/galaxy/galaxy-dist/eggs/Routes-1.12.3-py2.7.egg, /home/galaxy/galaxy-dist/eggs/Cheetah-2.2.2-py2.7-linux-x86_64-ucs4.egg, /home/galaxy/galaxy-dist/eggs/wchartype-0.1-py2.7.egg, /home/galaxy/galaxy-dist/eggs/elementtree-1.2.6_20050316-py2.7.egg, /home/galaxy/galaxy-dist/eggs/docutils-0.7-py2.7.egg, /home/galaxy/galaxy-dist/eggs/PasteDeploy-1.5.0-py2.7.egg, /home/galaxy/galaxy-dist/eggs/Paste-1.7.5.1-py2.7.egg, /home/galaxy/galaxy-dist/lib, /usr/lib/python2.7, /usr/lib/python2.7/plat-linux2, /usr/lib/python2.7/lib-tk, /usr/lib/python2.7/lib-old, /usr/lib/python2.7/lib-dynload, /usr/local/lib/python2.7/dist-packages, /usr/lib/pymodules/python2.7, /usr/lib/python2.7/dist-packages
galaxy.model.migrate.check INFO 2014-06-26 14:45:52,958 At database version 120
Traceback (most recent call last):
  File "/home/galaxy/galaxy-dist/lib/galaxy/webapps/galaxy/buildapp.py", line 39, in app_factory
    app = UniverseApplication( global_conf = global_conf, **kwargs )
  File "/home/galaxy/galaxy-dist/lib/galaxy/app.py", line 46, in __init__
    self._configure_models( check_migrate_databases=True, check_migrate_tools=check_migrate_tools, config_file=config_file )
  File "/home/galaxy/galaxy-dist/lib/galaxy/config.py", line 656, in _configure_models
    verify_tools( self, install_db_url, config_file, install_database_options )
  File "/home/galaxy/galaxy-dist/lib/tool_shed/galaxy_install/migrate/check.py", line 84, in verify_tools
    raise Exception( "Error attempting to update the value of migrate_tools.version: %s" % output )
Exception: Error attempting to update the value of migrate_tools.version: 3 -> 4... 

The NCBI BLAST+ tools have been eliminated from the distribution.  The tools and
datatypes are now available in repositories named ncbi_blast_plus and
blast_datatypes, in the main Galaxy tool shed at http://toolshed.g2.bx.psu.edu.
These repositories will be installed into your local Galaxy instance at the
location discussed above by running the following command.

done
4 -> 5... 
Traceback (most recent call last):
  File "./scripts/manage_tools.py", line 48, in <module>
    main( repository=repo, url=db_url )
  File "/home/galaxy/galaxy-dist/eggs/sqlalchemy_migrate-0.7.2-py2.7.egg/migrate/versioning/shell.py", line 207, in main
    ret = command_func(**kwargs)
  File "/home/galaxy/galaxy-dist/eggs/sqlalchemy_migrate-0.7.2-py2.7.egg/migrate/versioning/api.py", line 186, in upgrade
    return _migrate(url, repository, version, upgrade=True, err=err, **opts)
  File "<string>", line 2, in _migrate
  File "/home/galaxy/galaxy-dist/eggs/sqlalchemy_migrate-0.7.2-py2.7.egg/migrate/versioning/util/__init__.py", line 159, in with_engine
    return f(*a, **kw)
  File "/home/galaxy/galaxy-dist/eggs/sqlalchemy_migrate-0.7.2-py2.7.egg/migrate/versioning/api.py", line 366, in _migrate
    schema.runchange(ver, change, changeset.step)
  File "/home/galaxy/galaxy-dist/eggs/sqlalchemy_migrate-0.7.2-py2.7.egg/migrate/versioning/schema.py", line 89, in runchange
    (self.version, startver))
migrate.exceptions.InvalidVersionError: 5 is not 4

Removing PID file web0.pid" 

=> When Galaxy is running , there is not login required anymore.

#2014.06.26 Release 0.0.6

=> Corrections one bug in webapp: rewrite_rule is now set correctly with an array.

=> Role basic and multicore runs correctly .

=> In common.yaml , ::webapp::port set to 8081 to avoid conflict between apache and galaxy. 
