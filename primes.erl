-module(primes).
-compile(export_all).

%
%   This function hasa prime factor that it uses to test numbers
%   as they are received.  Numbers that contain the prime factor
%   are simply dropped.  Other numbers are sent to the next child
%   in the chain.  If any of those child can reject the number as
%   not being prime, they do.  If none of them can, the number is declared 
%   to be prime and displayed.  A new child is added to the end of the list
%   to reject future numbers that have this as a prime factor.
%
%   EvilTeach, Aug 2008
%
print_if_prime() ->
    
    receive
    
        % A quit message means shut down the whole chain
        {quit, _N} ->                   

            % Do we have a child?
            case ChildPid = get(child) of

                % No, so we are the last child in the chain
                undefined -> []; 

                % Yes, so we tell the next child to shutdown
                ChildPid -> 
                   ChildPid ! {quit, 0}
            end,

            % Erase my local dictionary 
            erase();

        % Tell the subprocess which prime factor it is to service
        {you_check, N} ->               

            io:format("~p IS PRIME~n",[N]),

            put(myFactor, N),           
            print_if_prime();          

        % We need to check to see if N is prime
        {check, N} ->

            %io:format("~p check ~p against ~p~n", [self(), N, get(myFactor)]),

            case N rem get(myFactor) of
                
                % a remainder of zero, indicates that is is not a prime
                0       -> [];

                % all other values need shipped off down the chain
                _Other  -> 

                    % Do we have a child to pass it to?
                    case ChildPid = get(child) of

                       % No. So we create one
                       undefined -> 
                                         
                           % Create a child to check this new prime number
                           NewChildPid = spawn(fun primes:print_if_prime/0),

                           % io:format("Created PID ~p for ~p~n",[NewChildPid, N]),

                           % Save it so we can call it later
                           put(child, NewChildPid),

                           % Tell it which number it is responsible for checking N
                           NewChildPid ! {you_check, N};


                       % Yes, so we let the children deal with it
                       ChildPid -> 
                           % io:format("We do have a child~n",[]),
                                           
                           % tell it to check this value
                           ChildPid ! {check, N}
                       end
            end,

            print_if_prime()
    end.
    

generate_primes_from(N, Limit, _child) when N > Limit -> 
    % There are no more values to iterate through
    [];

generate_primes_from(N, Limit, FirstChild) ->

    %io:format("sending ~p~n",[N]),

    % Tell the first child in the chain, to check the next number
    FirstChild ! {check, N},

    % how every so often, we do a short delay to not overflow the message queue
    % 80 seems to be right for my machine for Limit =  10k
    % 20 seems to be right for my machine for Limit = 100k
    case N rem 80
      of 
        0 -> receive
                     after 1 -> ok
                 end;
        _ -> []
    end,


    % Continue processing the next number
    generate_primes_from(N + 1, Limit, FirstChild).


main() ->
    io:format("Prime main begins~n",[]),

    % Create a first child to process a value
    ChildFactors2 = spawn(fun primes:print_if_prime/0),

    % Tell the child to check values for a factor of 2
    ChildFactors2 ! {you_check, 2},

    % Throw a whole range of numbers at the child
    generate_primes_from(2, 2000000, ChildFactors2),

    % Tell the first child to tell the rest of the children to shutdown
    ChildFactors2 ! {quit, 0},

    io:format("Prime main ends~n",[]).


start() -> start(2000000).  % default value for max is 100

start(Max) -> 
       io:format("  Loading ~w numbers into matrix (+N) \n ", [ Max ] ),
       Lid = spawn_link( primes, linda, [Max, [], [] ]),
       Sqrt = round(math:sqrt(Max)+0.5),  
       io:format(" Sqrt(~w) + 1 = ~w \n " , [Max,Sqrt] ),  
       io:format(" Tuple space is started ~n ",[]),  
       io:format(" ~w sieves are spawning (+PN) ~n ", [Sqrt] ),
       io:format(" Non prime sieves are being halted (-PN) ~n ", [] ),
       % load numbers into tuplespace 
       % and spawn sieve process
       spawn( primes, put_it, [Max, Max, Lid] ).

