(require 'neotree)
(global-set-key [C-escape] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq neo-smart-open t)