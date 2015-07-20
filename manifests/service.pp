class journald::service {
  service { ['systemd-journald']:
    ensure => running,
    enable => true,
  }
}
