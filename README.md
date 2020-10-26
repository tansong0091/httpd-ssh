# httpd-ssh

1. Add openssh in httpd:2.4 image. ssh public key inject by environment variable "SSH_PUBLIC_KEY". User and ssh access to container directly
2. Use /usr/local/apache2/bin/apachectl start httpd process.
3. the log name will have hostname as prefix

E.g

docker run -d --name tstesthtpd -p 108:80 -p 122:22 \
--env SSH_PUBLIC_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQA..." \
--restart=always \
httpd-ssh:0.3
