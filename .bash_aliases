# add ghidra alias
alias ghidra="~/Desktop/Tools/Hex\ Editors/ghidra/ghidraRun"

# add youtube-dl alias
alias youtube-dl="/usr/local/bin/youtube-dl"

# add weather alias
alias weather="curl wttr.in/Modica"

# add translate alias
alias translate="trans"

# add tts alias
# usage: tts "your text goes here"
# if you have some text in a foreign language, you can add the following to your text:
# "-from LANGUAGE". for example: tts "ciao prova" -from it
alias tts="echo $@ | trans -speak -player vlc -no-translate"

# add protonvpn alias
alias vpn="protonvpn"

# add interjection alias (praise rms)
alias interjection="echo I\'d just like to interject for a moment. What you\'re referring to Linux, is in fact, GNU/Linux, or as I\'ve recently taken to calling it, GNU plus Linux."

# add vim browser alias (needs tabbed: https://tools.suckless.org/tabbed/)
alias vimb="tabbed -c vimb -e"

# add vim file manager alias
alias vifm="vifmrun"
