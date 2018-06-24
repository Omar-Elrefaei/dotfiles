#! /bin/bash

export QT_STYLE_OVERRIDE=GTK+

exec mate-session

# Keeping i3 as default
session=${1:-mate-session}

#case $session in
#    cinnamon          ) exec cinnamon-session;;
#    i3|i3wm           ) exec mate-session;;
#    xfce			  ) exec startxfce4;;
#    kde				  ) exec /usr/bin/startkde;;
#	fluxbox			  ) exec /usr/bin/startfluxbox;;
#	awesome			  ) exec awesome;;
#	m|mate			  ) exec mate-session;;
#	ob|openbox        ) exec openbox-session;;

	# No known session, try to run it as command
#    *) exec mate-session ;;
esac
