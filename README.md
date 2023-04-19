
# your project

I use gitlabCI so the paths to my project will already be there, but you can make an aditionnal copy to add your project

# create workspace with your project

```
/opt/st/stm32cubeide_1.10.1/stm32cubeide --launcher.suppressErrors -nosplash -application org.eclipse.cdt.managedbuilder.core.headlessbuild -data /opt/workspace -import MYPROJECTPATH
```

# build cube project
```
sh /opt/st/stm32cubeide_1.10.1/headless_build.sh -build MYPROJECT -data /opt/workspace
```
# Docker cheat cheat

```
docker build -t rotule666/st-stm32cubeide:1.12.0 .
docker images
docker run --name st -d -it rotule666/st-stm32cubeide:1.12.0
docker ps
docker exec -ti st bash

docker push rotule666/st-stm32cubeide:1.12.0

docker image prune -a
docker container prune
```

# stm32cube headless install

in order to prepare the install script need to be modified.

download the zip file from st

extract the zip file and get the original setup .sh

```
mkdir output
./st-stm32cubeide_1.5.0_8698_20201117_1050_amd64.sh --tar -xvf -C output
rm setupOriginal.sh
mv output/setup.sh setupOriginal.sh
```

then just fix the top of setupOriginal.sh to remove the check for license and move it to setup.sh
