-module(area_server0).
-export([loop/0,start/0,area/2]).

start()->spawn(area_server0,loop,[]).

area(Pid,ParaList)->
	rpc(Pid,ParaList).

rpc(Pid,ParaList)->
      Pid!{self(),ParaList},
      receive
           {Pid,Res}->
                Res
      end.


loop()->
    receive 
       {From,{rec,Wth,Ht}}->
           %io:format ("Area of rectangle is ~p~n",[Wth*Ht]),
           From!{self(),Wth*Ht},
       	   loop();
       {From,{squa,Side}} ->
	   From!{self(),Side*Side},
	   %io:format ("Area of square is ~p~n",[Side*Side]),
           loop()
     end.
   

     
