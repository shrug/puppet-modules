# Class: mcollective::params
#
#   This class provides parameters for all other classes in the mcollective
#   module.  This class should be inherited.
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class mcollective::params {

  $mc_topicprefix       = '/topic/'
  $mc_main_collective   = 'mcollective'
  $mc_collectives       = ''
  $mc_logfile           = '/var/log/mcollective.log'
  $mc_loglevel          = 'log'
  $mc_daemonize         = '1'
  $mc_security_provider = 'psk'
  $mc_security_psk      = 'changemeplease'

  $nrpe_dir_real = $osfamily ? {
    redhat  => '/etc/nrpe.d',
    default => '/etc/nagios/nrpe.d',
  }
  $mc_service_name = $osfamily ? {
    /(?i-mx:darwin)/ => 'com.puppetlabs.mcollective',
    default          => 'mcollective',
  }

  $mc_libdir = $osfamily ? {
    debian  => '/usr/share/mcollective/plugins',
    redhat  => '/usr/libexec/mcollective',
  }

  $mc_service_start = $osfamily ? {
    debian  => '/etc/init.d/mcollective start',
    redhat  => '/sbin/service mcollective start',
  }

  $mc_service_stop = $osfamily ? {
    debian  => '/etc/init.d/mcollective stop',
    redhat  => '/sbin/service mcollective stop',
  }

  $plugin_base = "${mc_libdir}/mcollective"

  $plugin_subs = [
    "${plugin_base}/agent",
    "${plugin_base}/application",
    "${plugin_base}/audit",
    "${plugin_base}/connector",
    "${plugin_base}/facts",
    "${plugin_base}/registration",
    "${plugin_base}/security",
    "${plugin_base}/util",
  ]

  $client_config_owner  = '0'
  $client_config_group  = '0'
  $server_config_owner  = '0'
  $server_config_group  = '0'

  $stomp_user    = 'mcollective'
  $stomp_passwd  = 'marionette'
  $stomp_server  = 'puppet'
  $stomp_port    = '6163'

  $pkg_state = 'present'

}
