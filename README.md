
# XDG autostart role

A role for Potos, used to configure scripts that should run for users as they log in.

A key feature is to only run the script once. So the first time the user logs in, the script runs, then disables itself.

# A picture is worth a thousand words
![Role chart](role.png)

## Quickstart
This role is supposed to be imported into the specs repo, and configured in the specs repo's vars/ directory.

If the role is only imported into the specs repo, but not configured with vars, it will deploy a script which sets the volume of the default sound sink to ~80% using pulseaudio.

As an example, to configure the role to run test_1.sh once for each user when they log in, and test_2.sh to run for each user every time they log in and never get disabled, you can set the potos_xdgautostart var up as given under the vars section. 

## Vars
```
- potos_xdgautostart:
    - script: "test_1.sh"
      runonlyonce: yes
    - script: "test_2.sh"
      runonlyonce: no
```
## License

See [LICENSE](./LICENSE)

## Author Information

[Project Potos](https://github.com/projectpotos)

