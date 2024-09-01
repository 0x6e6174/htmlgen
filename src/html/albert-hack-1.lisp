(defun html () 
  (page "albert" `((section () 
                            (h1 () "a friend hacked my website.")
                            (p () "but how?"))
                   (section () 
                            (p () "
                               prior to me rewriting the backend of my website, there was a bug that would allow a bash command in a comment inside $[echo \\$\\[]] and not containing &lt; or &rt; to be executed if you querried the url /html/%2e%2e/files/posts-to-homepage/{post file}.
                               this was due to any url beginning with '/html/' being unconditionally put through parse_file(), which generates static content from the embedded bash in the html (see <a href='/html/site-info.html'></a>).
                               in addition to this, the source code of the server could be attained via a similar method, requesting the path of the file, but with /files/ or /html/ in front of it, followed by %2e%2e.")
                            (p () "
                               albert was able to exploit this by first getting the source code of the webserver via the second method discussed above, examining it, and deducing the first vulnerability mentioned above.
                               upon discovering the RCE available via the comment untrusted command evaluation, they were able to add an ssh key to my server and thus gain a shell.
                               amazingly, at the same time that they did this, my other friend's girlfriend (appearing in the comments as gexfan) was halfheartedly trying to mess with my site.
                               this ended with around 15 messages on discord telling me my site had been hacked, only around two of which were from albert.")))))
