#include <iostream>
#include "Windows.h"
#include "PxShape.h"
#include "PxPhysicsAPI.h"

static physx::PxFoundation *g_Foundation;
static physx::PxPvd *g_debugger = nullptr;
static physx::PxPhysics *g_Physics = nullptr;
static physx::PxScene *g_scene = nullptr;

static physx::PxDefaultErrorCallback gDefaultErrorCallback;
static physx::PxDefaultAllocator gDefaultAllocatorCallback;

int main(int, char **)
{
    std::cout << "Hello, world!\n";

    g_Foundation = PxCreateFoundation(PX_PHYSICS_VERSION, gDefaultAllocatorCallback, gDefaultErrorCallback);
    g_debugger = PxCreatePvd(*g_Foundation);
}
