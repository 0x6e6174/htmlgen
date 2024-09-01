(defun exec-command (command &key (env-vars nil))
  (let* ((default-env '(("PATH" . "\"$PATH:./scripts\"")))
         (combined-env (append default-env env-vars))
         (cd-command "cd ./site ; ")
         (full-command (format nil "~{~a=~a~} ; ~a~a"
                               (mapcan (lambda (kv) (list (car kv) (cdr kv)))
                                       combined-env)
                               cd-command
                               command)))
    (with-open-stream (output-stream
                       (ext:run-program "/bin/bash" :arguments (list "-c" full-command)
                                        :output :stream))
      (with-output-to-string (result)
        (loop for line = (read-line output-stream nil nil)
              while line do (format result "~a~%" line))))))

