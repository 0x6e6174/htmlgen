(defun footer () 
  `(footer () 
           "page rendered at $[date +%s]"
           (br)
           "page compiled at " ,(exec-command "date +%s")
           ,(exec-command "include files/88x31/natalieee.net.html")))
