#NoEnv
#Warn
SendMode Input

LoadRc() {
    Send :imap kj <Esc>{Enter}
    Send :nmap H {^}{Enter}
    Send :vmap H {^}{Enter}
    Send :nmap L {$}{Enter}
    Send :vmap L {$}{Enter}
}

^+!r::LoadRc()
