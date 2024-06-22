FROM jenkins/jenkins:latest

USER root

# Create the .gnupg directory, set ownership and permissions
RUN mkdir -p /var/jenkins_home/.gnupg && \
    chown -R jenkins:jenkins /var/jenkins_home/.gnupg && \
    chmod 700 /var/jenkins_home/.gnupg

# Update the package list and install dirmngr
RUN apt-get update && apt-get install -y dirmngr

# Ensure jenkins user has correct permissions
RUN chown -R jenkins:jenkins /var/jenkins_home/.gnupg && \
    chmod -R 700 /var/jenkins_home/.gnupg

# Clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Switch back to Jenkins user
USER jenkins


# FROM jenkins/jenkins:latest

# USER root

# # Create the .gnupg directory, set ownership and permissions
# RUN mkdir -p /var/jenkins_home/.gnupg && \
#     chown -R jenkins:jenkins /var/jenkins_home/.gnupg && \
#     chmod 700 /var/jenkins_home/.gnupg

# # Update the package list and install dirmngr
# RUN apt-get update && apt-get install -y dirmngr

# # Clean up APT when done
# RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# # Switch back to Jenkins user
# USER jenkins
