#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY ["Eggs.IdentityServer/Eggs.IdentityServer.csproj", "Eggs.IdentityServer/"]
RUN dotnet restore "Eggs.IdentityServer/Eggs.IdentityServer.csproj"
COPY . .
WORKDIR "/src/Eggs.IdentityServer"
RUN dotnet build "Eggs.IdentityServer.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Eggs.IdentityServer.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Eggs.IdentityServer.dll"]