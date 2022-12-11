resource "aws_instance" "Database" {

    ami= var.amiIdName
    instance_type = var.machineType
    subnet_id = var.publicSubnet
    security_groups = [var.sgID ]
    key_name = var.keyPair
    user_data = <<-EOF
        #!/bin/bash
        sudo yum install httpd php php-mysql -y
        cd /var/www/html
        wget https://wordpress.org/wordpress-5.1.1.tar.gz
        tar -xzf wordpress-5.1.1.tar.gz
        cp -r wordpress/* /var/www/html/
        rm -rf wordpress (it is optional to remove the WP package)
        rm -rf wordpress-5.1.1.tar.gz (it is optional to remove the tar ball)
        sudo chmod -R 755 wp-content
        sudo chown -R apache:apache wp-content
        sudo systemctl start httpd
        sudo systemctl enable httpd

      EOF

  
}