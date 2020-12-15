


Bus reader innit


# Bus Reader

Returns the next expected buses for a particular stop and displays how far away they are.
```
> ruby main.rb --stop=4
+++++++++
Stop: Bus Interchange (Platform D)

Next Bus:
+++++++++
1|
---
     6m
     21m
     37m
     50m
========
17|
---
     13m
     42m
========
28|
---
     4m
     33m
     43m
     57m
========
44|
---
     3m
     34m
========
95|
---
     16m
     46m
========
O|
---
     9m
     20m
     31m
     45m
     58m
========
```

## Usage

`ruby main.rb`

## Args
 - `--stop=<PlatformTagNumber>` : The platform tag number of the bus stop. 1 = Bus Interchange Platform A. If excluded defaults to 654 (Wairakei Rd by Blighs Rd heading into town)
- `--bus=<BusNumber>` : The specifc bus to return. If excluded will return all buses expected at the stop for the next hour.

### Known stops

1 - Bus Exchange Platform A
2 - Bus Exchange Platform B
3 - Bus Exchange Platform C
4 - Bus Exchange Platform D
654 - Wairakei Rd near Blighs (outside flat basically lol)
