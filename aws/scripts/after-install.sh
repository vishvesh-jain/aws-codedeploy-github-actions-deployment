#!/bin/bash
set -xe


# Copy war file from S3 bucket to tomcat webapp folder
#aws s3 cp s3://##s3-bucket##/SpringBootHelloWorldExampleApplication.war /usr/local/tomcat9/webapps/SpringBootHelloWorldExampleApplication.war

#cd /tmp

#run curl -sLO "https://github.com/$GITHUB_REPOSITORY/-/jobs/$GITHUB_RUN_ID/artifacts/war-artifact/*.war"

#cp "$latest_war" /usr/local/tomcat9/webapps/SpringBootHelloWorldExampleApplication.war

# Ensure the ownership permissions are correct.

cd ../../..

# Find the highest existing subfolder number
highest_number=$(find /installs -maxdepth 1 -type d -name 'CHG*' | grep -o '[0-9]*' | sort -rn | head -n 1)

# Increment the number
new_number=$((highest_number + 1))

# Create the new subfolder with the incremented number
new_folder="/installs/CHG$new_number"
mkdir "$new_folder"

# Copy contents from /tmp to the new subfolder
cp -r ../../../* "$new_folder"
chown -R ec2-user:user "$new_folder"

