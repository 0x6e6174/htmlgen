(defun join-strings-with-br (strings)
  (reduce (lambda (acc str)
            (if (string= acc "")
                str
                (concatenate 'string acc "<br>" str)))
          strings
          :initial-value ""))

(defun html ()
  (page "site info" 
        `((section () 
                   (h1 () "information about this website"))
          (section ()
                   (h2 () "/(.*\\.)?natalieee.net/")
                   (h3 () "why?")
                   (p () "I was displeased with my former status of not having a website")
                   (h3 () "how?")
                   (p () "requests to /(.*\\.)?natalieee.net/ get routed to nginx, which acts as a proxy for my subdomains. "
                      "nginx routes requests to /^natalieee.net/ to this webserver, which is named "
                      (a (:href "https://git.natalieee.net/nat/sludge") "sludge") ". "
                      "requests to /.*\\.natalieee.net/ are routed according to the /.*\\.natalieee.net/ section."))
          (section ()
                   (h2 () "/^natalieee.net/")
                   (p () "the root domain of this website, which you are currently observing, is running sludge. "
                      "the colors of both the light and dark mode are based off of the colorscheme of my laptop."))
          (section ()
                   (h2 () "sludge")
                   (h3 () "what is a sludge?")
                   (p () "s[ite][k]ludge is my from-scratch webserver. it has features.")
                   (h3 () "why?")
                   (p () "I dislike \"web development\". also, I was bored.")
                   (h3 () "what does sludge do?")
                   (ul ()
                       (li () "send data")
                       (li () "receive data")
                       (li () "process data")
                       (li () "create new data")
                       (li () "move data")
                       (li () "coerce data[types]")
                       (li () "other verbs prepended to data"))
                   (h3 () "how does sludge?")
                   (p () "sludge receives requests for paths. if these paths are in the routing table, it determines what it should respond with. "
                      "generally, if the path starts with /html/, it will read an html document from the filesystem. "
                      "following this, it will locate any instance of \"{key}\" and replace these instances with a value determined by a function associated to the route being requested in the routing table. "
                      "after substituting these values, it will find any instances of the pattern \"$[echo \\$[...]]\", where ... is a valid bash expression. "
                      "for each match, it replaces the original matching text with the output of said text executed in bash. "
                      "this functions as a static sight generator. an example of this is the headers on this site, which are included via the following expression: \"$[echo \\$[include ./html/header.html]]\"")
                   (p () "sludge also has the ability to apply arbitrary edits to outgoing data prior to said data being sent, but after it has been generated. "
                      "you may observe this "
                      (a (:href "?uwu=true") "here") "."))
          (section () 
                   (h2 () "webocodynamics of natalieee.net")
                   "the means by which this website runs involves an unreasonable number of symlinks. here is a textual description of a graph of them:"
                   (code () 
                        ,(join-strings-with-br '(
                                                 "site -> s&#x200B;ludge [label=s&#x200B;ludge]"
                                                 "s&#x200B;ludge -> site [label=site]"
                                                 "htmlgen -> site [label=out]"
                                                 "htmlgen -> site [label=site]"
                                                 )))
                   "you may ask: why?"
                   (br)(br)
                   "the answer to such a question is that sludge runs with a working directory of \~/site, but scripts in \~/site/scripts must be able to import files from \~/sludge (specifically \~/site/scripts/include). "
                   "htmlgen needs to be able to read scripts in \~/site/scripts to run commands at compile time. htmlgen writes html to \~/htmlgen/out, thus the double symlink to \~/site. "
                   "technically, this could all be done without symlinks. this is vaguely more robust because in the event that I move something, I simply need to change the symlinks instead of the paths in arbitrarily many files. "
                   "nevertheless, the number of symlinks is amusing. "
                   (footnote () "nevertheless is a stupid word"))
          (section ()
                   (h2 () "/.*\\.natalieee.net/")
                   (ul ()
                       (li () ,(exec-command "make-link https://git.natalieee.net") ": Gitea instance. You may use it if you feel so inclined for some reason. I wouldn't.")
                       (li () ,(exec-command "make-link https://dns.natalieee.net") ": Pointless CNAME record to my main domain so that entities using my dns (A number greater than 0!) can put dns.natalieee.net down as their nameserver instead of natalieee.net."))))))

