# NI Terraform for Oracle

### Prerequisites
* Install [Oracle cli](https://docs.oracle.com/cd/E11882_01/install.112/e47959/install.htm)
* Install [terraform](https://www.terraform.io/downloads.html)
* Log into your Oracle account

### How to run
Commands:
--------
plan    ./oci-run.sh COMPONENT_NAME="devops" SUBSCRIPTION_NAME="infra-dev" TF_CMD="plan"
apply   ./oci-run.sh COMPONENT_NAME="devops" SUBSCRIPTION_NAME="infra-dev" TF_CMD="apply"
destroy ./oci-run.sh COMPONENT_NAME="devops" SUBSCRIPTION_NAME="infra-dev" TF_CMD="destroy"

        TF_CMD="apply -auto-approve"
        TF_CMD="destroy -auto-approve"

    Argumets Value:
    --------------
        COMPONENT_NAME    = "devops", "mds", "oke"

        SUBSCRIPTION_NAME = "infra-dev", "uat", "prod"

        TF_CMD            = "plan", "apply", "destroy"


```
./oci-run.sh COMPONENT_NAME="devops" SUBSCRIPTION_NAME="infra-dev" TF_CMD="plan"
```