With Windows Docker Toolbox, you have to set and mount the share in VirtualBox.

Right clic on your default VM in VirtualBox > configuration > Shared Folders > Add "workspace" as the name of the share to the Windows path that you want

next, for example

```
docker-machine ssh default
sudo mount -t vboxsf -o uid=1000,gid=50 workspace /mnt/workspace
```
