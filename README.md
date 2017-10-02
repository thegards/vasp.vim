VASP - **V**im **A**uto **S**ession **P**lugin

  VASP is a simple plugin to work with automatic sessions.

# Installation
  It can be easily installed using vundle. Simply add the following to your vimrc:
  
  ```Plugin 'thegards/vasp.vim'```

# How it works
  When invoking vim without command-line arguments, the plug-in will try to automatically load a session from the current working directory. If many are present, it will load the first on the list (sorted lexicographically).
  
  If there are no sessions on the current working directory, the plug-in will try to load a default session from $HOME/.vim .
  
  If no session exists in your VIMDIR, one will be created automatically.
  
  To create a session in the current working directory, assign a value to the `g:vasp_session_name` variable and call `VaspSaveSession`:
  
  ```let g:vasp_session_name = MySessionName
  :call VaspSaveSession()```
