(defun html ()
  (page "server migration"
        `((section () 
                   (h1 () "this website runs on a big server now")
                   "it used to run on a dell optiplex 3040 natalie had laying around, but it got a server from the school basement (you can just take their servers, apparently).")
          (section () 
                   (image-column-container () 
                                           (image-container () 
                                                            (flex-column () 
                                                                         ,(exec-command "img-caption \"/files/natalie-holding-server.png\" \"natalie holding the server it got from the school basement\"")))
                                           (text-column () 
                                                        (h2 () "why does it have a server from its school's basement?")
                                                        (p () 
                                                           "at the time, its school was at a temporary campus while our regular campus is being remodelled. "
                                                           "(it hope this means there will be less lead in the water when they are done, but given how the district is, who knows.) "
                                                           "the current campus is notably smaller than the regular campus, thus a large amount of things are in storage. "
                                                           "the man who is in charge of the storage and moving stored items back to the new campus does not like moving items. "
                                                           "for this reason, when it ask him to let it in to the school's basement to just take random cool things, he says yes.")
                                                        (h2 () "it is kind of horrible that this thing has this server")
                                                        (p () 
                                                           "this server used to be part of the district's network infrastructure.
                                                            when natalie got it, it had an unencrypted raid array on the disks that contained district information. 
                                                            it should not have been stored like this, and natalie definitely should not have been allowed to take it. 
                                                            natalie did of course wipe the drives and didn't even look at what was on them beyond identifying that it was from the district because it is a good {thing}.")))))))
