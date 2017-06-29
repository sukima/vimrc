" after/unimparied.vim - Custom extras for the Unimparied plugin
" Maintainer:   Devin Weaver (@sukima) <suki@tritarget.org>
" Version:      1.0

" Toggle foldcolumn {{{1
function! FoldColumnToggle(value)
  if &foldcolumn
    let &foldcolumn=0
  else
    let &foldcolumn=a:value
  endif
endfunction

" Toggle Spelling Navigation {{{1
function! ToggleSpellingNavigation( )
    if !exists("g:spell_navigation_enabled") || g:spell_navigation_enabled == 0
        call SetSpellingNavigation(1)
    else
        call SetSpellingNavigation(0)
    endif
endfunction

function! SetSpellingNavigation( enabled )
    " ViewSetup() has conflicting mappings. Can't use spell while nomodifiable
    " anyway.
    if g:viewState == 0
        echohl Error
        echo "Cannot use spelling. File nomodifiable."
        echohl None
    else
        if a:enabled == 0
            setlocal nospell
            silent! nunmap <buffer> <CR>
            silent! nunmap <buffer> f
            silent! nunmap <buffer> b
            let g:spell_navigation_enabled = 0
            echo "Spell mappings: Off"
        else
            setlocal spell
            silent! nnoremap <buffer> <CR> z=
            silent! nnoremap <buffer> f ]s
            silent! nnoremap <buffer> b [s
            let g:spell_navigation_enabled = 1
            echo "Spell mappings: On ( f Next, <Enter> Suggest, b Prev )"
          endif
    endif
endfunction

" Unimpaired cutom mappings {{{1
if version >= 700
  nnoremap [of :set foldcolumn=2<cr>
  nnoremap ]of :set foldcolumn=0<cr>
  nnoremap cof :call FoldColumnToggle(2)<cr>

  nnoremap [oz :call SetSpellingNavigation(1)<Cr>
  nnoremap ]oz :call SetSpellingNavigation(0)<Cr>
  nnoremap coz :call ToggleSpellingNavigation()<Cr>
endif

" vim600:set fdm=marker sw=2 ts=2 et:
