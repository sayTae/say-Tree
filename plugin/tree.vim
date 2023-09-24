
function! Tree()

	if bufexists("Tree")
        " Tree 버퍼를 닫음
        execute 'bdelete Tree'

	else
		" 수직 분할 창 생성
		execute '32vsplit'

		" 현재 파일의 디렉토리 경로 가져오기
		let current_file = expand('%:p')
		let current_dir = fnamemodify(current_file, ':h')

		" 한 단계 상위 디렉토리 경로 가져오기
		let parent_dir = fnamemodify(current_dir, ':h')

		" clear 명령어 실행
		silent execute '!clear'

		" lsd --tree 실행
		silent execute 'term lsd --tree "' . parent_dir . '"'

		exe "file Tree"
		wincmd l

	endif

endfunction

command! -nargs=0 Tree call Tree()
