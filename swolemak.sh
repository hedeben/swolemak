#! /usr/bin/bash

echo "This script adds Swedish Colemak-DH to your installation."

echo "Editing /usr/share/X11/xkb/symbols/se..."

cat << EOF >> /usr/share/X11/xkb/symbols/se

// Swedish Colemak-DH
partial alphanumeric_keys
xkb_symbols "swolemak" {

    include "se(basic)"

    name[Group1]="Swedish (Colemak-DH)";

// 1 2 3 4 5 6 7 8 9 0 + '
//  q w f p b j l u y ö å ~
//   a r s t g m n e i o ä '
//  z x c d v < k h , . - 

    key <AD03>	{ [         f,          F,              dstroke,          ordfeminine ]	};
    key <AD04>	{ [         p,          P,                thorn,                THORN ]	};
    key <AD05>	{ [         b,          B,  leftdoublequotemark,  leftsinglequotemark ] };
    key <AD06>	{ [         j,          J,            dead_hook,            dead_horn ] };
    key <AD07>	{ [         l,          L,              lstroke,              Lstroke ]	};
    key <AD08>	{ [         u,          U,            downarrow,              uparrow ]	};
    key <AD09>	{ [         y,          Y,            leftarrow,                  yen ]	};
    key <AD10>	{ [odiaeresis, Odiaeresis,               oslash,               Oslash ]	};
    
    key <AC02>	{ [         r,          R,           registered,           registered ]	};
    key <AC03>	{ [         s,          S,               ssharp,                U1E9E ]	};
    key <AC04>	{ [         t,          T,                thorn,                THORN ]	};
    key <AC06>	{ [         m,          M,                   mu,            masculine ]	};
    key <AC07>	{ [         n,          N, rightdoublequotemark, rightsinglequotemark ]	};
    key <AC08>	{ [         e,          E,             EuroSign,                 cent ]	};
    key <AC09>	{ [         i,          I,           rightarrow,             idotless ]	};
    key <AC10>	{ [         o,          O,                   oe,                   OE ]	};
    
    key <LSGT>	{ [         z,          Z,        guillemotleft,                 less ]	};
    key <AB01>	{ [         x,          X,       guillemotright,              greater ]	};
    key <AB02>	{ [         c,          C,            copyright,            copyright ]	};
    key <AB03>	{ [         d,          D,                  eth,                  ETH ]	};
    key <AB05>  { [      less,    greater,                  bar,            brokenbar ] };
    key <AB06>	{ [         k,          K,                  kra,            ampersand ]	};
    key <AB07>	{ [         h,          H,              hstroke,              Hstroke ]	};

    key <CAPS> { [  BackSpace,  BackSpace,            BackSpace,            BackSpace ] };

    include "level3(ralt_switch)"
};

EOF

echo "Done."

echo "Editing /usr/share/X11/xkb/rules/evdev.xml..."

sed -i '/Swedish (no dead keys)/a \
          </configItem>\
        </variant>\
        <variant>\
          <configItem>\
            <name>swolemak</name>\
            <description>Swedish (Colemak-DH)</description>
' /usr/share/X11/xkb/rules/evdev.xml

echo "Done."

read -p "Do you want to reboot for the changes to take effect? [y/n]" confirm

if [[ ${confirm} == "y" ]]; then
    echo "Rebooting..."
    shutdown -r now
else
    echo "Alright."
fi
