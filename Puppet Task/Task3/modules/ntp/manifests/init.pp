class ntp {

  if $hostname {
    $ip = hiera('tt_ip', 'server 2.2.2.2  iburst')
  }
  else {
    $ip = hiera('px_ip', 'server 1.1.1.1 iburst')
  }

  package { 'ntp':
    ensure => installed,
  }

 file { '/etc/ntp.conf':
    content => template('ntp/ntp.conf.erb'),
    notify  => Service['ntp'],
  }

  service { 'ntp':
    ensure  => running,
    enable  => true,
    require => [ Package['ntp'], File['/etc/ntp.conf'] ],
  }
}
