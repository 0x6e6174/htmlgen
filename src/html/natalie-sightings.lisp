(defun html () 
  (page "natalie sightings" `((section () 
                                      (h1 () "natalie sightings")
                                      (p () "these are reasonably rare"
                                         (br)
                                         "these photographs are uneditted, some of the cameras that were used to take them are simply quite bad"))
                              (section () 
                                       (flex-grid () ,(exec-command "for file in files/natalie-sightings/*; do echo \"<flex-grid-item>$(img-caption \"/$file\")</flex-grid-item>\"; done"))))))

