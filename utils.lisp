(defun join-strings-with-br (strings)
  (reduce (lambda (acc str)
            (if (string= acc "")
                str
                (concatenate 'string acc "<br>" str)))
          strings
          :initial-value ""))

