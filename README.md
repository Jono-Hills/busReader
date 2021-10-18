


Bus reader innit


# Bus Reader
## nextBus

Returns the next expected buses for a particular stop and displays how far away they are.
```
> ruby nextBus.rb --stop=4
+++++++++
Stop: Bus Interchange (Platform D)

Next Bus:
+++++++++
1 | 🚌          1m
  |------------
7 |          🚌 23m
  |------------
28|        🚌   8m
  |------------

```

### Usage

`ruby nextBus.rb`

This command can then be aliased in terminal config;

```
alias nextBusHome='ruby ~/projects/busReader/main.rb --stop=4 --bus=28'
alias nextBusWork='ruby ~/projects/busReader/main.rb'
```


### Args

With no args provided it is hardcoded to a particular stop.

 - `--stop=<PlatformTagNumber>` : The platform tag number of the bus stop. 1 = Bus Interchange Platform A. If excluded defaults to 654 (Wairakei Rd by Blighs Rd heading into town)
- `--bus=<BusNumber>` : The specifc bus to return. If excluded will return all buses expected at the stop for the next hour.

### Known stops

1 - Bus Exchange Platform A
2 - Bus Exchange Platform B
3 - Bus Exchange Platform C
4 - Bus Exchange Platform D
654 - Wairakei Rd near Blighs (outside flat basically lol)


## findStop

Returns a list of bus stops with their platform tag numbers when provided with a search term such as a street.

```
ruby findStop.rb Creyke Rd
Creyke Rd 1918
Creyke Rd 1922
Creyke Rd near Clyde Rd 2921
Creyke Rd near Barlow St 1921
```
### Usage
`ruby findStop.rb` 
### Args
Searches whatever args are provided after the filename. Quotes not required

e.g. `ruby findStop.rb Cranford St` returns all stops on Cranford St. 

