-module(ring).
-export([start/2, foo/1, bar/0]).
%%
%% per Armstrong's "Programming Erlang"
%% Write a ring benchmark. Create N processes in a ring. Send a message round the ring M times.
%% So that a total of N * M messages get sent. Time how long this takes for different values of N and M.
%%

foo(Next) ->
     receive        %% foo does not care about the value of 2nd element in {x,y}, only bar does
  {0, Any} ->
      % io:format("foo done ~n",[]),
      Next ! {0, Any};  %% send the 0 along to tell everyone to shut down
  {N, Any} ->
      % io:format("  foo ~p  ~n", [N]),
      Next ! {N-1, Any},
      foo(Next);
  Other -> io:format("foo: huh? ~p ~n", [Other])
     end.

bar() ->
     receive
  {0, Next} ->
      % io:format("bar done ~n",[]),
      Next ! {0, Next};
  {N, Next} ->
      % io:format("bar ~p  ~n", [N]),
      Next ! {N-1, Next},
      bar();
  Other -> io:format("bar: huh? ~p ~n", [Other])
     end.

%% construct a chain of processes
%% process J-1 routes msgs to process J for all J < K
chain(0, Pid) -> Pid;
chain(K, Pid) -> chain(K-1, spawn(ring,foo,[Pid])).

%% N is the number of processes in the ring
%% M is the number of times msgs circle the ring
start(N, M) ->
     statistics(runtime),
     statistics(wall_clock),

     A= spawn(ring, bar, []),
     B= chain(N-1, A),
     A ! {N*M, B},

     {_, RT} = statistics(runtime),
     {_, WC} = statistics(wall_clock),
     io:format("Total time=~p (~p) milliseconds~n", [RT, WC]).

