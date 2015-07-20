# Class: journald
#
# This module manages journald
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class journald ($enable = false, $options = undef) inherits journald::params {
  if $::osfamily == 'RedHat' and versioncmp($::operatingsystemrelease, '7.0') >= 0 {
    contain journald::config
    contain journald::service

    Class['journald::config'] ~>
    Class['journald::service']
  }
}
