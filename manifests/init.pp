# Class: journald
#
# This module manages journald
#
# === Parameters:
#
# $persist_log::                 By default, the journal stores log data in /run/log/journal/. 
#                                Since /run/ is volatile, log data is lost at reboot. To make the
#                                data persistent, it is sufficient to create /var/log/journal/ 
#                                where systemd-journald will then store the data.
#
# $options::                     a hash with journald parameters
#
class journald (
  $persist_log = $journald::params::persist_log,
  $options = undef
) inherits journald::params {
  if $::osfamily == 'RedHat' and versioncmp($::operatingsystemrelease, '7.0') >= 0 {
    contain journald::config
    contain journald::service

    Class['journald::config'] ~>
    Class['journald::service']
  }
}
