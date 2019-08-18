"return '' is for map <expr>

function! fcitx#inactivate()
	call system('fcitx5-remote -c')
	return ''
endfunction

function! fcitx#activate()
	call system('fcitx5-remote -o')
	return ''
endfunction

function! fcitx#toggle()
	call system('fcitx5-remote -t')
	return ''
endfunction

function! fcitx#is_on()
	return system('fcitx5-remote') == 2 ? v:true : v:false
endfunction

function! fcitx#inactivate_with_state()
	let b:was_fcitx_on = fcitx#is_on()
	return fcitx#inactivate()
endfunction

function! fcitx#restore_state()
	if b:was_fcitx_on
		return fcitx#activate()
	else
		return fcitx#inactivate()
	endif
endfunction
