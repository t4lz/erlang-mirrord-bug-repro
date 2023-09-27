-module(file_info_reader).
-export([get_file_info/1]).

get_file_info(FilePath) ->
    case file:read_file_info(FilePath) of
        {ok, FileInfo} ->
            print_file_info({ok, FileInfo});
        {error, Reason} ->
            io:format("Error: ~s~n", [Reason])
    end.

print_file_info({ok, FileInfo}) ->
    io:format("File Information:~p~n", [FileInfo]);
print_file_info({error, Reason}) ->
    io:format("Error: ~s~n", [Reason]).

