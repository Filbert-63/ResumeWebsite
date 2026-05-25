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
in the /html file, the file "index.html" should be located. this file will contian the home page of our website and should display when the website has been opend.
to open the website and verify that the installation of nginx has been done successfully, enter the IP address of your system into a web browser that is not within the virtual machine. if done correctley the contents of "index.html" shoudl display. 

to edit this file, type this command from the "/var/www/html" file location, and make any changes that you would like to make:
```
sudo nano index.html

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
