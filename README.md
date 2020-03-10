## In this branch are PowerShell tasks. 
Setting tasks are given below.

**Task 1**
Write PowerShell script with following functional:

There 3 input parameters supported:

*--users* - display all users on your desctop (UserAccounts)  
*--sessions* - display all active sessions on local computer  
*--processes* - [ACCEPTABLE ONLY IF USERS FLAG SPECIFIED] get processes runned by --users  

Try to resolve the issues using switch statement, wmi objects. Simple error hendling and logging are required. Provide Get-Help     documentation.  

**Task 2**
You should create a PowerShell script which will initially install dotnetcore-sdk (2.1.300) via chocolately. It's importent to  

Possible parameters:  

*--autoupgrade*  
*--uninstall * 
Functional:  

*--autoupgrade argument* - script should create daily schedule for running sh > choco upgrade dotnetcore-sdk command.  
*--uninstall argument* - uninstall dotnetcore-sdk , chocolately, and scheduler (if exist)  
Simple error hendling and logging are required. It's importent to provide Get-Help documentation.  
