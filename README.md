# Bus Reader

Returns the next expected buses for a particular stop and displays how far away they are.
```
> ruby main.rb --stop=1

Next Bus:
+++++++++
60|
---
     25m
     55m
========
80|
---
     31m
========
P|
---
     3m
     31m
========
Y|
---
     22m
     48m
========
```

## Usage

`ruby main.rb`

## Args
 - `--stop=<PlatformTagNumber>` : The platform tag number of the bus stop. 1 = Bus Interchange Platform A. If excluded defaults to 654 (Wairakei Rd by Blighs Rd heading into town)
- `--bus=<BusNumber>` : The specifc bus to return. If excluded will return all buses expected at the stop for the next hour.
