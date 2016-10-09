-module(lib_misc).
-export([string2value/1])

string2value(Str).
	{ok,Scaned}=eval_scan(Str),
        io:format("~p~n",Scaned).

