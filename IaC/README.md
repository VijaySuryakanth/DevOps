# NI Terraform for Oracle

### Prerequisites
* Install [Oracle cli](https://docs.oracle.com/cd/E11882_01/install.112/e47959/install.htm)
* Install [terraform](https://www.terraform.io/downloads.html)
* Log into your Oracle account

### How to run

    ./oci-run.sh --component=COMPONENT_NAME --subscription-name=SUBSCRIPTION_NAME --tf-command=TF_CMD

Arguments:
    COMPONENT_NAME       The name of the component to apply (eg 'devops', 'mds', 'mongo', 'oke')"
    SUBSCRIPTION_NAME    The name of the subscription (eg. 'dev', 'uat', 'prod')"
    TF_CMD               The name of the region (eg. 'plan', 'apply', 'destroy')"

eg:
    ./oci-run.sh --component=oke --subscription-name=dev --tf-command=plan
