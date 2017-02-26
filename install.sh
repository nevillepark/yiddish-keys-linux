#!/bin/sh

# Installer for Yiddish keyboard map. 
#
# http://www.shretl.org

# Run ./install.sh
# Then activate via Settings -> Keyboard -> Keyboard Layouts -> add layout 

##########################################################################

# Copy Yiddish layout file into relevant directory
sudo cp yi /usr/share/X11/xkb/symbols/yi &&
sudo chown root:root /usr/share/X11/xkb/symbols/yi &&

# Add Yiddish to rules/evdev.xml

sudo sed -i 's_<\/layoutList>_<layout>\
    <configItem>\
      <name>yi</name>\
      <shortDescription>yi</shortDescription>\
      <description>Yiddish</description>\
      <languageList>\
        <iso639Id>yid</iso639Id>\
      </languageList>\
    </configItem>\
   </layout>\
</layoutList>_g' /usr/share/X11/xkb/rules/evdev.xml &&

# Add Yiddish to rules/evdev.lst
sudo sed -i '/yi              Yiddish/d; // cleanup

  yi              Yiddish_g' /usr/share/X11/xkb/rules/evdev.lst &&

# Say nice things
echo '
Success! The Yiddish keyboard map has been installed.
To activate it in your operating system, see Settings -> Keyboard -> Keyboard Layouts -> add layout
See http://www.shretl.org for more information.
'
