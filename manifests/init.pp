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
# $enable_defaults::             if defaults parameters should be used or not
#
# $options::                     a hash with journald parameters
#
class journald (
  $persist_log = $journald::params::persist_log,
  $enable_defaults =  $journald::params::enable_defaults,
  $options = {},
) inherits journald::params {

  contain ::journald::config
  contain ::journald::service

  Class['journald::config'] ~> Class['journald::service']

}
