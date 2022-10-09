#! ../../../bin/bash

echo "1.Nano 2.Vim 3.Links 4.Exit"
while true; do
	read num
	if [[ "$num" -ge 1 && "$num" -le 4 ]]; then
		case $num in
			1 )
				nano;;
			2 )
				vim;;
			3 )
				xdg-open https://www.google.com;;
			4 )
				exit;;
		esac
	else 
		echo "Something's going wrong! I can feel it..."
	fi
done
