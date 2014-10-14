<?php

// Define the application environment
defined('APPLICATION_ENV')
    || define('APPLICATION_ENV',
        (getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'njala_prototype'));

echo "<html><body>\n";
echo "<p>This is a simple test that this server can display a basic
      web page.</p>
      <p>The APPLICATION_ENV has been set to " . APPLICATION_ENV . ".</p>";
echo "</body></html>\n";

?>
