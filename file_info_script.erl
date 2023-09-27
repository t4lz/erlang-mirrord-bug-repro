#!/usr/bin/env escript

-mode(compile).
-include_lib("kernel/include/file.hrl").
-compile([file_info_reader]).

main([FilePath]) ->
    file_info_reader:get_file_info(FilePath),
    init:stop().

