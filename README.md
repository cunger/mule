
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
> a Dutch player lost

  sPosPast + [ apply_VP + [ an + [ modify_AP_CN + [ Dutch + , player + ] ] , lose1 + ] ]
  some x [(Dutch (x)and player (x))][lose (x)]

 --> a Dutch player lost
     sPosPast + [ apply_VP + [ an + [ modify_AP_CN + [ Dutch + , player + ] ] , lose1 + ] ]
     some x [(Dutch (x)and player (x))][lose (x)]

 --> a player lost
     sPosPast + [ apply_VP + [ an + [ player + ] , lose1 + ] ]
     some x [player (x)] [lose (x)]

 --> a European player lost
     sPosPast + [ apply_VP + [ an + [ modify_AP_CN + [ European + , player + ] ] , lose1 + ] ]
     some x [(European (x)and player (x))][lose (x)]

 --> a player from the Netherlands lost
     sPosPast + [ apply_VP + [ an + [ modify_Adv_CN + [ apply_Prep + [ from + , Netherlands + ] , player + ] ] , lose1 + ] ]
     some x [(from (x, Netherlands)and player (x))][lose (x)]

 --> a player from Europe lost
     sPosPast + [ apply_VP + [ an + [ modify_Adv_CN + [ apply_Prep + [ from + , Europe + ] , player + ] ] , lose1 + ] ]
     some x [(from (x, Europe)and player (x))][lose (x)]
```

Dutch:

```
> een Nederlandse speler verloor

  sPosPast + [ apply_VP + [ an + [ modify_AP_CN + [ Dutch + , player + ] ] , lose1 + ] ]
  some x [(Dutch (x)and player (x))][lose (x)]

 --> een Nederlandse speler verloor
     sPosPast + [ apply_VP + [ an + [ modify_AP_CN + [ Dutch + , player + ] ] , lose1 + ] ]
     some x [(Dutch (x)and player (x))][lose (x)]

 --> een speler verloor
     sPosPast + [ apply_VP + [ an + [ player + ] , lose1 + ] ]
     some x [player (x)] [lose (x)]

 --> een Eurpoese speler verloor
     sPosPast + [ apply_VP + [ an + [ modify_AP_CN + [ European + , player + ] ] , lose1 + ] ]
     some x [(European (x)and player (x))][lose (x)]

 --> een speler uit Nederland verloor
     sPosPast + [ apply_VP + [ an + [ modify_Adv_CN + [ apply_Prep + [ from + , Netherlands + ] , player + ] ] , lose1 + ] ]
     some x [(from (x, Netherlands)and player (x))][lose (x)]

 --> een speler uit Europa verloor
     sPosPast + [ apply_VP + [ an + [ modify_Adv_CN + [ apply_Prep + [ from + , Europe + ] , player + ] ] , lose1 + ] ]
     some x [(from (x, Europe)and player (x))][lose (x)]
```

German:

```
> ein niederländischer Spieler verlor

  sPosPast + [ apply_VP + [ an + [ modify_AP_CN + [ Dutch + , player + ] ] , lose1 + ] ]
  some x [(Dutch (x)and player (x))][lose (x)]

 --> ein niederländischer Spieler verlor
     sPosPast + [ apply_VP + [ an + [ modify_AP_CN + [ Dutch + , player + ] ] , lose1 + ] ]
     some x [(Dutch (x)and player (x))][lose (x)]

 --> ein Spieler verlor
     sPosPast + [ apply_VP + [ an + [ player + ] , lose1 + ] ]
     some x [player (x)] [lose (x)]

 --> ein europäischer Spieler verlor
     sPosPast + [ apply_VP + [ an + [ modify_AP_CN + [ European + , player + ] ] , lose1 + ] ]
     some x [(European (x)and player (x))][lose (x)]

 --> ein Spieler aus Holland verlor
     sPosPast + [ apply_VP + [ an + [ modify_Adv_CN + [ apply_Prep + [ from + , Netherlands + ] , player + ] ] , lose1 + ] ]
     some x [(from (x, Netherlands)and player (x))][lose (x)]

 --> ein Spieler aus Europa verlor
     sPosPast + [ apply_VP + [ an + [ modify_Adv_CN + [ apply_Prep + [ from + , Europe + ] , player + ] ] , lose1 + ] ]
     some x [(from (x, Europe)and player (x))][lose (x)]
```
