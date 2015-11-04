class journald::config {
  $merged_options = merge($::journald::params::default_options, $::journald::options)

  if $::journald::persist_log {
    $journald_dir = 'directory'
  } else {
    $journald_dir = 'absent'
  }

  file { '/var/log/journal/':
    ensure => $journald_dir,
    force  => true,
    owner  => 0,
    group  => 'systemd-journal',
  }

  file { '/etc/systemd/journald.conf':
    ensure  => 'file',
    owner   => 0,
    group   => 0,
    content => template("${module_name}/journald.conf.erb"),
  }
}
