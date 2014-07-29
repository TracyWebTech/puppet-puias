class puias {

  Yumrepo {
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puias',
    gpgcheck => 1,
    require  => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-puias'],
  }

  file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-puias":
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => "puppet:///modules/puias/RPM-GPG-KEY-puias",
  }

  ######################
  ###   PUIAS Core   ### 
  ######################
  yumrepo { 'PUIAS_core_Base':
    name       => 'puias',
    descr      => 'PUIAS core Base $releasever - $basearch',
    mirrorlist => 'http://puias.math.ias.edu/data/puias/$releasever/$basearch/os/mirrorlist',
  }

  yumrepo { 'PUIAS_core_Updates':
    name       => 'puias_updates',
    descr      => 'PUIAS core Updates $releasever - $basearch',
    mirrorlist => 'http://puias.math.ias.edu/data/puias/updates/$releasever/en/os/$basearch/mirrorlist',
  }

  ########################
  ###   PUIAS Addons   ### 
  ########################
  yumrepo { 'PUIAS_addons':
    name    => 'puias_addons',
    descr   => 'PUIAS addons Base $releasever - $basearch',
    baseurl => 'http://puias.princeton.edu/data/puias/$releasever/$basearch/os/Addons',
    require => Yumrepo['PUIAS_6_core_Base', 'PUIAS_6_core_Updates'],
  }

  yumrepo { 'PUIAS_addons_Updates':
    name    => 'puias_addons_updates',
    descr   => 'PUIAS addons Updates $releasever - $basearch',
    baseurl => 'http://puias.princeton.edu/data/puias/updates/$releasever/en/addons/$basearch',
    require => Yumrepo['PUIAS_6_core_Base', 'PUIAS_6_core_Updates'],
  }

  ###############################
  ###   PUIAS Computational   ### 
  ###############################
  yumrepo { 'PUIAS_computational':
    name       => 'puias_computational',
    descr      => 'PUIAS computational Base $releasever - $basearch',
    mirrorlist => 'http://puias.math.ias.edu/data/puias/computational/$releasever/$basearch/mirrorlist',
  }

}
