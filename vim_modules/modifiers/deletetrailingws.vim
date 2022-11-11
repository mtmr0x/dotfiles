"""""""""""""""""""""""""""""""
" DELETE TRAILING WHITE SPACE "
"""""""""""""""""""""""""""""""

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" server
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.rb :call DeleteTrailingWS()
autocmd BufWrite *.rs :call DeleteTrailingWS()

" client
autocmd BufWrite *.html :call DeleteTrailingWS()
autocmd BufWrite *.haml :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.ts :call DeleteTrailingWS()
autocmd BufWrite *.jsx :call DeleteTrailingWS()
autocmd BufWrite *.tsx :call DeleteTrailingWS()
autocmd BufWrite *.cljs :call DeleteTrailingWS()
autocmd BufWrite *.cljc :call DeleteTrailingWS()
autocmd BufWrite *.clj :call DeleteTrailingWS()
autocmd BufWrite *.scss :call DeleteTrailingWS()
autocmd BufWrite *.styl :call DeleteTrailingWS()
autocmd BufWrite *.css :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.ejs :call DeleteTrailingWS()
autocmd BufWrite *.erb :call DeleteTrailingWS()

" shell
autocmd BufWrite *.vimrc :call DeleteTrailingWS()
autocmd BufWrite *.bashrc :call DeleteTrailingWS()

