vim.cmd [[
  let g:md_modify_disabled = 0
  function! NewTemplate ()
    let l:wiki_directory = v:false
        
    for wiki in g:vimwiki_list
        if expand('%:p:h') =~ expand(wiki.path)
            let l:wiki_directory= v:true
            break
        endif
    endfor
    if !l:wiki_directory
        echom 'first debugging point >> called this return statement'
        return
    endif

    if line("$") > 1
        return
    endif

    let l:template = []
    call add(l:template, '---')
    call add(l:template, 'title: ')
    call add(l:template, 'summary: ')
    call add(l:template, 'date: ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
    call add(l:template, 'lastmod: ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
    call add(l:template, 'tags: ')
    call add(l:template, 'categories: ')
    call add(l:template, 'public: true')
    call add(l:template, 'parent: ')
    call add(l:template, 'description: ')
    call add(l:template, 'showToc: true')
    call add(l:template, '---')
    call add(l:template, '')
    call add(l:template, '# ')
    call setline(1, l:template)
    execute 'normal! G'
    execute 'normal! $'

    echom 'new wiki page has created'

  endfunction

  function! LastModified()
    if g:md_modify_disabled
        return
    endif
    if &modified
        " echo('markdown updated time modified')
        let save_cursor = getpos(".")
        let n = min([10, line("$")])
        keepjumps exe '1,' . n . 's#^\(.\{,10}updated\s*: \).*#\1' .
          \ strftime('%Y-%m-%d %H:%M:%S +0900') . '#e'
        call histdel('search', -1)
        call setpos('.', save_cursor)
    endif
  endfun

  augroup wimwikiauto
    autocmd BufWritePre *wiki/*.md call LastModified()
    autocmd BufRead,BufNewFile *wiki/*.md call NewTemplate()
  augroup END
]]
