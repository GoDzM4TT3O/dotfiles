## user defined bash aliases

# add slimjet alias
alias slimjet="flashpeak-slimjet"

# add ghidra alias
alias ghidra="/home/matteo/Desktop/Tools/Hex\ Editors/ghidra/ghidraRun"

# add youtube-dl alias
alias youtube-dl="/usr/local/bin/youtube-dl"

# add weather alias
alias weather="curl wttr.in/Modica"

# add translate alias
alias translate="trans"

# add tts alias
# usage: tts "your text goes here"
# trans flags work fine:
# if you have some text in a foreign language, you can add the following to your text:
# "-from LANGUAGE". for example: tts "ciao prova" -from it
alias tts="echo $@ | trans -speak -player vlc -no-translate"

# add taskbook alias
alias tb="taskbook"

# add protonvpn alias
alias vpn="protonvpn"

#add please alias
alias please="sudo"

# add settings alias
alias settings="gnome-control-center"

# add thanks aliases
alias thanks="echo 'Happy to help you, $USER :)' | lolcat -a"
alias thankyou="thanks"
alias thank-you="thanks"
alias quit="echo 'Bye, $USER!' | lolcat -a; exit"

# add interjection alias (praise rms)
alias interjection="echo I\'d just like to interject for a moment. What you\'re referring to Linux, is in fact, GNU/Linux, or as I\'ve recently taken to calling it, GNU plus Linux."

alias vimb="tabbed -c vimb -e"
alias vifm="vifmrun"
