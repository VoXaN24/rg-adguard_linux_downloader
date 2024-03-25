#Function Download
function download {
    clear
    echo "Download files..."
    aria2c -x1 -s1 -d"$dir_temp" -o"dl.txt" "https://files.rg-adguard.net/dl/$key/$uuid" --disable-ipv6
    aria2c -x8 -s8 -j8 -c -R -d"$PWD" -i "$dir_temp/dl.txt" --disable-ipv6
    if [ -e $dir_temp/.aria2]; then
        download
    fi
}

# Check Programm
# Check if the program is installed
if ! command -v aria2c &> /dev/null; then
    echo "aria2 is not installed. Installing..."
    sudo apt update
    sudo apt install -y aria2
    echo "aria2 has been installed."
else
    echo "aria2 is already installed."
fi
if ! command -v smv &> /dev/null; then
  echo "SmartVersion is not installated. Installing..."
  sudo wget -O /etc/bin/smv https://public.voxhost.fr/partage/smv_x64
  echo "SmartVersion is installed"
else
  echo "SmartVersion is already installed"
fi

if ! command -v 7z &> /dev/null; then
  echo "7z is not installated. Installing..."
  sudo apt update
  sudo apt install -y p7zip-full
  echo "7z is installed"
else
  echo "7z is already installed."
fi

echo "Please enter your UUID\n"
read uuid

echo "Please enter your key\n"
read key

cart="1"
ListSel="S"
dir_temp="/tmp/script"

aria2c -x1 -s1 -d"$dir_temp" -o"list_cart.txt" "https://files.rg-adguard.net/cart/list/$uuid" --disable-ipv6
