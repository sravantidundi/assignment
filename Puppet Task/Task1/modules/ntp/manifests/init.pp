class ntp {
  package { 'ntp':
    ensure => installed,
  }

  file { '/etc/ntp.conf':
    source => 'puppet:///modules/ntp/test.txt',
    notify  => Service['ntp'],
  }

  service { 'ntp':
    ensure  => running,
    enable  => true,
    require => [ Package['ntp'], File['/etc/ntp.conf'] ],
  }
}
