


Bus reader innit


# Bus Reader

Returns the next expected buses for a particular stop and displays how far away they are.
```
> ruby main.rb --stop=4
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

## Usage

`ruby main.rb`

This command can then be aliased in terminal config;

```
alias nextBusHome='ruby ~/projects/busReader/main.rb --stop=4 --bus=28'
alias nextBusWork='ruby ~/projects/busReader/main.rb'
```


## Args

With no args provided it is hardcoded to a particular stop.

 - `--stop=<PlatformTagNumber>` : The platform tag number of the bus stop. 1 = Bus Interchange Platform A. If excluded defaults to 654 (Wairakei Rd by Blighs Rd heading into town)
- `--bus=<BusNumber>` : The specifc bus to return. If excluded will return all buses expected at the stop for the next hour.

### Known stops

1 - Bus Exchange Platform A
2 - Bus Exchange Platform B
3 - Bus Exchange Platform C
4 - Bus Exchange Platform D
654 - Wairakei Rd near Blighs (outside flat basically lol)
