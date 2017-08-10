(use-package org
  :config
  (setq org-directory "~/.emacs.d/org"
        org-default-notes-file (concat org-directory "/todo.org"))
  (setq org-publish-project-alist
    '(
       ("org-notes"
         :base-directory "~/notes/article"
         :base-extension "org"
         :publishing-directory "~/notes_html/"
         :recursive t
         :html-doctype "html5"
         :html-head-include-default-style nil
         :html-head-include-scripts nil
         :html-head "<link rel='stylesheet' type='text/css' href='/assets/css/worg.css' />"
         ;;:html-use-infojs t
         :html-preamble t
         :auto-sitemap t
         :sitemap-file-entry-format "%d %t"
         :sitemap-date-format "%Y-%m"
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :auto-preamble t)
       ("org-common"
         :base-directory "~/notes/"
         :base-extension "org"
         :publishing-directory "~/notes_html/"
         :include ("about.org")
         :html-doctype "html5"
         :html-head-include-default-style nil
         :html-head-include-scripts nil
         :html-head "<link rel='stylesheet' type='text/css' href='/assets/css/worg.css' />"
         :html-preamble t
	 :html-postamble nil
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :auto-preamble t)
       ("org-static"
         :base-directory "~/notes/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/notes_html/"
         :recursive t
         :publishing-function org-publish-attachment)
       ("note"
         :components ("org-notes" "org-common" "org-static")
         :author "ucshell AT outlook DOT com")))
  :bind
  ("C-c l" . org-store-link)
  ("C-c a" . org-agenda))

(use-package org-projectile
  :config
  (org-projectile:per-repo)
  (setq org-projectile:per-repo-filename "todo.org"
	org-agenda-files (append org-agenda-files (org-projectile:todo-files))))

(use-package org-bullets
  :config
  (setq org-hide-leading-stars t)
  (add-hook 'org-mode-hook
            (lambda ()
              (org-bullets-mode t))))

(provide 'org-extensions)
