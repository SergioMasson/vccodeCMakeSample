set( CUSTOME_PHYSX_ROOT_DIR $ENV{PHYSX_PATH})
set( CUSTOME_PHYSX_INCLUDE_DIRS ${CUSTOME_PHYSX_ROOT_DIR}/include/)

if(NOT DEFINED ENV{PHYSX_PATH})
    message(FATAL_ERROR "Could not find a location for the nvidia Physx sdk. Please set the PHYSX_PATH envirorment variable.")
    # some more commands
endif()

message("Physx found at location: " ${CUSTOME_PHYSX_ROOT_DIR})

#Check architecture
if(NOT "${CMAKE_GENERATOR}" MATCHES "(Win64|IA64)")
    set(ARCH 64)
else()
    set(ARCH 32)
endif()


#defines the location of all Physx release dlls.
set( CUSTOME_PHYSX_IMPORTED_LOCATION
    ${CUSTOME_PHYSX_ROOT_DIR}/bin/PhysX_${ARCH}.dll
	${CUSTOME_PHYSX_ROOT_DIR}/bin/PhysXCommon_${ARCH}.dll
	${CUSTOME_PHYSX_ROOT_DIR}/bin/PhysXCooking_${ARCH}.dll
	${CUSTOME_PHYSX_ROOT_DIR}/bin/PhysXFoundation_${ARCH}.dll
)

#defines the location of all Physx debug dlls.
set( CUSTOME_PHYSX_IMPORTED_LOCATION_DEBUG
    ${CUSTOME_PHYSX_ROOT_DIR}/debug/bin/PhysX_${ARCH}.dll
	${CUSTOME_PHYSX_ROOT_DIR}/debug/bin/PhysXCommon_${ARCH}.dll
	${CUSTOME_PHYSX_ROOT_DIR}/debug/bin/PhysXCooking_${ARCH}.dll
	${CUSTOME_PHYSX_ROOT_DIR}/debug/bin/PhysXFoundation_${ARCH}.dll
)

set( CUSTOME_PHYSX_IMPORTED_IMPLIB
    ${CUSTOME_PHYSX_ROOT_DIR}/lib/LowLevel_static_${ARCH}.lib
	${CUSTOME_PHYSX_ROOT_DIR}/lib/LowLevelAABB_static_${ARCH}.lib
	${CUSTOME_PHYSX_ROOT_DIR}/lib/LowLevelDynamics_static_${ARCH}.lib
	${CUSTOME_PHYSX_ROOT_DIR}/lib/PhysX_${ARCH}.lib
	${CUSTOME_PHYSX_ROOT_DIR}/lib/PhysXCharacterKinematic_static_${ARCH}.lib
	${CUSTOME_PHYSX_ROOT_DIR}/lib/PhysXCommon_${ARCH}.lib
	${CUSTOME_PHYSX_ROOT_DIR}/lib/PhysXCooking_${ARCH}.lib
	${CUSTOME_PHYSX_ROOT_DIR}/lib/PhysXExtensions_static_${ARCH}.lib
    ${CUSTOME_PHYSX_ROOT_DIR}/lib/PhysXFoundation_${ARCH}.lib
    ${CUSTOME_PHYSX_ROOT_DIR}/lib/PhysXPvdSDK_static_${ARCH}.lib
    ${CUSTOME_PHYSX_ROOT_DIR}/lib/PhysXTask_static_${ARCH}.lib
    ${CUSTOME_PHYSX_ROOT_DIR}/lib/PhysXVehicle_static_${ARCH}.lib
    ${CUSTOME_PHYSX_ROOT_DIR}/lib/SceneQuery_static_${ARCH}.lib
    ${CUSTOME_PHYSX_ROOT_DIR}/lib/SimulationController_static_${ARCH}.lib
)

set( CUSTOME_PHYSX_IMPORTED_IMPLIB_DEBUG
    ${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/LowLevel_static_${ARCH}.lib
	${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/LowLevelAABB_static_${ARCH}.lib
	${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/LowLevelDynamics_static_${ARCH}.lib
	${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/PhysX_${ARCH}.lib
	${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/PhysXCharacterKinematic_static_${ARCH}.lib
	${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/PhysXCommon_${ARCH}.lib
	${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/PhysXCooking_${ARCH}.lib
	${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/PhysXExtensions_static_${ARCH}.lib
    ${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/PhysXFoundation_${ARCH}.lib
    ${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/PhysXPvdSDK_static_${ARCH}.lib
    ${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/PhysXTask_static_${ARCH}.lib
    ${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/PhysXVehicle_static_${ARCH}.lib
    ${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/SceneQuery_static_${ARCH}.lib
    ${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/SimulationController_static_${ARCH}.lib
)

#creates a target for the nvidia Physx library.
add_library(NvidiaPhysxLibrary SHARED IMPORTED)

#set target properties acording to the instalation of the nvidia library.
set_target_properties(NvidiaPhysxLibrary PROPERTIES
  IMPORTED_LOCATION ${CUSTOME_PHYSX_IMPORTED_LOCATION}
  IMPORTED_LOCATION_DEBUG ${CUSTOME_PHYSX_IMPORTED_LOCATION_DEBUG}
  IMPORTED_IMPLIB ${CUSTOME_PHYSX_IMPORTED_IMPLIB}
  IMPORTED_IMPLIB_DEBUG ${CUSTOME_PHYSX_IMPORTED_IMPLIB_DEBUG}
  INTERFACE_INCLUDE_DIRECTORIES ${CUSTOME_PHYSX_INCLUDE_DIRS}
  IMPORTED_CONFIGURATIONS "RELEASE;DEBUG"
)
