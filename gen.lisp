(load "~/quicklisp/setup.lisp")

(load "html.lisp")
(load "exec.lisp")
(load "utils.lisp")
(load "templates/page.lisp")

(ql:quickload "uiop")

(defparameter *src-files* nil)

(uiop:collect-sub*directories "src/" t t (lambda (x) (push x *src-files*)))

(print *src-files*)

(defun create-directories-iteratively (path)
  (let* ((directories (pathname-directory (pathname path)))
         (accumulated-path (make-pathname :directory nil)))
    (dolist (dir directories)
      (setq accumulated-path (make-pathname :directory (append (pathname-directory accumulated-path) (list dir))))
      (ignore-errors
        (make-directory accumulated-path)))))

(defun write-to-file (content path)
  (create-directories-iteratively path)
  (with-open-file (stream path :direction :output :if-exists :supersede :if-does-not-exist :create)
    (write-string content stream)))

(defun replace-substring (original-string old-substring new-substring)
  (let ((start (search old-substring original-string)))
    (if start
        (let* ((end (+ start (length old-substring)))
               (before (subseq original-string 0 start))
               (after (subseq original-string end)))
          (concatenate 'string before new-substring after))
        original-string)))

(defun build (file) 
  (load file)
  (write-to-file (html->string (html)) (replace-substring (replace-substring (format nil "~a" file) (format nil "~asrc" (ext:cd)) "./out") ".lisp" ".html")))

(defun build-dir (directory)
  (let ((lisp-files (uiop:directory-files directory)))
    (dolist (file lisp-files)
      (build file))))

(dolist (dir *src-files*)
  (build-dir dir))
