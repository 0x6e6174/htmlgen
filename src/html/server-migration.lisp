(defun html ()
  (page "server migration"
        `((section () 
                   (h1 () "this website runs on a big server now")
                   "it used to run on a dell optiplex 3040 I had laying around, but I got a server from the school basement (you can just take their servers, apparently).")
          (section () 
                   (image-column-container () 
                                           (image-container () 
                                                            (flex-column () 
                                                                         ,(exec-command "img-caption \"/files/natalie-holding-server.png\" \"me holding the server I got from the school basement\"")))
                                           (text-column () 
                                                        (h2 () "why do I have a server from my school's basement?")
                                                        (p () 
                                                           "at the time, my school was at a temporary campus while our regular campus is being remodelled."
                                                           "I hope this means there will be less lead in the water when they are done, but given how the district is, who knows."
                                                           "The current campus is notably smaller than the regular campus, thus a large amount of things are in storage."
                                                           "The man who is in charge of the storage and moving stored items back to the new campus does not like moving items."
                                                           "For this reason, when I ask him to let me in to the school's basement to just take random cool things, he says yes.")
                                                        (h2 () "it is kind of horrible that I have this server")
                                                        (p () 
                                                           "this server used to be part of the district's network infrastructure.
                                                            when I got it, it had an unencrypted raid array on the disks that contained district information. 
                                                            it should not have been stored like this, and I definitely should not have been allowed to take it. 
                                                            I did of course wipe the drives and didn't even look at what was on them beyond identifying that it was from the district because I am not evil.")))))))

