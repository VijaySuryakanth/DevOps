#!/bin/bash
# DO NOT MODIFY
curl --fail -H "Authorization: Bearer Oracle" -L0 http://169.254.169.254/opc/v2/instance/metadata/oke_init_script | base64 --decode >/var/run/oke-init.sh
## run oke provisioning script
bash -x /var/run/oke-init.sh

#install OCI CLI packages.
#For installation commands please ref: https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/cliinstall.htm
#Linux 8
sudo dnf -y install oraclelinux-developer-release-el8
sudo dnf install python36-oci-cli
