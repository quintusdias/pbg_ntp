# Manage NTP
class pbg_ntp {
  ensure_packages(['chrony'])

  file { '/etc/chrony.conf':
    source => 'puppet:///modules/pbg_ntp/chrony.conf',
    notify => Service['chrony'],
    require => Package['chrony'],
  }

  service { 'chrony':
    ensure => running,
    enable => true,
  }
}
