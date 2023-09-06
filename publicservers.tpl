[pub]
server01 ansible_port=22 ansible_host=${testserver01}  ansible_user=ubuntu ansible_ssh_private_key_file=/etc/ansible/ansiblekey.pem 
server02 ansible_port=22 ansible_host=${testserver02}  ansible_user=ubuntu ansible_ssh_private_key_file=/etc/ansible/ansiblekey.pem 
server03 ansible_port=22 ansible_host=${testserver03}  ansible_user=ubuntu ansible_ssh_private_key_file=/etc/ansible/ansiblekey.pem 

[pvt]
server01 ansible_port=22 ansible_host=${pvtserver01}  ansible_user=ubuntu ansible_ssh_private_key_file=/etc/ansible/ansiblekey.pem 
server01 ansible_port=22 ansible_host=${pvtserver02}  ansible_user=ubuntu ansible_ssh_private_key_file=/etc/ansible/ansiblekey.pem 
server01 ansible_port=22 ansible_host=${pvtserver03}  ansible_user=ubuntu ansible_ssh_private_key_file=/etc/ansible/ansiblekey.pem 

[public]
${testserver01}
${testserver02}
${testserver03}