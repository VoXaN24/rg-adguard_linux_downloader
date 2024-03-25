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

