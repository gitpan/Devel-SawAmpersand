#ifdef __cplusplus
extern "C" {
#endif

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#ifdef __cplusplus
}
#endif

#include "patchlevel.h"

#if PATCHLEVEL < 5
#  ifndef PL_sawampersand
#    define PL_sawampersand sawampersand
#  endif
#endif


MODULE = Devel::SawAmpersand		PACKAGE = Devel::SawAmpersand

bool
sawampersand()

    PROTOTYPE:

    CODE:
    RETVAL = PL_sawampersand;

    OUTPUT:
    RETVAL

