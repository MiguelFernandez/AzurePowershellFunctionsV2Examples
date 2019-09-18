# Create blob storage container with a PowerShell function + System Assigned Identity (MSI)

### Assuming that you have a function app with an http triggered function with the code from the example follow the following steps to complete setting up the app:

1. Turn on System Assigned Identity in the Function app's Platform features section(don't forget to hit save)
![Image1](img/screen1.png)
![Image2](img/screen2.png)
2. Navigate to the storage account that you want to be able to create containers in and go into the Access control (IAM) section
![Image3](img/screen2.png)
3. Click on the Role assignments tab and then in the +Add button > Add Role Assignment
![Image4](img/screen4.png)
4. For the Role dropdown select Storage Blob Data Contributor (other Storage Blob roles may also work). For Assign access to select Function App. Search for the function app name in the select field. In my case the function app that I turned on MSI for was called mifernapowershell. Click save.
![Image5](img/screen5.png)
5. This step may not be necessary, but I found that I sometimes needed to restart the function app in the overview screen for the changes to take effect immediately. Otherwise it would take a few minutes to sync up.
