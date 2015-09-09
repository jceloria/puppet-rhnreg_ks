# == Class: rhnreg_ks
#
# === Authors
#
# Gaël Chamoulaud <gchamoul@redhat.com>
#
# === Copyright
#
# Copyright 2015 Gaël Chamoulaud
#
# === Example hiera configuration:
# ---
# classes:
#   - rhnreg_ks
#
# rhnreg_ks::rhn_register:
#   'https://xmlrpc.rhn.redhat.com/XMLRPC':
#     activationkeys:
#       - '888888888eeeeeee888888eeeeee8888'
#     ssl_ca_cert: '/usr/share/rhn/RHN-ORG-TRUSTED-SSL-CERT'
#     force: true
#
# rhnreg_ks::rhn_channel:
#   'centos6-scl-x86_64':
#     ensure: present
#     username: 'myusername'
#     password: 'mypassword'
# ===
class rhnreg_ks (
  $rhn_register  = '',
  $rhn_channel   = '',
) {

  if is_hash($rhn_register) {
    create_resources( rhn_register, $rhn_register )
  }

  if is_hash($rhn_channel) {
    create_resources( rhn_channel, $rhn_channel )
  }

}
