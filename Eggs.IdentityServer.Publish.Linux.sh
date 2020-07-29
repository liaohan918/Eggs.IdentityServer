git pull;
rm -rf .PublishFiles;
dotnet build;
dotnet publish -o /home/EggsIdentityServer/Eggs.IdentityServer/bin/Debug/netcoreapp3.1;
cp -r /home/Eggs.IdentityServer/Eggs.IdentityServer/bin/Debug/netcoreapp3.1 .PublishFiles;
echo "Successfully!!!! ^ please see the file .PublishFiles";