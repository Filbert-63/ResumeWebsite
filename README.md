# ResumeWebsite
In this project, we create a website to host an online Resume off of an IAAS system. for this project, we utilise Microsft Azure, hosting a Linux (ubuntu 24.04) system.


# Website Creation History/Process

## Creation of the Microsoft Azure Virtual Machine
For this step , we have created a Linux Virtual Machine on the Microsoft Azure platform. for the creation of this system, we have created a fairley weak system as the website that we are creating is simple, which means we do not need to incure higher costs for a more powerful system which will go under utilised. following the process on the website, we created a low power "B-Series" system, ruinnig "Ubuntu Server 24.04 LTS". we then generateda  key pair to allows us to access the virtual machine. under the "select inbound ports", ensure that HTTP (80), HTTPS (443), and SSH (22) are selected. this will allow the system to display the website

## connecting to the Virtual system
to connect to the virtual system, ensure that you have the Key Pair that you have created in an easily accesssable location, to allow for the accessing of it when connecting to the system. to connect to the system, we used this command in Windows Command Prompt:
```
ssh -i [FILElocationofkey] [VMName]@[IPADDRESS]
```
 where [FILElocationofkey] is the file location of our key pair, [VMName] is the name of our VM, and [IPADDRESS], which is the IP address of the system.

command that i have used to access the system:
```
ssh -i C:\Users\remyp\Desktop\remypintovm_key.pem remypinto@20.5.11.42
```

## Configureation of Virtual Machine
once we have used the SSH command to remotley access the virtual machine, we must ensure that all of the programs are up to date. to do this we will use this command:

```
sudo apt update
```
after doing this, we can now install the Nginx Web Server which allows us to host the website off of this system. to install this, we utilised the command:
```
sudo apt install nginx-full
```

after this program has been installed, there should be some new files added onto our system. these files contian the files for our website, and are located at the file location:
```
/var/www/html
```
in the /html file, the file "index.nginx-debian.html" should be located. this file will contian the home page of our website and should display when the website has been opend.
to open the website and verify that the installation of nginx has been done successfully, enter the IP address of your system into a web browser that is not within the virtual machine. if done correctley the contents of "index.nginx-debian.html" should display. 

to edit this file, type this command from the "/var/www/html" file location, and make any changes that you would like to make:
```
sudo nano index.nginx-debian.htmlvcvhb

```
after making any changes you would like, and saving, if you reload the website on the other system, you will notice that the changes have been reflecet on the website. 

## Installing Github on the virtual machine
to install github on the virtual system, use this command:
```
sudo apt install gh
```
to verify that the installation has been successful, use this command, which should return the current version of github. 
```
gh --version
```
after doing so, you must log into github. to do so, type this command in, and follow the steps:
```
gh auth login
```
## accessing our created repositry
after we have logged into github and we have already previousley made a github repositry that we want to access, we should add it to our virtual system for easy accessablitliy when working on the project. to do so, the cd command can be used to go back to the root of the system.
```
cd --
```
after doing so, this command will create a clone of the repositry on our system. this will allow us to easily access and move the file that we update directley onto out website. to do so, use this command:
```
git clone [the link to the repo]
```
in our case, we this:
```
git clone https://github.com/Filbert-63/ResumeWebsite
```
now, while we are in the root file location of the system, we should be able to see a new file on our system, which should have the same name as the repo we have just cloned. now if we use this command to change our directory to the file of the cloned repo, we should see that all of the content form the repo should be there as well:
```
cd /[REPONAME]
```
replace [REPONAME] with the name of the file. 
somthing important to note is that if we wouuld like to pull the most frequent update/commit of the repo, we must run this command from within the file location to do so:
```
git pull
```

## Cloning the nginx files to the repo and pusing the changes. 
now that we have cloned the repo that we will be using, and we have installed nginx, we should copy the files that the installation of nginx has created into the repo, and push the changes. this allows us to work on the website in a more better and efficent method, as we will not have to use the command lkine to do so, rather we could use github desktop and visual studio code to make our changes and work on the project. in the creation of our website, we used these commands in order to allows us to do this:

```
cp -R /var/www/html /home/remypinto/ResumeWebsite/
cd ResumeWebsite/
git add .
git commit -m "Trying to move files again"
git push -u origin main
```
now, after doing these commands, if we check github, our files should now be up there. these files should act as a template for the rest of the project.

## creating a script to copy the website files to the nignx website
for this project we had to make a script, so i decided that i would make a fairley simple script to copy the website files from the github into the file location of the website. this would allow me to make my website more effecientl;ey as i would be able to work on the code for the websiote from a diffrent location, rather then the virtual system, and easiley push the changes to the website. 
to create the script, you must make a file with the extension .sh to ensure that you will be able to run the script. here is the code for the script that i have created:
```
#!/bin/bash

# Define source and destination directories
src_dir="/home/remypinto/ResumeWebsite/html"
dst_dir="/var/www/html"

# Copy files recursively (including subdirectories)
# -r: recursive, -v: verbose (shows progress)
cp -rv "$src_dir"/. "$dst_dir"/
```
the code that is in script is very easily changeable. if you would like to adapt the code for personal usage, all you would need to change is the source and destination directorys to match you file system on your machine.
to run this script, i can run this command, and the files will be copied over to the websites file location on the system:
```
sudo ./FileCopy.sh
```
## connecting our website to a domain / DNS
somthing important we must do is connect the website that we have made to a domain, which would allow us to access the website on any system. to do this, we must purchase a domain from the internet, and configure the DNS between the public ip address of the server and the domain name.
to do this, we first purchased the domain filbertinfo.me from cloud flare, which costed around $20 AUD.  for this project i recomend that the domain is purchased from cloudflare as it is both cheaper than most options, and allows for the configuration of the dns record to be completed on the website.

after the domain has been purchased, we are able to configure the DNS record for this domain from the cloudflare website, using the dashboard menu. to do this, we can press "Ctrl + K" to access the quick search menu, and from there we should type "DNS", select records and select our domain that we will be using for the website. if done correectley, this opage shoul open:

! [screenshot of dns record menu](https://github.com/Filbert-63/ResumeWebsite/blob/main/screenshots/DNSRECORD.png)

to add a DNS record to your domain do this:
*select "add record button"
*select Type A
*for the name field, type the domain of your website
*for the IPv4 address, type tyhe public ip address of your system that is hosting the website
*press add record
by doing this, we have now created a DNS record for the website. this means that once the record has propigated to the dns servers, we shoudl be able to type the domain of the webste that we have chosen, and be able to access our website, rather than the ip address. it is also necessary to repete the process for adding a record, but instead of entering the domain name, enter "www", so you are also able to access the website using www at the front of your domain. 


## obtaining digital certificate 
to obtian a digital certificate for the website, it is a fairley strtaight forward process to do so. to do this, go to this website, and follow the steps provided:
```
(https://certbot.eff.org/)
```
in our case, we followed the proived steps for "Nginx" on "Linux (snap)", which after doing so, created the certificate for our website. after completing the steps, if we enter our website using a browser, the website should now be secure and have the lock symbol at the top left of the search bar 