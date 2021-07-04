if filereadable(expand("~/general.vimrc"))
  source ~/general.vimrc
endif

if filereadable(expand("~/plug_list.vimrc"))
  source ~/plug_list.vimrc
endif

if filereadable(expand("~/plug_config.vimrc"))
  source ~/plug_config.vimrc
endif

if filereadable(expand("~/key.vimrc"))
  source ~/key.vimrc
endif
