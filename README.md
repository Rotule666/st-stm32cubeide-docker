
# your project

I use gitlabCI so the paths to my project will already be there, but you can make an aditionnal copy to add your project

# create workspace with your project

/opt/st/stm32cubeide_1.3.0/stm32cubeide --launcher.suppressErrors -nosplash -application org.eclipse.cdt.managedbuilder.core.headlessbuild -data /opt/workspace -import /opt/MYPROJECT

# build

sh /opt/st/stm32cubeide_1.3.0/headless_build.sh -build MYPROJECT -data /opt/workspace
