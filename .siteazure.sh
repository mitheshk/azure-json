#!/bin/sh

LOCATION="EAST Asia"
AFFINITYGROUP="MyLinuxDemo"
STORAGEACCOUNT="mylinuxdemo"
ADDRESSSPACE="10.0.0.0"
ADDRESSSPACECIDR="8"
SUBNETADDRESSSPACE="10.0.0.0"
SUBNETADDRESSPSACEDIR="24"
SUBNETNAME="sUBNET01"
VNETNAME="MyLinuxVnet"
PHPVERSION="5.5"
WEBAPPNAME="azurecliwebap"
RESOURCEGROUPNAME="Default"
HOSTNAME="azurecliwebap.azurewebwebapps.net"
GITREPOSITORY="https://reshma_ingavale_@bitbucket.org/reshma_ingavale_/drupaltest.git"
GITUSERNAME="reshma_ingavale_"
SUBSCRIPTIONID="776add2f-0d31-47b3-8359-93546ef1bb5c"
SERVICEPLANNAME="azurecliwebapplan"


#Create webwebapp using azure command
#set location and subscription id while creating webapp
azure webapp create -g $RESOURCEGROUPNAME -n $WEBAPPNAME -l $LOCATION -p $SERVICEPLANNAME -s $SUBSCRIPTIONID

#update git repository
azure webapp repository update $WEBAPPNAME
#set php-version to webapp
azure webapp set --php-version $PHPVERSION
#create new affinity group
azure account affinity-group create --location "$LOCATION" --label $AFFINITYGROUP $AFFINITYGROUP

#create storage account
azure storage account create --affinity-group $AFFINITYGROUP $STORAGEACCOUNT

#create virual network
azure network vnet create --affinity-group $AFFINITYGROUP --address-space $ADDRESSSPACE --cidr $ADDRESSSPACECIDR --subnet-start-ip $SUBNETADDRESSSPACE --subnet-cidr $SUBNETADDRESSPSACEDIR --subnet-name $SUBNETNAME $VNETNAME




