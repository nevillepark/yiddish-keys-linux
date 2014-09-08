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
\
    <shortDescription>yi</shortDescription>\
    <description>Yiddish (qwerty)</description>\
    <languageList>\
      <iso639Id>yid</iso639Id>\
    </languageList>\
  </configItem>\
  <variantList>\
    <variant>\
      <configItem>\
        <name>israeli</name>\
        <shortDescription>yi</shortDescription>\
        <description>Yiddish (Israeli)</description>\
      </configItem>\
    </variant>\
    <variant>\
     <configItem>\
      <name>israeli-phonetic</name>\
      <shortDescription>yi</shortDescription>\
      <description>Yiddish (Israeli phonetic)</description>\
     </configItem>\
 </variant>\
  </variantList>\
</layout>\
</layoutList>_g' /usr/share/X11/xkb/rules/evdev.xml &&

# Add Yiddish to rules/evdev.lst
sudo sed -i '/yi              Yiddish/d; // cleanup

s_il              Hebrew_il              Hebrew\
  yi              Yiddish_g' /usr/share/X11/xkb/rules/evdev.lst &&

# Say nice things
echo '
Success! The Yiddish keyboard maps have been installed.
To activate them in your operating system, see Settings -> Keyboard -> Keyboard Layouts -> add layout
See http://www.shretl.org for more information.
'
