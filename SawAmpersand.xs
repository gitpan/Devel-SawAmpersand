#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#ifdef __cplusplus
}
#endif


MODULE = Devel::SawAmpersand		PACKAGE = Devel::SawAmpersand		

bool
sawampersand()

    PROTOTYPE:

    CODE:
    RETVAL = sawampersand;

    OUTPUT:
    RETVAL

