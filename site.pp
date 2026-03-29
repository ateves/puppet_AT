# This manifest manages a simple file and the Apache web server service.
# For best practices, this code should be part of a proper Puppet module.

# Define a file resource: ensures a file exists at the specified path
file { '/tmp/my_first_puppet_file.txt':
  ensure  => file,                       # Ensures it is a file (can also be 'absent' or 'directory')
  mode    => '0644',                     # Sets file permissions
  content => 'Hello, GitHub! This file was created by Puppet.', # The content of the file
}

# Define a package resource: ensures the apache package is installed
# Note: The package name might vary depending on the OS (e.g., 'httpd' for RHEL/CentOS, 'apache2' for Debian/Ubuntu)
package { 'apache2':
  ensure => installed,
}

# Define a service resource: ensures the apache service is running and enabled at boot
# The 'subscribe' metaphore will restart the service if the package is changed
service { 'apache2':
  ensure    => running,                  # Ensures the service is started
  enable    => true,                     # Ensures the service starts on boot
  subscribe => Package['apache2'],       # Restarts the service if the package is updated
}
