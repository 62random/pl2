# pl2

### Assignment for a Language Processing course - using gawk to optimize CSV files and processing it's information to generate graphs using graphviz


The first input file we have is as CSV bloated with useless lines and ineffiecient formatting.

We first use gawk to generate a cleaner CSV, and then use gawk again to process that output file to produce a DOT file used by graphviz to generate graph such as the one in the picture below.

![](./graph.png)
