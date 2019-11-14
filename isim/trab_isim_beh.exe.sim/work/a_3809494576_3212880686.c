/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x1cce1bb2 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/trab_laborg.vhd/trab.vhd";



static void work_a_3809494576_3212880686_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    int t9;
    char *t10;
    int t11;
    unsigned char t12;
    char *t13;
    int t14;
    int t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;

LAB0:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 5800);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(69, ng0);
    t4 = (t0 + 3432U);
    t8 = *((char **)t4);
    t9 = *((int *)t8);
    t4 = (t0 + 2952U);
    t10 = *((char **)t4);
    t11 = *((int *)t10);
    t12 = (t9 < t11);
    if (t12 != 0)
        goto LAB8;

LAB10:    t2 = (t0 + 3432U);
    t4 = *((char **)t2);
    t9 = *((int *)t4);
    t2 = (t0 + 3112U);
    t5 = *((char **)t2);
    t11 = *((int *)t5);
    t1 = (t9 == t11);
    if (t1 != 0)
        goto LAB11;

LAB12:    xsi_set_current_line(76, ng0);
    t2 = (t0 + 3432U);
    t4 = *((char **)t2);
    t9 = *((int *)t4);
    t11 = (t9 + 1);
    t2 = (t0 + 5896);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t10 = (t8 + 56U);
    t13 = *((char **)t10);
    *((int *)t13) = t11;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(77, ng0);
    t2 = (t0 + 5960);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);

LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(70, ng0);
    t4 = (t0 + 3432U);
    t13 = *((char **)t4);
    t14 = *((int *)t13);
    t15 = (t14 + 1);
    t4 = (t0 + 5896);
    t16 = (t4 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    *((int *)t19) = t15;
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(71, ng0);
    t2 = (t0 + 5960);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB9;

LAB11:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 5896);
    t8 = (t2 + 56U);
    t10 = *((char **)t8);
    t13 = (t10 + 56U);
    t16 = *((char **)t13);
    *((int *)t16) = 0;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(74, ng0);
    t2 = (t0 + 5960);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    goto LAB9;

}

static void work_a_3809494576_3212880686_p_1(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    int t9;
    unsigned char t10;
    char *t11;
    int t12;
    int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    xsi_set_current_line(84, ng0);
    t2 = (t0 + 3232U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 5816);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(85, ng0);
    t4 = (t0 + 3592U);
    t8 = *((char **)t4);
    t9 = *((int *)t8);
    t10 = (t9 > 0);
    if (t10 != 0)
        goto LAB8;

LAB10:    t2 = (t0 + 3752U);
    t4 = *((char **)t2);
    t9 = *((int *)t4);
    t1 = (t9 > 0);
    if (t1 != 0)
        goto LAB11;

LAB12:    t2 = (t0 + 3912U);
    t4 = *((char **)t2);
    t9 = *((int *)t4);
    t1 = (t9 > 0);
    if (t1 != 0)
        goto LAB13;

LAB14:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 6216);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);

LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 3272U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(86, ng0);
    t4 = (t0 + 3592U);
    t11 = *((char **)t4);
    t12 = *((int *)t11);
    t13 = (t12 - 1);
    t4 = (t0 + 6024);
    t14 = (t4 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((int *)t17) = t13;
    xsi_driver_first_trans_fast(t4);
    goto LAB9;

LAB11:    xsi_set_current_line(88, ng0);
    t2 = (t0 + 6024);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t14 = *((char **)t11);
    *((int *)t14) = 99;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(89, ng0);
    t2 = (t0 + 3752U);
    t4 = *((char **)t2);
    t9 = *((int *)t4);
    t12 = (t9 - 1);
    t2 = (t0 + 6088);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t14 = *((char **)t11);
    *((int *)t14) = t12;
    xsi_driver_first_trans_fast(t2);
    goto LAB9;

LAB13:    xsi_set_current_line(91, ng0);
    t2 = (t0 + 6024);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t14 = *((char **)t11);
    *((int *)t14) = 99;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(92, ng0);
    t2 = (t0 + 6088);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((int *)t11) = 59;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(93, ng0);
    t2 = (t0 + 3912U);
    t4 = *((char **)t2);
    t9 = *((int *)t4);
    t12 = (t9 - 1);
    t2 = (t0 + 6152);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t14 = *((char **)t11);
    *((int *)t14) = t12;
    xsi_driver_first_trans_fast(t2);
    goto LAB9;

}


extern void work_a_3809494576_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3809494576_3212880686_p_0,(void *)work_a_3809494576_3212880686_p_1};
	xsi_register_didat("work_a_3809494576_3212880686", "isim/trab_isim_beh.exe.sim/work/a_3809494576_3212880686.didat");
	xsi_register_executes(pe);
}
