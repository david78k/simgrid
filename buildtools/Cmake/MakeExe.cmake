###################################################################
### Load all files declaring binaries (tools, examples and tests) #
###################################################################

add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/java)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/java/async)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/java/bittorrent)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/java/chord)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/java/cloud)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/java/commTime)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/java/io)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/java/kademlia)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/java/master_slave_bypass)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/java/master_slave_kill)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/java/masterslave)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/java/migration)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/java/mutualExclusion)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/java/pingPong)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/java/priority)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/java/startKillTime)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/java/suspend)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/java/tracing)

add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/lua)

add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/actions)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/bittorrent)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/chainsend)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/chord)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/cloud)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/energy/e1)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/energy/e2)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/energy/e3)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/gpu)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/gtnets)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/icomms)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/io)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/kademlia)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/masterslave)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/mc)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/migration)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/ns3)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/parallel_task)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/pastry)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/pmm)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/priority)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/properties)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/semaphores)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/sendrecv)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/start_kill_time)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/suspend)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/token_ring)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/msg/tracing)

add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/scala)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/scala/master_slave_bypass)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/scala/master_slave_kill)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/scala/masterslave)

add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/simdag)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/simdag/dax)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/simdag/dot)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/simdag/goal)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/simdag/io)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/simdag/metaxml)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/simdag/properties)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/simdag/scheduling)

add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/smpi)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/smpi/MM)

add_subdirectory(${CMAKE_HOME_DIRECTORY}/examples/xbt)

add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/msg)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/msg/storage)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/msg/trace)

add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/simdag)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/simdag/availability)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/simdag/network)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/simdag/network/mxn)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/simdag/network/p2p)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/simdag/partask)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/simdag/platforms)

add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/simix)

add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/smpi)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/smpi/mpich3-test)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/smpi/mpich3-test/attr)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/smpi/mpich3-test/coll)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/smpi/mpich3-test/comm)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/smpi/mpich3-test/datatype)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/smpi/mpich3-test/group)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/smpi/mpich3-test/init)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/smpi/mpich3-test/pt2pt)

#add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/smpi/mpich3-test/f77/attr)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/smpi/mpich3-test/f77/coll)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/smpi/mpich3-test/f77/comm)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/smpi/mpich3-test/f77/datatype)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/smpi/mpich3-test/f77/ext)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/smpi/mpich3-test/f77/init)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/smpi/mpich3-test/f77/pt2pt)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/smpi/mpich3-test/f90/coll)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/smpi/mpich3-test/f90/datatype)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/smpi/mpich3-test/f90/init)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/smpi/mpich3-test/f90/pt2pt)

add_subdirectory(${CMAKE_HOME_DIRECTORY}/teshsuite/xbt)

add_subdirectory(${CMAKE_HOME_DIRECTORY}/testsuite/surf)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/testsuite/xbt)

add_subdirectory(${CMAKE_HOME_DIRECTORY}/tools)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/tools/graphicator)
add_subdirectory(${CMAKE_HOME_DIRECTORY}/tools/tesh)
