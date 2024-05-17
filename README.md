
# XDG autostart role

A role for Potos, used to configure scripts that should run for users as they log in.

A key feature is to only run the script once. So the first time the user logs in, the script runs, then disables itself.

# A picture is worth a thousand words
![Role chart](role.png)

This role is supposed to be imported into the specs repo, and configured in the specs repo's vars/ directory.

## Quickstart

If the role is only imported into the specs repo, but not configured with vars, it will deploy a script which sets the volume of the default sound sink to ~80% using pulseaudio.
To get started asap, import the role in the specs repo(files/templates/requirements.yml.j2):
```
- name: xdgautostart
  src: git+https://github.com/wickdChromosome/ansible-role-potos_xdgautostart.git
  version: 'master'
```

Now do an ansible-pull. In var/log/potos/ansible.log, you should be able to see the pulseaudio script being deployed.

In `/usr/local/bin`, you should be able to see `pulseaudio-example.sh-wrapper.sh` and `pulseaudio-example.sh`. 

In `/etc/xdg/autostart` you will find pulseaudio-example.sh-wrapper.sh.desktop.

After logout and login, if runonlyonce is set(by default it is for this example), you will find `~/.config/autostart/pulseaudio-example.sh-wrapper.sh.desktop` as well, where autorun is disabled for the user you are logged in under for this script.

## If the script is already on the remote host
Existing script automation(maybe deployed by another role under /usr/local/bin) is also supported.
However, in that case the potos_xdgautostart list should refer to the script as $deployed_script + .j2

For example, if the script is under `/usr/local/bin/example.sh`, the script should be present in the list as `script: "example.sh.j2"`, even
if there is no existing .j2 template for the script.

## Vars
Here, after importing the role in the specs repo:
```
- potos_xdgautostart: # List of scripts to autostart
    - script: "test_1.sh.j2" # Name of script to run on user login(stored in files/potos_xdgautostart for specs repo)
      runonlyonce: yes # For each user, run the script once and only once on first login
      my_var_to_template: "1245" # If test_1.sh.j2 has $my_var_to_template, it can be templated as {{ item.my_var_to_template }} in test_1.sh.j2
    - script: "test_2.sh.j2" 
      runonlyonce: no # For each user, run the script on every login
```

## Requirements
The script specified to be deployed must exist either under templates/ as specified, or on the remote host already deployed. 

## License

See [LICENSE](./LICENSE)

## Author Information

[Project Potos](https://github.com/projectpotos)

