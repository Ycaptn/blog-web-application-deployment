#!/bin/bash

# Your GitHub repository URL
repository_url="https://github.com/Ycaptn/blog-web-application-deployment.git"

# Your branch or tag name
branch_or_tag="master"

# Backup existing application code
echo "Creating backup..."
cp -r /path/to/your/flask/app /path/to/backup/location

# Clone the updated source code
echo "Cloning the updated source code..."
git clone $repository_url /path/to/temporary/location
cd /path/to/temporary/location
git checkout $branch_or_tag

# Copy/replace files
echo "Copying/Replacing files..."
cp -r * /path/to/your/flask/app

# Update dependencies
echo "Updating dependencies..."
pip install -r /path/to/your/flask/app/requirements.txt

# Perform database migrations (if applicable)
echo "Performing database migrations..."
cd /path/to/your/flask/app
flask db migrate -m "Description of migration"
flask db upgrade

# Restart the Gunicorn process
echo "Restarting Gunicorn..."
sudo systemctl restart gunicorn-your-flask-app-service-name

# Test the application
echo "Testing the application..."

# Version control
echo "Committing changes to version control..."
cd /path/to/your/flask/app
git add .
git commit -m "Update application to version X"
git push origin $branch_or_tag

echo "Update complete!"


        # secrets.PRIVATE_KEY
        # secrets.EC2_IP
        # secrets.USER
        # ec2-user