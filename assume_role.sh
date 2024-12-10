#!/bin/bash

# Check if the script is sourced or not
# if [ "$0" = "$BASH_SOURCE" ]; then
#     echo "This script needs to be sourced. Use the following command:"
#     echo ". $BASH_SOURCE <account_id> <role_name> <role_session_name>"
#     exit 1
# fi

# Function to check prerequisites
# check_prerequisites() {
#     # Check if AWS CLI is installed
#     if ! command -v aws &> /dev/null
#     then
#         echo "AWS CLI not installed. Please install it and try again."
#         return 1
#     fi

#     # Check for correct number of arguments
#     if [ "$#" -ne 3 ]; then
#         echo "Usage: . $0 <account_id> <role_name> <role_session_name>"
#         return 1
#     fi
# }

# Main function to assume role
assume_role() {
    # Assign arguments to variables
    account_id=$1
    role_name=$2
    role_session_name=$3

    # Construct role ARN
    role_arn="arn:aws:iam::${account_id}:role/${role_name}"

    # Assume the role and retrieve credentials
    read -r access_key secret_key session_token <<< $(aws sts assume-role \
                                                        --role-arn "$role_arn" \
                                                        --role-session-name "$role_session_name" \
                                                        --query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" \
                                                        --output text)

    # Check if the credentials were successfully retrieved
    if [ -z "$access_key" ] || [ -z "$secret_key" ] || [ -z "$session_token" ]; then
        echo "Failed to assume role. Please check your inputs and AWS configuration."
        return 1
    fi

    # Export the credentials
    export AWS_ACCESS_KEY_ID=$access_key
    export AWS_SECRET_ACCESS_KEY=$secret_key
    export AWS_SESSION_TOKEN=$session_token

    echo "AWS credentials exported successfully."
}

unassume_role() {
    unset AWS_ACCESS_KEY_ID
    unset AWS_SECRET_ACCESS_KEY
    unset AWS_SESSION_TOKEN
}

# Run the checks
# check_prerequisites "$@" || return 1

# If checks pass, assume the role
# assume_role "$@"