# High-level demo of ELB in front of two EC2 instances running Apache

1. Launch two EC2 instances using Ubuntu AMI, ensure the security group permits TCP port 80 inbound.
2. Log in to each and execute: `sudo apt update && sudo apt upgrade`
3. Install Apache with `sudo apt install apache2`
4. Create an ELB Target group with both instances in the group
5. Create an application load-balancer that routes traffic to the target group on port 80
6. Modify the HTTP on one of the hosts.
7. Surf to the ELB and refresh, note the HTML content change when refreshing.
