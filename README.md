
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
sPosPast + [ quant + [ someSg + [ modify_AP_CN + [ happy + , man + ] ] , refuse_to + [ smile - ] ] ]
-->
sPosPast + [  quant + [  someSg + [  man +  ]  , refuse_to + [  smile -  ]  ]  ]
sNegPast + [  quant - [  someSg - [  modify_AP_CN - [  happy -  , man -  ]  ]  , smile -  ]  ]
sNegPast + [  quant - [  someSg - [  man -  ]  , smile -  ]  ]
=
some man refused to smile
some happy man didn't smile
some man didn't smile
```

Dutch: 

```
een gelukkige man weigerde te glimlachen
=
sPosPast + [ quant + [ an + [ modify_AP_CN + [ happy + , man + ] ] , refuse_to + [ smile - ] ] ]
-->
sPosPast + [  quant + [  an + [  man +  ]  , refuse_to + [  smile -  ]  ]  ]
sNegPast + [  quant - [  an - [  modify_AP_CN - [  happy -  , man -  ]  ]  , smile -  ]  ]
sNegPast + [  quant - [  an - [  man -  ]  , smile -  ]  ]
=
een man weigerde te glimlachen
een gelukkige man glimlachte niet
een man glimlachte niet
```

German:

```
ein glücklicher Mann weigerte sich zu lächeln
=
sPosPast + [ quant + [ an + [ modify_AP_CN + [ happy + , man + ] ] , refuse_to + [ smile - ] ] ]
-->
sPosPast + [  quant + [  an + [  man +  ]  , refuse_to + [  smile -  ]  ]  ]
sNegPast + [  quant - [  an - [  modify_AP_CN - [  happy -  , man -  ]  ]  , smile -  ]  ]
sNegPast + [  quant - [  an - [  man -  ]  , smile -  ]  ]
=
ein Mann weigerte sich zu lächeln
ein glücklicher Mann lächelte nicht
ein Mann lächelte nicht
```
