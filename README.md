# OptimizeZephryus
A Powershell Script to optimize services on the Zephyrus G15 when on battery

## **Usage Notes**
The Script must be run as an administrator. You can also add it to the path with the following line run from powershell.

``` Powershell
$env:Path += "C:\Path\To\Script\"
```
You can pass several options to change the behavior when managing the services, as listed below.

1. -suspend true -> **Suspends the services**
2. -disable true -> **Disables the services**
3. -enable true -> **Enables the services**
4. -start true -> **Starts the services**

## **Updates**
I plan to continue to add features to continue to optmize the battery life as I find more optimizations. Please feel free to contribute!