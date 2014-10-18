# SMART: Software for Managing Academic Records and Transcripts #

Welcome to the Njala Prototype version of the SMART Project.

#### SMART ####

Smart is a program for managing records needed to support an academic
institution.  It currently supports managing administrative and
academic records in three broad categories: curriculum records,
staff records, and student records.

Smart is built on top of [Ramp] [ramp] (Record and Activity Management
Program), which provides mechanisms for creating _activity pages_
for choosing among various activities and _table settings_ for
viewing and updating records in database tables.  Smart is, then,
primarily a set of customized _activity pages_ and _table settings_,
along with documentation, to support managing administrative and
academic records.
Ramp, in turn, is built on MySQL, PHP, and the Zend Framework.

In time, the plan is to expand Smart to include customized activities
specific to the academic records domain, such as student registration
and generation of transcripts, in addition to the more
general-purpose activities supported by Ramp.


### RELEASE INFORMATION ###

SMART (Njala Prototype) Release 0.9.2.
Released on October 12, 2014.

### SYSTEM REQUIREMENTS ###

See the [RAMP README] [ramp] file for RAMP's System Requirements.

### INSTALLATION ###

Install [Ramp] [ramp], using the Installation Instructions provided with it.
A simplified version of those instructions appear here.

Installing Smart:

1.  Download or clone this repository under the Document Root for
    your server or your personal web page area.

1.  Set up a virtual host for this Smart instance (if possible).

    If you have the appropriate powers on your server, create a virtual host
    for this repository.  (Zend, and therefore RAMP, works better under its
    own virtual host.)  The actual steps to take depend on your operating
    system, but involve adding the virtual host information to your system
    and then restarting the web server.  For example, on a Debian or Ubuntu
    system you would do the following using `sudo`:

    - Copy `smart-njala-proto.conf` to `/etc/apache2/sites-available`.  
    - Edit the `smart-njala-proto.conf` copy in the `sites-available`
        directory to set an appropriate ServerAdmin, ServerName and
        DocumentRoot.  
    - Enable the site:  `a2ensite smart-njala-proto`.  
    - Restart the apache server (_e.g._, `service apache2 reload`).  

1.  Set up the `njala_proto` database:  (The instructions below are for
setting up a demo or development environment; to set up a production
environment, see the full Installation manual.)

    - Go to the `installation/installDB` subdirectory.  
    - Copy createDevelMysqlAccts.sql (_e.g._, to createMysqlAccts.sql) and
        make sure the file is readable only to you.  Edit it and change the
        DBA and Smart usernames and passwords (or _at least_ the passwords) to
        provide the most basic security.  
    - Go into `mysql` as root and read in the new file and `setupSmartDB.sql`:

            SOURCE createMysqlAccts.sql;
            SOURCE setupSmartDB.sql;
            quit

1.  Create a customized configuration file with the correct username and
password:

    - Go to the `configs` subdirectory.  
    - Copy template_custom_properties.ini to `custom_properties.ini` and
      make sure
      the file is readable only to you and the `www-data` group (or whatever
      group your web server is part of).  Edit `custom_properties.ini` and
      change the username and password to the Smart username and password
      set in the `createMysqlAccts.sql` file above.  You may wish to
      customize other properties as well (see the `README` file in the
      `configs` directory for more details).  
    - Create an `application.ini` file that contains the following "building
      block" files in the specified order:
        `ramp_basics.ini`, `ramp_defaults.ini`, `smart_defaults.ini`, and
        `custom_properties.ini`.
      For example,  

            cat ramp_basics.ini ramp_defaults.ini >application.ini
            cat smart_defaults.ini custom_properties.ini >>application.ini

1.  Include basic documentation and adminstrative table settings from Ramp:

    - Create a copy or link of Ramp's `README.md` file, called
      `rampREADME.md`, in the top-level directory of this installation.
    - Then create a copy or link of Ramp's `application/docs` directory,
      called `rampDocs`, under the `docs` directory in this installation.
    - Finally, create a copy or link of Ramp's `application/adminSettings`
      directory, called `rampAdmin`, under the `settings/Admin` directory.

      For example, in the top-level directory (the one containing this
      `README.md` file) the following commands on a Unix/Linux/MacOS
      system would create appropriate symbolic links:

            ln -s ../ramp/README.md rampREADME.md
            cd docs
            ln -s ../../ramp/application/docs rampDocs
            cd ../settings
            ln -s ../../ramp/application/adminSettings Admin/rampAdmin

1.  If you are using git, add the following files and directories 
   to your `.gitignore` file in the top directory of this Smart
   instance (the directory above configs, installation, and public).

            installation/installDB/createMysqlAccts.sql
            configs/custom_properties.ini
            configs/application.ini
            rampREADME.md
            docs/rampDocs
            settings/Admin/rampAdmin

1.  If you are running a browser on the same machine as your server, you
   can bring up the Njala Prototype using the virtual host ServerName
   as the URL (_e.g._, `njala.smart/`).  If not, unless the new virtual
   host is being served by DNS (and, therefore, publicly accessible),
   you will need to make changes on the client machines to see it.
   For example, this might be a matter of editing `/etc/hosts` on
   the client machines and adding lines that resolve the virtual
   server names from the appropriate machine.  For example,

            123.45.0.67     njala.smart  [or whatever name you used]

    If you are not using virtual hosts, you can get to your Njala
    Prototype as a subdirectory under your server name, _e.g._,

            /my.servername.com/smart-njala-prototype/public/

Please see [INSTALL.md] [install] for more detailed information.  (Under construction...)

<h3 id="LICENSE"> LICENSE INFORMATION </h3>

The source files for Ramp/Smart are released under a BSD 2-Clause license.
You can find a copy of this license in [LICENSE.md] [license].

[TODO: Need to choose the correct CC license for documentation.  Do
activity files and table settings fit under software or documentation
for licensing purposes?]

### ACKNOWLEDGEMENTS ###

The Ramp/Smart team would like to thank all the contributors to the
Ramp/Smart project and the institutional supporters who have provided
time, expertise, and money.

Institutional supporters include:

>   Kalamazoo College, Kalamazoo, Michigan, USA  
>   Njala University, Sierra Leone  
>   The Arcus Center for Socal Justice Leadership, Kalamazoo, Michigan, USA  

Individual contributors include:

>   Keaton Adams  
>   Giancarlo Anemone  
>   Alyce Brady  
>   Christopher Cain  
>   Katrina Carlsen  
>   Chris Clerville  
>   Ryan Davis  
>   Ashton Galloway  
>   Guilherme Guedes  
>   Simon Haile  
>   Tristan Kiel  
>   Lucas Kushner  
>   Justin Leatherwood  
>   Tendai Mudyiwa  
>   William Reichle  
>   Renjie Song  
>   Kyle Sunden  
>   Jiakan Wang  
>   Riley Wetzel  

[license-section]: #LICENSE
[ramp]: https://github.com/AlyceBrady/ramp/
[install]: /INSTALL.md
[license]:  /LICENSE.md

