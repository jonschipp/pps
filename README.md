# pps

`pps` - Script to print interface statistics.

Calculates PPS, BPS, and percentage of line-rate (LR) from Linux kernel statistics by reading from procfs.
Requires sysfs and procfs.

#### Single interface statistics:
```shell
$ ./pps.sh -i eth1
^C to exit
Int: eth1 | [RX] PPS: 458 | BPS: 86362 | % of LR: 0.069 -- [TX] PPS: 0 | BPS: 0 | % of LR: 0.000
Int: eth1 | [RX] PPS: 201 | BPS: 37772 | % of LR: 0.030 -- [TX] PPS: 0 | BPS: 0 | % of LR: 0.000
Int: eth1 | [RX] PPS: 65 | BPS: 21034 | % of LR: 0.017 -- [TX] PPS: 0 | BPS: 0 | % of LR: 0.000
Int: eth1 | [RX] PPS: 187 | BPS: 38292 | % of LR: 0.031 -- [TX] PPS: 0 | BPS: 0 | % of LR: 0.000
Int: eth1 | [RX] PPS: 517 | BPS: 103126 | % of LR: 0.083 -- [TX] PPS: 0 | BPS: 0 | % of LR: 0.000
^C
```

#### Multiple interface statistics:
```shell
$ ./pps.sh -i eth0,eth1,eth2,eth3
^C to exit
Int: eth0 | [RX] PPS: 34 | BPS: 1672 | % of LR: 0.001 -- [TX] PPS: 0 | BPS: 0 | % of LR: 0.000
Int: eth1 | [RX] PPS: 61 | BPS: 7168 | % of LR: 0.006 -- [TX] PPS: 0 | BPS: 0 | % of LR: 0.000
Int: eth2 | [RX] PPS: 1 | BPS: 64 | % of LR: 0.001 -- [TX] PPS: 0 | BPS: 0 | % of LR: 0.000
Int: eth3 | [RX] PPS: 7 | BPS: 457 | % of LR: 0.000 -- [TX] PPS: 0 | BPS: 0 | % of LR: 0.000
Int: eth0 | [RX] PPS: 156 | BPS: 22496 | % of LR: 0.018 -- [TX] PPS: 0 | BPS: 0 | % of LR: 0.000
Int: eth1 | [RX] PPS: 1667 | BPS: 290476 | % of LR: 0.232 -- [TX] PPS: 0 | BPS: 0 | % of LR: 0.000
Int: eth2 | [RX] PPS: 13 | BPS: 3256 | % of LR: 0.026 -- [TX] PPS: 0 | BPS: 0 | % of LR: 0.000
Int: eth3 | [RX] PPS: 0 | BPS: 0 | % of LR: 0.000 -- [TX] PPS: 0 | BPS: 0 | % of LR: 0.000
```

## Author:
***Jon Schipp*** (keisterstash) <br>
jonschipp [ at ] Gmail dot com <br>
`sickbits.net`, `jonschipp.com`
