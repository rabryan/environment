#!/bin/sh

# to run this dd below line (minus #) into "r, then use @r
#! chmod 755 %; %
# to run a line individually, do the above, but yy instead of dd
# 0i! <Esc>"ryy@ruu

# --------------------- DEFINE SEVERAL FUNCTIONS --------------------- #
get_python3_packages() {
    echo "Getting required python packages"
    if [ "$OS" = "linux" ]; then
        # python 3 versions
        sudo apt-get install python3 -y
        sudo apt-get install python3-pip -y

        # needed to buil qrc
        sudo apt-get install libfreetype6-dev -y        # matplotlib
        sudo apt-get install libpng3 -y                 # matplotlib

        sudo pip3 install --upgrade pyqt5
        #sudo apt-get install python3-pyqt5.qtsvg -y
        sudo pip3 install --upgrade pyparsing
        sudo pip3 install --upgrade numpy
        sudo pip3 install --upgrade scipy
        sudo pip3 install --upgrade pyserial
        sudo pip3 install --upgrade pyusb
        sudo pip3 install --upgrade psutil
        sudo pip3 install --upgrade urllib3
        sudo pip3 install --upgrade jsonpickle
        sudo pip3 install --upgrade qtconsole
        sudo pip3 install --upgrade ipython
        sudo pip3 install --upgrade pyfirmata
        sudo pip3 install --upgrade simplegeneric
        sudo pip3 install --upgrade pandas
        sudo pip3 install --upgrade plotly
        sudo pip3 install --upgrade matplotlib
        sudo pip3 install --upgrade pyusb
    elif [ $OS = windows ]; then
        echo "It's probably easier to type 'gb' over each link from vim"
        echo "Install the 32 bit versions unless NumPy works for 64bit"
        echo "http://www.python.org/download/"
        echo "https://pypi.python.org/pypi/distribute"
        echo "https://pypi.python.org/pypi/pyreadline"
        echo "Ipython: Download and run as admin after installing distribute"
        echo "https://pypi.python.org/pypi/ipython#downloads"
        echo "http://www.sourceforge.net/projects/numpy/files/NumPy/"
        echo "http://www.matplotlib.org/downloads.html"
        echo "http://www.riverbankcomputing.com/software/pyqt/download/"
        echo "http://cx-freeze.sourceforge.net"
        echo "https://pypi.python.org/pypi/pyserial"
        echo ""
        echo "Installing Python Packages:"
        echo "(cd $softwaredir/environment && untar ~/Downloads/distribute-*)"
        echo "$ untar pyserial-2.*"
        echo "$ cd pyserial-2.*"
        echo "$ /c/Python33/python.exe setup.py install"
    fi
}

get_python2_packages() {
    echo "Getting required python packages"
    if [ "$OS" = "linux" ]; then
        sudo apt-get install python2.7 -y
    elif [ $OS = windows ]; then
        echo "It's probably easier to type 'gb' over each link from vim"
        echo "Install the 32 bit versions unless NumPy works for 64bit"
        echo "http://www.python.org/download/"
        echo "https://pypi.python.org/pypi/setuptools#downloads"
#        echo "https://pypi.python.org/pypi/distribute"
#        echo "https://pypi.python.org/pypi/pyreadline"
        echo "Ipython: don't worry about the start menu error"
        echo "https://pypi.python.org/pypi/ipython#downloads"
        echo "http://www.sourceforge.net/projects/numpy/files/NumPy/"
        echo "http://www.matplotlib.org/downloads.html"
        echo "http://www.riverbankcomputing.com/software/pyqt/download/"
        echo "http://cx-freeze.sourceforge.net"
        echo "https://pypi.python.org/pypi/pyserial"
        echo ""
        echo "Installing Python Packages:"
        echo "(cd $softwaredir/environment && untar ~/Downloads/distribute-*)"
        echo "$ untar pyserial-2.*"
        echo "$ cd pyserial-2.*"
        echo "$ /c/Python33/python.exe setup.py install"
    elif [ $OS = mac ]; then
        echo "Install python, pyqt, numpy, matplotlib - homebrew?"
        echo "install readline: sudo easy_install readline"
        echo "install ipython: download and unp, cd ipy, sudo setup.py install"
    fi
}

# --------------------- SETUP SCRIPT --------------------- #
echo "=================== config_python.sh ==================="
get_python2_packages;
get_python3_packages;
echo "============== END: config_python.sh ==================="
