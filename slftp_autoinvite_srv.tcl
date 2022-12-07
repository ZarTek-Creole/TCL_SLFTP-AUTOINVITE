# Visite https://github.com/ZarTek-Creole/TCL_SLFTP-AUTOINVITE
namespace eval ::SLINVITE_SRV {
    variable SLFTP_CHANNEL   "<#CHANNEL_SL_WITH_ADMINROLES>"
}
proc ::SLINVITE_SRV::SLFTPINVITE { frombot fromcmd arg } {
    set SITE_NAME   [lindex ${arg} 0];
    set IRC_NICK    [lindex ${arg} 1];
    putnow "PRIVMSG ${::SLINVITE_SRV::SLFTP_CHANNEL} :!ircnick ${SITE_NAME} ${IRC_NICK}"
    putnow "PRIVMSG ${::SLINVITE_SRV::SLFTP_CHANNEL} :!inviteme ${SITE_NAME}"

}
bind bot - SLFTPINVITE ::SLINVITE_SRV::SLFTPINVITE