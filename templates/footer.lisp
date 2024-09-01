(defun footer () 
  `(footer () 
           "page rendered at $[date +%s]"
           (br)
           ,(exec-command "include files/88x31/natalieee.net.html")))
