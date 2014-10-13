# SMART: Software for Managing Academic Records and Transcripts #

Welcome to the Njala Prototype version of the SMART Project.

#### SMART ####

Smart is a program based on [RAMP] [ramp]
that provides a set of activity files and
table settings appropriate for managing academic records, including
curriculum records (_e.g._, programs available, course modules, and
course module schedules) and student records (_e.g._, enrolled
program, course module history, test scores).

For more information about Smart, see [About SMART] [aboutSmart].

In time, the plan is to expand Smart to include customized activities
specific to the academic records domain (as opposed to the more
general-purpose activities supported by Ramp).


### RELEASE INFORMATION ###

SMART (Njala Prototype) Release 0.9.2.
Released on October 12, 2014.

### SYSTEM REQUIREMENTS ###

See the [RAMP README] [ramp] file for RAMP's System Requirements.

### INSTALLATION ###

Install [Ramp] [ramp], using the Installation Instructions provided with it.

Download or clone this repository under your server's Document Root or
your personal web page area.

Set up the `njala_proto` database:  (The instructions below are for
setting up a demo or development environment; to set up a production
environment, see the full Installation manual.)

- Go to the `installation` subdirectory.
- Copy createDevelMysqlAccts.sql (e.g., to createMysqlAccts.sql) and
  make sure the file is readable only to you.  Edit it and change the
  DBA and Smart usernames and passwords (or _at least_ the passwords) to
  provide the most basic security.
- Go into `mysql` as root and read in the new file and `setupSmartDB.sql:

    SOURCE createMysqlAccts.sql;
    SOURCE setupSmartDB.sql;
    quit

Create a customized configuration file with the correct username and
password:

- Go to the `configs` subdirectory.
- Copy template_custom_properties.ini to `custom_properties.ini` and make sure
  the file is readable only to you and the `www-data` group (or whatever
  group your web server is part of).  Edit `custom_properties.ini` and
  change the username and password to the Smart username and password
  set in the `createMysqlAccts.sql` file above.  You may wish to
  customize other properties as well (see the `README` file in the
  `configs` directory for more details).
- Create an `application.ini` file that contains the following "building
  block" files in the specified order:
    `ramp_basics.ini`, `ramp_defaults.ini`, `smart_defaults.ini`, and
    `custom_properties.ini
  For example,

    cat ramp_basics.ini ramp_defaults.ini smart_defaults.ini >application.ini
    cat custom_properties.ini >>application.ini

Include basic documentation and adminstrative table settings from Ramp:

- Create a copy or link of Ramp's `application/docs` directory, called
  `rampDocs` under the `docs` directory in this installation.  For example,
  the following command from the `docs` subdirectory on a
  Unix/Linux/MacOS system would create an appropriate symbolic link:

    ln -s ../../ramp/application/docs rampDocs

- Create a copy or link of Ramp's `application/adminSettings` directory,
  called `rampAdmin` under the `settings/Admin` directory in this
  installation.  For example, from the `settings` subdirectory:

    ln -s ../../ramp/application/adminSettings Admin/rampAdmin

- Add the docs/rampDocs and settings/Admin/rampAdmin directories to your
  `.gitignore` file if you are using `git`.

Bring up a Njala Prototype version of Smart in a browser, using the
following URL:
- /smart-njala-prototype/public/

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
[aboutSmart]: /document/index/document/rampDocs%252FsmartAbout.md
[install]: /document/index/document/..%252F..%252Finstallation%252FINSTALL.md
[license]:  /document/index/document/..%252F..%252FLICENSE.md

