# == Class: haveged::service
#
# Manage the haveged service.
#
class haveged::service {
  $ensure = $haveged::start ? {
    true    => 'running',
    default => 'stopped',
  }

  service { 'haveged':
    ensure  => $ensure,
    enable  => $haveged::enable,
    require => Class['haveged::config'],
  }
}
