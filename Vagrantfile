# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version '>= 1.5'

def require_plugins(plugins = {})
  needs_restart = false
  plugins.each do |plugin, version|
    next if Vagrant.has_plugin?(plugin)
    cmd =
        [
            'vagrant plugin install',
            plugin
        ]
    cmd << "--plugin-version #{version}" if version
    system(cmd.join(' ')) || exit!
    needs_restart = true
  end
  exit system('vagrant', *ARGV) if needs_restart
end

require_plugins \
  'vagrant-bindfs' => '0.3.2'

Vagrant.configure(2) do |config|
  config.vm.provider :virtualbox do |vb, override|
    vb.memory = 512

    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
  end

  # TODO: replace with app name
  config.vm.define 'app_name' do |machine|
    machine.vm.hostname = 'localhost'
    machine.vm.network 'forwarded_port', :guest => 3000, :host => 3000, :auto_correct => true

    machine.vm.box = 'ubuntu/trusty64'

  end

  config.vm.provision 'ansible' do |ansible|
    ansible.playbook = 'provisioning/development.yml'
    ansible.sudo = true
    ansible.host_key_checking = false
    # ansible.verbose =  'vvvv'
    ansible.extra_vars = { ansible_ssh_user: 'vagrant',
                           ansible_connection: 'ssh',
                           ansible_ssh_args: '-o ForwardAgent=yes'}
  end
end
