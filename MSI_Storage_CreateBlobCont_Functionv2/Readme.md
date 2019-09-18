# Create blob storage container with a PowerShell function + System Assigned Identity (MSI)

### Assuming that you have a function app with an http triggered function with the code from the example follow the following steps to complete setting up the app:

1. Turn on System Assigned Identity in the Function app's Platform features section(don't forget to hit save)
![Image1](https://github.com/MiguelFernandez/AzurePowershellFunctionsV2Examples/blob/master/MSI_Storage_CreateBlobCont_Functionv2/img/screen1.PNG)
![Image2](https://github.com/MiguelFernandez/AzurePowershellFunctionsV2Examples/blob/master/MSI_Storage_CreateBlobCont_Functionv2/img/screen2.PNG)
2. Navigate to the storage account that you want to be able to create containers in and go into the Access control (IAM) section
![Image3](https://github.com/MiguelFernandez/AzurePowershellFunctionsV2Examples/blob/master/MSI_Storage_CreateBlobCont_Functionv2/img/screen3.PNG)
3. Click on the Role assignments tab and then in the +Add button > Add Role Assignment
![Image4](https://github.com/MiguelFernandez/AzurePowershellFunctionsV2Examples/blob/master/MSI_Storage_CreateBlobCont_Functionv2/img/screen4.PNG)
4. For the Role dropdown select Storage Blob Data Contributor (other Storage Blob roles may also work). For Assign access to select Function App. Search for the function app name in the select field. In my case the function app that I turned on MSI for was called mifernapowershell. Click save.
![Image5](https://github.com/MiguelFernandez/AzurePowershellFunctionsV2Examples/blob/master/MSI_Storage_CreateBlobCont_Functionv2/img/screen5.PNG)
5. This step may not be necessary, but I found that I sometimes needed to restart the function app in the overview screen for the changes to take effect immediately. Otherwise it would take a few minutes to sync up.
