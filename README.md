https://github.com/josean-dev/dev-environment-files

more guide with lua : https://github.com/krapjost/nvim-lua-guide-kr

more config with this : https://github.com/LunarVim/Neovim-from-scratch


TODO : 아래와 같은 오토커맨드를 작성해볼 예정
```
function! NewTemplate()

    let l:wiki_directory = v:false

    for wiki in g:vimwiki_list
        if expand('%:p:h') =~ expand(wiki.path)
            let l:wiki_directory = v:true
            break
        endif
    endfor

    if !l:wiki_directory
        return
    endif

    if line("$") > 1
        return
    endif

    let l:template = []
    call add(l:template, '---')
    call add(l:template, 'layout  : wiki')
    call add(l:template, 'title   : ')
    call add(l:template, 'summary : ')
    call add(l:template, 'date    : ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
    call add(l:template, 'updated : ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
    call add(l:template, 'tag     : ')
    call add(l:template, 'toc     : true')
    call add(l:template, 'public  : true')
    call add(l:template, 'parent  : ')
    call add(l:template, 'latex   : false')
    call add(l:template, 'resource: ' . substitute(system("uuidgen"), '\n', '', ''))
    call add(l:template, '---')
    call add(l:template, '* TOC')
    call add(l:template, '{:toc}')
    call add(l:template, '')
    call add(l:template, '# ')
    call setline(1, l:template)
    execute 'normal! G'
    execute 'normal! $'

    echom 'new wiki page has created'
endfunction

```

참고할 문서 :

https://neovim.io/doc/user/autocmd.html

https://johngrib.github.io/wiki/vimwiki/#%EC%83%88%EB%A1%9C%EC%9A%B4-%EB%AC%B8%EC%84%9C-%ED%8C%8C%EC%9D%BC%EC%9D%84-%EB%A7%8C%EB%93%A4%EC%97%88%EC%9D%84-%EB%95%8C-%EA%B8%B0%EB%B3%B8-%ED%98%95%EC%8B%9D%EC%9D%B4-%EC%9E%85%EB%A0%A5%EB%90%98%EB%8F%84%EB%A1%9D-%ED%95%9C%EB%8B%A4

https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/autocommands.lua


했다!

https://devhints.io/vimscript
이런 문서도 있어서 삽질했지만 끝내기는 했다!
