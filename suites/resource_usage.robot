*** Settings ***
Documentation   Get footprint and CPU, memory usage
...             Image Footprint:            Get docker image footprint of each edgex services
...             Executable Footprint:	    Copy service executable file from container to host and get the executable footprint of each edgex services
...             CPU used on start up:	    Start all services at once and get CPU usage of each edgex services on startup using "docker stats"
...             Memory used on start up: 	Start all services at once and get memory usage of each edgex services on startup using "docker stats"
Library         Process
Library         ../lib/ResourceUsage.py
Suite Setup  Deploy EdgeX
Suite Teardown  Shutdown EdgeX


*** Test Cases ***
Get footprint and CPU, memory usage
    Given EdgeX deployed
    When fetch footprint cpu memory
    Then show the summary table


*** Keywords ***
Deploy EdgeX
    ${result} =  Run Process    docker-compose    up    -d
    Log    ${result.stderr}
    Should Be Equal As Integers    ${result.rc}    0

EdgeX deployed
    Log    "EdgeX is deployed"

Shutdown EdgeX
    ${result} =  Run Process    docker-compose    down
    Log    ${result.stderr}
    Should Be Equal As Integers	     ${result.rc}  0