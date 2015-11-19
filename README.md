
_mule_ is a prototype engine for multilingual natural logic, powered by [Grammatical Framework](http://www.grammaticalframework.org). It is still under development. 

## Build and run 

_mule_ is built using [stack](https://github.com/commercialhaskell/stack), so you can build and run an executable like this: 

```
stack build
stack exec mule-exe
```

Or load it in GHCi like this: 

```
stack ghci
> :load Main 
> main 
```

## Example 

English:

```
some happy man refused to smile
=
sPosPast + [ someSg + [ modify_AP_CN + [ happy + , man + ] , refuse_to + [ smile - ] ] ]
-->
sNegPast + [  someSg - [  modify_AP_CN - [  happy -  , man -  ]  , smile -  ]  ]
sPosPast + [  someSg + [  man +  , refuse_to + [  smile -  ]  ]  ]
sNegPast + [  someSg - [  man -  , smile -  ]  ]
=
some happy man didn't smile
some man refused to smile
some man didn't smile
```

Dutch: 

```
een gelukkige man weigerde te glimlachen
=
sPosPast + [ an + [ modify_AP_CN + [ happy + , man + ] , refuse_to + [ smile - ] ] ]
-->
sNegPast + [  an - [  modify_AP_CN - [  happy -  , man -  ]  , smile -  ]  ]
sPosPast + [  an + [  man +  , refuse_to + [  smile -  ]  ]  ]
sNegPast + [  an - [  man -  , smile -  ]  ]
=
een gelukkige man glimlachte niet
een man weigerde te glimlachen
een man glimlachte niet
```

German:

```
ein glücklicher Mann weigerte sich zu lächeln
=
sPosPast + [ an + [ modify_AP_CN + [ happy + , man + ] , refuse_to + [ smile - ] ] ]
-->
sNegPast + [  an - [  modify_AP_CN - [  happy -  , man -  ]  , smile -  ]  ]
sPosPast + [  an + [  man +  , refuse_to + [  smile -  ]  ]  ]
sNegPast + [  an - [  man -  , smile -  ]  ]
=
ein glücklicher Mann lächelte nicht
ein Mann weigerte sich zu lächeln
ein Mann lächelte nicht
```
