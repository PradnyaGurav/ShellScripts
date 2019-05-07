#!/bin/bash
show_menu(){
    echo ""
    echo ""
    echo "**********************APP MENU***********************"
    echo "** 1] New User"
    echo "** 2] Login"
    echo "** 3] Reset Password"
	echo "** 4] List the details of my account"
	echo "** 5] Modify User Account"
	echo "** 6] Delete User Account"
	echo "** 7] Create Group"
	echo "** 8] Delete Group"
    echo "*********************************************"
    echo "Please enter a menu option and enter or enter to exit. "
    read opt
}
clear
show_menu

while [[ opt != '' ]]
do

if [[ $opt = "" ]]; then 
    exit 1;
else
        case $opt in
        1) clear;
            echo "Enter the Username"
			read Uname;
			useradd $Uname -s ;
			echo "Set the Password"
			passwd $Uname;
			show_menu;
			;;
		
		2) clear;
			echo "Username"
			read Uname;
			su - $Uname;
			#need to work on home directory
			show_menu
			if [[ $opt = "" ]]; then 
				exit 1;
			fi
			;;
			
		3) clear;
			echo "Username";
			read Uname;
			passwd $Uname;
			show_menu;
			;;
			
		4) clear;
			echo "Username";
			read Uname;
			cat /etc/passwd | grep "$Uname";
			show_menu;
			;;
			
		5) clear;
			echo "Username";
			read Uname;
			#usermod --help
			show_menu;
			;;
		
		6) clear;
			echo "Username";
			read Uname;
			#Delete's user and home directory
			userdel -r $Uname;
			
			#/dev/null is a char special file
			find / -nouser -o -nogroup 2> /dev/null
			id $Uname;
			show_menu;
			;;	

		7) clear;
			echo "Enter Group Name : ";
			read GName;
			groupadd GName;
			cat /etc/group | grep $GName
			show_menu;
			;;
			
		8) clear;
			echo "Enter Group Name to delete : ";
			read GName;
			groupdel GName;
			show_menu;
			;;
			
		9) clear;
			echo "Enter User Name: ";
			read UName;
			echo "Group Name: ";
			read GName;
			#echo "New Group Name :";
			#read NewGName;
			echo "Add supplementary group :";
			read SupGName;
			groupmod -aG $SupGName $Uname
			cat /etc/group | grep $SupGName
			show_menu;
			;;
			
		esac
fi
done
			
			
			
			

			
			