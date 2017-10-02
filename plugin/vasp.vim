function! VaspLoadSession()
	if !exists("g:vasp_session_name")
		let sessions = globpath('./', '*.vimsession')
		echom "Found sessions: " sessions
		if !empty(sessions) " if there are sessions saved in pwd
			let l:file_name = split(sessions, '\n')[0]
			let g:vasp_session_name = split(split(l:file_name, '\./')[-1], '\.')[-2]
			echo "Session name: " g:vasp_session_name
		else " load default session if existing
			let l:file_name = $HOME . '/.vim/vim.vimsession'
		endif
	else " reload known session if existing
		let l:file_name = g:vasp_session_name . '.vimsession'
	endif

	echom "Filename " l:file_name
	if filereadable(l:file_name)
		echom "Using session: " l:file_name
		silent exe 'source' l:file_name
	else
		echom "No session to load. Default session will be created later."
	endif
endfunction

function! VaspSaveSession()
	if exists("g:vasp_session_name")
		echom "Saving session " g:vasp_session_name
		let l:file_name = g:vasp_session_name . '.vimsession'
	else
		echom "Saving default session"
		let l:file_name = $HOME . '/.vim/vim.vimsession'
	endif
	silent exe 'mksession!' l:file_name
endfunction

au VimEnter * if argc() == 0 | call VaspLoadSession() | endif
au VimLeavePre,BufEnter * call VaspSaveSession()
