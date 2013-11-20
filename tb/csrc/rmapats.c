#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include "rmapats.h"

scalar dummyScalar;
scalar fScalarIsForced=0;
scalar fScalarIsReleased=0;
scalar fScalarHasChanged=0;
scalar fForceFromNonRoot=0;
void  hsG_0(struct dummyq_struct * I885, EBLK  * I886, U  I657);
void  hsG_0(struct dummyq_struct * I885, EBLK  * I886, U  I657)
{
    U  I1084;
    U  I1085;
    U  I1086;
    struct futq * I1087;
    I1084 = ((U )vcs_clocks) + I657;
    I1086 = I1084 & 0xfff;
    I886->I590 = (EBLK  *)(-1);
    I886->I600 = I1084;
    if (I1084 < (U )vcs_clocks) {
        I1085 = ((U  *)&vcs_clocks)[1];
        sched_millenium(I885, I886, I1085 + 1, I1084);
    }
    else if ((peblkFutQ1Head != ((void *)0)) && (I657 == 1)) {
        I886->I601 = (struct eblk *)peblkFutQ1Tail;
        peblkFutQ1Tail->I590 = I886;
        peblkFutQ1Tail = I886;
    }
    else if ((I1087 = I885->I853[I1086].I607)) {
        I886->I601 = (struct eblk *)I1087->I606;
        I1087->I606->I590 = (RP )I886;
        I1087->I606 = (RmaEblk  *)I886;
    }
    else {
        sched_hsopt(I885, I886, I1084);
    }
}
U   hsG_1(U  I898);
#ifdef __cplusplus
extern "C" {
#endif
void SinitHsimPats(void);
#ifdef __cplusplus
}
#endif
