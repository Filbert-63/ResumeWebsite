<h1 align="center">ResumeWebsite</h1>
<p align="center">In this project, we create a website to host an online Resume off of an IAAS system. for this project, we utilise Microsft Azure, hosting a Linux (ubuntu 24.04) system.</p>


<h1 align="center">Website Creation History/Process</h1>
<h2 align="center">Creation of the Microsoft Azure Virtual Machine</h2>
<p align="center">For this step , we have created a Linux Virtual Machine on the Microsoft Azure platform. for the creation of this system, we have created a fairley weak system as the website that we are creating is simple, which means we do not need to incure higher costs for a more powerful system which will go under utilised. following the process on the website, we created a low power "B-Series" system, ruinnig "Ubuntu Server 24.04 LTS". we then generateda  key pair to allows us to access the virtual machine.</p>
<h2 align="center">connecting to the Virtual system</h2>
<p align="center">to connect to the virtual system, ensure that you have the Key Pair that you have created in an easily accesssable location, to allow for the accessing of it when connecting to the system. to connect to the system,  we used this command, where [FILElocationofkey] is the file location of our key pair, [VMName] is the name of our VM, and [IPADDRESS], which is the IP address of the system</p>
```
ssh -i [FILElocationofkey] [VMName]@[IPADDRESS]
```
<p align="center">command that we have used</p>
```
ssh -i C:\Users\remyp\Desktop\remypintovm_key.pem remypinto@20.5.11.42
```