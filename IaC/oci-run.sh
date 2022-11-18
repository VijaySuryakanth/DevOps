#!/usr/bin/env bash
usage() {
    echo "USAGE: ${0} --component=COMPONENT_NAME --subscription-name=SUBSCRIPTION_NAME --tf-command=TF_CMD"
    echo "     COMPONENT_NAME       The name of the component to apply (eg 'devops', 'mds', 'mongo', 'oke')"
    echo "     SUBSCRIPTION_NAME    The name of the subscription (eg. 'dev', 'uat', 'prod')"
    echo "     TF_CMD          The name of the region (eg. 'plan', 'apply', 'destroy')"
}

parse_arguments() {
    for arg in "$@"; do
        case $arg in
        --component=*)
            COMPONENT_NAME="${arg#*=}"
            ;;
        --subscription-name=*)
            SUBSCRIPTION_NAME="${arg#*=}"
            ;;
        --tf-command=*)
            TF_CMD="${arg#*=}"
            ;;
        *)
            usage
            exit 1
            ;;
        esac
    done
    BACKEND_KEY="jenkins/$SUBSCRIPTION_NAME/oke/terraform.tfstate"
    echo "BACKEND_KEY = $BACKEND_KEY"

    BUCKET="tf_store"
    echo "BUCKET = $BUCKET"
}

remove_stale_terraform_state_dir() {
    echo "Deleting .terraform directory to clean up stale state file"
    rm -rf .terraform
}

execute_command(){
    echo -e "-----------------"
    echo -e "Change directory \n cd ./components/oci-$COMPONENT_NAME/"
    # shellcheck disable=SC2164
    cd ./components/oci-$COMPONENT_NAME/

    # shellcheck disable=SC2030
    # shellcheck disable=SC2233
    # shellcheck disable=SC2236
    if ([ ! -z "$SUBSCRIPTION_NAME" ] && [ ! -z "$COMPONENT_NAME" ])
    then
        #remove terraform folder
        remove_stale_terraform_state_dir

        # shellcheck disable=SC2031
        export TF_VAR_env=""${SUBSCRIPTION_NAME}

        echo -e "-----------------"
        echo -e "Executing Command: \n" terraform init -backend-config key="$BACKEND_KEY" -backend-config bucket="$BUCKET"
        terraform init -backend-config key="$BACKEND_KEY" -backend-config bucket="$BUCKET"

        echo -e "-----------------"
        echo -e "Executing Command: \n" terraform "$TF_CMD"
        terraform $TF_CMD

    else
        echo "Executing Command: " terraform "$TF_CMD"
        #terraform $TF_CMD
    fi
}

main() {
    echo "$@"

    # check if arguments are provided.
    if [[ $# -gt 0 ]]
    then
        parse_arguments "${@}"
    fi

    #get_auth_secrets    # get the authentication secrets from OCI Valut
    execute_command     # execute terraform command with proper arguments
}

main "${@:-}"
