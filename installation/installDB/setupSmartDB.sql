-- Define the Ramp/Smart table schemas and populate with sample data.

--
-- This file contains SQL code to create administrative tables used by
-- Smart and sample Smart tables that have corresponding table settings
-- in the settings/demo directory.
--

--
-- Create Database: `njala_proto`
--

DROP DATABASE IF EXISTS `njala_proto`;
CREATE DATABASE `njala_proto`;

-- Define what "guest" users (those who are not logged in) are
-- authorized to do, create a SMART administrator role, and define what
-- administrative users with that role may do.  As an example, and/or
-- to make development easier, create several test users ("hr", "reg",
-- and "developer") and define what those users may do.

SOURCE createSmartUsersAuths.sql;

-- Create and populate the built-in tables used for record locking.

SOURCE createSmartLocks.sql;

-- Read in various files to set up tables that form the core of an
-- academic records system:
--    - tables for information about academic terms, schools, and departments
--    - tables for information about academic programs / courses of study
--    - tables for information about people generally (names,
--        demographic and contact information, etc) and about
--        staff members more specifically (job titles, contract
--        information, etc.)
--    - tables for information about course modules and specific
--        offerings
--    - tables for information about students and their academic
--        progress
--    - FUTURE: tables that capture degree or program requirements
--

SOURCE smartCoreSetup.sql

SOURCE smartProgramSetup.sql

SOURCE smartPersonStaffSetup.sql

SOURCE smartModuleSetup.sql

SOURCE smartStudentSetup.sql

-- SOURCE smartRequirementsSetup.sql

-- Grant the MySQL accounts created in createSmartMysqlAccts.sql
-- the ability to execute functions and procedures that allow the
-- database to do some of its own consistency maintenance.
--
--      IS THIS NECESSARY?

-- SOURCE grant_func_proc_privs.sql;

