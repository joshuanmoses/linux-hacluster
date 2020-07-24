#edit /etc/hosts files
echo 10.10.10.100 blackbox.myorg.local >> /etc/hosts
echo 10.10.10.101 redbox.myorg.local >> /etc/hosts
echo 10.10.10.102 bluebox.myorg.local >> /etc/hosts


#install nginx - ubuntu
apt install nginx
#install nginx - centos/RHEL
#yum install epel-release && sudo yum install nginx

#start the Nginx service and enable it to start as a service
systemctl enable nginx
systemctl start nginx
systemctl status nginx

echo "This is the default page for blackbox.myorg.local" | sudo tee /usr/share/nginx/html/index.html 	#VPS1
echo "This is the default page for redbox.myorg.local" | sudo tee /usr/share/nginx/html/index.html 	#VPS2
echo "This is the default page for bluebox.myorg.local" | sudo tee /usr/share/nginx/html/index.html 	#VPS3

#ubuntu
apt install corosync pacemaker pcs
#centos/rhel
#yum install corosync pacemaker pcs

systemctl enable pcsd
systemctl start pcsd
systemctl status pcsd
#change password for hacluster account
passwd hacluster

#command to set up the authentication needed for pcs - only run this command on one server
pcs cluster auth blackbox.myorg.local redbox.myorg.local bluebox.myorg.local -u hacluster -p password_here --force
#create a cluster and populate it with your nodes
pcs cluster setup --name mycluster blackbox.myorg.local redbox.myorg.local bluebox.myorg.local

#enable the cluster on boot and start the service
pcs cluster enable --all
pcs cluster start --all

#Check the cluster status
#pcs status
#OR
#crm_mon -1

#turn off STONITH
pcs property set stonith-enabled=false
#ignore the Quorum policy
pcs property set no-quorum-policy=ignore

#
pcs resource create floating_ip ocf:heartbeat:IPaddr2 ip=10.10.10.200 cidr_netmask=24 op monitor interval=60s
#
pcs resource create http_server ocf:heartbeat:nginx configfile="/etc/nginx/nginx.conf" op monitor timeout="20s" interval="60s"

#-------------- Ubuntu -------------- 
ufw allow http	
ufw allow high-availability						
ufw reload

#-------------- CentOS 7 -------------- 
#firewall-cmd --permanent --add-service=http
#firewall-cmd --permanent --add-service=high-availability		
#firewall-cmd --reload

#to test and simulate a node failure
#sudo pcs cluster stop http_server
#OR
#sudo crm_resource --resource http_server --force-stop 

