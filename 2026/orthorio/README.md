# About

Hobby project to solve complex multi-agent pathfinding problems using Factorio's conveyor belts.

Meant to be used with MiniZinc and works best when compiled for and ran with Google OR-Tools. See `problems` directory for problem intances.

# Solutions
Level 1.1 (OPTIMAL):
```
─═┌┐═┐  ┌──
─┐║└═│  │═─
 └──═│  │═┐
─═║  │═┐│ └
──┘  └═└┘═─         
43
==========
```
Level 1.2 (Lower Bound = 78)
```
       ┌┐  
──┐  ┌═│║═─
─═│ ┌┘═┘┌──
─═│═┘┌─═│═─
─┐└┐ ║┌═│═─
 └┐└═┌┘┌┘═┐
─═║  │═┘║ └
─═┌──┘═┐└──
──┘┌═║ └┐═─
─═║│═┘  └──
  └┘       
92
----------
```
Level 2.1 (Lower Bound = 131)
```
       ╳╳╳╳╳╳╳╳╳╳╳╳        
       ╳╳╳╳╳╳╳╳╳╳╳╳        
       ╳╳╳╳╳╳╳╳╳╳╳╳        
──┐┌────═┌──┐══┌──┐══┌──┐═─
─═║│══┌──┘══└──┘══└──┘═┐║┌─
─═┌┘═─┘╳╳╳╳╳╳╳╳╳╳╳╳ ┌─═║═┘┌
  │    ╳╳╳╳╳╳╳╳╳╳╳╳ ║  ┌──┘
──┘    ╳╳╳╳╳╳╳╳╳╳╳╳┌─═┌┘║═─
─═║══┌──┐══┌──┐══┌─┘║═┘║└──
─═└──┘══└──┘══└──┘═─┘  └───
       ╳╳╳╳╳╳╳╳╳╳╳╳        
       ╳╳╳╳╳╳╳╳╳╳╳╳        
       ╳╳╳╳╳╳╳╳╳╳╳╳        
137
----------
```

Made with help and insights from:
- Peter Stuckey <<peter.james.stuckey@gmail.com>> 
- [Jonathan Brouwer](https://github.com/JonathanBrouwer) <<jonathantbrouwer@gmail.com>>
