#ifndef SIMULATOR__VISIBILITY_CONTROL_H_
#define SIMULATOR__VISIBILITY_CONTROL_H_
#if defined _WIN32 || defined __CYGWIN__
  #ifdef __GNUC__
    #define SIMULATOR_EXPORT __attribute__ ((dllexport))
    #define SIMULATOR_IMPORT __attribute__ ((dllimport))
  #else
    #define SIMULATOR_EXPORT __declspec(dllexport)
    #define SIMULATOR_IMPORT __declspec(dllimport)
  #endif
  #ifdef SIMULATOR_BUILDING_LIBRARY
    #define SIMULATOR_PUBLIC SIMULATOR_EXPORT
  #else
    #define SIMULATOR_PUBLIC SIMULATOR_IMPORT
  #endif
  #define SIMULATOR_PUBLIC_TYPE SIMULATOR_PUBLIC
  #define SIMULATOR_LOCAL
#else
  #define SIMULATOR_EXPORT __attribute__ ((visibility("default")))
  #define SIMULATOR_IMPORT
  #if __GNUC__ >= 4
    #define SIMULATOR_PUBLIC __attribute__ ((visibility("default")))
    #define SIMULATOR_LOCAL  __attribute__ ((visibility("hidden")))
  #else
    #define SIMULATOR_PUBLIC
    #define SIMULATOR_LOCAL
  #endif
  #define SIMULATOR_PUBLIC_TYPE
#endif
#endif  // SIMULATOR__VISIBILITY_CONTROL_H_
// Generated 13-Oct-2023 10:19:51
// Copyright 2019-2020 The MathWorks, Inc.