start_sieves(Lid) ->
       Lid ! {self(), get, all, pids},  
       receive 
           {lindagram, pids, Pids} -> done
       end,
       start_sieve_loop(Pids).

start_sieve_loop([]) -> done;
start_sieve_loop([Pid|Pids]) ->
       receive
       after 100 -> done
       end,
       Pid ! {start},
       start_sieve_loop(Pids).

spawn_sieves( _Max, Sqrt, _Lid, Sqrt ) -> done;  
spawn_sieves( Max, Inc, Lid, Sqrt ) ->
       T = 1000,
       Pid = spawn( primes, sieve, [ Max, Inc+Inc, Inc, Lid, T ]),
       Name = list_to_atom("P" ++ integer_to_list(Inc)),
       Lid ! {put, pid, Name},
       register( Name, Pid),
       io:format(" +~s ", [atom_to_list(Name)]),
       spawn_sieves( Max, Inc+1, Lid, Sqrt ).

put_it(Max, N, Lid) when N =< 1 ->
       Sqrt = round(math:sqrt(Max)+0.5),
       spawn_sieves( Max, 2, Lid, Sqrt );  

put_it(Max, N,Lid) when N > 1 ->
       receive
       after 0 ->
           Lid ! {put, N, N},
           if 
               N rem 1000 == 0 ->
                   io:format(" +~w ", [N]);
               true -> done
           end,
           put_it(Max, N-1,Lid)
       end.

   % the 2 sieve starts last and has the most to do so it finishes last
sieve(Max, N, 2, Lid, _T) when N > Max -> 
       io:format("final sieve ~w done, ~n", [2] ),
       Lid ! {dump,output};

sieve(Max, N, Inc, _Lid, _T) when N > Max ->    
       io:format("sieve ~w done ", [Inc] );

sieve(Max, N, Inc, Lid, T) when N =< Max ->   
       receive 
       after 
           T -> NT = 0   
       end,
       receive 
           {lindagram,Number} when Number =/= undefined -> 
               clearing_the_queue;
           {exit} -> exit(normal)
       after
           1 -> done 
       end,

       % remove multiple of number from tuple-space
       Lid ! {self(), get, N},
       Some_time = (N rem 1000)==0,
       if Some_time -> io:format("."); true -> done end,

       % remove (multiple of Inc) from sieve-process space
       Name = list_to_atom("P" ++ integer_to_list(N)),
       Exists = lists:member( Name, registered()),
       if 
           Exists ->
               Name ! {exit},
               io:format(" -~s ", [atom_to_list(Name)] );
           true -> done
       end,
       sieve(Max, N+Inc, Inc, Lid, NT).        % next multiple
        
   %% linda is a simple tutple space 
   %%    if it receives no messages for 2 whole seconds it dumps its contents 
   %%    as output and halts

linda(Max, Keys, Pids) ->
       receive
       {put, pid, Pid} ->
           linda(Max, Keys, Pids++[Pid]);
       {put, Name, Value} ->
           put( Name, Value),
           linda(Max, Keys++[Name], Pids);
       {From, get, Name} ->
           From ! {lindagram, get( Name)},
           erase( Name ),                          % get is a destructive read  
           linda(Max, Keys--[Name],Pids);
       {From, get, all, pids} ->
           From ! {lindagram, pids, Pids},
           linda(Max, Keys, Pids );
       {From, get, pid, Pid} ->
           L1 = length( Pids ),
           L2 = length( Pids -- [Pid]),
           if 
               L1 > L2 ->  % if it exists
                   From ! {lindagram, pid, Pid};
               true -> 
                   From ! {lindagram, pid, undefined}
           end,
           linda(Max, Keys, Pids );
       {dump,output} ->
           io:format(" ~w final primes remain: ~w ~n ", [length(Keys),  lists:sort(Keys) ])
       after (100*Max) -> % if there is not tuple action after some time then print the results
           io:format(" ~w primes remain: ~w ~n ", [length(Keys),  lists:sort(Keys) ])
       end.
