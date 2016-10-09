-module(lib_misc).
-export([string2value/1]).

string2value(Str)->
	{ok,Scaned,_}=erl_scan:string(Str),
        io:format("~p~n",[Scaned]),
	{ok,Parsed}=erl_parse:parse_exprs(Scaned),
    	io:format("~p~n",[Parsed]),
 	{value,Value,_}=erl_eval:exprs(Parsed,[]),
        Value.
        
        
