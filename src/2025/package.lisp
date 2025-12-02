(defpackage #:aoc-lisp-ng/2025
  (:use :cl)
  (:local-nicknames (#:d #:aoc-lisp-ng/downloader)
                    (#:s :str))
  (:import-from #:aoc-lisp-ng/downloader #:download-input-as-string)
  (:export #:show-answers-01 #:show-answers-02))
