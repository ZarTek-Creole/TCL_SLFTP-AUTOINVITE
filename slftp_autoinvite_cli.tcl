# Visite https://github.com/ZarTek-Creole/TCL_SLFTP-AUTOINVITE
namespace eval ::SLINVITE_CLI {
    variable SITE_NAME   "<SITENAME_IN_SLFTP>"
    variable IRC_NICK   "<MyNick_Irc_On_SITENAME>"
    variable TO_BOTNAME "";
}
proc ::SLINVITE_CLI::init_server {args} {
    if { ${::SLINVITE_CLI::TO_BOTNAME} == "" } {
        putallbots "SLFTPINVITE ${::SLINVITE_CLI::SITE_NAME} ${::SLINVITE_CLI::IRC_NICK}"
    } else {
        putbot ${::SLINVITE_CLI::TO_BOTNAME} "SLFTPINVITE ${::SLINVITE_CLI::SITE_NAME} ${::SLINVITE_CLI::IRC_NICK}"
    }

}
bind evnt - init-server ::SLINVITE_CLI::init_server
bind msgm - "*Connected!*" ::SLINVITE_CLI::init_server
