# Visite https://github.com/ZarTek-Creole/TCL_SLFTP-AUTOINVITE
namespace eval ::SLINVITE_CLI {
    # Site name or list of site name separate by space "site1 site2 site3 etc" for this network
    variable SITE_NAME   "<SITENAME_IN_SLFTP>"
    variable IRC_NICK   "<MyNick_Irc_On_SITENAME>"
    variable TO_BOTNAME "";
}
proc ::SLINVITE_CLI::init_server {args} {
    if { ${::SLINVITE_CLI::TO_BOTNAME} == "" } {
        foreach { SITENAME } [split ${::SLINVITE_CLI::SITE_NAME}]  {
            putallbots "SLFTPINVITE ${SITENAME} ${::SLINVITE_CLI::IRC_NICK}";
        }
    } else {
        foreach { SITENAME } [split ${::SLINVITE_CLI::SITE_NAME}]  {
            putbot ${::SLINVITE_CLI::TO_BOTNAME} "SLFTPINVITE ${SITENAME} ${::SLINVITE_CLI::IRC_NICK}";
        }
    }

}
bind evnt - init-server ::SLINVITE_CLI::init_server
bind msgm - "*Connected!*" ::SLINVITE_CLI::init_server
