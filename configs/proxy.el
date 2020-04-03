(setq url-proxy-services
      '(("no_proxy" . (getenv "no_proxy"))
	("http" . (getenv "http_proxy"))
        ("https" . (getenv "https_proxy"))))
