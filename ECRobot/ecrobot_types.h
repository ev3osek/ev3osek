/**
*  \file ecrobot_types.h
*
*  \brief This file contains some typedefs.
*
*  \author Tobias Schießl
*/
#ifndef _ECROBOT_TYPES_H_
#define _ECROBOT_TYPES_H_

/* Include statements */
#include "mytypes.h"

/* Struct definitions */
/**
 * \brief The typedef for the type char
 */
typedef          char CHAR; /* NOTE: ARM GCC treats "char" as unsigned */

#ifdef NXT_JSP
#ifndef UINT_DEFINED
/**
 * \brief The define-switch for the type unsigned int
 */
#define UINT_DEFINED
/**
 * \brief The typedef for the type unsigned int
 */
typedef unsigned int UINT;
#endif
#else
/**
 * \brief The typedef for the type unsigned int
 */
typedef unsigned  int UINT;
#endif
/**
 * \brief The typedef for the type signed int
 */
typedef   signed  int SINT;
/**
 * \brief The typedef for the type float
 */
typedef         float F32;
/**
 * \brief The typedef for the type double
 */
typedef        double F64;

#endif
