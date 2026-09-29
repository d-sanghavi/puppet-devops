node 'codespace-agent' {

  package { ['tree', 'figlet']:
    ensure => installed,
  }

  user { 'devopsuser':
    ensure    => present,
    managehome => true,
    shell     => '/bin/bash',
  }

  file { '/opt/devops-lab':
    ensure  => directory,
    owner   => 'devopsuser',
    mode    => '0755',
    require => User['devopsuser'],
  }

  file { '/opt/devops-lab/info.txt':
    ensure  => file,
    content => "Managed by Puppet on ${facts['networking']['hostname']}\nOS: ${facts['os']['name']} ${facts['os']['release']['full']}\n",
    require => File['/opt/devops-lab'],
  }

}

node default { }
