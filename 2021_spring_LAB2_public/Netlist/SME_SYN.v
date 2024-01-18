/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : N-2017.09-SP2
// Date      : Thu Jan 18 16:14:51 2024
/////////////////////////////////////////////////////////////


module SME ( clk, rst_n, chardata, isstring, ispattern, out_valid, match, 
        match_index );
  input [7:0] chardata;
  output [4:0] match_index;
  input clk, rst_n, isstring, ispattern;
  output out_valid, match;
  wire   star_f, end_f, front_or_back, isstring_ff, ispattern_ff, N609, N610,
         N611, N612, match_f_ff, head_f, N845, N846, N847, N848, N849, N1594,
         N1675, N1802, N1804, n2573, n2574, n2575, n2576, n2578, n2580, n2582,
         n2583, n2584, n2586, n2587, n2588, n2590, n2591, n2592, n2593, n2594,
         n2595, n2596, n2597, n2598, n2599, n2600, n2601, n2602, n2603, n2604,
         n2605, n2606, n2607, n2608, n2609, n2610, n2611, n2612, n2613, n2614,
         n2615, n2616, n2617, n2618, n2619, n2620, n2621, n2622, n2623, n2624,
         n2625, n2626, n2627, n2628, n2629, n2630, n2631, n2632, n2633, n2634,
         n2635, n2636, n2637, n2638, n2639, n2640, n2641, n2642, n2643, n2644,
         n2645, n2646, n2647, n2648, n2649, n2650, n2651, n2652, n2653, n2654,
         n2655, n2656, n2657, n2658, n2659, n2660, n2661, n2662, n2663, n2665,
         n2672, n2676, n2677, n2678, n2679, n2680, n2681, n2682, n2683, n2684,
         n2685, n2686, n2687, n2688, n2689, n2690, n2691, n2692, n2693, n2694,
         n2695, n2696, n2697, n2698, n2699, n2700, n2701, n2702, n2703, n2704,
         n2705, n2706, n2707, n2708, n2709, n2710, n2711, n2712, n2713, n2714,
         n2715, n2716, n2717, n2718, n2719, n2721, n2722, n2723, n2724, n2725,
         n2726, n2727, n2728, n2729, n2730, n2731, n2732, n2733, n2734, n2735,
         n2736, n2737, n2738, n2739, n2741, n2742, n2743, n2744, n2745, n2746,
         n2747, n2748, n2749, n2750, n2751, n2752, n2753, n2754, n2755, n2756,
         n2757, n2758, n2760, n2761, n2762, n2763, n2764, n2765, n2766, n2767,
         n2769, n2770, n2771, n2773, n2776, n2777, n2778, n2779, n2780, n2781,
         n2782, n2783, n2784, n2785, n2786, n2787, n2788, n2790, n2792, n2793,
         n2794, n2795, n2796, n2797, n2798, n2799, n2800, n2801, n2802, n2803,
         n2805, n2806, n2807, n2808, n2809, n2810, n2811, n2812, n2813, n2814,
         n2815, n2816, n2817, n2818, n2819, n2821, n2822, n2823, n2824, n2825,
         n2826, n2828, n2829, n2830, n2831, n2832, n2834, n2835, n2836, n2837,
         n2838, n2839, n2841, n2842, n2843, n2844, n2846, n2848, n2849, n2850,
         n2851, n2852, n2853, n2854, n2855, n2856, n2857, n2858, n2859, n2860,
         n2861, n2862, n2863, n2864, n2865, n2866, n2867, n2868, n2869, n2870,
         n2871, n2872, n2873, n2874, n2875, n2876, n2877, n2878, n2879, n2880,
         n2881, n2882, n2883, n2884, n2885, n2886, n2887, n2888, n2889, n2892,
         n2893, n2894, n2895, n2896, n2898, n2899, n2900, n2901, n2902, n2904,
         n2905, n2908, n2909, n2910, n2911, n2912, n2913, n2914, n2915, n2916,
         n2917, n2918, n2921, n2922, n2923, n2924, n2925, n2926, n2927, n2928,
         n2929, n2930, n2932, n2933, n2934, n2935, n2936, n2937, n2938, n2939,
         n2940, n2941, DP_OP_542J1_123_7011_n30, n2943, n2944, n2945, n2946,
         n2947, n2948, n2949, n2950, n2951, n2952, n2953, n2954, n2955, n2956,
         n2957, n2958, n2959, n2960, n2961, n2962, n2963, n2964, n2965, n2966,
         n2967, n2968, n2969, n2970, n2971, n2972, n2973, n2974, n2975, n2976,
         n2977, n2978, n2979, n2980, n2981, n2982, n2983, n2984, n2985, n2986,
         n2987, n2988, n2989, n2990, n2991, n2992, n2993, n2994, n2995, n2996,
         n2997, n2998, n2999, n3000, n3001, n3002, n3003, n3004, n3005, n3006,
         n3007, n3008, n3009, n3010, n3011, n3012, n3013, n3014, n3015, n3016,
         n3017, n3018, n3019, n3020, n3021, n3022, n3023, n3024, n3025, n3026,
         n3027, n3028, n3029, n3030, n3031, n3032, n3033, n3034, n3035, n3036,
         n3037, n3038, n3039, n3040, n3041, n3042, n3043, n3044, n3045, n3046,
         n3047, n3048, n3049, n3050, n3051, n3052, n3053, n3054, n3055, n3056,
         n3057, n3058, n3059, n3060, n3061, n3062, n3063, n3064, n3065, n3066,
         n3067, n3068, n3069, n3070, n3071, n3072, n3073, n3074, n3075, n3076,
         n3077, n3078, n3079, n3080, n3081, n3082, n3083, n3084, n3085, n3086,
         n3087, n3088, n3089, n3090, n3091, n3092, n3093, n3094, n3095, n3096,
         n3097, n3098, n3099, n3100, n3101, n3102, n3103, n3104, n3105, n3106,
         n3107, n3108, n3109, n3110, n3111, n3112, n3113, n3114, n3115, n3116,
         n3117, n3118, n3119, n3120, n3121, n3122, n3123, n3124, n3125, n3126,
         n3127, n3128, n3129, n3130, n3131, n3132, n3133, n3134, n3135, n3136,
         n3137, n3138, n3139, n3140, n3141, n3142, n3143, n3144, n3145, n3146,
         n3147, n3148, n3149, n3150, n3151, n3152, n3153, n3154, n3155, n3156,
         n3157, n3158, n3159, n3160, n3161, n3162, n3163, n3164, n3165, n3166,
         n3167, n3168, n3169, n3170, n3171, n3172, n3173, n3174, n3175, n3176,
         n3177, n3178, n3179, n3180, n3181, n3182, n3183, n3184, n3185, n3186,
         n3187, n3188, n3189, n3190, n3191, n3192, n3193, n3194, n3195, n3196,
         n3197, n3198, n3199, n3200, n3201, n3202, n3203, n3204, n3205, n3206,
         n3207, n3208, n3209, n3210, n3211, n3212, n3213, n3214, n3215, n3216,
         n3217, n3218, n3219, n3220, n3221, n3222, n3223, n3224, n3225, n3226,
         n3227, n3228, n3229, n3230, n3231, n3232, n3233, n3234, n3235, n3236,
         n3237, n3238, n3239, n3240, n3241, n3242, n3243, n3244, n3245, n3246,
         n3247, n3248, n3249, n3250, n3251, n3252, n3253, n3254, n3255, n3256,
         n3257, n3258, n3259, n3260, n3261, n3262, n3263, n3264, n3265, n3266,
         n3267, n3268, n3269, n3270, n3271, n3272, n3273, n3274, n3275, n3276,
         n3277, n3278, n3279, n3280, n3281, n3282, n3283, n3284, n3285, n3286,
         n3287, n3288, n3289, n3290, n3291, n3292, n3293, n3294, n3295, n3296,
         n3297, n3298, n3299, n3300, n3301, n3302, n3303, n3304, n3305, n3306,
         n3307, n3308, n3309, n3310, n3311, n3312, n3313, n3314, n3315, n3316,
         n3317, n3318, n3319, n3320, n3321, n3322, n3323, n3324, n3325, n3326,
         n3327, n3328, n3329, n3330, n3331, n3332, n3333, n3334, n3335, n3336,
         n3337, n3338, n3339, n3340, n3341, n3342, n3343, n3344, n3345, n3346,
         n3347, n3348, n3349, n3350, n3351, n3352, n3353, n3354, n3355, n3356,
         n3357, n3358, n3359, n3360, n3361, n3362, n3363, n3364, n3365, n3366,
         n3367, n3368, n3369, n3370, n3371, n3372, n3373, n3374, n3375, n3376,
         n3377, n3378, n3379, n3380, n3381, n3382, n3383, n3384, n3385, n3386,
         n3387, n3388, n3389, n3390, n3391, n3392, n3393, n3394, n3395, n3396,
         n3397, n3398, n3399, n3400, n3401, n3402, n3403, n3404, n3405, n3406,
         n3407, n3408, n3409, n3410, n3411, n3412, n3413, n3414, n3415, n3416,
         n3417, n3418, n3419, n3420, n3421, n3422, n3423, n3424, n3425, n3426,
         n3427, n3428, n3429, n3430, n3431, n3432, n3433, n3434, n3435, n3436,
         n3437, n3438, n3439, n3440, n3441, n3442, n3443, n3444, n3445, n3446,
         n3447, n3448, n3449, n3450, n3451, n3452, n3453, n3454, n3455, n3456,
         n3457, n3458, n3459, n3460, n3461, n3462, n3463, n3464, n3465, n3466,
         n3467, n3468, n3469, n3470, n3471, n3472, n3473, n3474, n3475, n3476,
         n3477, n3478, n3479, n3480, n3481, n3482, n3483, n3484, n3485, n3486,
         n3487, n3488, n3489, n3490, n3491, n3492, n3493, n3494, n3495, n3496,
         n3497, n3498, n3499, n3500, n3501, n3502, n3503, n3504, n3505, n3506,
         n3507, n3508, n3509, n3510, n3511, n3512, n3513, n3514, n3515, n3516,
         n3517, n3518, n3519, n3520, n3521, n3522, n3523, n3524, n3525, n3526,
         n3527, n3528, n3529, n3530, n3531, n3532, n3533, n3534, n3535, n3536,
         n3537, n3538, n3539, n3540, n3541, n3542, n3543, n3544, n3545, n3546,
         n3547, n3548, n3549, n3550, n3551, n3552, n3553, n3554, n3555, n3556,
         n3557, n3558, n3559, n3560, n3561, n3562, n3563, n3564, n3565, n3566,
         n3567, n3568, n3569, n3570, n3571, n3572, n3573, n3574, n3575, n3576,
         n3577, n3578, n3579, n3580, n3581, n3582, n3583, n3584, n3585, n3586,
         n3587, n3588, n3589, n3590, n3591, n3592, n3593, n3594, n3595, n3596,
         n3597, n3598, n3599, n3600, n3601, n3602, n3603, n3604, n3605, n3606,
         n3607, n3608, n3609, n3610, n3611, n3612, n3613, n3614, n3615, n3616,
         n3617, n3618, n3619, n3620, n3621, n3622, n3623, n3624, n3625, n3626,
         n3627, n3628, n3629, n3630, n3631, n3632, n3633, n3634, n3635, n3636,
         n3637, n3638, n3639, n3640, n3641, n3642, n3643, n3644, n3645, n3646,
         n3647, n3648, n3649, n3650, n3651, n3652, n3653, n3654, n3655, n3656,
         n3657, n3658, n3659, n3660, n3661, n3662, n3663, n3664, n3665, n3666,
         n3667, n3668, n3669, n3670, n3671, n3672, n3673, n3674, n3675, n3676,
         n3677, n3678, n3679, n3680, n3681, n3682, n3683, n3684, n3685, n3686,
         n3687, n3688, n3689, n3690, n3691, n3692, n3693, n3694, n3695, n3696,
         n3697, n3698, n3699, n3700, n3701, n3702, n3703, n3704, n3705, n3706,
         n3707, n3708, n3709, n3710, n3711, n3712, n3713, n3714, n3715, n3716,
         n3717, n3718, n3719, n3720, n3721, n3722, n3723, n3724, n3725, n3726,
         n3727, n3728, n3729, n3730, n3731, n3732, n3733, n3734, n3735, n3736,
         n3737, n3738, n3739, n3740, n3741, n3742, n3743, n3744, n3745, n3746,
         n3747, n3748, n3749, n3750, n3751, n3752, n3753, n3754, n3755, n3756,
         n3757, n3758, n3759, n3760, n3761, n3762, n3763, n3764, n3765, n3766,
         n3767, n3768, n3769, n3770, n3771, n3772, n3773, n3774, n3775, n3776,
         n3777, n3778, n3779, n3780, n3781, n3782, n3783, n3784, n3785, n3786,
         n3787, n3788, n3789, n3790, n3791, n3792, n3793, n3794, n3795, n3796,
         n3797, n3798, n3799, n3800, n3801, n3802, n3803, n3804, n3805, n3806,
         n3807, n3808, n3809, n3810, n3811, n3812, n3813, n3814, n3815, n3816,
         n3817, n3818, n3819, n3820, n3821, n3822, n3823, n3824, n3825, n3826,
         n3827, n3828, n3829, n3830, n3831, n3832, n3833, n3834, n3835, n3836,
         n3837, n3838, n3839, n3840, n3841, n3842, n3843, n3844, n3845, n3846,
         n3847, n3848, n3849, n3850, n3851, n3852, n3853, n3854, n3855, n3856,
         n3857, n3858, n3859, n3860, n3861, n3862, n3863, n3864, n3865, n3866,
         n3867, n3868, n3869, n3870, n3871, n3872, n3873, n3874, n3875, n3876,
         n3877, n3878, n3879, n3880, n3881, n3882, n3883, n3884, n3885, n3886,
         n3887, n3888, n3889, n3890, n3891, n3892, n3893, n3894, n3895, n3896,
         n3897, n3898, n3899, n3900, n3901, n3902, n3903, n3904, n3905, n3906,
         n3907, n3908, n3909, n3910, n3911, n3912, n3913, n3914, n3915, n3916,
         n3917, n3918, n3919, n3920, n3921, n3922, n3923, n3924, n3925, n3926,
         n3927, n3928, n3929, n3930, n3931, n3932, n3933, n3934, n3935, n3936,
         n3937, n3938, n3939, n3940, n3941, n3942, n3943, n3944, n3945, n3946,
         n3947, n3948, n3949, n3950, n3951, n3952, n3953, n3954, n3955, n3956,
         n3957, n3958, n3959, n3960, n3961, n3962, n3963, n3964, n3965, n3966,
         n3967, n3968, n3969, n3970, n3971, n3972, n3973, n3974, n3975, n3976,
         n3977, n3978, n3979, n3980, n3981, n3982, n3983, n3984, n3985, n3986,
         n3987, n3988, n3989, n3990, n3991, n3992, n3993, n3994, n3995, n3996,
         n3997, n3998, n3999, n4000, n4001, n4002, n4003, n4004, n4005, n4006,
         n4007, n4008, n4009, n4010, n4011, n4012, n4013, n4014, n4015, n4016,
         n4017, n4018, n4019, n4020, n4021, n4022, n4023, n4024, n4025, n4026,
         n4027, n4028, n4029, n4030, n4031, n4032, n4033, n4034, n4035, n4036,
         n4037, n4038, n4039, n4040, n4041, n4042, n4043, n4044, n4045, n4046,
         n4047, n4048, n4049, n4050, n4051, n4052, n4053, n4054, n4055, n4056,
         n4057, n4058, n4059, n4060, n4061, n4062, n4063, n4064, n4065, n4066,
         n4067, n4068, n4069, n4070, n4071, n4072, n4073, n4074, n4075, n4076,
         n4077, n4078, n4079, n4080, n4081, n4082, n4083, n4084, n4085, n4086,
         n4087, n4088, n4089, n4090, n4091, n4092, n4093, n4094, n4095, n4096,
         n4097, n4098, n4099, n4100, n4101, n4102, n4103, n4104, n4105, n4106,
         n4107, n4108, n4109, n4110, n4111, n4112, n4113, n4114, n4115, n4116,
         n4117, n4118, n4119, n4120, n4121, n4122, n4123, n4124, n4125, n4126,
         n4127, n4128, n4129, n4130, n4131, n4132, n4133, n4134, n4135, n4136,
         n4137, n4138, n4139, n4140, n4141, n4142, n4143, n4144, n4145, n4146,
         n4147, n4148, n4149, n4150, n4151, n4152, n4153, n4154, n4155, n4156,
         n4157, n4158, n4159, n4160, n4161, n4162, n4163, n4164, n4165, n4166,
         n4167, n4168, n4169, n4170, n4171, n4172, n4173, n4174, n4175, n4176,
         n4177, n4178, n4179, n4180, n4181, n4182, n4183, n4184, n4185, n4186,
         n4187, n4188, n4189, n4190, n4191, n4192, n4193, n4194, n4195, n4196,
         n4197, n4198, n4199, n4200, n4201, n4202, n4203, n4204, n4205, n4206,
         n4207, n4208, n4209, n4210, n4211, n4212, n4213, n4214, n4215, n4216,
         n4217, n4218, n4219, n4220, n4221, n4222, n4223, n4224, n4225, n4226,
         n4227, n4228, n4229, n4230, n4231, n4232, n4233, n4234, n4235, n4236,
         n4237, n4238, n4239, n4240, n4241, n4242, n4243, n4244, n4245, n4246,
         n4247, n4248, n4249, n4250, n4251, n4252, n4253, n4254, n4255, n4256,
         n4257, n4258, n4259, n4260, n4261, n4262, n4263, n4264, n4265, n4266,
         n4267, n4268, n4269, n4270, n4271, n4272, n4273, n4274, n4275, n4276,
         n4277, n4278, n4279, n4280, n4281, n4282, n4283, n4284, n4285, n4286,
         n4287, n4288, n4289, n4290, n4291, n4292, n4293, n4294, n4295, n4296,
         n4297, n4298, n4299, n4300, n4301, n4302, n4303, n4304, n4305, n4306,
         n4307, n4308, n4309, n4310, n4311, n4312, n4313, n4314, n4315, n4316,
         n4317, n4318, n4319, n4320, n4321, n4322, n4323, n4324, n4325, n4326,
         n4327, n4328, n4329, n4330, n4331, n4332, n4333, n4334, n4335, n4336,
         n4337, n4338, n4339, n4340, n4341, n4342, n4343, n4344, n4345, n4346,
         n4347, n4348, n4349, n4350, n4351, n4352, n4353, n4354, n4355, n4356,
         n4357, n4358, n4359, n4360, n4361, n4362, n4363, n4364, n4365, n4366,
         n4367, n4368, n4369, n4370, n4371, n4372, n4373, n4374, n4375, n4376,
         n4377, n4378, n4379, n4380, n4381, n4382, n4383, n4384, n4385, n4386,
         n4387, n4388, n4389, n4390, n4391, n4392, n4393, n4394, n4395, n4396,
         n4397, n4398, n4399, n4400, n4401, n4402, n4403, n4404, n4405, n4406,
         n4407, n4408, n4409, n4410, n4411, n4412, n4413, n4414, n4415, n4416,
         n4417, n4418, n4419, n4420, n4421, n4422, n4423, n4424, n4425, n4426,
         n4427, n4428, n4429, n4430, n4431, n4432, n4433, n4434, n4435, n4436,
         n4437, n4438, n4439, n4440, n4441, n4442, n4443, n4444, n4445, n4446,
         n4447, n4448, n4449, n4450, n4451, n4452, n4453, n4454, n4455, n4456,
         n4457, n4458, n4459, n4460, n4461, n4462, n4463, n4464, n4465, n4466,
         n4467, n4468, n4469, n4470, n4471, n4472, n4473, n4474, n4475, n4476,
         n4477, n4478, n4479, n4480, n4481, n4482, n4483, n4484, n4485, n4486,
         n4487, n4488, n4489, n4490, n4491, n4492, n4493, n4494, n4495, n4496,
         n4497, n4498, n4499, n4500, n4501, n4502, n4503, n4504, n4505, n4506,
         n4507, n4508, n4509, n4510, n4511, n4512, n4513, n4514, n4515, n4516,
         n4517, n4518, n4519, n4520, n4521, n4522, n4523, n4524, n4525, n4526,
         n4527, n4528, n4529, n4530, n4531, n4532, n4533, n4534, n4535, n4536,
         n4537, n4538, n4539, n4540, n4541, n4542, n4543, n4544, n4545, n4546,
         n4547, n4548, n4549, n4550, n4551, n4552, n4553, n4554, n4555, n4556,
         n4557, n4558, n4559, n4560, n4561, n4562, n4563, n4564, n4565, n4566,
         n4567, n4568, n4569, n4570, n4571, n4572, n4573, n4574, n4575, n4576,
         n4577, n4578, n4579, n4580, n4581, n4582, n4583, n4584, n4585, n4586,
         n4587, n4588, n4589, n4590, n4591, n4592, n4593, n4594, n4595, n4596,
         n4597, n4598, n4599, n4600, n4601, n4602, n4603, n4604, n4605, n4606,
         n4607, n4608, n4609, n4610, n4611, n4612, n4613, n4614, n4615, n4616,
         n4617, n4618, n4619, n4620, n4621, n4622, n4623, n4624, n4625, n4626,
         n4627, n4628, n4629, n4630, n4631, n4632, n4633, n4634, n4635, n4636,
         n4637, n4638, n4639, n4640, n4641, n4642, n4643, n4644, n4645, n4646,
         n4647, n4648, n4649, n4650, n4651, n4652, n4653, n4654, n4655, n4656,
         n4657, n4658, n4659, n4660, n4661, n4662, n4663, n4664, n4665, n4666,
         n4667, n4668, n4669, n4670, n4671, n4672, n4673, n4674, n4675, n4676,
         n4677, n4678, n4679, n4680, n4681, n4682, n4683, n4684, n4685, n4686,
         n4687, n4688, n4689, n4690, n4691, n4692, n4693, n4694, n4695, n4696,
         n4697, n4698, n4699, n4700, n4701, n4702, n4703, n4704, n4705, n4706,
         n4707, n4708, n4709, n4710, n4711, n4712, n4713, n4714, n4715, n4716,
         n4717, n4718, n4719, n4720, n4721, n4722, n4723, n4724, n4725, n4726,
         n4727, n4728, n4729, n4730, n4731, n4732, n4733, n4734, n4735, n4736,
         n4737, n4738, n4739, n4740, n4741, n4742, n4743, n4744, n4745, n4746,
         n4747, n4748, n4749, n4750, n4751, n4752, n4753, n4754, n4755, n4756,
         n4757, n4758, n4759, n4760, n4761, n4762, n4763, n4764, n4765, n4766,
         n4767, n4768, n4769, n4770, n4771, n4772, n4773, n4774, n4775, n4776,
         n4777, n4778, n4779, n4780, n4781, n4782, n4783, n4784, n4785, n4786,
         n4787, n4788, n4789, n4790, n4791, n4792, n4793, n4794, n4795, n4796,
         n4797, n4798, n4799, n4800, n4801, n4802, n4803, n4804, n4805, n4806,
         n4807, n4808, n4809, n4810, n4811, n4812, n4813, n4814, n4815, n4816,
         n4817, n4818, n4819, n4820, n4821, n4822, n4823, n4824, n4825, n4826,
         n4827, n4828, n4829, n4830, n4831, n4832, n4833, n4834, n4835, n4836,
         n4837, n4838, n4839, n4840, n4841, n4842, n4843, n4844, n4845, n4846,
         n4847, n4848, n4849, n4850, n4851, n4852, n4853, n4854, n4855, n4856,
         n4857, n4858, n4859, n4860, n4861, n4862, n4863, n4864, n4865, n4866,
         n4867, n4868, n4869, n4870, n4871, n4872, n4873, n4874, n4875, n4876,
         n4877, n4878, n4879, n4880, n4881, n4882, n4883, n4884, n4885, n4886,
         n4887, n4888, n4889, n4890, n4891, n4892, n4893, n4894, n4895, n4896,
         n4897, n4898, n4899, n4900, n4901, n4902, n4903, n4904, n4905, n4906,
         n4907, n4908, n4909, n4910, n4911, n4912, n4913, n4914, n4915, n4916,
         n4917, n4918, n4919, n4920, n4921, n4922, n4923, n4924, n4925, n4926,
         n4927, n4928, n4929, n4930, n4931, n4932, n4933, n4934, n4935, n4936,
         n4937, n4938, n4939, n4940, n4941, n4942, n4943, n4944, n4945, n4946,
         n4947, n4948, n4949, n4950, n4951, n4952, n4953, n4954, n4955, n4956,
         n4957, n4958, n4959, n4960, n4961, n4962, n4963, n4964, n4965, n4966,
         n4967, n4968, n4969, n4970, n4971, n4972, n4973, n4974, n4975, n4976,
         n4977, n4978, n4979, n4980, n4981, n4982, n4983, n4984, n4985, n4986,
         n4987, n4988, n4989, n4990, n4991, n4992, n4993, n4994, n4995, n4996,
         n4997, n4998, n4999, n5000, n5001, n5002, n5003, n5004, n5005, n5006,
         n5007, n5008, n5009, n5010, n5011, n5012, n5013, n5014, n5015, n5016,
         n5017, n5018, n5019, n5020, n5021, n5022, n5023, n5024, n5025, n5026,
         n5027, n5028, n5029, n5030, n5031, n5032, n5033, n5034, n5035, n5036,
         n5037, n5038, n5039, n5040, n5041, n5042, n5043, n5044, n5045, n5046,
         n5047, n5048, n5049, n5050, n5051, n5052, n5053, n5054, n5055, n5056,
         n5057, n5058, n5059, n5060, n5061, n5062, n5063, n5064, n5065, n5066,
         n5067, n5068, n5069, n5070, n5071, n5072, n5073, n5074, n5075, n5076,
         n5077, n5078, n5079, n5080, n5081, n5082, n5083, n5084, n5085, n5086,
         n5087, n5088, n5089, n5090, n5091, n5092, n5093, n5094, n5095, n5096,
         n5097, n5098, n5099, n5100, n5101, n5102, n5103, n5104, n5105, n5106,
         n5107, n5108, n5109, n5110, n5111, n5112, n5113, n5114, n5115, n5116,
         n5117, n5118, n5119, n5120, n5121, n5122, n5123, n5124, n5125, n5126,
         n5127, n5128, n5129, n5130, n5131, n5132, n5133, n5134, n5135, n5136,
         n5137, n5138, n5139, n5140, n5141, n5142, n5143, n5144, n5145, n5146,
         n5147, n5148, n5149, n5150, n5151, n5152, n5153, n5154, n5155, n5156,
         n5157, n5158, n5159, n5160, n5161, n5162, n5163, n5164, n5165, n5166,
         n5167, n5168, n5169, n5170, n5171, n5172, n5173, n5174, n5175, n5176,
         n5177, n5178, n5179, n5180, n5181, n5182, n5183, n5184, n5185, n5186,
         n5187, n5188, n5189, n5190, n5191, n5192, n5193, n5194, n5195, n5196,
         n5197, n5198, n5199, n5200, n5201, n5202, n5203, n5204, n5205, n5206,
         n5207, n5208, n5209, n5210, n5211, n5212, n5213, n5214, n5215, n5216,
         n5217, n5218, n5219, n5220, n5221, n5222, n5223, n5224, n5225, n5226,
         n5227, n5228, n5229, n5230, n5231, n5232, n5233, n5234, n5235, n5236,
         n5237, n5238, n5239, n5240, n5241, n5242, n5243, n5244, n5245, n5246,
         n5247, n5248, n5249, n5250, n5251, n5252, n5253, n5254, n5255, n5256,
         n5257, n5258, n5259, n5260, n5261, n5262, n5263, n5264, n5265, n5266,
         n5267, n5268, n5269, n5270, n5271, n5272, n5273, n5274, n5275, n5276,
         n5277, n5278, n5279, n5280, n5281, n5282, n5283, n5284, n5285, n5286,
         n5287, n5288, n5289, n5290, n5291, n5292, n5293, n5294, n5295, n5296,
         n5297, n5298, n5299, n5300, n5301, n5302, n5303, n5304, n5305, n5306,
         n5307, n5308, n5309, n5310, n5311, n5312, n5313, n5314, n5315, n5316,
         n5317, n5318, n5319, n5320, n5321, n5322, n5323, n5324, n5325, n5326,
         n5327, n5328, n5329, n5330, n5331, n5332, n5333, n5334, n5335, n5336,
         n5337, n5338, n5339, n5340, n5341, n5342, n5343, n5344, n5345, n5346,
         n5347, n5348, n5349, n5350, n5351, n5352, n5353, n5354, n5355, n5356,
         n5357, n5358, n5359, n5360, n5361, n5362, n5363, n5364, n5365, n5366,
         n5367, n5368, n5369, n5370, n5371, n5372, n5373, n5374, n5375, n5376,
         n5377, n5378, n5379, n5380, n5381, n5382, n5383, n5384, n5385, n5386,
         n5387, n5388, n5389, n5390, n5391, n5392, n5393, n5394, n5395, n5396,
         n5397, n5398, n5399, n5400, n5401, n5402, n5403, n5404, n5405, n5406,
         n5407, n5408, n5409, n5410, n5411, n5412, n5413, n5414, n5415, n5416,
         n5417, n5418, n5419, n5420, n5421, n5422, n5423, n5424, n5425, n5426,
         n5427, n5428, n5429, n5430, n5431, n5432, n5433, n5434, n5435, n5436,
         n5437, n5438, n5439, n5440, n5441, n5442, n5443, n5444, n5445, n5446,
         n5447, n5448, n5449, n5450, n5451, n5452, n5453, n5454, n5455, n5456,
         n5457, n5458, n5459, n5460, n5461, n5462, n5463, n5464, n5465, n5466,
         n5467, n5468, n5469, n5470, n5471, n5472, n5473, n5474, n5475, n5476,
         n5477, n5478, n5479, n5480, n5481, n5482, n5483, n5484, n5485, n5486,
         n5487, n5488, n5489, n5490, n5491, n5492, n5493, n5494, n5495, n5496,
         n5497, n5498, n5499, n5500, n5501, n5502, n5503, n5504, n5505, n5506,
         n5507, n5508, n5509, n5510, n5511, n5512, n5513, n5514, n5515, n5516,
         n5517, n5518, n5519, n5520, n5521, n5522, n5523, n5524, n5525, n5526,
         n5527, n5528, n5529, n5530, n5531, n5532, n5533, n5534, n5535, n5536,
         n5537, n5538, n5539, n5540, n5541, n5542, n5543, n5544, n5545, n5546,
         n5547, n5548, n5549, n5550, n5551, n5552, n5553, n5554, n5555, n5556,
         n5557, n5558, n5559, n5560, n5561, n5562, n5563, n5564, n5565, n5566,
         n5567, n5568, n5569, n5570, n5571, n5572, n5573, n5574, n5575, n5576,
         n5577, n5578, n5579, n5580, n5581, n5582, n5583, n5584, n5585, n5586,
         n5587, n5588, n5589, n5590, n5591, n5592, n5593, n5594, n5595, n5596,
         n5597, n5598, n5599, n5600, n5601, n5602, n5603, n5604, n5605, n5606,
         n5607, n5608, n5609, n5610, n5611, n5612, n5613, n5614, n5615, n5616,
         n5617, n5618, n5619, n5620, n5621, n5622, n5623, n5624, n5625, n5626,
         n5627, n5628, n5629, n5630, n5631, n5632, n5633, n5634, n5635, n5636,
         n5637, n5638, n5639, n5640, n5641, n5642, n5643, n5644, n5645, n5646,
         n5647, n5648, n5649, n5650, n5651, n5652, n5653, n5654, n5655, n5656,
         n5657, n5658, n5659, n5660, n5661, n5662, n5663, n5664, n5665, n5666,
         n5667, n5668, n5669, n5670, n5671, n5672, n5673, n5674, n5675, n5676,
         n5677, n5678, n5679, n5680, n5681, n5682, n5683, n5684, n5685, n5686,
         n5687, n5688, n5689, n5690, n5691, n5692, n5693, n5694, n5695, n5696,
         n5697, n5698, n5699, n5700, n5701, n5702, n5703, n5704, n5705, n5706,
         n5707, n5708, n5709, n5710, n5711, n5712, n5713, n5714, n5715, n5716,
         n5717, n5718, n5719, n5720, n5721, n5722, n5723, n5724, n5725, n5726,
         n5727, n5728, n5729, n5730, n5731;
  wire   [5:0] cal_cnt;
  wire   [5:0] string_cnt_max;
  wire   [3:0] pat_cnt;
  wire   [2:0] curr_state;
  wire   [2:0] next_state;
  wire   [5:0] front_cnt;
  wire   [113:0] stringdata_ff;
  wire   [5:0] string_cnt;
  wire   [53:0] pattern_ff;

  DFFRX1 string_cnt_reg_4_ ( .D(N849), .CK(clk), .RN(rst_n), .Q(string_cnt[4]), 
        .QN(n5701) );
  DFFRX1 string_cnt_reg_3_ ( .D(N848), .CK(clk), .RN(rst_n), .Q(string_cnt[3]), 
        .QN(n5561) );
  DFFRX1 string_cnt_reg_2_ ( .D(N847), .CK(clk), .RN(rst_n), .Q(string_cnt[2]), 
        .QN(n5560) );
  DFFRX1 string_cnt_reg_1_ ( .D(N846), .CK(clk), .RN(rst_n), .Q(string_cnt[1]), 
        .QN(n5472) );
  DFFRX1 curr_state_reg_1_ ( .D(next_state[1]), .CK(clk), .RN(rst_n), .Q(
        curr_state[1]) );
  DFFRX1 curr_state_reg_2_ ( .D(next_state[2]), .CK(clk), .RN(rst_n), .Q(
        curr_state[2]), .QN(n5568) );
  DFFRX1 curr_state_reg_0_ ( .D(next_state[0]), .CK(clk), .RN(rst_n), .Q(
        curr_state[0]) );
  DFFRX1 isstring_ff_reg ( .D(n2940), .CK(clk), .RN(rst_n), .Q(isstring_ff), 
        .QN(n5698) );
  DFFRX1 stringdata_ff_reg_33__0_ ( .D(n2939), .CK(clk), .RN(rst_n), .QN(n5583) );
  DFFRX1 stringdata_ff_reg_33__7_ ( .D(n2938), .CK(clk), .RN(rst_n), .QN(n5489) );
  DFFRX1 stringdata_ff_reg_33__6_ ( .D(n2937), .CK(clk), .RN(rst_n), .QN(n5581) );
  DFFRX1 stringdata_ff_reg_33__5_ ( .D(n2936), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[0]), .QN(n5503) );
  DFFRX1 stringdata_ff_reg_33__4_ ( .D(n2935), .CK(clk), .RN(rst_n), .QN(n5438) );
  DFFRX1 stringdata_ff_reg_33__3_ ( .D(n2934), .CK(clk), .RN(rst_n), .QN(n5582) );
  DFFRX1 stringdata_ff_reg_33__2_ ( .D(n2933), .CK(clk), .RN(rst_n), .QN(n5388) );
  DFFRX1 stringdata_ff_reg_33__1_ ( .D(n2932), .CK(clk), .RN(rst_n), .QN(n5404) );
  DFFRX1 stringdata_ff_reg_32__7_ ( .D(n2930), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[8]), .QN(n5630) );
  DFFRX1 stringdata_ff_reg_32__6_ ( .D(n2929), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[7]), .QN(n5641) );
  DFFRX1 stringdata_ff_reg_32__5_ ( .D(n2928), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[6]), .QN(n5606) );
  DFFRX1 stringdata_ff_reg_32__4_ ( .D(n2927), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[5]), .QN(n5417) );
  DFFRX1 stringdata_ff_reg_32__3_ ( .D(n2926), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[4]), .QN(n5607) );
  DFFRX1 stringdata_ff_reg_32__2_ ( .D(n2925), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[3]), .QN(n5423) );
  DFFRX1 stringdata_ff_reg_32__1_ ( .D(n2924), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[2]), .QN(n5608) );
  DFFRX1 stringdata_ff_reg_31__0_ ( .D(n2923), .CK(clk), .RN(rst_n), .QN(n5579) );
  DFFRX1 stringdata_ff_reg_31__7_ ( .D(n2922), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[9]), .QN(n5591) );
  DFFRX1 stringdata_ff_reg_31__6_ ( .D(n2921), .CK(clk), .RN(rst_n), .QN(n5384) );
  DFFRX1 stringdata_ff_reg_31__3_ ( .D(n2918), .CK(clk), .RN(rst_n), .QN(n5428) );
  DFFRX1 stringdata_ff_reg_31__2_ ( .D(n2917), .CK(clk), .RN(rst_n), .QN(n5392) );
  DFFRX1 stringdata_ff_reg_31__1_ ( .D(n2916), .CK(clk), .RN(rst_n), .QN(n5487) );
  DFFRX1 stringdata_ff_reg_30__0_ ( .D(n2915), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[10]), .QN(n5636) );
  DFFRX1 stringdata_ff_reg_30__7_ ( .D(n2914), .CK(clk), .RN(rst_n), .QN(n5508) );
  DFFRX1 stringdata_ff_reg_30__6_ ( .D(n2913), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[15]), .QN(n5512) );
  DFFRX1 stringdata_ff_reg_30__5_ ( .D(n2912), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[14]), .QN(n5538) );
  DFFRX1 stringdata_ff_reg_30__4_ ( .D(n2911), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[13]), .QN(n5611) );
  DFFRX1 stringdata_ff_reg_30__3_ ( .D(n2910), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[12]), .QN(n5615) );
  DFFRX1 stringdata_ff_reg_30__2_ ( .D(n2909), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[11]), .QN(n5609) );
  DFFRX1 stringdata_ff_reg_30__1_ ( .D(n2908), .CK(clk), .RN(rst_n), .QN(n5516) );
  DFFRX1 stringdata_ff_reg_29__6_ ( .D(n2905), .CK(clk), .RN(rst_n), .QN(n5436) );
  DFFRX1 stringdata_ff_reg_29__5_ ( .D(n2904), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[16]), .QN(n5497) );
  DFFRX1 stringdata_ff_reg_29__3_ ( .D(n2902), .CK(clk), .RN(rst_n), .QN(n5393) );
  DFFRX1 stringdata_ff_reg_29__2_ ( .D(n2901), .CK(clk), .RN(rst_n), .QN(n5398) );
  DFFRX1 stringdata_ff_reg_29__1_ ( .D(n2900), .CK(clk), .RN(rst_n), .QN(n5431) );
  DFFRX1 stringdata_ff_reg_28__0_ ( .D(n2899), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[17]), .QN(n5605) );
  DFFRX1 stringdata_ff_reg_28__7_ ( .D(n2898), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[21]), .QN(n5631) );
  DFFRX1 stringdata_ff_reg_28__5_ ( .D(n2896), .CK(clk), .RN(rst_n), .QN(n5455) );
  DFFRX1 stringdata_ff_reg_28__4_ ( .D(n2895), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[20]), .QN(n5565) );
  DFFRX1 stringdata_ff_reg_28__3_ ( .D(n2894), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[19]), .QN(n5469) );
  DFFRX1 stringdata_ff_reg_28__2_ ( .D(n2893), .CK(clk), .RN(rst_n), .QN(n5598) );
  DFFRX1 stringdata_ff_reg_28__1_ ( .D(n2892), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[18]), .QN(n5638) );
  DFFRX1 stringdata_ff_reg_27__6_ ( .D(n2889), .CK(clk), .RN(rst_n), .QN(n5422) );
  DFFRX1 stringdata_ff_reg_27__5_ ( .D(n2888), .CK(clk), .RN(rst_n), .QN(n5585) );
  DFFRX1 stringdata_ff_reg_27__4_ ( .D(n2887), .CK(clk), .RN(rst_n), .QN(n5383) );
  DFFRX1 stringdata_ff_reg_27__3_ ( .D(n2886), .CK(clk), .RN(rst_n), .QN(n5411) );
  DFFRX1 stringdata_ff_reg_27__2_ ( .D(n2885), .CK(clk), .RN(rst_n), .QN(n5426) );
  DFFRX1 stringdata_ff_reg_27__1_ ( .D(n2884), .CK(clk), .RN(rst_n), .QN(n5439) );
  DFFRX1 stringdata_ff_reg_26__0_ ( .D(n2883), .CK(clk), .RN(rst_n), .QN(n5597) );
  DFFRX1 stringdata_ff_reg_26__7_ ( .D(n2882), .CK(clk), .RN(rst_n), .QN(n5514) );
  DFFRX1 stringdata_ff_reg_26__6_ ( .D(n2881), .CK(clk), .RN(rst_n), .QN(n5599) );
  DFFRX1 stringdata_ff_reg_26__5_ ( .D(n2880), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[26]), .QN(n5602) );
  DFFRX1 stringdata_ff_reg_26__4_ ( .D(n2879), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[25]), .QN(n5628) );
  DFFRX1 stringdata_ff_reg_26__3_ ( .D(n2878), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[24]), .QN(n5596) );
  DFFRX1 stringdata_ff_reg_26__2_ ( .D(n2877), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[23]), .QN(n5526) );
  DFFRX1 stringdata_ff_reg_26__1_ ( .D(n2876), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[22]), .QN(n5619) );
  DFFRX1 stringdata_ff_reg_25__0_ ( .D(n2875), .CK(clk), .RN(rst_n), .QN(n5484) );
  DFFRX1 stringdata_ff_reg_25__7_ ( .D(n2874), .CK(clk), .RN(rst_n), .QN(n5389) );
  DFFRX1 stringdata_ff_reg_25__6_ ( .D(n2873), .CK(clk), .RN(rst_n), .QN(n5399) );
  DFFRX1 stringdata_ff_reg_25__5_ ( .D(n2872), .CK(clk), .RN(rst_n), .QN(n5386) );
  DFFRX1 stringdata_ff_reg_25__4_ ( .D(n2871), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[27]), .QN(n5498) );
  DFFRX1 stringdata_ff_reg_25__3_ ( .D(n2870), .CK(clk), .RN(rst_n), .QN(n5432) );
  DFFRX1 stringdata_ff_reg_25__2_ ( .D(n2869), .CK(clk), .RN(rst_n), .QN(n5442) );
  DFFRX1 stringdata_ff_reg_25__1_ ( .D(n2868), .CK(clk), .RN(rst_n), .QN(n5580) );
  DFFRX1 stringdata_ff_reg_24__0_ ( .D(n2867), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[28]), .QN(n5424) );
  DFFRX1 stringdata_ff_reg_24__7_ ( .D(n2866), .CK(clk), .RN(rst_n), .QN(n5463) );
  DFFRX1 stringdata_ff_reg_24__6_ ( .D(n2865), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[31]), .QN(n5639) );
  DFFRX1 stringdata_ff_reg_24__5_ ( .D(n2864), .CK(clk), .RN(rst_n), .QN(n5412) );
  DFFRX1 stringdata_ff_reg_24__4_ ( .D(n2863), .CK(clk), .RN(rst_n), .QN(n5474) );
  DFFRX1 stringdata_ff_reg_24__3_ ( .D(n2862), .CK(clk), .RN(rst_n), .QN(n5515) );
  DFFRX1 stringdata_ff_reg_24__2_ ( .D(n2861), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[30]), .QN(n5527) );
  DFFRX1 stringdata_ff_reg_24__1_ ( .D(n2860), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[29]), .QN(n5467) );
  DFFRX1 stringdata_ff_reg_23__0_ ( .D(n2859), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[32]), .QN(n5448) );
  DFFRX1 stringdata_ff_reg_23__7_ ( .D(n2858), .CK(clk), .RN(rst_n), .QN(n5400) );
  DFFRX1 stringdata_ff_reg_23__6_ ( .D(n2857), .CK(clk), .RN(rst_n), .QN(n5488) );
  DFFRX1 stringdata_ff_reg_23__5_ ( .D(n2856), .CK(clk), .RN(rst_n), .QN(n5433) );
  DFFRX1 stringdata_ff_reg_23__4_ ( .D(n2855), .CK(clk), .RN(rst_n), .QN(n5401) );
  DFFRX1 stringdata_ff_reg_23__3_ ( .D(n2854), .CK(clk), .RN(rst_n), .QN(n5402) );
  DFFRX1 stringdata_ff_reg_23__2_ ( .D(n2853), .CK(clk), .RN(rst_n), .QN(n5485) );
  DFFRX1 stringdata_ff_reg_23__1_ ( .D(n2852), .CK(clk), .RN(rst_n), .QN(n5481) );
  DFFRX1 stringdata_ff_reg_22__0_ ( .D(n2851), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[33]), .QN(n5624) );
  DFFRX1 stringdata_ff_reg_22__7_ ( .D(n2850), .CK(clk), .RN(rst_n), .QN(n5450) );
  DFFRX1 stringdata_ff_reg_22__6_ ( .D(n2849), .CK(clk), .RN(rst_n), .QN(n5504) );
  DFFRX1 stringdata_ff_reg_22__5_ ( .D(n2848), .CK(clk), .RN(rst_n), .QN(n5513) );
  DFFRX1 stringdata_ff_reg_22__3_ ( .D(n2846), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[35]), .QN(n5620) );
  DFFRX1 stringdata_ff_reg_22__1_ ( .D(n2844), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[34]), .QN(n5616) );
  DFFRX1 stringdata_ff_reg_21__0_ ( .D(n2843), .CK(clk), .RN(rst_n), .QN(n5406) );
  DFFRX1 stringdata_ff_reg_21__7_ ( .D(n2842), .CK(clk), .RN(rst_n), .QN(n5394) );
  DFFRX1 stringdata_ff_reg_21__6_ ( .D(n2841), .CK(clk), .RN(rst_n), .QN(n5421) );
  DFFRX1 stringdata_ff_reg_21__4_ ( .D(n2839), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[37]), .QN(n5451) );
  DFFRX1 stringdata_ff_reg_21__3_ ( .D(n2838), .CK(clk), .RN(rst_n), .QN(n5486) );
  DFFRX1 stringdata_ff_reg_21__2_ ( .D(n2837), .CK(clk), .RN(rst_n), .QN(n5429) );
  DFFRX1 stringdata_ff_reg_21__1_ ( .D(n2836), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[36]), .QN(n5593) );
  DFFRX1 stringdata_ff_reg_20__0_ ( .D(n2835), .CK(clk), .RN(rst_n), .QN(n5509) );
  DFFRX1 stringdata_ff_reg_20__7_ ( .D(n2834), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[40]), .QN(n5617) );
  DFFRX1 stringdata_ff_reg_20__5_ ( .D(n2832), .CK(clk), .RN(rst_n), .QN(n5441) );
  DFFRX1 stringdata_ff_reg_20__4_ ( .D(n2831), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[39]), .QN(n5621) );
  DFFRX1 stringdata_ff_reg_20__3_ ( .D(n2830), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[38]), .QN(n5651) );
  DFFRX1 stringdata_ff_reg_20__2_ ( .D(n2829), .CK(clk), .RN(rst_n), .QN(n5507) );
  DFFRX1 stringdata_ff_reg_20__1_ ( .D(n2828), .CK(clk), .RN(rst_n), .QN(n5510) );
  DFFRX1 stringdata_ff_reg_19__7_ ( .D(n2826), .CK(clk), .RN(rst_n), .QN(n5437) );
  DFFRX1 stringdata_ff_reg_19__6_ ( .D(n2825), .CK(clk), .RN(rst_n), .QN(n5434) );
  DFFRX1 stringdata_ff_reg_19__5_ ( .D(n2824), .CK(clk), .RN(rst_n), .QN(n5408) );
  DFFRX1 stringdata_ff_reg_19__4_ ( .D(n2823), .CK(clk), .RN(rst_n), .QN(n5409) );
  DFFRX1 stringdata_ff_reg_19__3_ ( .D(n2822), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[41]), .QN(n5452) );
  DFFRX1 stringdata_ff_reg_19__2_ ( .D(n2821), .CK(clk), .RN(rst_n), .QN(n5584) );
  DFFRX1 stringdata_ff_reg_18__0_ ( .D(n2819), .CK(clk), .RN(rst_n), .QN(n5588) );
  DFFRX1 stringdata_ff_reg_18__7_ ( .D(n2818), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[47]), .QN(n5622) );
  DFFRX1 stringdata_ff_reg_18__6_ ( .D(n2817), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[46]), .QN(n5603) );
  DFFRX1 stringdata_ff_reg_18__5_ ( .D(n2816), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[45]), .QN(n5530) );
  DFFRX1 stringdata_ff_reg_18__4_ ( .D(n2815), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[44]), .QN(n5566) );
  DFFRX1 stringdata_ff_reg_18__3_ ( .D(n2814), .CK(clk), .RN(rst_n), .QN(n5465) );
  DFFRX1 stringdata_ff_reg_18__2_ ( .D(n2813), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[43]), .QN(n5595) );
  DFFRX1 stringdata_ff_reg_18__1_ ( .D(n2812), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[42]), .QN(n5618) );
  DFFRX1 stringdata_ff_reg_17__0_ ( .D(n2811), .CK(clk), .RN(rst_n), .QN(n5390) );
  DFFRX1 stringdata_ff_reg_17__7_ ( .D(n2810), .CK(clk), .RN(rst_n), .QN(n5587) );
  DFFRX1 stringdata_ff_reg_17__6_ ( .D(n2809), .CK(clk), .RN(rst_n), .QN(n5382) );
  DFFRX1 stringdata_ff_reg_17__5_ ( .D(n2808), .CK(clk), .RN(rst_n), .QN(n5445) );
  DFFRX1 stringdata_ff_reg_17__4_ ( .D(n2807), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[49]), .QN(n5600) );
  DFFRX1 stringdata_ff_reg_17__3_ ( .D(n2806), .CK(clk), .RN(rst_n), .QN(n5482) );
  DFFRX1 stringdata_ff_reg_17__2_ ( .D(n2805), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[48]), .QN(n5496) );
  DFFRX1 stringdata_ff_reg_16__0_ ( .D(n2803), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[50]), .QN(n5521) );
  DFFRX1 stringdata_ff_reg_16__7_ ( .D(n2802), .CK(clk), .RN(rst_n), .QN(n5464) );
  DFFRX1 stringdata_ff_reg_16__6_ ( .D(n2801), .CK(clk), .RN(rst_n), .QN(n5494) );
  DFFRX1 stringdata_ff_reg_16__5_ ( .D(n2800), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[54]), .QN(n5567) );
  DFFRX1 stringdata_ff_reg_16__4_ ( .D(n2799), .CK(clk), .RN(rst_n), .QN(n5415) );
  DFFRX1 stringdata_ff_reg_16__3_ ( .D(n2798), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[53]), .QN(n5626) );
  DFFRX1 stringdata_ff_reg_16__2_ ( .D(n2797), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[52]), .QN(n5629) );
  DFFRX1 stringdata_ff_reg_16__1_ ( .D(n2796), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[51]), .QN(n5528) );
  DFFRX1 stringdata_ff_reg_15__0_ ( .D(n2795), .CK(clk), .RN(rst_n), .QN(n5443) );
  DFFRX1 stringdata_ff_reg_15__7_ ( .D(n2794), .CK(clk), .RN(rst_n), .QN(n5410) );
  DFFRX1 stringdata_ff_reg_15__6_ ( .D(n2793), .CK(clk), .RN(rst_n), .QN(n5387) );
  DFFRX1 stringdata_ff_reg_15__5_ ( .D(n2792), .CK(clk), .RN(rst_n), .QN(n5435) );
  DFFRX1 stringdata_ff_reg_15__3_ ( .D(n2790), .CK(clk), .RN(rst_n), .QN(n5391) );
  DFFRX1 stringdata_ff_reg_15__1_ ( .D(n2788), .CK(clk), .RN(rst_n), .QN(n5395) );
  DFFRX1 stringdata_ff_reg_14__0_ ( .D(n2787), .CK(clk), .RN(rst_n), .QN(n5407) );
  DFFRX1 stringdata_ff_reg_14__7_ ( .D(n2786), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[58]), .QN(n5533) );
  DFFRX1 stringdata_ff_reg_14__6_ ( .D(n2785), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[57]), .QN(n5610) );
  DFFRX1 stringdata_ff_reg_14__5_ ( .D(n2784), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[56]), .QN(n5517) );
  DFFRX1 stringdata_ff_reg_14__4_ ( .D(n2783), .CK(clk), .RN(rst_n), .QN(n5457) );
  DFFRX1 stringdata_ff_reg_14__3_ ( .D(n2782), .CK(clk), .RN(rst_n), .QN(n5447) );
  DFFRX1 stringdata_ff_reg_14__2_ ( .D(n2781), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[55]), .QN(n5522) );
  DFFRX1 stringdata_ff_reg_14__1_ ( .D(n2780), .CK(clk), .RN(rst_n), .QN(n5418) );
  DFFRX1 stringdata_ff_reg_13__0_ ( .D(n2779), .CK(clk), .RN(rst_n), .QN(n5430) );
  DFFRX1 stringdata_ff_reg_13__7_ ( .D(n2778), .CK(clk), .RN(rst_n), .QN(n5396) );
  DFFRX1 stringdata_ff_reg_13__6_ ( .D(n2777), .CK(clk), .RN(rst_n), .QN(n5427) );
  DFFRX1 stringdata_ff_reg_13__5_ ( .D(n2776), .CK(clk), .RN(rst_n), .QN(n5405) );
  DFFRX1 stringdata_ff_reg_13__2_ ( .D(n2773), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[59]), .QN(n5459) );
  DFFRX1 stringdata_ff_reg_12__0_ ( .D(n2771), .CK(clk), .RN(rst_n), .QN(n5416) );
  DFFRX1 stringdata_ff_reg_12__7_ ( .D(n2770), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[64]), .QN(n5612) );
  DFFRX1 stringdata_ff_reg_12__6_ ( .D(n2769), .CK(clk), .RN(rst_n), .QN(n5500) );
  DFFRX1 stringdata_ff_reg_12__4_ ( .D(n2767), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[63]), .QN(n5520) );
  DFFRX1 stringdata_ff_reg_12__3_ ( .D(n2766), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[62]), .QN(n5613) );
  DFFRX1 stringdata_ff_reg_12__2_ ( .D(n2765), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[61]), .QN(n5614) );
  DFFRX1 stringdata_ff_reg_12__1_ ( .D(n2764), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[60]), .QN(n5635) );
  DFFRX1 stringdata_ff_reg_11__0_ ( .D(n2763), .CK(clk), .RN(rst_n), .QN(n5493) );
  DFFRX1 stringdata_ff_reg_11__7_ ( .D(n2762), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[66]), .QN(n5505) );
  DFFRX1 stringdata_ff_reg_11__6_ ( .D(n2761), .CK(clk), .RN(rst_n), .QN(n5385) );
  DFFRX1 stringdata_ff_reg_11__5_ ( .D(n2760), .CK(clk), .RN(rst_n), .QN(n5586) );
  DFFRX1 stringdata_ff_reg_11__3_ ( .D(n2758), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[65]), .QN(n5453) );
  DFFRX1 stringdata_ff_reg_11__2_ ( .D(n2757), .CK(clk), .RN(rst_n), .QN(n5444) );
  DFFRX1 stringdata_ff_reg_11__1_ ( .D(n2756), .CK(clk), .RN(rst_n), .QN(n5490) );
  DFFRX1 stringdata_ff_reg_10__0_ ( .D(n2755), .CK(clk), .RN(rst_n), .QN(n5456) );
  DFFRX1 stringdata_ff_reg_10__7_ ( .D(n2754), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[68]), .QN(n5633) );
  DFFRX1 stringdata_ff_reg_10__6_ ( .D(n2753), .CK(clk), .RN(rst_n), .QN(n5594) );
  DFFRX1 stringdata_ff_reg_10__5_ ( .D(n2752), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[67]), .QN(n5637) );
  DFFRX1 stringdata_ff_reg_10__4_ ( .D(n2751), .CK(clk), .RN(rst_n), .QN(n5458) );
  DFFRX1 stringdata_ff_reg_10__3_ ( .D(n2750), .CK(clk), .RN(rst_n), .QN(n5506) );
  DFFRX1 stringdata_ff_reg_10__2_ ( .D(n2749), .CK(clk), .RN(rst_n), .QN(n5461) );
  DFFRX1 stringdata_ff_reg_10__1_ ( .D(n2748), .CK(clk), .RN(rst_n), .QN(n5454) );
  DFFRX1 stringdata_ff_reg_9__0_ ( .D(n2747), .CK(clk), .RN(rst_n), .QN(n5397)
         );
  DFFRX1 stringdata_ff_reg_9__7_ ( .D(n2746), .CK(clk), .RN(rst_n), .QN(n5440)
         );
  DFFRX1 stringdata_ff_reg_9__6_ ( .D(n2745), .CK(clk), .RN(rst_n), .QN(n5589)
         );
  DFFRX1 stringdata_ff_reg_9__5_ ( .D(n2744), .CK(clk), .RN(rst_n), .QN(n5590)
         );
  DFFRX1 stringdata_ff_reg_9__4_ ( .D(n2743), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[70]), .QN(n5511) );
  DFFRX1 stringdata_ff_reg_9__3_ ( .D(n2742), .CK(clk), .RN(rst_n), .QN(n5483)
         );
  DFFRX1 stringdata_ff_reg_9__2_ ( .D(n2741), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[69]), .QN(n5414) );
  DFFRX1 stringdata_ff_reg_8__0_ ( .D(n2739), .CK(clk), .RN(rst_n), .QN(n5601)
         );
  DFFRX1 stringdata_ff_reg_8__7_ ( .D(n2738), .CK(clk), .RN(rst_n), .QN(n5592)
         );
  DFFRX1 stringdata_ff_reg_8__6_ ( .D(n2737), .CK(clk), .RN(rst_n), .QN(n5492)
         );
  DFFRX1 stringdata_ff_reg_8__5_ ( .D(n2736), .CK(clk), .RN(rst_n), .QN(n5475)
         );
  DFFRX1 stringdata_ff_reg_8__4_ ( .D(n2735), .CK(clk), .RN(rst_n), .QN(n5462)
         );
  DFFRX1 stringdata_ff_reg_8__3_ ( .D(n2734), .CK(clk), .RN(rst_n), .QN(n5460)
         );
  DFFRX1 stringdata_ff_reg_8__2_ ( .D(n2733), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[72]), .QN(n5625) );
  DFFRX1 stringdata_ff_reg_8__1_ ( .D(n2732), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[71]), .QN(n5518) );
  DFFRX1 stringdata_ff_reg_7__0_ ( .D(n2731), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[73]), .QN(n5501) );
  DFFRX1 stringdata_ff_reg_7__7_ ( .D(n2730), .CK(clk), .RN(rst_n), .QN(n5491)
         );
  DFFRX1 stringdata_ff_reg_7__6_ ( .D(n2729), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[78]), .QN(n5449) );
  DFFRX1 stringdata_ff_reg_7__5_ ( .D(n2728), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[77]), .QN(n5499) );
  DFFRX1 stringdata_ff_reg_7__4_ ( .D(n2727), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[76]), .QN(n5502) );
  DFFRX1 stringdata_ff_reg_7__3_ ( .D(n2726), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[75]), .QN(n5413) );
  DFFRX1 stringdata_ff_reg_7__2_ ( .D(n2725), .CK(clk), .RN(rst_n), .QN(n5403)
         );
  DFFRX1 stringdata_ff_reg_7__1_ ( .D(n2724), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[74]), .QN(n5446) );
  DFFRX1 stringdata_ff_reg_6__0_ ( .D(n2723), .CK(clk), .RN(rst_n), .QN(n5623)
         );
  DFFRX1 stringdata_ff_reg_6__7_ ( .D(n2722), .CK(clk), .RN(rst_n), .QN(n5466)
         );
  DFFRX1 stringdata_ff_reg_6__6_ ( .D(n2721), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[81]), .QN(n5471) );
  DFFRX1 stringdata_ff_reg_6__4_ ( .D(n2719), .CK(clk), .RN(rst_n), .QN(n5627)
         );
  DFFRX1 stringdata_ff_reg_6__3_ ( .D(n2718), .CK(clk), .RN(rst_n), .QN(n5529)
         );
  DFFRX1 stringdata_ff_reg_6__2_ ( .D(n2717), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[80]), .QN(n5537) );
  DFFRX1 stringdata_ff_reg_6__1_ ( .D(n2716), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[79]), .QN(n5536) );
  DFFRX1 stringdata_ff_reg_5__0_ ( .D(n2715), .CK(clk), .RN(rst_n), .QN(n5523)
         );
  DFFRX1 stringdata_ff_reg_5__7_ ( .D(n2714), .CK(clk), .RN(rst_n), .QN(n5519)
         );
  DFFRX1 stringdata_ff_reg_5__6_ ( .D(n2713), .CK(clk), .RN(rst_n), .QN(n5524)
         );
  DFFRX1 stringdata_ff_reg_5__5_ ( .D(n2712), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[82]), .QN(n5640) );
  DFFRX1 stringdata_ff_reg_5__4_ ( .D(n2711), .CK(clk), .RN(rst_n), .QN(n5532)
         );
  DFFRX1 stringdata_ff_reg_5__3_ ( .D(n2710), .CK(clk), .RN(rst_n), .QN(n5531)
         );
  DFFRX1 stringdata_ff_reg_5__2_ ( .D(n2709), .CK(clk), .RN(rst_n), .QN(n5468)
         );
  DFFRX1 stringdata_ff_reg_5__1_ ( .D(n2708), .CK(clk), .RN(rst_n), .QN(n5470)
         );
  DFFRX1 stringdata_ff_reg_4__0_ ( .D(n2707), .CK(clk), .RN(rst_n), .QN(n5543)
         );
  DFFRX1 stringdata_ff_reg_4__7_ ( .D(n2706), .CK(clk), .RN(rst_n), .QN(n5544)
         );
  DFFRX1 stringdata_ff_reg_4__6_ ( .D(n2705), .CK(clk), .RN(rst_n), .QN(n5545)
         );
  DFFRX1 stringdata_ff_reg_4__5_ ( .D(n2704), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[86]), .QN(n5553) );
  DFFRX1 stringdata_ff_reg_4__4_ ( .D(n2703), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[85]), .QN(n5655) );
  DFFRX1 stringdata_ff_reg_4__3_ ( .D(n2702), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[84]), .QN(n5654) );
  DFFRX1 stringdata_ff_reg_4__2_ ( .D(n2701), .CK(clk), .RN(rst_n), .QN(n5649)
         );
  DFFRX1 stringdata_ff_reg_4__1_ ( .D(n2700), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[83]), .QN(n5671) );
  DFFRX1 stringdata_ff_reg_3__0_ ( .D(n2699), .CK(clk), .RN(rst_n), .QN(n5648)
         );
  DFFRX1 stringdata_ff_reg_3__7_ ( .D(n2698), .CK(clk), .RN(rst_n), .QN(n5644)
         );
  DFFRX1 stringdata_ff_reg_3__6_ ( .D(n2697), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[90]), .QN(n5659) );
  DFFRX1 stringdata_ff_reg_3__5_ ( .D(n2696), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[89]), .QN(n5657) );
  DFFRX1 stringdata_ff_reg_3__4_ ( .D(n2695), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[88]), .QN(n5556) );
  DFFRX1 stringdata_ff_reg_3__3_ ( .D(n2694), .CK(clk), .RN(rst_n), .QN(n5645)
         );
  DFFRX1 stringdata_ff_reg_3__2_ ( .D(n2693), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[87]), .QN(n5660) );
  DFFRX1 stringdata_ff_reg_3__1_ ( .D(n2692), .CK(clk), .RN(rst_n), .QN(n5647)
         );
  DFFRX1 stringdata_ff_reg_2__0_ ( .D(n2691), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[91]), .QN(n5686) );
  DFFRX1 stringdata_ff_reg_2__7_ ( .D(n2690), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[97]), .QN(n5687) );
  DFFRX1 stringdata_ff_reg_2__6_ ( .D(n2689), .CK(clk), .RN(rst_n), .QN(n5672)
         );
  DFFRX1 stringdata_ff_reg_2__5_ ( .D(n2688), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[96]), .QN(n5694) );
  DFFRX1 stringdata_ff_reg_2__4_ ( .D(n2687), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[95]), .QN(n5688) );
  DFFRX1 stringdata_ff_reg_2__3_ ( .D(n2686), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[94]), .QN(n5689) );
  DFFRX1 stringdata_ff_reg_2__2_ ( .D(n2685), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[93]), .QN(n5673) );
  DFFRX1 stringdata_ff_reg_2__1_ ( .D(n2684), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[92]), .QN(n5693) );
  DFFRX1 stringdata_ff_reg_1__0_ ( .D(n2683), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[98]), .QN(n5690) );
  DFFRX1 stringdata_ff_reg_1__7_ ( .D(n2682), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[105]), .QN(n5681) );
  DFFRX1 stringdata_ff_reg_1__6_ ( .D(n2681), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[104]), .QN(n5692) );
  DFFRX1 stringdata_ff_reg_1__5_ ( .D(n2680), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[103]), .QN(n5682) );
  DFFRX1 stringdata_ff_reg_1__4_ ( .D(n2679), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[102]), .QN(n5683) );
  DFFRX1 stringdata_ff_reg_1__3_ ( .D(n2678), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[101]), .QN(n5684) );
  DFFRX1 stringdata_ff_reg_1__2_ ( .D(n2677), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[100]), .QN(n5691) );
  DFFRX1 stringdata_ff_reg_1__1_ ( .D(n2676), .CK(clk), .RN(rst_n), .Q(
        stringdata_ff[99]), .QN(n5685) );
  DFFRX1 pat_cnt_reg_1_ ( .D(n2663), .CK(clk), .RN(rst_n), .Q(pat_cnt[1]), 
        .QN(n5480) );
  DFFRX1 pat_cnt_reg_2_ ( .D(n2657), .CK(clk), .RN(rst_n), .Q(pat_cnt[2]), 
        .QN(n5576) );
  DFFRX1 pat_cnt_reg_3_ ( .D(n2656), .CK(clk), .RN(rst_n), .Q(pat_cnt[3]), 
        .QN(n5577) );
  DFFRX1 star_loc_reg_3_ ( .D(n2659), .CK(clk), .RN(rst_n), .Q(N1804), .QN(
        n5699) );
  DFFRX1 pattern_ff_reg_7__0_ ( .D(n2655), .CK(clk), .RN(rst_n), .Q(
        pattern_ff[0]), .QN(n5552) );
  DFFRX1 pattern_ff_reg_6__0_ ( .D(n2647), .CK(clk), .RN(rst_n), .Q(
        pattern_ff[8]), .QN(n5679) );
  DFFRX1 pattern_ff_reg_5__0_ ( .D(n2639), .CK(clk), .RN(rst_n), .Q(
        pattern_ff[16]), .QN(n5425) );
  DFFRX1 pattern_ff_reg_4__0_ ( .D(n2631), .CK(clk), .RN(rst_n), .Q(
        pattern_ff[24]), .QN(n5658) );
  DFFRX1 pattern_ff_reg_3__0_ ( .D(n2623), .CK(clk), .RN(rst_n), .QN(n5539) );
  DFFRX1 pattern_ff_reg_2__0_ ( .D(n2615), .CK(clk), .RN(rst_n), .Q(
        pattern_ff[37]), .QN(n5665) );
  DFFRX1 pattern_ff_reg_1__0_ ( .D(n2607), .CK(clk), .RN(rst_n), .QN(n5551) );
  DFFRX1 pattern_ff_reg_0__0_ ( .D(n2599), .CK(clk), .RN(rst_n), .QN(n5674) );
  DFFRX1 pattern_ff_reg_7__4_ ( .D(n2651), .CK(clk), .RN(rst_n), .Q(
        pattern_ff[4]), .QN(n5656) );
  DFFRX1 pattern_ff_reg_6__4_ ( .D(n2643), .CK(clk), .RN(rst_n), .Q(
        pattern_ff[12]), .QN(n5575) );
  DFFRX1 pattern_ff_reg_5__4_ ( .D(n2635), .CK(clk), .RN(rst_n), .Q(
        pattern_ff[20]), .QN(n5477) );
  DFFRX1 pattern_ff_reg_4__4_ ( .D(n2627), .CK(clk), .RN(rst_n), .Q(
        pattern_ff[27]), .QN(n5572) );
  DFFRX1 pattern_ff_reg_3__4_ ( .D(n2619), .CK(clk), .RN(rst_n), .Q(
        pattern_ff[34]), .QN(n5548) );
  DFFRX1 pattern_ff_reg_2__4_ ( .D(n2611), .CK(clk), .RN(rst_n), .Q(
        pattern_ff[41]), .QN(n5554) );
  DFFRX1 pattern_ff_reg_1__4_ ( .D(n2603), .CK(clk), .RN(rst_n), .Q(
        pattern_ff[48]), .QN(n5678) );
  DFFRX1 pattern_ff_reg_0__4_ ( .D(n2595), .CK(clk), .RN(rst_n), .QN(n5675) );
  DFFRX1 pattern_ff_reg_7__6_ ( .D(n2649), .CK(clk), .RN(rst_n), .Q(
        pattern_ff[6]), .QN(n5550) );
  DFFRX1 pattern_ff_reg_6__6_ ( .D(n2641), .CK(clk), .RN(rst_n), .Q(
        pattern_ff[14]), .QN(n5667) );
  DFFRX1 pattern_ff_reg_5__6_ ( .D(n2633), .CK(clk), .RN(rst_n), .Q(
        pattern_ff[22]), .QN(n5478) );
  DFFRX1 pattern_ff_reg_4__6_ ( .D(n2625), .CK(clk), .RN(rst_n), .Q(
        pattern_ff[29]), .QN(n5653) );
  DFFRX1 pattern_ff_reg_3__6_ ( .D(n2617), .CK(clk), .RN(rst_n), .Q(
        pattern_ff[35]), .QN(n5650) );
  DFFRX1 pattern_ff_reg_2__6_ ( .D(n2609), .CK(clk), .RN(rst_n), .Q(
        pattern_ff[43]), .QN(n5555) );
  DFFRX1 pattern_ff_reg_1__6_ ( .D(n2601), .CK(clk), .RN(rst_n), .Q(
        pattern_ff[49]), .QN(n5668) );
  DFFRX1 pattern_ff_reg_0__6_ ( .D(n2593), .CK(clk), .RN(rst_n), .QN(n5676) );
  DFFRX1 pattern_ff_reg_7__7_ ( .D(n2648), .CK(clk), .RN(rst_n), .Q(
        pattern_ff[7]), .QN(n5542) );
  DFFRX1 pattern_ff_reg_6__7_ ( .D(n2640), .CK(clk), .RN(rst_n), .Q(
        pattern_ff[15]), .QN(n5479) );
  DFFRX1 pattern_ff_reg_5__7_ ( .D(n2632), .CK(clk), .RN(rst_n), .Q(
        pattern_ff[23]), .QN(n5666) );
  DFFRX1 pattern_ff_reg_4__7_ ( .D(n2624), .CK(clk), .RN(rst_n), .Q(
        pattern_ff[30]), .QN(n5569) );
  DFFRX1 pattern_ff_reg_3__7_ ( .D(n2616), .CK(clk), .RN(rst_n), .Q(
        pattern_ff[36]), .QN(n5643) );
  DFFRX1 pattern_ff_reg_2__7_ ( .D(n2608), .CK(clk), .RN(rst_n), .Q(
        pattern_ff[44]), .QN(n5669) );
  DFFRX1 pattern_ff_reg_1__7_ ( .D(n2600), .CK(clk), .RN(rst_n), .QN(n5557) );
  DFFRX1 pattern_ff_reg_0__7_ ( .D(n2592), .CK(clk), .RN(rst_n), .Q(
        pattern_ff[53]), .QN(n5697) );
  DFFRX4 cal_cnt_reg_1_ ( .D(n2588), .CK(clk), .RN(rst_n), .Q(cal_cnt[1]), 
        .QN(n5476) );
  DFFRX1 front_cnt_reg_1_ ( .D(n2587), .CK(clk), .RN(rst_n), .Q(front_cnt[1]), 
        .QN(n5703) );
  DFFRX4 cal_cnt_reg_2_ ( .D(n2586), .CK(clk), .RN(rst_n), .Q(cal_cnt[2]), 
        .QN(n5571) );
  DFFRX1 front_cnt_reg_3_ ( .D(n2583), .CK(clk), .RN(rst_n), .Q(front_cnt[3]), 
        .QN(n5702) );
  DFFSX1 string_cnt_reg_0_ ( .D(N845), .CK(clk), .SN(rst_n), .Q(string_cnt[0]), 
        .QN(n5700) );
  DFFSX1 front_or_back_reg ( .D(n2941), .CK(clk), .SN(rst_n), .Q(front_or_back) );
  DFFSX1 stringdata_ff_reg_0__5_ ( .D(n2672), .CK(clk), .SN(rst_n), .Q(
        stringdata_ff[111]) );
  DFFSX1 pattern_ff_reg_7__5_ ( .D(n2650), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[5]) );
  DFFSX1 pattern_ff_reg_6__5_ ( .D(n2642), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[13]), .QN(n5662) );
  DFFSX1 pattern_ff_reg_3__5_ ( .D(n2618), .CK(clk), .SN(rst_n), .QN(n5534) );
  DFFSX1 pattern_ff_reg_2__5_ ( .D(n2610), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[42]), .QN(n5670) );
  DFFSX1 pattern_ff_reg_5__5_ ( .D(n2634), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[21]), .QN(n5546) );
  DFFSX1 pattern_ff_reg_4__5_ ( .D(n2626), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[28]), .QN(n5540) );
  DFFSX1 pattern_ff_reg_1__5_ ( .D(n2602), .CK(clk), .SN(rst_n), .QN(n5661) );
  DFFSX1 pattern_ff_reg_0__5_ ( .D(n2594), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[52]) );
  DFFSX1 pattern_ff_reg_7__1_ ( .D(n2654), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[1]) );
  DFFSX1 pattern_ff_reg_6__1_ ( .D(n2646), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[9]), .QN(n5634) );
  DFFSX1 pattern_ff_reg_5__1_ ( .D(n2638), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[17]), .QN(n5549) );
  DFFSX1 pattern_ff_reg_4__1_ ( .D(n2630), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[25]), .QN(n5632) );
  DFFSX1 pattern_ff_reg_3__1_ ( .D(n2622), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[31]), .QN(n5664) );
  DFFSX1 pattern_ff_reg_2__1_ ( .D(n2614), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[38]), .QN(n5558) );
  DFFSX1 pattern_ff_reg_1__1_ ( .D(n2606), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[45]) );
  DFFSX1 pattern_ff_reg_0__1_ ( .D(n2598), .CK(clk), .SN(rst_n), .QN(n5677) );
  DFFSX1 pattern_ff_reg_7__2_ ( .D(n2653), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[2]) );
  DFFSX1 pattern_ff_reg_6__2_ ( .D(n2645), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[10]), .QN(n5525) );
  DFFSX1 pattern_ff_reg_5__2_ ( .D(n2637), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[18]), .QN(n5642) );
  DFFSX1 pattern_ff_reg_4__2_ ( .D(n2629), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[26]), .QN(n5541) );
  DFFSX1 pattern_ff_reg_3__2_ ( .D(n2621), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[32]), .QN(n5652) );
  DFFSX1 pattern_ff_reg_2__2_ ( .D(n2613), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[39]) );
  DFFSX1 pattern_ff_reg_1__2_ ( .D(n2605), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[46]), .QN(n5695) );
  DFFSX1 pattern_ff_reg_0__2_ ( .D(n2597), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[50]) );
  DFFSX1 pattern_ff_reg_7__3_ ( .D(n2652), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[3]) );
  DFFSX1 pattern_ff_reg_6__3_ ( .D(n2644), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[11]), .QN(n5535) );
  DFFSX1 pattern_ff_reg_5__3_ ( .D(n2636), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[19]), .QN(n5646) );
  DFFSX1 pattern_ff_reg_4__3_ ( .D(n2628), .CK(clk), .SN(rst_n), .QN(n5604) );
  DFFSX1 pattern_ff_reg_3__3_ ( .D(n2620), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[33]), .QN(n5547) );
  DFFSX1 pattern_ff_reg_2__3_ ( .D(n2612), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[40]), .QN(n5663) );
  DFFSX1 pattern_ff_reg_1__3_ ( .D(n2604), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[47]), .QN(n5680) );
  DFFSX1 pattern_ff_reg_0__3_ ( .D(n2596), .CK(clk), .SN(rst_n), .Q(
        pattern_ff[51]) );
  DFFRX1 string_cnt_max_reg_4_ ( .D(n2576), .CK(clk), .RN(rst_n), .Q(
        string_cnt_max[4]), .QN(n5495) );
  DFFRX1 string_cnt_max_reg_3_ ( .D(n2575), .CK(clk), .RN(rst_n), .Q(
        string_cnt_max[3]), .QN(n5578) );
  DFFRX1 string_cnt_max_reg_2_ ( .D(n2574), .CK(clk), .RN(rst_n), .Q(
        string_cnt_max[2]), .QN(n5570) );
  DFFRX1 string_cnt_max_reg_1_ ( .D(n2573), .CK(clk), .RN(rst_n), .Q(
        string_cnt_max[1]), .QN(n5574) );
  TLATX1 next_state_reg_2_ ( .G(N609), .D(N612), .Q(next_state[2]) );
  DFFRX4 star_loc_reg_1_ ( .D(n2661), .CK(clk), .RN(rst_n), .Q(N1675), .QN(
        n5696) );
  DFFRX4 star_loc_reg_0_ ( .D(n2662), .CK(clk), .RN(rst_n), .Q(N1594), .QN(
        n5419) );
  TLATX1 next_state_reg_1_ ( .G(N609), .D(N611), .Q(next_state[1]) );
  TLATX1 next_state_reg_0_ ( .G(N609), .D(N610), .Q(next_state[0]) );
  DFFRX1 match_f_ff_reg ( .D(n2591), .CK(clk), .RN(rst_n), .Q(match_f_ff), 
        .QN(n5704) );
  DFFRX1 end_f_reg ( .D(n2665), .CK(clk), .RN(rst_n), .Q(end_f), .QN(n5573) );
  DFFRX1 string_cnt_max_reg_0_ ( .D(n2578), .CK(clk), .RN(rst_n), .Q(
        string_cnt_max[0]), .QN(n5559) );
  DFFRX2 cal_cnt_reg_3_ ( .D(n2584), .CK(clk), .RN(rst_n), .Q(cal_cnt[3]), 
        .QN(n5473) );
  DFFRX1 cal_cnt_reg_5_ ( .D(n2580), .CK(clk), .RN(rst_n), .Q(cal_cnt[5]), 
        .QN(n5564) );
  DFFSX1 out_valid_reg ( .D(n5731), .CK(clk), .SN(rst_n), .QN(out_valid) );
  DFFSX1 match_reg ( .D(n5381), .CK(clk), .SN(rst_n), .QN(match) );
  DFFSX1 match_index_reg_4_ ( .D(n5380), .CK(clk), .SN(rst_n), .QN(
        match_index[4]) );
  DFFSX1 match_index_reg_3_ ( .D(n5379), .CK(clk), .SN(rst_n), .QN(
        match_index[3]) );
  DFFSX1 match_index_reg_2_ ( .D(n5378), .CK(clk), .SN(rst_n), .QN(
        match_index[2]) );
  DFFSX1 match_index_reg_1_ ( .D(n5377), .CK(clk), .SN(rst_n), .QN(
        match_index[1]) );
  DFFSX1 match_index_reg_0_ ( .D(n5376), .CK(clk), .SN(rst_n), .QN(
        match_index[0]) );
  DFFSX1 ispattern_ff_reg ( .D(n2953), .CK(clk), .SN(rst_n), .QN(ispattern_ff)
         );
  DFFSX1 star_f_reg ( .D(n5375), .CK(clk), .SN(rst_n), .Q(n5730), .QN(star_f)
         );
  DFFSX1 string_cnt_max_reg_5_ ( .D(n2951), .CK(clk), .SN(rst_n), .QN(
        string_cnt_max[5]) );
  DFFSX1 head_f_reg ( .D(n2954), .CK(clk), .SN(rst_n), .QN(head_f) );
  DFFSX1 string_cnt_reg_5_ ( .D(n5374), .CK(clk), .SN(rst_n), .QN(
        string_cnt[5]) );
  DFFSX1 stringdata_ff_reg_32__0_ ( .D(n5373), .CK(clk), .SN(rst_n), .Q(n5705), 
        .QN(stringdata_ff[1]) );
  DFFSX1 stringdata_ff_reg_0__7_ ( .D(n5372), .CK(clk), .SN(rst_n), .QN(
        stringdata_ff[113]) );
  DFFSX1 stringdata_ff_reg_0__6_ ( .D(n5371), .CK(clk), .SN(rst_n), .QN(
        stringdata_ff[112]) );
  DFFSX1 stringdata_ff_reg_0__4_ ( .D(n5370), .CK(clk), .SN(rst_n), .QN(
        stringdata_ff[110]) );
  DFFSX1 stringdata_ff_reg_0__3_ ( .D(n5369), .CK(clk), .SN(rst_n), .QN(
        stringdata_ff[109]) );
  DFFSX1 stringdata_ff_reg_0__2_ ( .D(n5368), .CK(clk), .SN(rst_n), .QN(
        stringdata_ff[108]) );
  DFFSX1 stringdata_ff_reg_0__1_ ( .D(n5367), .CK(clk), .SN(rst_n), .QN(
        stringdata_ff[107]) );
  DFFSX1 stringdata_ff_reg_0__0_ ( .D(n5366), .CK(clk), .SN(rst_n), .QN(
        stringdata_ff[106]) );
  DFFSX1 stringdata_ff_reg_6__5_ ( .D(n5365), .CK(clk), .SN(rst_n), .Q(n5729)
         );
  DFFSX1 stringdata_ff_reg_21__5_ ( .D(n5364), .CK(clk), .SN(rst_n), .Q(n5716)
         );
  DFFSX1 stringdata_ff_reg_22__4_ ( .D(n5363), .CK(clk), .SN(rst_n), .Q(n5714)
         );
  DFFSX1 stringdata_ff_reg_22__2_ ( .D(n5362), .CK(clk), .SN(rst_n), .Q(n5715)
         );
  DFFSX1 stringdata_ff_reg_20__6_ ( .D(n5361), .CK(clk), .SN(rst_n), .Q(n5717)
         );
  DFFSX1 stringdata_ff_reg_19__1_ ( .D(n5360), .CK(clk), .SN(rst_n), .Q(n5719)
         );
  DFFSX1 stringdata_ff_reg_19__0_ ( .D(n5359), .CK(clk), .SN(rst_n), .Q(n5718)
         );
  DFFSX1 stringdata_ff_reg_17__1_ ( .D(n5358), .CK(clk), .SN(rst_n), .Q(n5720)
         );
  DFFSX1 stringdata_ff_reg_12__5_ ( .D(n5357), .CK(clk), .SN(rst_n), .Q(n5726)
         );
  DFFSX1 stringdata_ff_reg_15__4_ ( .D(n5356), .CK(clk), .SN(rst_n), .Q(n5721)
         );
  DFFSX1 stringdata_ff_reg_15__2_ ( .D(n5355), .CK(clk), .SN(rst_n), .Q(n5722)
         );
  DFFSX1 stringdata_ff_reg_13__4_ ( .D(n5354), .CK(clk), .SN(rst_n), .Q(n5723)
         );
  DFFSX1 stringdata_ff_reg_13__3_ ( .D(n5353), .CK(clk), .SN(rst_n), .Q(n5724)
         );
  DFFSX1 stringdata_ff_reg_13__1_ ( .D(n5352), .CK(clk), .SN(rst_n), .Q(n5725)
         );
  DFFSX1 stringdata_ff_reg_11__4_ ( .D(n5351), .CK(clk), .SN(rst_n), .Q(n5727)
         );
  DFFSX1 stringdata_ff_reg_9__1_ ( .D(n5350), .CK(clk), .SN(rst_n), .Q(n5728)
         );
  DFFSX1 stringdata_ff_reg_29__7_ ( .D(n5349), .CK(clk), .SN(rst_n), .Q(n5709)
         );
  DFFSX1 stringdata_ff_reg_29__4_ ( .D(n5348), .CK(clk), .SN(rst_n), .Q(n5710)
         );
  DFFSX1 stringdata_ff_reg_29__0_ ( .D(n5347), .CK(clk), .SN(rst_n), .Q(n5708)
         );
  DFFSX1 stringdata_ff_reg_28__6_ ( .D(n5346), .CK(clk), .SN(rst_n), .Q(n5711)
         );
  DFFSX1 stringdata_ff_reg_27__7_ ( .D(n5345), .CK(clk), .SN(rst_n), .Q(n5713)
         );
  DFFSX1 stringdata_ff_reg_27__0_ ( .D(n5344), .CK(clk), .SN(rst_n), .Q(n5712)
         );
  DFFSX1 stringdata_ff_reg_31__5_ ( .D(n5343), .CK(clk), .SN(rst_n), .Q(n5706)
         );
  DFFSX1 stringdata_ff_reg_31__4_ ( .D(n5342), .CK(clk), .SN(rst_n), .Q(n5707)
         );
  DFFSX1 front_cnt_reg_2_ ( .D(n5341), .CK(clk), .SN(rst_n), .QN(front_cnt[2])
         );
  DFFSX1 front_cnt_reg_0_ ( .D(n5340), .CK(clk), .SN(rst_n), .QN(front_cnt[0])
         );
  DFFSX1 front_cnt_reg_4_ ( .D(n5339), .CK(clk), .SN(rst_n), .QN(front_cnt[4])
         );
  DFFSX1 front_cnt_reg_5_ ( .D(n2952), .CK(clk), .SN(rst_n), .QN(front_cnt[5])
         );
  DFFRX1 pat_cnt_reg_0_ ( .D(n2658), .CK(clk), .RN(rst_n), .Q(pat_cnt[0]), 
        .QN(DP_OP_542J1_123_7011_n30) );
  DFFRX2 cal_cnt_reg_0_ ( .D(n2590), .CK(clk), .RN(rst_n), .Q(cal_cnt[0]), 
        .QN(n5562) );
  DFFRX1 cal_cnt_reg_4_ ( .D(n2582), .CK(clk), .RN(rst_n), .Q(cal_cnt[4]), 
        .QN(n5420) );
  DFFRX1 star_loc_reg_2_ ( .D(n2660), .CK(clk), .RN(rst_n), .Q(N1802), .QN(
        n5563) );
  OAI22XL U2960 ( .A0(n5073), .A1(n5335), .B0(n5564), .B1(n5334), .Y(n2580) );
  OR2X1 U2961 ( .A(n5039), .B(n5571), .Y(n5040) );
  NAND4BBXL U2962 ( .AN(n3174), .BN(n3173), .C(n3203), .D(n3187), .Y(n3197) );
  OR2X1 U2963 ( .A(n3560), .B(n3559), .Y(n3663) );
  OR2X1 U2964 ( .A(n5104), .B(n5419), .Y(n5112) );
  OR2X1 U2965 ( .A(n4687), .B(n4249), .Y(n3953) );
  CLKBUFX3 U2966 ( .A(n3825), .Y(n2945) );
  CLKINVX1 U2967 ( .A(n4696), .Y(n2948) );
  BUFX2 U2968 ( .A(n3728), .Y(n2944) );
  OR2X1 U2969 ( .A(n3963), .B(cal_cnt[0]), .Y(n4152) );
  OR2X1 U2970 ( .A(n3965), .B(cal_cnt[0]), .Y(n4151) );
  OR2X1 U2971 ( .A(n3964), .B(n5562), .Y(n4147) );
  OR2X1 U2972 ( .A(n3964), .B(cal_cnt[0]), .Y(n4412) );
  INVX1 U2973 ( .A(n3243), .Y(n3471) );
  AOI2BB2X1 U2974 ( .B0(stringdata_ff[89]), .B1(n4823), .A0N(n5567), .A1N(
        n2946), .Y(n4698) );
  NOR4XL U2975 ( .A(n4376), .B(n4375), .C(n4374), .D(n4373), .Y(n4377) );
  NOR4XL U2976 ( .A(n3816), .B(n3815), .C(n3814), .D(n3813), .Y(n3822) );
  NOR4XL U2977 ( .A(n3774), .B(n3773), .C(n3772), .D(n3771), .Y(n3785) );
  NOR2X1 U2978 ( .A(n5696), .B(N1594), .Y(n4236) );
  NOR4XL U2979 ( .A(n3643), .B(n3642), .C(n3641), .D(n3640), .Y(n3644) );
  NAND2XL U2980 ( .A(cal_cnt[2]), .B(cal_cnt[1]), .Y(n3963) );
  NOR4XL U2981 ( .A(n4617), .B(n4616), .C(n4615), .D(n4614), .Y(n4661) );
  OAI21XL U2982 ( .A0(n4425), .A1(n4424), .B0(n4423), .Y(n4447) );
  CLKINVX2 U2983 ( .A(n4828), .Y(n2947) );
  NAND2XL U2984 ( .A(n4943), .B(n5061), .Y(n5139) );
  NAND3XL U2985 ( .A(n4973), .B(n5701), .C(n5561), .Y(n5236) );
  NAND2XL U2986 ( .A(string_cnt[4]), .B(n4957), .Y(n5180) );
  AOI211XL U2987 ( .A0(n5333), .A1(front_cnt[4]), .B0(n5332), .C0(n5331), .Y(
        n5336) );
  NOR3XL U2988 ( .A(curr_state[0]), .B(curr_state[1]), .C(n5568), .Y(n5303) );
  OAI31XL U2989 ( .A0(n3890), .A1(n3889), .A2(n3888), .B0(n3887), .Y(n3891) );
  NAND2XL U2990 ( .A(n3647), .B(n3644), .Y(n3645) );
  NAND4XL U2991 ( .A(n4717), .B(n4716), .C(n4715), .D(n4714), .Y(n4917) );
  NAND4BBXL U2992 ( .AN(n4907), .BN(n4906), .C(n4936), .D(n4912), .Y(n4930) );
  AOI2BB2XL U2993 ( .B0(pattern_ff[39]), .B1(n4682), .A0N(n5525), .A1N(n4241), 
        .Y(n3465) );
  NAND2BXL U2994 ( .AN(n4945), .B(n5563), .Y(n3438) );
  INVX2 U2995 ( .A(n4848), .Y(n4829) );
  BUFX4 U2996 ( .A(n3300), .Y(n2943) );
  NAND2X1 U2997 ( .A(n4957), .B(n5701), .Y(n5215) );
  NAND2X2 U2998 ( .A(n3240), .B(n3980), .Y(n3226) );
  NOR2XL U2999 ( .A(n4252), .B(n3681), .Y(n3435) );
  NAND3X1 U3000 ( .A(string_cnt[4]), .B(n4973), .C(n5561), .Y(n5197) );
  INVX2 U3001 ( .A(n4366), .Y(n2946) );
  INVX2 U3002 ( .A(n4333), .Y(n2949) );
  NAND4BX1 U3003 ( .AN(n5156), .B(curr_state[1]), .C(ispattern_ff), .D(n5259), 
        .Y(n5309) );
  INVX1 U3004 ( .A(isstring), .Y(n5160) );
  INVX1 U3005 ( .A(ispattern), .Y(n5259) );
  ADDHX1 U3006 ( .A(N1802), .B(n3905), .CO(n3909), .S(n5028) );
  NOR2X1 U3007 ( .A(n3965), .B(cal_cnt[3]), .Y(n3245) );
  NAND2X4 U3008 ( .A(n5571), .B(n5315), .Y(n4149) );
  NAND2X2 U3009 ( .A(n3488), .B(n3243), .Y(n4860) );
  INVX3 U3010 ( .A(n4738), .Y(n4865) );
  BUFX4 U3011 ( .A(n3770), .Y(n2950) );
  NOR2X1 U3012 ( .A(n3610), .B(n3225), .Y(n4540) );
  INVXL U3013 ( .A(n4236), .Y(n4249) );
  INVXL U3014 ( .A(n4242), .Y(n4259) );
  NOR2XL U3015 ( .A(n4692), .B(n4228), .Y(n4242) );
  BUFX2 U3016 ( .A(n3234), .Y(n4874) );
  NAND3XL U3017 ( .A(cal_cnt[4]), .B(n5564), .C(n5473), .Y(n4159) );
  NAND2XL U3018 ( .A(cal_cnt[0]), .B(cal_cnt[4]), .Y(n3242) );
  NOR2XL U3019 ( .A(n4622), .B(n4408), .Y(n4419) );
  NOR2XL U3020 ( .A(string_cnt_max[5]), .B(n5564), .Y(n4901) );
  NAND2XL U3021 ( .A(string_cnt_max[5]), .B(n5564), .Y(n4905) );
  AOI211XL U3022 ( .A0(n4204), .A1(pattern_ff[32]), .B0(n4203), .C0(n4202), 
        .Y(n4449) );
  OAI211XL U3023 ( .A0(n5563), .A1(n3953), .B0(n3952), .C0(n3951), .Y(n4194)
         );
  NAND2XL U3024 ( .A(n3980), .B(n5564), .Y(n4141) );
  AND2X1 U3025 ( .A(n3244), .B(n3483), .Y(n4333) );
  NOR2XL U3026 ( .A(n4149), .B(n4622), .Y(n4738) );
  NAND2XL U3027 ( .A(n5476), .B(cal_cnt[2]), .Y(n3964) );
  CLKINVX1 U3028 ( .A(n3148), .Y(n3225) );
  INVXL U3029 ( .A(n4407), .Y(n4408) );
  INVXL U3030 ( .A(n5003), .Y(n4623) );
  NOR2XL U3031 ( .A(n3628), .B(n3241), .Y(n4578) );
  NOR2XL U3032 ( .A(n3232), .B(n3610), .Y(n4466) );
  NOR4XL U3033 ( .A(n4470), .B(n4469), .C(n4468), .D(n4467), .Y(n4481) );
  NOR4XL U3034 ( .A(n4488), .B(n4487), .C(n4486), .D(n4485), .Y(n4499) );
  NOR4XL U3035 ( .A(n3743), .B(n3742), .C(n3741), .D(n3740), .Y(n3744) );
  NOR4XL U3036 ( .A(n3700), .B(n3699), .C(n3698), .D(n3697), .Y(n3706) );
  NOR4XL U3037 ( .A(n3719), .B(n3718), .C(n3717), .D(n3716), .Y(n3725) );
  INVXL U3038 ( .A(n3242), .Y(n3488) );
  NOR2XL U3039 ( .A(n5314), .B(n4889), .Y(n4904) );
  NOR4XL U3040 ( .A(n4808), .B(n4807), .C(n4806), .D(n4805), .Y(n4820) );
  NOR4XL U3041 ( .A(n4804), .B(n4803), .C(n4802), .D(n4801), .Y(n4821) );
  NOR4XL U3042 ( .A(n4817), .B(n4816), .C(n4815), .D(n4814), .Y(n4818) );
  NAND4XL U3043 ( .A(n4800), .B(n4799), .C(n4798), .D(n4797), .Y(n4913) );
  AOI211XL U3044 ( .A0(stringdata_ff[71]), .A1(n4784), .B0(n4783), .C0(n4782), 
        .Y(n4800) );
  NOR4XL U3045 ( .A(n4788), .B(n4787), .C(n4786), .D(n4785), .Y(n4799) );
  NOR4XL U3046 ( .A(n4796), .B(n4795), .C(n4794), .D(n4793), .Y(n4797) );
  AOI211XL U3047 ( .A0(stringdata_ff[20]), .A1(n4855), .B0(n4854), .C0(n4853), 
        .Y(n4884) );
  NAND4XL U3048 ( .A(n4846), .B(n4845), .C(n4844), .D(n4843), .Y(n4921) );
  NOR4XL U3049 ( .A(n4837), .B(n4836), .C(n4835), .D(n4834), .Y(n4844) );
  NOR4XL U3050 ( .A(n4833), .B(n4832), .C(n4831), .D(n4830), .Y(n4845) );
  AOI211XL U3051 ( .A0(stringdata_ff[43]), .A1(n4828), .B0(n4827), .C0(n4826), 
        .Y(n4846) );
  NOR4XL U3052 ( .A(n4755), .B(n4754), .C(n4753), .D(n4752), .Y(n4756) );
  AOI211XL U3053 ( .A0(stringdata_ff[38]), .A1(n4743), .B0(n4742), .C0(n4741), 
        .Y(n4759) );
  NOR4XL U3054 ( .A(n4751), .B(n4750), .C(n4749), .D(n4748), .Y(n4757) );
  NOR4XL U3055 ( .A(n4763), .B(n4762), .C(n4761), .D(n4760), .Y(n4779) );
  NOR4XL U3056 ( .A(n4771), .B(n4770), .C(n4769), .D(n4768), .Y(n4777) );
  NOR4XL U3057 ( .A(n4713), .B(n4712), .C(n4711), .D(n4710), .Y(n4714) );
  NOR4XL U3058 ( .A(n4705), .B(n4704), .C(n4703), .D(n4702), .Y(n4716) );
  NOR4XL U3059 ( .A(n4725), .B(n4724), .C(n4723), .D(n4722), .Y(n4736) );
  NOR4XL U3060 ( .A(n4733), .B(n4732), .C(n4731), .D(n4730), .Y(n4734) );
  NOR4XL U3061 ( .A(n4729), .B(n4728), .C(n4727), .D(n4726), .Y(n4735) );
  AND2X1 U3062 ( .A(n4457), .B(n5062), .Y(n4458) );
  AOI22XL U3063 ( .A0(pattern_ff[14]), .A1(n4459), .B0(pattern_ff[6]), .B1(
        n4458), .Y(n4646) );
  AOI22XL U3064 ( .A0(pattern_ff[12]), .A1(n4459), .B0(pattern_ff[4]), .B1(
        n4458), .Y(n4634) );
  NAND2XL U3065 ( .A(n5062), .B(n3680), .Y(n3683) );
  NAND2XL U3066 ( .A(cal_cnt[4]), .B(n3850), .Y(n4889) );
  INVXL U3067 ( .A(n3898), .Y(n3849) );
  NAND2XL U3068 ( .A(n5062), .B(n3212), .Y(n3214) );
  NOR4XL U3069 ( .A(n3354), .B(n3353), .C(n3352), .D(n3351), .Y(n3365) );
  NOR4XL U3070 ( .A(n3358), .B(n3357), .C(n3356), .D(n3355), .Y(n3364) );
  NOR4XL U3071 ( .A(n3362), .B(n3361), .C(n3360), .D(n3359), .Y(n3363) );
  NOR4XL U3072 ( .A(n3372), .B(n3371), .C(n3370), .D(n3369), .Y(n3383) );
  NOR4XL U3073 ( .A(n3376), .B(n3375), .C(n3374), .D(n3373), .Y(n3382) );
  NAND4XL U3074 ( .A(n3255), .B(n3254), .C(n3253), .D(n3252), .Y(n3409) );
  NOR4XL U3075 ( .A(n3238), .B(n3237), .C(n3236), .D(n3235), .Y(n3253) );
  NOR4XL U3076 ( .A(n3251), .B(n3250), .C(n3249), .D(n3248), .Y(n3252) );
  AOI211XL U3077 ( .A0(stringdata_ff[30]), .A1(n4312), .B0(n3222), .C0(n3221), 
        .Y(n3255) );
  AOI211XL U3078 ( .A0(stringdata_ff[25]), .A1(n3295), .B0(n3294), .C0(n3293), 
        .Y(n3312) );
  NOR4XL U3079 ( .A(n3299), .B(n3298), .C(n3297), .D(n3296), .Y(n3311) );
  NOR4XL U3080 ( .A(n3304), .B(n3303), .C(n3302), .D(n3301), .Y(n3310) );
  NOR4XL U3081 ( .A(n3318), .B(n3317), .C(n3316), .D(n3315), .Y(n3329) );
  NOR4XL U3082 ( .A(n3326), .B(n3325), .C(n3324), .D(n3323), .Y(n3327) );
  NOR4XL U3083 ( .A(n3340), .B(n3339), .C(n3338), .D(n3337), .Y(n3346) );
  NOR4XL U3084 ( .A(n3344), .B(n3343), .C(n3342), .D(n3341), .Y(n3345) );
  NOR4XL U3085 ( .A(n3288), .B(n3287), .C(n3286), .D(n3285), .Y(n3289) );
  NOR4XL U3086 ( .A(n3280), .B(n3279), .C(n3278), .D(n3277), .Y(n3291) );
  AOI211XL U3087 ( .A0(stringdata_ff[46]), .A1(n4366), .B0(n3276), .C0(n3275), 
        .Y(n3292) );
  NOR4XL U3088 ( .A(n3261), .B(n3260), .C(n3259), .D(n3258), .Y(n3272) );
  NOR4XL U3089 ( .A(n3265), .B(n3264), .C(n3263), .D(n3262), .Y(n3271) );
  INVXL U3090 ( .A(n3274), .Y(n3419) );
  AOI211XL U3091 ( .A0(pattern_ff[40]), .A1(n3468), .B0(n2991), .C0(n2990), 
        .Y(n2993) );
  AOI211XL U3092 ( .A0(n4252), .A1(pattern_ff[44]), .B0(n2976), .C0(n2975), 
        .Y(n2979) );
  AOI211XL U3093 ( .A0(n4252), .A1(pattern_ff[43]), .B0(n2967), .C0(n2966), 
        .Y(n2968) );
  AOI211XL U3094 ( .A0(n4252), .A1(pattern_ff[41]), .B0(n2971), .C0(n2970), 
        .Y(n2972) );
  AOI211XL U3095 ( .A0(pattern_ff[8]), .A1(n2973), .B0(n2957), .C0(n2956), .Y(
        n2964) );
  NOR2XL U3096 ( .A(n2998), .B(n3173), .Y(n3183) );
  NOR2XL U3097 ( .A(n2998), .B(n3199), .Y(n3179) );
  NOR2XL U3098 ( .A(n2998), .B(n3174), .Y(n3175) );
  NOR4XL U3099 ( .A(n4910), .B(n4908), .C(n4914), .D(n4922), .Y(n4936) );
  OAI2BB1XL U3100 ( .A0N(n4449), .A1N(n4422), .B0(n4424), .Y(n4423) );
  AOI22XL U3101 ( .A0(n4441), .A1(n4440), .B0(n4439), .B1(n4438), .Y(n4442) );
  AOI22XL U3102 ( .A0(n4437), .A1(n4436), .B0(n4435), .B1(n4434), .Y(n4443) );
  NOR2XL U3103 ( .A(n4463), .B(n4651), .Y(n4665) );
  NOR2XL U3104 ( .A(n4463), .B(n4652), .Y(n4638) );
  NOR2XL U3105 ( .A(n4463), .B(n4653), .Y(n4640) );
  AOI211XL U3106 ( .A0(pattern_ff[13]), .A1(n4682), .B0(n4463), .C0(n4461), 
        .Y(n4656) );
  INVXL U3107 ( .A(n4460), .Y(n4461) );
  NAND3XL U3108 ( .A(n4634), .B(n4644), .C(n4646), .Y(n4664) );
  NOR2XL U3109 ( .A(n4172), .B(n4176), .Y(n4173) );
  NOR2XL U3110 ( .A(n4194), .B(n4167), .Y(n3962) );
  NOR4XL U3111 ( .A(n3457), .B(n3441), .C(n3440), .D(n3439), .Y(n3671) );
  NOR2XL U3112 ( .A(n3689), .B(n3878), .Y(n3869) );
  NOR2XL U3113 ( .A(n3689), .B(n3877), .Y(n3859) );
  AOI211XL U3114 ( .A0(pattern_ff[28]), .A1(n4682), .B0(n3689), .C0(n3688), 
        .Y(n3880) );
  NAND3XL U3115 ( .A(n3404), .B(n3412), .C(n3408), .Y(n3420) );
  NOR2XL U3116 ( .A(n3217), .B(n3422), .Y(n3410) );
  AOI211XL U3117 ( .A0(n4682), .A1(pattern_ff[17]), .B0(n3217), .C0(n3211), 
        .Y(n3433) );
  NOR2XL U3118 ( .A(n3217), .B(n3424), .Y(n3432) );
  NOR2XL U3119 ( .A(n3217), .B(n3423), .Y(n3414) );
  OAI2BB1XL U3120 ( .A0N(n3401), .A1N(n3400), .B0(n3399), .Y(n3428) );
  ADDFXL U3121 ( .A(n5032), .B(n5081), .CI(n5031), .CO(n5036), .S(n5026) );
  OAI2BB1XL U3122 ( .A0N(n3206), .A1N(pat_cnt[2]), .B0(n3434), .Y(n2958) );
  NAND2XL U3123 ( .A(n5571), .B(cal_cnt[1]), .Y(n3965) );
  NAND2XL U3124 ( .A(n5563), .B(n4693), .Y(n3678) );
  NAND2XL U3125 ( .A(n5563), .B(n5696), .Y(n3209) );
  NOR4XL U3126 ( .A(n4864), .B(n4863), .C(n4862), .D(n4861), .Y(n4883) );
  NOR4XL U3127 ( .A(n4842), .B(n4841), .C(n4840), .D(n4839), .Y(n4843) );
  NOR4XL U3128 ( .A(n4767), .B(n4766), .C(n4765), .D(n4764), .Y(n4778) );
  NOR4XL U3129 ( .A(n4721), .B(n4720), .C(n4719), .D(n4718), .Y(n4737) );
  NAND2XL U3130 ( .A(n5062), .B(n4680), .Y(n4677) );
  NOR4XL U3131 ( .A(n4372), .B(n4371), .C(n4370), .D(n4369), .Y(n4378) );
  AOI211XL U3132 ( .A0(stringdata_ff[77]), .A1(n4823), .B0(n4314), .C0(n4313), 
        .Y(n4325) );
  NOR4XL U3133 ( .A(n4318), .B(n4317), .C(n4316), .D(n4315), .Y(n4324) );
  NOR4XL U3134 ( .A(n4337), .B(n4336), .C(n4335), .D(n4334), .Y(n4343) );
  AOI211XL U3135 ( .A0(stringdata_ff[52]), .A1(n4333), .B0(n4332), .C0(n4331), 
        .Y(n4344) );
  NOR4XL U3136 ( .A(n4287), .B(n4286), .C(n4285), .D(n4284), .Y(n4288) );
  NOR4XL U3137 ( .A(n4283), .B(n4282), .C(n4281), .D(n4280), .Y(n4289) );
  AOI211XL U3138 ( .A0(stringdata_ff[32]), .A1(n4279), .B0(n4278), .C0(n4277), 
        .Y(n4290) );
  AOI211XL U3139 ( .A0(stringdata_ff[9]), .A1(n4578), .B0(n4385), .C0(n4384), 
        .Y(n4396) );
  AOI211XL U3140 ( .A0(stringdata_ff[60]), .A1(n4784), .B0(n4350), .C0(n4349), 
        .Y(n4361) );
  AOI211XL U3141 ( .A0(stringdata_ff[31]), .A1(n4743), .B0(n4296), .C0(n4295), 
        .Y(n4307) );
  NOR4XL U3142 ( .A(n4300), .B(n4299), .C(n4298), .D(n4297), .Y(n4306) );
  NOR4XL U3143 ( .A(n4304), .B(n4303), .C(n4302), .D(n4301), .Y(n4305) );
  NOR4XL U3144 ( .A(n4265), .B(n4264), .C(n4263), .D(n4262), .Y(n4271) );
  NOR4XL U3145 ( .A(n4269), .B(n4268), .C(n4267), .D(n4266), .Y(n4270) );
  AOI31XL U3146 ( .A0(N1675), .A1(N1594), .A2(pattern_ff[7]), .B0(n4223), .Y(
        n4675) );
  INVXL U3147 ( .A(n4211), .Y(n4674) );
  INVXL U3148 ( .A(n4450), .Y(n4669) );
  NOR4XL U3149 ( .A(n4525), .B(n4524), .C(n4523), .D(n4522), .Y(n4536) );
  NOR4XL U3150 ( .A(n4548), .B(n4547), .C(n4546), .D(n4545), .Y(n4554) );
  NOR4XL U3151 ( .A(n4563), .B(n4562), .C(n4561), .D(n4560), .Y(n4574) );
  NOR4XL U3152 ( .A(n4605), .B(n4604), .C(n4603), .D(n4602), .Y(n4611) );
  NOR4XL U3153 ( .A(n4601), .B(n4600), .C(n4599), .D(n4598), .Y(n4612) );
  NOR4XL U3154 ( .A(n4007), .B(n4006), .C(n4005), .D(n4004), .Y(n4008) );
  NOR4XL U3155 ( .A(n3984), .B(n3983), .C(n3982), .D(n3981), .Y(n3985) );
  NOR4XL U3156 ( .A(n4156), .B(n4155), .C(n4154), .D(n4153), .Y(n4158) );
  NOR4XL U3157 ( .A(n4102), .B(n4101), .C(n4100), .D(n4099), .Y(n4103) );
  NOR4XL U3158 ( .A(n4079), .B(n4078), .C(n4077), .D(n4076), .Y(n4080) );
  NOR4XL U3159 ( .A(n4053), .B(n4052), .C(n4051), .D(n4050), .Y(n4054) );
  NOR4XL U3160 ( .A(n4125), .B(n4124), .C(n4123), .D(n4122), .Y(n4126) );
  NAND2XL U3161 ( .A(n3974), .B(n5564), .Y(n4165) );
  NOR4XL U3162 ( .A(n4030), .B(n4029), .C(n4028), .D(n4027), .Y(n4031) );
  AOI211XL U3163 ( .A0(n5033), .A1(n5577), .B0(n3911), .C0(n3910), .Y(n3955)
         );
  NOR2XL U3164 ( .A(n4943), .B(n5074), .Y(n3931) );
  NAND2XL U3165 ( .A(n3955), .B(n5062), .Y(n3929) );
  INVXL U3166 ( .A(n4693), .Y(n4235) );
  AOI211XL U3167 ( .A0(n3622), .A1(n3621), .B0(n3620), .C0(n3619), .Y(n3634)
         );
  AOI211XL U3168 ( .A0(stringdata_ff[69]), .A1(n4696), .B0(n3631), .C0(n3630), 
        .Y(n3632) );
  NOR4XL U3169 ( .A(n3627), .B(n3626), .C(n3625), .D(n3624), .Y(n3633) );
  NOR4XL U3170 ( .A(n3590), .B(n3589), .C(n3588), .D(n3587), .Y(n3591) );
  AOI211XL U3171 ( .A0(stringdata_ff[76]), .A1(n4784), .B0(n3607), .C0(n3606), 
        .Y(n3608) );
  AND2X1 U3172 ( .A(n5010), .B(n3244), .Y(n4849) );
  NOR4XL U3173 ( .A(n3511), .B(n3510), .C(n3509), .D(n3508), .Y(n3521) );
  NOR4XL U3174 ( .A(n3568), .B(n3567), .C(n3566), .D(n3565), .Y(n3574) );
  NOR4XL U3175 ( .A(n3549), .B(n3548), .C(n3547), .D(n3546), .Y(n3556) );
  AOI211XL U3176 ( .A0(stringdata_ff[16]), .A1(n4738), .B0(n3554), .C0(n3553), 
        .Y(n3555) );
  NOR4XL U3177 ( .A(n3531), .B(n3530), .C(n3529), .D(n3528), .Y(n3537) );
  NOR4XL U3178 ( .A(n3535), .B(n3534), .C(n3533), .D(n3532), .Y(n3536) );
  NOR4XL U3179 ( .A(n3493), .B(n3492), .C(n3491), .D(n3490), .Y(n3498) );
  NOR2XL U3180 ( .A(n4693), .B(N1802), .Y(n3924) );
  INVXL U3181 ( .A(n4248), .Y(n4238) );
  NAND2XL U3182 ( .A(n5062), .B(n3444), .Y(n3455) );
  INVXL U3183 ( .A(n4250), .Y(n4237) );
  NOR4XL U3184 ( .A(n3840), .B(n3839), .C(n3838), .D(n3837), .Y(n3841) );
  NAND4XL U3185 ( .A(n3805), .B(n3804), .C(n3803), .D(n3802), .Y(n3865) );
  NOR4XL U3186 ( .A(n3793), .B(n3792), .C(n3791), .D(n3790), .Y(n3804) );
  NOR4XL U3187 ( .A(n3797), .B(n3796), .C(n3795), .D(n3794), .Y(n3803) );
  NOR3XL U3188 ( .A(n5420), .B(n4149), .C(cal_cnt[3]), .Y(n4312) );
  NOR4XL U3189 ( .A(n3308), .B(n3307), .C(n3306), .D(n3305), .Y(n3309) );
  NOR4XL U3190 ( .A(n3322), .B(n3321), .C(n3320), .D(n3319), .Y(n3328) );
  NOR4XL U3191 ( .A(n3336), .B(n3335), .C(n3334), .D(n3333), .Y(n3347) );
  NOR4XL U3192 ( .A(n3284), .B(n3283), .C(n3282), .D(n3281), .Y(n3290) );
  NOR4XL U3193 ( .A(n3269), .B(n3268), .C(n3267), .D(n3266), .Y(n3270) );
  NAND2XL U3194 ( .A(n5062), .B(pattern_ff[3]), .Y(n4687) );
  NOR2XL U3195 ( .A(string_cnt_max[2]), .B(n3166), .Y(n3393) );
  NAND2XL U3196 ( .A(pattern_ff[2]), .B(n5062), .Y(n4694) );
  NAND2XL U3197 ( .A(N1802), .B(n4237), .Y(n3956) );
  INVXL U3198 ( .A(n4251), .Y(n4229) );
  INVXL U3199 ( .A(n3924), .Y(n4247) );
  OAI2BB1XL U3200 ( .A0N(n4685), .A1N(N1802), .B0(n4253), .Y(n4254) );
  OAI211XL U3201 ( .A0(n4666), .A1(n4668), .B0(n4669), .C0(n4667), .Y(n4255)
         );
  NAND4XL U3202 ( .A(n4594), .B(n4593), .C(n4592), .D(n4591), .Y(n4635) );
  NOR4XL U3203 ( .A(n4582), .B(n4581), .C(n4580), .D(n4579), .Y(n4593) );
  NOR4XL U3204 ( .A(n4590), .B(n4589), .C(n4588), .D(n4587), .Y(n4591) );
  NAND4XL U3205 ( .A(n4537), .B(n4536), .C(n4535), .D(n4534), .Y(n4645) );
  AOI211XL U3206 ( .A0(n4521), .A1(stringdata_ff[7]), .B0(n4520), .C0(n4519), 
        .Y(n4537) );
  NOR4XL U3207 ( .A(n4529), .B(n4528), .C(n4527), .D(n4526), .Y(n4535) );
  NOR4XL U3208 ( .A(n4533), .B(n4532), .C(n4531), .D(n4530), .Y(n4534) );
  NAND4XL U3209 ( .A(n4518), .B(n4517), .C(n4516), .D(n4515), .Y(n4642) );
  NOR4XL U3210 ( .A(n4506), .B(n4505), .C(n4504), .D(n4503), .Y(n4517) );
  NOR4XL U3211 ( .A(n4510), .B(n4509), .C(n4508), .D(n4507), .Y(n4516) );
  NAND4XL U3212 ( .A(n4556), .B(n4555), .C(n4554), .D(n4553), .Y(n4637) );
  AOI211XL U3213 ( .A0(n4540), .A1(stringdata_ff[52]), .B0(n4539), .C0(n4538), 
        .Y(n4556) );
  NOR4XL U3214 ( .A(n4544), .B(n4543), .C(n4542), .D(n4541), .Y(n4555) );
  NOR4XL U3215 ( .A(n4552), .B(n4551), .C(n4550), .D(n4549), .Y(n4553) );
  NAND4XL U3216 ( .A(n4575), .B(n4574), .C(n4573), .D(n4572), .Y(n4633) );
  AOI211XL U3217 ( .A0(n4559), .A1(stringdata_ff[44]), .B0(n4558), .C0(n4557), 
        .Y(n4575) );
  NOR4XL U3218 ( .A(n4571), .B(n4570), .C(n4569), .D(n4568), .Y(n4572) );
  NOR4XL U3219 ( .A(n4567), .B(n4566), .C(n4565), .D(n4564), .Y(n4573) );
  AOI211XL U3220 ( .A0(n4466), .A1(stringdata_ff[68]), .B0(n4465), .C0(n4464), 
        .Y(n4482) );
  NOR4XL U3221 ( .A(n4478), .B(n4477), .C(n4476), .D(n4475), .Y(n4479) );
  NOR4XL U3222 ( .A(n4474), .B(n4473), .C(n4472), .D(n4471), .Y(n4480) );
  NOR4XL U3223 ( .A(n4492), .B(n4491), .C(n4490), .D(n4489), .Y(n4498) );
  NOR4XL U3224 ( .A(n4496), .B(n4495), .C(n4494), .D(n4493), .Y(n4497) );
  NAND2XL U3225 ( .A(n5563), .B(n4236), .Y(n4248) );
  NOR2XL U3226 ( .A(n4250), .B(N1802), .Y(n4251) );
  NAND2XL U3227 ( .A(N1802), .B(n4220), .Y(n4228) );
  OAI2BB1XL U3228 ( .A0N(n3963), .A1N(cal_cnt[3]), .B0(n3471), .Y(n3474) );
  NAND2XL U3229 ( .A(string_cnt_max[4]), .B(n5420), .Y(n4628) );
  INVXL U3230 ( .A(n4220), .Y(n4689) );
  NAND4XL U3231 ( .A(n3786), .B(n3785), .C(n3784), .D(n3783), .Y(n3870) );
  NOR4XL U3232 ( .A(n3778), .B(n3777), .C(n3776), .D(n3775), .Y(n3784) );
  INVXL U3233 ( .A(n3889), .Y(n3861) );
  NAND4XL U3234 ( .A(n3844), .B(n3843), .C(n3842), .D(n3841), .Y(n3860) );
  NOR4XL U3235 ( .A(n3836), .B(n3835), .C(n3834), .D(n3833), .Y(n3842) );
  NOR4XL U3236 ( .A(n3832), .B(n3831), .C(n3830), .D(n3829), .Y(n3843) );
  NOR3XL U3237 ( .A(n3828), .B(n3827), .C(n3826), .Y(n3844) );
  NAND4XL U3238 ( .A(n3824), .B(n3823), .C(n3822), .D(n3821), .Y(n3867) );
  NOR4XL U3239 ( .A(n3820), .B(n3819), .C(n3818), .D(n3817), .Y(n3821) );
  NOR4XL U3240 ( .A(n3812), .B(n3811), .C(n3810), .D(n3809), .Y(n3823) );
  NAND4XL U3241 ( .A(n3766), .B(n3765), .C(n3764), .D(n3763), .Y(n3863) );
  NOR4XL U3242 ( .A(n3754), .B(n3753), .C(n3752), .D(n3751), .Y(n3765) );
  NOR4XL U3243 ( .A(n3762), .B(n3761), .C(n3760), .D(n3759), .Y(n3763) );
  NAND4XL U3244 ( .A(n3747), .B(n3746), .C(n3745), .D(n3744), .Y(n3862) );
  NOR4XL U3245 ( .A(n3739), .B(n3738), .C(n3737), .D(n3736), .Y(n3745) );
  NOR4XL U3246 ( .A(n3735), .B(n3734), .C(n3733), .D(n3732), .Y(n3746) );
  NOR4XL U3247 ( .A(n3704), .B(n3703), .C(n3702), .D(n3701), .Y(n3705) );
  NOR4XL U3248 ( .A(n3696), .B(n3695), .C(n3694), .D(n3693), .Y(n3707) );
  NOR4XL U3249 ( .A(n3723), .B(n3722), .C(n3721), .D(n3720), .Y(n3724) );
  NOR4XL U3250 ( .A(n3715), .B(n3714), .C(n3713), .D(n3712), .Y(n3726) );
  NAND2XL U3251 ( .A(n5062), .B(pattern_ff[1]), .Y(n4462) );
  NAND2XL U3252 ( .A(n3198), .B(n3195), .Y(n3196) );
  AOI211XL U3253 ( .A0(n4905), .A1(n3172), .B0(n4901), .C0(n3171), .Y(n3198)
         );
  NOR4XL U3254 ( .A(n3162), .B(n3161), .C(n3160), .D(n3159), .Y(n3201) );
  NOR4XL U3255 ( .A(n3177), .B(n3185), .C(n3181), .D(n3189), .Y(n3203) );
  NOR4XL U3256 ( .A(n3187), .B(n3175), .C(n3179), .D(n3183), .Y(n3202) );
  NOR4XL U3257 ( .A(n4912), .B(n4916), .C(n4918), .D(n4920), .Y(n4935) );
  NOR4XL U3258 ( .A(n4888), .B(n4887), .C(n4886), .D(n4885), .Y(n4934) );
  OAI31XL U3259 ( .A0(n4932), .A1(n4931), .A2(n4930), .B0(n4929), .Y(n4933) );
  NAND4XL U3260 ( .A(n4421), .B(n4440), .C(n4436), .D(n4438), .Y(n4448) );
  NAND4XL U3261 ( .A(n4445), .B(n4444), .C(n4443), .D(n4442), .Y(n4446) );
  OAI31XL U3262 ( .A0(n4665), .A1(n4664), .A2(n4663), .B0(n4662), .Y(n4938) );
  NAND2XL U3263 ( .A(n4660), .B(n4657), .Y(n4658) );
  NOR4XL U3264 ( .A(n4193), .B(n4192), .C(n4191), .D(n4190), .Y(n4195) );
  NOR3XL U3265 ( .A(n4189), .B(n4188), .C(n4187), .Y(n4196) );
  AOI211XL U3266 ( .A0(n4176), .A1(n4175), .B0(n4174), .C0(n4173), .Y(n4197)
         );
  NAND4XL U3267 ( .A(n3482), .B(n3654), .C(n3652), .D(n3656), .Y(n3670) );
  NOR4XL U3268 ( .A(n3667), .B(n3666), .C(n3665), .D(n3664), .Y(n3668) );
  OAI211XL U3269 ( .A0(n3886), .A1(n3885), .B0(n3884), .C0(n3883), .Y(n3887)
         );
  NAND2XL U3270 ( .A(n3885), .B(n3882), .Y(n3883) );
  OAI31XL U3271 ( .A0(n3433), .A1(n3432), .A2(n3431), .B0(n3430), .Y(n3893) );
  OAI211XL U3272 ( .A0(n3429), .A1(n3428), .B0(n3427), .C0(n3426), .Y(n3430)
         );
  NOR2XL U3273 ( .A(N1594), .B(n5730), .Y(n5024) );
  NOR2XL U3274 ( .A(n5571), .B(n3218), .Y(n3165) );
  INVXL U3275 ( .A(n3850), .Y(n4891) );
  INVXL U3276 ( .A(chardata[4]), .Y(n5249) );
  INVXL U3277 ( .A(chardata[2]), .Y(n5263) );
  NAND2XL U3278 ( .A(n5266), .B(n5261), .Y(n5262) );
  NAND2XL U3279 ( .A(n4682), .B(n4246), .Y(n4945) );
  NAND2XL U3280 ( .A(cal_cnt[1]), .B(cal_cnt[0]), .Y(n3218) );
  NOR3XL U3281 ( .A(chardata[0]), .B(chardata[7]), .C(chardata[6]), .Y(n5251)
         );
  INVXL U3282 ( .A(n5335), .Y(n5143) );
  INVXL U3283 ( .A(n5078), .Y(n5102) );
  INVXL U3284 ( .A(n5313), .Y(n5311) );
  INVXL U3285 ( .A(n3218), .Y(n5315) );
  NOR2XL U3286 ( .A(cal_cnt[1]), .B(cal_cnt[0]), .Y(n5314) );
  OAI21XL U3287 ( .A0(n5066), .A1(n5335), .B0(n5309), .Y(n5334) );
  NOR2XL U3288 ( .A(n5333), .B(n5304), .Y(n5066) );
  OA21XL U3289 ( .A0(n5704), .A1(n5303), .B0(n5328), .Y(n5305) );
  INVXL U3290 ( .A(n4701), .Y(n4856) );
  NOR4XL U3291 ( .A(n4609), .B(n4608), .C(n4607), .D(n4606), .Y(n4610) );
  AOI21XL U3292 ( .A0(n4667), .A1(n4220), .B0(n4666), .Y(n4452) );
  NOR2XL U3293 ( .A(cal_cnt[1]), .B(string_cnt_max[1]), .Y(n4411) );
  NOR4XL U3294 ( .A(n3801), .B(n3800), .C(n3799), .D(n3798), .Y(n3802) );
  BUFX2 U3295 ( .A(n3219), .Y(n4875) );
  NOR2XL U3296 ( .A(cal_cnt[5]), .B(n3247), .Y(n3147) );
  AOI22XL U3297 ( .A0(n2959), .A1(pat_cnt[2]), .B0(n2958), .B1(pat_cnt[3]), 
        .Y(n2963) );
  NOR4XL U3298 ( .A(n4813), .B(n4812), .C(n4811), .D(n4810), .Y(n4819) );
  NOR4XL U3299 ( .A(n4792), .B(n4791), .C(n4790), .D(n4789), .Y(n4798) );
  OAI211XL U3300 ( .A0(n4852), .A1(n5600), .B0(n4851), .C0(n4850), .Y(n4853)
         );
  NOR4XL U3301 ( .A(n4747), .B(n4746), .C(n4745), .D(n4744), .Y(n4758) );
  NOR2XL U3302 ( .A(n3599), .B(cal_cnt[0]), .Y(n4701) );
  NAND2XL U3303 ( .A(n4413), .B(n5570), .Y(n4896) );
  NOR2XL U3304 ( .A(n4413), .B(n5570), .Y(n4894) );
  CLKINVX1 U3305 ( .A(n4597), .Y(n4852) );
  BUFX2 U3306 ( .A(n3246), .Y(n4873) );
  CLKINVX1 U3307 ( .A(n4559), .Y(n4859) );
  CLKINVX1 U3308 ( .A(n4279), .Y(n4876) );
  CLKINVX1 U3309 ( .A(n4466), .Y(n4847) );
  CLKINVX1 U3310 ( .A(n4578), .Y(n4868) );
  CLKINVX1 U3311 ( .A(n4823), .Y(n4867) );
  NAND2XL U3312 ( .A(N1802), .B(n4235), .Y(n4456) );
  NOR2XL U3313 ( .A(n3628), .B(n3471), .Y(n4848) );
  NOR2XL U3314 ( .A(string_cnt_max[1]), .B(n5476), .Y(n4409) );
  NOR2XL U3315 ( .A(n4220), .B(n5563), .Y(n3681) );
  OAI211XL U3316 ( .A0(pat_cnt[2]), .A1(n3676), .B0(n3675), .C0(n4671), .Y(
        n3677) );
  OAI211XL U3317 ( .A0(n4669), .A1(n3208), .B0(n3207), .C0(n4671), .Y(n3210)
         );
  NAND2XL U3318 ( .A(n5699), .B(n2961), .Y(n3434) );
  INVXL U3319 ( .A(n3391), .Y(n3392) );
  OAI2BB1XL U3320 ( .A0N(n4688), .A1N(N1802), .B0(n4199), .Y(n4200) );
  NOR3XL U3321 ( .A(n4383), .B(n4382), .C(n4381), .Y(n4439) );
  NAND4XL U3322 ( .A(n4380), .B(n4379), .C(n4378), .D(n4377), .Y(n4381) );
  NOR3XL U3323 ( .A(n4329), .B(n4328), .C(n4327), .Y(n4441) );
  NAND4XL U3324 ( .A(n4326), .B(n4325), .C(n4324), .D(n4323), .Y(n4327) );
  NOR3XL U3325 ( .A(n4348), .B(n4347), .C(n4346), .Y(n4431) );
  NAND4XL U3326 ( .A(n4345), .B(n4344), .C(n4343), .D(n4342), .Y(n4346) );
  INVXL U3327 ( .A(n4449), .Y(n4430) );
  NOR3XL U3328 ( .A(n4294), .B(n4293), .C(n4292), .Y(n4433) );
  NAND4XL U3329 ( .A(n4291), .B(n4290), .C(n4289), .D(n4288), .Y(n4292) );
  NOR3XL U3330 ( .A(n4400), .B(n4399), .C(n4398), .Y(n4435) );
  NOR3XL U3331 ( .A(n4365), .B(n4364), .C(n4363), .Y(n4437) );
  NAND4XL U3332 ( .A(n4362), .B(n4361), .C(n4360), .D(n4359), .Y(n4363) );
  NOR3XL U3333 ( .A(n4311), .B(n4310), .C(n4309), .Y(n4427) );
  NAND4XL U3334 ( .A(n4308), .B(n4307), .C(n4306), .D(n4305), .Y(n4309) );
  NOR3XL U3335 ( .A(n4276), .B(n4275), .C(n4274), .Y(n4429) );
  AOI211XL U3336 ( .A0(n4238), .A1(pattern_ff[37]), .B0(n4208), .C0(n4207), 
        .Y(n4209) );
  AOI211XL U3337 ( .A0(n4252), .A1(pattern_ff[53]), .B0(n4225), .C0(n4224), 
        .Y(n4227) );
  AOI211XL U3338 ( .A0(n4251), .A1(pattern_ff[48]), .B0(n4213), .C0(n4212), 
        .Y(n4214) );
  NOR2XL U3339 ( .A(n4623), .B(n5473), .Y(n4627) );
  NOR4XL U3340 ( .A(n3994), .B(n3993), .C(n3992), .D(n3991), .Y(n4013) );
  NOR4XL U3341 ( .A(n3969), .B(n3968), .C(n3967), .D(n3966), .Y(n3990) );
  AOI211XL U3342 ( .A0(n4163), .A1(stringdata_ff[1]), .B0(n3988), .C0(n3987), 
        .Y(n3989) );
  NOR4XL U3343 ( .A(n4135), .B(n4134), .C(n4133), .D(n4132), .Y(n4166) );
  AOI211XL U3344 ( .A0(n4163), .A1(stringdata_ff[2]), .B0(n4162), .C0(n4161), 
        .Y(n4164) );
  NOR4XL U3345 ( .A(n4089), .B(n4088), .C(n4087), .D(n4086), .Y(n4108) );
  AOI211XL U3346 ( .A0(n4163), .A1(stringdata_ff[4]), .B0(n4106), .C0(n4105), 
        .Y(n4107) );
  AOI211XL U3347 ( .A0(n4163), .A1(stringdata_ff[8]), .B0(n4083), .C0(n4082), 
        .Y(n4084) );
  NOR4XL U3348 ( .A(n4040), .B(n4039), .C(n4038), .D(n4037), .Y(n4059) );
  AOI211XL U3349 ( .A0(n4163), .A1(stringdata_ff[3]), .B0(n4057), .C0(n4056), 
        .Y(n4058) );
  NOR4XL U3350 ( .A(n4112), .B(n4111), .C(n4110), .D(n4109), .Y(n4131) );
  AOI211XL U3351 ( .A0(n4163), .A1(stringdata_ff[5]), .B0(n4129), .C0(n4128), 
        .Y(n4130) );
  NOR4XL U3352 ( .A(n4017), .B(n4016), .C(n4015), .D(n4014), .Y(n4036) );
  AOI211XL U3353 ( .A0(n4163), .A1(stringdata_ff[7]), .B0(n4034), .C0(n4033), 
        .Y(n4035) );
  AOI211XL U3354 ( .A0(n5062), .A1(n3960), .B0(n3959), .C0(n3958), .Y(n3961)
         );
  AOI211XL U3355 ( .A0(n4238), .A1(pattern_ff[36]), .B0(n3921), .C0(n3920), 
        .Y(n3922) );
  AOI211XL U3356 ( .A0(n4238), .A1(pattern_ff[34]), .B0(n3928), .C0(n3927), 
        .Y(n3930) );
  AOI211XL U3357 ( .A0(n3924), .A1(pattern_ff[29]), .B0(n3902), .C0(n3901), 
        .Y(n3912) );
  AOI211XL U3358 ( .A0(n3924), .A1(pattern_ff[24]), .B0(n3915), .C0(n3914), 
        .Y(n3916) );
  AOI211XL U3359 ( .A0(n3639), .A1(n3638), .B0(n3637), .C0(n3636), .Y(n3655)
         );
  NAND4XL U3360 ( .A(n3635), .B(n3634), .C(n3633), .D(n3632), .Y(n3636) );
  NOR3XL U3361 ( .A(n3595), .B(n3594), .C(n3593), .Y(n3653) );
  NAND2XL U3362 ( .A(n3592), .B(n3591), .Y(n3593) );
  NOR4XL U3363 ( .A(n3615), .B(n3614), .C(n3613), .D(n3612), .Y(n3657) );
  OAI2BB1XL U3364 ( .A0N(n3597), .A1N(n3622), .B0(n3596), .Y(n3613) );
  NAND4XL U3365 ( .A(n3522), .B(n3521), .C(n3520), .D(n3519), .Y(n3659) );
  NOR4XL U3366 ( .A(n3515), .B(n3514), .C(n3513), .D(n3512), .Y(n3520) );
  AOI211XL U3367 ( .A0(stringdata_ff[90]), .A1(n4849), .B0(n3518), .C0(n3517), 
        .Y(n3519) );
  NOR4XL U3368 ( .A(n3578), .B(n3577), .C(n3576), .D(n3575), .Y(n3661) );
  NOR3XL U3369 ( .A(n3540), .B(n3539), .C(n3538), .Y(n3649) );
  NAND2XL U3370 ( .A(n3537), .B(n3536), .Y(n3538) );
  NOR4XL U3371 ( .A(n3503), .B(n3502), .C(n3501), .D(n3500), .Y(n3651) );
  AOI211XL U3372 ( .A0(pattern_ff[32]), .A1(n3468), .B0(n3467), .C0(n3466), 
        .Y(n3480) );
  NOR3XL U3373 ( .A(n3461), .B(n3460), .C(n3459), .Y(n3481) );
  INVXL U3374 ( .A(n3457), .Y(n3469) );
  AOI211XL U3375 ( .A0(pattern_ff[33]), .A1(n3468), .B0(n3464), .C0(n3463), 
        .Y(n3470) );
  AOI211XL U3376 ( .A0(n3924), .A1(pattern_ff[12]), .B0(n3450), .C0(n3449), 
        .Y(n3451) );
  AOI211XL U3377 ( .A0(n4238), .A1(pattern_ff[16]), .B0(n3447), .C0(n3446), 
        .Y(n3448) );
  NOR2XL U3378 ( .A(cal_cnt[4]), .B(n5473), .Y(n3980) );
  NOR2XL U3379 ( .A(n5473), .B(n5420), .Y(n3974) );
  AOI21XL U3380 ( .A0(string_cnt_max[5]), .A1(n5070), .B0(n3170), .Y(n3171) );
  OAI211XL U3381 ( .A0(n5541), .A1(n3939), .B0(n2997), .C0(n2996), .Y(n3173)
         );
  AOI211XL U3382 ( .A0(pattern_ff[39]), .A1(n3468), .B0(n2995), .C0(n2994), 
        .Y(n2997) );
  OAI211XL U3383 ( .A0(n5634), .A1(n4259), .B0(n2989), .C0(n2988), .Y(n3174)
         );
  AOI211XL U3384 ( .A0(pattern_ff[38]), .A1(n3468), .B0(n2987), .C0(n2986), 
        .Y(n2989) );
  INVXL U3385 ( .A(n3158), .Y(n3190) );
  OAI211XL U3386 ( .A0(n3157), .A1(n3628), .B0(n3156), .C0(n3155), .Y(n3158)
         );
  OAI211XL U3387 ( .A0(n3135), .A1(n3628), .B0(n3134), .C0(n3133), .Y(n3176)
         );
  INVXL U3388 ( .A(n3077), .Y(n3186) );
  NOR4XL U3389 ( .A(n3061), .B(n3060), .C(n3059), .D(n3058), .Y(n3076) );
  OAI211XL U3390 ( .A0(n3056), .A1(n3242), .B0(n3055), .C0(n3054), .Y(n3188)
         );
  OAI211XL U3391 ( .A0(n3116), .A1(n3628), .B0(n3115), .C0(n3114), .Y(n3117)
         );
  AOI211XL U3392 ( .A0(n3097), .A1(n3488), .B0(n3096), .C0(n3095), .Y(n3182)
         );
  NAND2XL U3393 ( .A(n4931), .B(n4928), .Y(n4929) );
  AOI211XL U3394 ( .A0(pattern_ff[31]), .A1(n4682), .B0(n4681), .C0(n4695), 
        .Y(n4912) );
  NOR2XL U3395 ( .A(n4695), .B(n4907), .Y(n4920) );
  NOR2XL U3396 ( .A(n4695), .B(n4906), .Y(n4918) );
  OAI2BB1XL U3397 ( .A0N(n4420), .A1N(n4419), .B0(n4418), .Y(n4424) );
  AOI22XL U3398 ( .A0(n4433), .A1(n4432), .B0(n4431), .B1(n4430), .Y(n4444) );
  AOI22XL U3399 ( .A0(n4429), .A1(n4428), .B0(n4427), .B1(n4426), .Y(n4445) );
  NOR4XL U3400 ( .A(n4432), .B(n4428), .C(n4426), .D(n4434), .Y(n4421) );
  OAI211XL U3401 ( .A0(n4245), .A1(n4692), .B0(n4244), .C0(n4243), .Y(n4436)
         );
  OAI211XL U3402 ( .A0(n5534), .A1(n4241), .B0(n4234), .C0(n4233), .Y(n4440)
         );
  OAI211XL U3403 ( .A0(n5604), .A1(n4259), .B0(n4258), .C0(n4257), .Y(n4438)
         );
  NOR4XL U3404 ( .A(n4654), .B(n4653), .C(n4652), .D(n4651), .Y(n4655) );
  NOR4XL U3405 ( .A(n4650), .B(n4649), .C(n4648), .D(n4647), .Y(n4659) );
  INVXL U3406 ( .A(n4167), .Y(n4191) );
  AOI211XL U3407 ( .A0(n4682), .A1(pattern_ff[50]), .B0(n3938), .C0(n3937), 
        .Y(n4193) );
  NOR2XL U3408 ( .A(n3936), .B(n4692), .Y(n3938) );
  AOI211XL U3409 ( .A0(n4242), .A1(pattern_ff[21]), .B0(n3946), .C0(n3945), 
        .Y(n4192) );
  OAI211XL U3410 ( .A0(n4241), .A1(n5540), .B0(n3944), .C0(n3943), .Y(n3945)
         );
  NAND4XL U3411 ( .A(n4183), .B(n4060), .C(n4185), .D(n4181), .Y(n4190) );
  NAND4XL U3412 ( .A(n3671), .B(n3482), .C(n3481), .D(n3480), .Y(n3646) );
  INVXL U3413 ( .A(n3470), .Y(n3648) );
  AOI211XL U3414 ( .A0(string_cnt_max[4]), .A1(n3477), .B0(n3476), .C0(n3475), 
        .Y(n3478) );
  NAND2XL U3415 ( .A(n3469), .B(n3480), .Y(n3656) );
  NAND2XL U3416 ( .A(n3469), .B(n3481), .Y(n3654) );
  NAND2XL U3417 ( .A(n3470), .B(n3469), .Y(n3652) );
  NOR4XL U3418 ( .A(n3650), .B(n3662), .C(n3658), .D(n3523), .Y(n3482) );
  NAND3XL U3419 ( .A(n3864), .B(n3871), .C(n3866), .Y(n3881) );
  AOI22XL U3420 ( .A0(n4630), .A1(n4889), .B0(n3857), .B1(n3856), .Y(n3885) );
  OAI211XL U3421 ( .A0(n5578), .A1(n3855), .B0(n3854), .C0(n3853), .Y(n3856)
         );
  NOR4XL U3422 ( .A(n3875), .B(n3874), .C(n3873), .D(n3872), .Y(n3884) );
  NOR4XL U3423 ( .A(n3848), .B(n3847), .C(n3846), .D(n3845), .Y(n3886) );
  NOR4XL U3424 ( .A(n3388), .B(n3387), .C(n3386), .D(n3385), .Y(n3429) );
  NOR4XL U3425 ( .A(n3424), .B(n3423), .C(n3422), .D(n3421), .Y(n3425) );
  NAND3XL U3426 ( .A(n5106), .B(n5111), .C(n5105), .Y(n5107) );
  AND2X1 U3427 ( .A(n3165), .B(n3980), .Y(n4828) );
  NAND2XL U3428 ( .A(n3165), .B(n3974), .Y(n3623) );
  NOR2XL U3429 ( .A(n5571), .B(n5473), .Y(n3850) );
  ADDFXL U3430 ( .A(n5046), .B(n5045), .CI(n5044), .CO(n5053), .S(n5047) );
  NOR2XL U3431 ( .A(n5730), .B(N1804), .Y(n4246) );
  AOI2BB1X1 U3432 ( .A0N(isstring), .A1N(n4990), .B0(string_cnt[5]), .Y(n4973)
         );
  NOR2X1 U3433 ( .A(n5003), .B(cal_cnt[3]), .Y(n5010) );
  INVXL U3434 ( .A(n3477), .Y(n3599) );
  NAND2XL U3435 ( .A(cal_cnt[5]), .B(cal_cnt[0]), .Y(n4140) );
  INVXL U3436 ( .A(n3623), .Y(n3172) );
  CLKINVX1 U3437 ( .A(n4692), .Y(n5062) );
  NAND4XL U3438 ( .A(n3894), .B(n3893), .C(n3892), .D(n3891), .Y(n4942) );
  NAND2XL U3439 ( .A(ispattern), .B(chardata[5]), .Y(n5265) );
  AND2X1 U3440 ( .A(chardata[3]), .B(chardata[1]), .Y(n4992) );
  NOR4XL U3441 ( .A(pat_cnt[3]), .B(n5480), .C(n5576), .D(n5259), .Y(n5270) );
  NAND4XL U3442 ( .A(chardata[6]), .B(chardata[2]), .C(n4992), .D(n4988), .Y(
        n5266) );
  NOR4XL U3443 ( .A(chardata[0]), .B(chardata[7]), .C(chardata[5]), .D(n5249), 
        .Y(n4988) );
  NAND2XL U3444 ( .A(n5022), .B(n5730), .Y(n5018) );
  NOR2XL U3445 ( .A(n5420), .B(n5330), .Y(n5329) );
  NAND4XL U3446 ( .A(chardata[5]), .B(n5251), .C(n5250), .D(n5249), .Y(n5261)
         );
  NAND2XL U3447 ( .A(n4990), .B(n5160), .Y(n5337) );
  INVXL U3448 ( .A(n5337), .Y(n5338) );
  INVXL U3449 ( .A(n5269), .Y(n5264) );
  INVXL U3450 ( .A(n5298), .Y(n5288) );
  NAND3XL U3451 ( .A(n5266), .B(n5265), .C(n5731), .Y(n5298) );
  NAND2XL U3452 ( .A(chardata[7]), .B(n5267), .Y(n5300) );
  NAND2XL U3453 ( .A(chardata[6]), .B(n5267), .Y(n5299) );
  NAND2XL U3454 ( .A(chardata[4]), .B(n5267), .Y(n5297) );
  NOR2XL U3455 ( .A(n5292), .B(n5291), .Y(n5302) );
  NOR2XL U3456 ( .A(n5287), .B(n5291), .Y(n5290) );
  INVXL U3457 ( .A(n5290), .Y(n5289) );
  NOR2XL U3458 ( .A(n5292), .B(n5282), .Y(n5284) );
  INVXL U3459 ( .A(n5284), .Y(n5283) );
  NOR2XL U3460 ( .A(n5287), .B(n5282), .Y(n5281) );
  INVXL U3461 ( .A(n5281), .Y(n5280) );
  NOR2XL U3462 ( .A(n5277), .B(n5292), .Y(n5279) );
  INVXL U3463 ( .A(n5279), .Y(n5278) );
  NOR2XL U3464 ( .A(n5287), .B(n5277), .Y(n5276) );
  INVXL U3465 ( .A(n5276), .Y(n5275) );
  INVXL U3466 ( .A(n5271), .Y(n5274) );
  NAND2XL U3467 ( .A(chardata[0]), .B(n5267), .Y(n5293) );
  NAND3XL U3468 ( .A(n4992), .B(n5251), .C(n4991), .Y(n5253) );
  NOR3XL U3469 ( .A(chardata[4]), .B(chardata[2]), .C(n5265), .Y(n4991) );
  NAND2XL U3470 ( .A(n5252), .B(n5253), .Y(n5254) );
  NOR2XL U3471 ( .A(pat_cnt[2]), .B(n5259), .Y(n5285) );
  NOR2XL U3472 ( .A(n5256), .B(n5257), .Y(n5258) );
  NOR2XL U3473 ( .A(n5237), .B(n5236), .Y(n5246) );
  INVXL U3474 ( .A(n5246), .Y(n5245) );
  NOR2XL U3475 ( .A(n5233), .B(n5236), .Y(n5235) );
  INVXL U3476 ( .A(n5235), .Y(n5234) );
  NOR2XL U3477 ( .A(n5230), .B(n5236), .Y(n5232) );
  INVXL U3478 ( .A(n5232), .Y(n5231) );
  INVXL U3479 ( .A(n5229), .Y(n5228) );
  NOR2XL U3480 ( .A(n5224), .B(n5236), .Y(n5226) );
  INVXL U3481 ( .A(n5226), .Y(n5225) );
  NOR2XL U3482 ( .A(n5202), .B(n5236), .Y(n5223) );
  INVXL U3483 ( .A(n5223), .Y(n5222) );
  NOR2XL U3484 ( .A(n5219), .B(n5236), .Y(n5221) );
  INVXL U3485 ( .A(n5221), .Y(n5220) );
  NOR2XL U3486 ( .A(n5216), .B(n5215), .Y(n5218) );
  INVXL U3487 ( .A(n5218), .Y(n5217) );
  NOR2XL U3488 ( .A(n5237), .B(n5215), .Y(n5214) );
  INVXL U3489 ( .A(n5214), .Y(n5213) );
  NOR2XL U3490 ( .A(n5233), .B(n5215), .Y(n5212) );
  INVXL U3491 ( .A(n5212), .Y(n5211) );
  NOR2XL U3492 ( .A(n5230), .B(n5215), .Y(n5210) );
  INVXL U3493 ( .A(n5210), .Y(n5209) );
  NOR2XL U3494 ( .A(n5227), .B(n5215), .Y(n5208) );
  NOR2XL U3495 ( .A(n5224), .B(n5215), .Y(n5206) );
  INVXL U3496 ( .A(n5206), .Y(n5205) );
  NOR2XL U3497 ( .A(n5202), .B(n5215), .Y(n5204) );
  INVXL U3498 ( .A(n5204), .Y(n5203) );
  NOR2XL U3499 ( .A(n5219), .B(n5215), .Y(n5201) );
  INVXL U3500 ( .A(n5201), .Y(n5200) );
  NOR2XL U3501 ( .A(n5216), .B(n5197), .Y(n5199) );
  INVXL U3502 ( .A(n5199), .Y(n5198) );
  NOR2XL U3503 ( .A(n5237), .B(n5197), .Y(n5196) );
  INVXL U3504 ( .A(n5196), .Y(n5195) );
  NOR2XL U3505 ( .A(n5233), .B(n5197), .Y(n5194) );
  INVXL U3506 ( .A(n5194), .Y(n5193) );
  INVXL U3507 ( .A(n5192), .Y(n5191) );
  NOR2XL U3508 ( .A(n5227), .B(n5197), .Y(n5190) );
  INVXL U3509 ( .A(n5190), .Y(n5189) );
  NOR2XL U3510 ( .A(n5224), .B(n5197), .Y(n5188) );
  INVXL U3511 ( .A(n5188), .Y(n5187) );
  NOR2XL U3512 ( .A(n5202), .B(n5197), .Y(n5186) );
  INVXL U3513 ( .A(n5186), .Y(n5185) );
  NOR2XL U3514 ( .A(n5219), .B(n5197), .Y(n5184) );
  INVXL U3515 ( .A(n5184), .Y(n5183) );
  NOR2XL U3516 ( .A(n5180), .B(n5216), .Y(n5182) );
  INVXL U3517 ( .A(n5182), .Y(n5181) );
  NOR2XL U3518 ( .A(n5180), .B(n5237), .Y(n5179) );
  INVXL U3519 ( .A(n5179), .Y(n5178) );
  NOR2XL U3520 ( .A(n5180), .B(n5233), .Y(n5177) );
  INVXL U3521 ( .A(n5177), .Y(n5176) );
  NOR2XL U3522 ( .A(n5180), .B(n5230), .Y(n5175) );
  NOR2XL U3523 ( .A(n5180), .B(n5227), .Y(n5173) );
  INVXL U3524 ( .A(n5173), .Y(n5172) );
  NOR2XL U3525 ( .A(n5180), .B(n5224), .Y(n5171) );
  INVXL U3526 ( .A(n5171), .Y(n5170) );
  NOR2XL U3527 ( .A(n5180), .B(n5202), .Y(n5169) );
  INVXL U3528 ( .A(n5169), .Y(n5168) );
  NOR2XL U3529 ( .A(n5219), .B(n5180), .Y(n5167) );
  INVXL U3530 ( .A(n5167), .Y(n5166) );
  NOR2XL U3531 ( .A(n5216), .B(n5161), .Y(n5165) );
  INVXL U3532 ( .A(n5165), .Y(n5164) );
  NOR2XL U3533 ( .A(n5237), .B(n5161), .Y(n5163) );
  INVXL U3534 ( .A(n5163), .Y(n5162) );
  INVXL U3535 ( .A(n5252), .Y(n5256) );
  INVXL U3536 ( .A(n5151), .Y(n5219) );
  NOR2XL U3537 ( .A(cal_cnt[0]), .B(n5326), .Y(n5307) );
  AOI21XL U3538 ( .A0(n5333), .A1(front_cnt[3]), .B0(n5323), .Y(n5324) );
  OAI211XL U3539 ( .A0(n5102), .A1(cal_cnt[5]), .B0(n5101), .C0(n5100), .Y(
        n5147) );
  NOR2BX1 U3540 ( .AN(n5158), .B(front_or_back), .Y(n5159) );
  AOI21XL U3541 ( .A0(n5333), .A1(front_cnt[2]), .B0(n5065), .Y(n5067) );
  AOI211XL U3542 ( .A0(n5333), .A1(front_cnt[1]), .B0(n5317), .C0(n5316), .Y(
        n5318) );
  NOR3XL U3543 ( .A(n5315), .B(n5314), .C(n5326), .Y(n5316) );
  INVXL U3544 ( .A(n5153), .Y(n5152) );
  NAND2X1 U3545 ( .A(n3239), .B(n3244), .Y(n3485) );
  NAND2X1 U3546 ( .A(n3622), .B(n3483), .Y(n3223) );
  CLKINVX1 U3547 ( .A(n4849), .Y(n4809) );
  AOI21XL U3548 ( .A0(chardata[3]), .A1(n5266), .B0(n5303), .Y(n5296) );
  AOI21XL U3549 ( .A0(chardata[1]), .A1(n5266), .B0(n5303), .Y(n5294) );
  NOR2XL U3550 ( .A(n5303), .B(n5272), .Y(n5271) );
  NOR2XL U3551 ( .A(n5303), .B(n5262), .Y(n5267) );
  NAND2XL U3552 ( .A(n5259), .B(n5303), .Y(n5252) );
  AOI21XL U3553 ( .A0(n5286), .A1(n5285), .B0(n5303), .Y(n5291) );
  AOI22XL U3554 ( .A0(n5338), .A1(string_cnt[5]), .B0(n5337), .B1(
        string_cnt_max[5]), .Y(n2951) );
  OAI22XL U3555 ( .A0(n5328), .A1(cal_cnt[5]), .B0(n5325), .B1(front_cnt[5]), 
        .Y(n2952) );
  INVXL U3556 ( .A(n3295), .Y(n3825) );
  OAI22XL U3557 ( .A0(n5252), .A1(isstring), .B0(ispattern_ff), .B1(ispattern), 
        .Y(n2953) );
  OAI21XL U3558 ( .A0(head_f), .A1(n4989), .B0(n5252), .Y(n2954) );
  INVXL U3559 ( .A(n4312), .Y(n3300) );
  INVXL U3560 ( .A(n5023), .Y(n3904) );
  INVXL U3561 ( .A(n4149), .Y(n3240) );
  NAND2XL U3562 ( .A(stringdata_ff[14]), .B(n3550), .Y(n3551) );
  NAND2XL U3563 ( .A(stringdata_ff[94]), .B(n5010), .Y(n3014) );
  INVXL U3564 ( .A(n4893), .Y(n4895) );
  NOR2XL U3565 ( .A(n5314), .B(n5571), .Y(n4892) );
  NOR2XL U3566 ( .A(n5482), .B(n3226), .Y(n4596) );
  NOR2XL U3567 ( .A(n5605), .B(n4829), .Y(n4577) );
  NOR2XL U3568 ( .A(n5383), .B(n2945), .Y(n4558) );
  NOR2XL U3569 ( .A(n5426), .B(n2945), .Y(n4539) );
  NOR2XL U3570 ( .A(n5385), .B(n3485), .Y(n4520) );
  NOR2XL U3571 ( .A(n5726), .B(n3220), .Y(n4502) );
  NOR2XL U3572 ( .A(n5481), .B(n2944), .Y(n4484) );
  NOR2XL U3573 ( .A(n5591), .B(n4838), .Y(n4465) );
  NAND3XL U3574 ( .A(n3240), .B(n5473), .C(n5420), .Y(n3770) );
  INVXL U3575 ( .A(n4743), .Y(n3728) );
  NOR2XL U3576 ( .A(n3610), .B(n3231), .Y(n4559) );
  NAND2XL U3577 ( .A(n3622), .B(n3245), .Y(n3246) );
  NOR4XL U3578 ( .A(n4075), .B(n4074), .C(n4073), .D(n4072), .Y(n4081) );
  NOR4XL U3579 ( .A(n4146), .B(n4145), .C(n4144), .D(n4143), .Y(n4160) );
  NOR2XL U3580 ( .A(n5602), .B(n3241), .Y(n3039) );
  AND2X1 U3581 ( .A(n3244), .B(n3243), .Y(n4696) );
  INVXL U3582 ( .A(n3226), .Y(n4822) );
  NOR2XL U3583 ( .A(n3242), .B(n3232), .Y(n3295) );
  AND2X1 U3584 ( .A(n3244), .B(n3550), .Y(n4366) );
  INVXL U3585 ( .A(n4860), .Y(n4330) );
  OAI211XL U3586 ( .A0(n5430), .A1(n3231), .B0(n3110), .C0(n3109), .Y(n3111)
         );
  AOI211XL U3587 ( .A0(stringdata_ff[88]), .A1(n3245), .B0(n3086), .C0(n3085), 
        .Y(n3087) );
  AOI211XL U3588 ( .A0(stringdata_ff[86]), .A1(n3245), .B0(n3042), .C0(n3041), 
        .Y(n3552) );
  OAI211XL U3589 ( .A0(n3231), .A1(n5447), .B0(n3015), .C0(n3014), .Y(n3016)
         );
  NOR2XL U3590 ( .A(n5314), .B(n4891), .Y(n4890) );
  NOR2XL U3591 ( .A(n3242), .B(n3241), .Y(n4855) );
  NOR2XL U3592 ( .A(n5533), .B(n3226), .Y(n4804) );
  INVXL U3593 ( .A(n3485), .Y(n4784) );
  NOR2XL U3594 ( .A(n5384), .B(n4874), .Y(n4763) );
  NOR2XL U3595 ( .A(n3242), .B(n3247), .Y(n4743) );
  NOR2XL U3596 ( .A(n5705), .B(n4866), .Y(n4721) );
  OAI211XL U3597 ( .A0(n4857), .A1(n5405), .B0(n4698), .C0(n4697), .Y(n4699)
         );
  NOR4XL U3598 ( .A(n4586), .B(n4585), .C(n4584), .D(n4583), .Y(n4592) );
  NOR4XL U3599 ( .A(n4514), .B(n4513), .C(n4512), .D(n4511), .Y(n4515) );
  CLKINVX1 U3600 ( .A(n4521), .Y(n4858) );
  NOR4XL U3601 ( .A(n4354), .B(n4353), .C(n4352), .D(n4351), .Y(n4360) );
  OAI211XL U3602 ( .A0(n5634), .A1(n3956), .B0(n3955), .C0(n3954), .Y(n3960)
         );
  INVXL U3603 ( .A(n3955), .Y(n3942) );
  NOR2XL U3604 ( .A(cal_cnt[0]), .B(n5564), .Y(n4163) );
  NAND2XL U3605 ( .A(cal_cnt[2]), .B(n5570), .Y(n3895) );
  NOR4XL U3606 ( .A(n3782), .B(n3781), .C(n3780), .D(n3779), .Y(n3783) );
  NOR3XL U3607 ( .A(n3711), .B(n3710), .C(n3709), .Y(n3727) );
  NOR4XL U3608 ( .A(n3586), .B(n3585), .C(n3584), .D(n3583), .Y(n3592) );
  AOI211XL U3609 ( .A0(stringdata_ff[97]), .A1(n5010), .B0(n3143), .C0(n3142), 
        .Y(n3524) );
  NOR2XL U3610 ( .A(n4220), .B(n4235), .Y(n3673) );
  NOR4XL U3611 ( .A(n3380), .B(n3379), .C(n3378), .D(n3377), .Y(n3381) );
  AOI211XL U3612 ( .A0(stringdata_ff[51]), .A1(n4822), .B0(n3314), .C0(n3313), 
        .Y(n3330) );
  NOR4XL U3613 ( .A(n3230), .B(n3229), .C(n3228), .D(n3227), .Y(n3254) );
  AOI22XL U3614 ( .A0(n3244), .A1(n3108), .B0(n3107), .B1(n3488), .Y(n3115) );
  OAI211XL U3615 ( .A0(n5595), .A1(n3247), .B0(n3629), .C0(n3026), .Y(n3029)
         );
  INVXL U3616 ( .A(n3209), .Y(n3208) );
  NOR4XL U3617 ( .A(n4880), .B(n4879), .C(n4878), .D(n4877), .Y(n4881) );
  NOR4XL U3618 ( .A(n4872), .B(n4871), .C(n4870), .D(n4869), .Y(n4882) );
  NOR4XL U3619 ( .A(n4775), .B(n4774), .C(n4773), .D(n4772), .Y(n4776) );
  AOI211XL U3620 ( .A0(stringdata_ff[0]), .A1(n4701), .B0(n4700), .C0(n4699), 
        .Y(n4717) );
  INVXL U3621 ( .A(n4654), .Y(n4636) );
  NAND4XL U3622 ( .A(n4397), .B(n4396), .C(n4395), .D(n4394), .Y(n4398) );
  NAND4XL U3623 ( .A(n4273), .B(n4272), .C(n4271), .D(n4270), .Y(n4274) );
  NAND2XL U3624 ( .A(n4682), .B(n4672), .Y(n4455) );
  NOR4XL U3625 ( .A(n4066), .B(n4065), .C(n4064), .D(n4063), .Y(n4085) );
  AOI211XL U3626 ( .A0(n4163), .A1(stringdata_ff[6]), .B0(n4011), .C0(n4010), 
        .Y(n4012) );
  NOR4XL U3627 ( .A(n3878), .B(n3877), .C(n3876), .D(n3889), .Y(n3879) );
  NAND2XL U3628 ( .A(n5696), .B(N1594), .Y(n4250) );
  OAI211XL U3629 ( .A0(n3499), .A1(n3610), .B0(n3498), .C0(n3497), .Y(n3500)
         );
  AOI211XL U3630 ( .A0(n4252), .A1(pattern_ff[35]), .B0(n3453), .C0(n3452), 
        .Y(n3456) );
  NAND2XL U3631 ( .A(N1594), .B(N1675), .Y(n4693) );
  NAND2XL U3632 ( .A(N1802), .B(N1675), .Y(n2961) );
  AOI22XL U3633 ( .A0(n3488), .A1(n3029), .B0(n3244), .B1(n3028), .Y(n3036) );
  NAND2XL U3634 ( .A(n5699), .B(n3208), .Y(n2980) );
  NOR4XL U3635 ( .A(n4927), .B(n4926), .C(n4925), .D(n4924), .Y(n4928) );
  NAND4XL U3636 ( .A(n4759), .B(n4758), .C(n4757), .D(n4756), .Y(n4919) );
  AOI21XL U3637 ( .A0(n4628), .A1(n4627), .B0(n4626), .Y(n4629) );
  INVXL U3638 ( .A(n4456), .Y(n4454) );
  AOI211XL U3639 ( .A0(n4251), .A1(pattern_ff[45]), .B0(n4255), .C0(n4240), 
        .Y(n4245) );
  AOI211XL U3640 ( .A0(pattern_ff[46]), .A1(n4251), .B0(n4255), .C0(n4200), 
        .Y(n4201) );
  INVXL U3641 ( .A(n4194), .Y(n4179) );
  AOI211XL U3642 ( .A0(cal_cnt[3]), .A1(n5578), .B0(n3897), .C0(n4626), .Y(
        n3899) );
  INVXL U3643 ( .A(n4246), .Y(n4672) );
  INVXL U3644 ( .A(n3523), .Y(n3660) );
  INVXL U3645 ( .A(n3468), .Y(n3458) );
  NOR2XL U3646 ( .A(n4622), .B(n3392), .Y(n3400) );
  NAND2XL U3647 ( .A(n5062), .B(pattern_ff[5]), .Y(n4460) );
  INVXL U3648 ( .A(n3117), .Y(n3178) );
  NAND2XL U3649 ( .A(n5062), .B(n2981), .Y(n2978) );
  INVXL U3650 ( .A(n3974), .Y(n4622) );
  NOR2XL U3651 ( .A(n4695), .B(n4932), .Y(n4916) );
  AOI22XL U3652 ( .A0(pattern_ff[15]), .A1(n4459), .B0(pattern_ff[7]), .B1(
        n4458), .Y(n4644) );
  NOR2XL U3653 ( .A(n4692), .B(n4247), .Y(n4204) );
  NOR2XL U3654 ( .A(n3899), .B(n3898), .Y(n4176) );
  NOR4XL U3655 ( .A(n3418), .B(n3417), .C(n3416), .D(n3415), .Y(n3427) );
  OAI211XL U3656 ( .A0(n5535), .A1(n4259), .B0(n2993), .C0(n2992), .Y(n3199)
         );
  NOR2XL U3657 ( .A(n3963), .B(n4622), .Y(n3477) );
  OAI211XL U3658 ( .A0(n4661), .A1(n4660), .B0(n4659), .C0(n4658), .Y(n4662)
         );
  NOR2XL U3659 ( .A(n3689), .B(n3876), .Y(n3890) );
  OAI211XL U3660 ( .A0(n5086), .A1(n5476), .B0(n5085), .C0(n5562), .Y(n5091)
         );
  NAND2XL U3661 ( .A(n5571), .B(n5476), .Y(n5003) );
  OAI22XL U3662 ( .A0(n4449), .A1(n4448), .B0(n4447), .B1(n4446), .Y(n4939) );
  INVXL U3663 ( .A(n5077), .Y(n5093) );
  INVXL U3664 ( .A(n5009), .Y(n5002) );
  NAND2XL U3665 ( .A(n5009), .B(n5476), .Y(n5004) );
  ADDFXL U3666 ( .A(n5054), .B(n5093), .CI(n5053), .CO(n5055), .S(n5048) );
  AOI21XL U3667 ( .A0(cal_cnt[2]), .A1(n5004), .B0(n5011), .Y(n5005) );
  NOR3XL U3668 ( .A(chardata[3]), .B(chardata[1]), .C(n5263), .Y(n5250) );
  NOR2XL U3669 ( .A(n5058), .B(n5057), .Y(n5059) );
  AOI31XL U3670 ( .A0(pat_cnt[2]), .A1(ispattern), .A2(n5286), .B0(n5303), .Y(
        n5277) );
  AOI21XL U3671 ( .A0(n5333), .A1(front_cnt[5]), .B0(n5072), .Y(n5073) );
  AOI211XL U3672 ( .A0(n5333), .A1(front_cnt[0]), .B0(n5307), .C0(n5306), .Y(
        n5308) );
  INVXL U3673 ( .A(n5273), .Y(n5272) );
  INVXL U3674 ( .A(n5302), .Y(n5301) );
  NAND2XL U3675 ( .A(n5731), .B(n5268), .Y(n5269) );
  NOR2XL U3676 ( .A(n5227), .B(n5236), .Y(n5229) );
  INVXL U3677 ( .A(n5208), .Y(n5207) );
  NOR2XL U3678 ( .A(n5230), .B(n5197), .Y(n5192) );
  INVXL U3679 ( .A(n5175), .Y(n5174) );
  INVXL U3680 ( .A(n5303), .Y(n5731) );
  OAI211XL U3681 ( .A0(n5158), .A1(n5148), .B0(n5147), .C0(n5146), .Y(N612) );
  NAND3BX1 U3682 ( .AN(curr_state[0]), .B(n5568), .C(curr_state[1]), .Y(n5335)
         );
  OAI21X1 U3683 ( .A0(front_or_back), .A1(n5730), .B0(n5143), .Y(n4690) );
  INVX3 U3684 ( .A(n4690), .Y(n4682) );
  NOR2X1 U3685 ( .A(N1594), .B(N1675), .Y(n4220) );
  NAND2X1 U3686 ( .A(n5563), .B(n4220), .Y(n4944) );
  CLKINVX1 U3687 ( .A(n4944), .Y(n4252) );
  AOI211XL U3688 ( .A0(n4252), .A1(n5699), .B0(n5730), .C0(n4690), .Y(n4943)
         );
  INVXL U3689 ( .A(n4228), .Y(n2973) );
  OAI22XL U3690 ( .A0(n4229), .A1(n5539), .B0(n4247), .B1(n5425), .Y(n2957) );
  AOI2BB2X1 U3691 ( .B0(n4238), .B1(pattern_ff[24]), .A0N(n4944), .A1N(n5665), 
        .Y(n2955) );
  OAI21XL U3692 ( .A0(n5552), .A1(n3956), .B0(n2955), .Y(n2956) );
  OR3X2 U3693 ( .A(front_or_back), .B(n5335), .C(n5730), .Y(n4692) );
  INVXL U3694 ( .A(n2980), .Y(n2959) );
  NAND2XL U3695 ( .A(n3209), .B(n2961), .Y(n3206) );
  OAI21XL U3696 ( .A0(N1675), .A1(pat_cnt[1]), .B0(pat_cnt[0]), .Y(n3672) );
  OAI22XL U3697 ( .A0(N1594), .A1(n3672), .B0(n5480), .B1(n5696), .Y(n3204) );
  NAND2XL U3698 ( .A(n5577), .B(n3434), .Y(n2960) );
  OAI211XL U3699 ( .A0(pat_cnt[2]), .A1(n3206), .B0(n3204), .C0(n2960), .Y(
        n2962) );
  AOI2BB2X1 U3700 ( .B0(n2963), .B1(n2962), .A0N(n5699), .A1N(n2961), .Y(n2981) );
  OAI21XL U3701 ( .A0(n5730), .A1(n2980), .B0(n4682), .Y(n2977) );
  OAI22XL U3702 ( .A0(n2964), .A1(n2978), .B0(n5551), .B1(n2977), .Y(n3177) );
  OAI22XL U3703 ( .A0(n4247), .A1(n5478), .B0(n5667), .B1(n4228), .Y(n2967) );
  AOI2BB2X1 U3704 ( .B0(n4238), .B1(pattern_ff[29]), .A0N(n4229), .A1N(n5650), 
        .Y(n2965) );
  OAI21XL U3705 ( .A0(n5550), .A1(n3956), .B0(n2965), .Y(n2966) );
  OAI22XL U3706 ( .A0(n2968), .A1(n2978), .B0(n5668), .B1(n2977), .Y(n3185) );
  OAI22XL U3707 ( .A0(n4247), .A1(n5477), .B0(n4228), .B1(n5575), .Y(n2971) );
  AOI2BB2X1 U3708 ( .B0(n4238), .B1(pattern_ff[27]), .A0N(n4229), .A1N(n5548), 
        .Y(n2969) );
  OAI21XL U3709 ( .A0(n3956), .A1(n5656), .B0(n2969), .Y(n2970) );
  OAI22XL U3710 ( .A0(n2972), .A1(n2978), .B0(n5678), .B1(n2977), .Y(n3181) );
  OAI22XL U3711 ( .A0(n4229), .A1(n5643), .B0(n5542), .B1(n3956), .Y(n2976) );
  AOI2BB2X1 U3712 ( .B0(n2973), .B1(pattern_ff[15]), .A0N(n4247), .A1N(n5666), 
        .Y(n2974) );
  OAI21XL U3713 ( .A0(n4248), .A1(n5569), .B0(n2974), .Y(n2975) );
  OAI22XL U3714 ( .A0(n2979), .A1(n2978), .B0(n5557), .B1(n2977), .Y(n3189) );
  NAND2XL U3715 ( .A(star_f), .B(n4682), .Y(n5079) );
  OAI22XL U3716 ( .A0(n2981), .A1(n4692), .B0(n5079), .B1(n2980), .Y(n2998) );
  NAND2X1 U3717 ( .A(n5062), .B(n4238), .Y(n3939) );
  OAI22XL U3718 ( .A0(n3939), .A1(n5540), .B0(n4259), .B1(n5662), .Y(n2985) );
  CLKINVX1 U3719 ( .A(n4204), .Y(n4241) );
  OAI22XL U3720 ( .A0(n4241), .A1(n5546), .B0(n3956), .B1(n4460), .Y(n2984) );
  NAND2X1 U3721 ( .A(n4251), .B(n5062), .Y(n3957) );
  NAND2X1 U3722 ( .A(n5062), .B(n5419), .Y(n3216) );
  NOR2X1 U3723 ( .A(n3209), .B(n3216), .Y(n3468) );
  AOI2BB2X1 U3724 ( .B0(pattern_ff[42]), .B1(n3468), .A0N(n4690), .A1N(n5661), 
        .Y(n2982) );
  OAI21XL U3725 ( .A0(n3957), .A1(n5534), .B0(n2982), .Y(n2983) );
  NOR4X1 U3726 ( .A(n2998), .B(n2985), .C(n2984), .D(n2983), .Y(n3187) );
  OAI22XL U3727 ( .A0(n3939), .A1(n5632), .B0(n3956), .B1(n4462), .Y(n2987) );
  OAI22XL U3728 ( .A0(n4241), .A1(n5549), .B0(n3957), .B1(n5664), .Y(n2986) );
  NAND2XL U3729 ( .A(n4682), .B(pattern_ff[45]), .Y(n2988) );
  OAI22XL U3730 ( .A0(n3939), .A1(n5604), .B0(n4687), .B1(n3956), .Y(n2991) );
  OAI22XL U3731 ( .A0(n4241), .A1(n5646), .B0(n3957), .B1(n5547), .Y(n2990) );
  NAND2XL U3732 ( .A(n4682), .B(pattern_ff[47]), .Y(n2992) );
  OAI22XL U3733 ( .A0(n5525), .A1(n4259), .B0(n5642), .B1(n4241), .Y(n2995) );
  OAI22XL U3734 ( .A0(n5652), .A1(n3957), .B0(n3956), .B1(n4694), .Y(n2994) );
  NAND2XL U3735 ( .A(pattern_ff[46]), .B(n4682), .Y(n2996) );
  NOR2X1 U3736 ( .A(n5473), .B(n5003), .Y(n3483) );
  INVX3 U3737 ( .A(n3483), .Y(n3241) );
  NOR2X1 U3738 ( .A(n5473), .B(n3964), .Y(n3550) );
  INVX3 U3739 ( .A(n3550), .Y(n3231) );
  OAI22XL U3740 ( .A0(n5432), .A1(n3241), .B0(n5393), .B1(n3231), .Y(n3002) );
  INVX3 U3741 ( .A(n5010), .Y(n3247) );
  NOR2X1 U3742 ( .A(n5473), .B(n3963), .Y(n3479) );
  CLKINVX1 U3743 ( .A(n3479), .Y(n3224) );
  OAI22XL U3744 ( .A0(n5482), .A1(n3247), .B0(n5428), .B1(n3224), .Y(n3001) );
  CLKINVX1 U3745 ( .A(n3245), .Y(n3146) );
  NOR2X1 U3746 ( .A(n5473), .B(n3965), .Y(n3148) );
  OAI22XL U3747 ( .A0(n5452), .A1(n3146), .B0(n5411), .B1(n3225), .Y(n3000) );
  NOR2X1 U3748 ( .A(n3963), .B(cal_cnt[3]), .Y(n3243) );
  NOR2X1 U3749 ( .A(n3964), .B(cal_cnt[3]), .Y(n3239) );
  INVX3 U3750 ( .A(n3239), .Y(n3232) );
  OAI22XL U3751 ( .A0(n5402), .A1(n3471), .B0(n5486), .B1(n3232), .Y(n2999) );
  NOR4XL U3752 ( .A(n3002), .B(n3001), .C(n3000), .D(n2999), .Y(n3019) );
  NOR2X1 U3753 ( .A(n5420), .B(cal_cnt[0]), .Y(n3639) );
  INVX3 U3754 ( .A(n3639), .Y(n3628) );
  OAI22XL U3755 ( .A0(n5615), .A1(n3231), .B0(n5469), .B1(n3225), .Y(n3004) );
  OAI22XL U3756 ( .A0(n5515), .A1(n3471), .B0(n5607), .B1(n3224), .Y(n3003) );
  AOI211XL U3757 ( .A0(stringdata_ff[35]), .A1(n3239), .B0(n3004), .C0(n3003), 
        .Y(n3494) );
  AOI2BB2X1 U3758 ( .B0(stringdata_ff[38]), .B1(n3245), .A0N(n5465), .A1N(
        n3247), .Y(n3487) );
  OAI211XL U3759 ( .A0(n5596), .A1(n3241), .B0(n3494), .C0(n3487), .Y(n3011)
         );
  NAND2X1 U3760 ( .A(n5562), .B(n5420), .Y(n3610) );
  CLKINVX1 U3761 ( .A(n3610), .Y(n3622) );
  AOI2BB2X1 U3762 ( .B0(stringdata_ff[101]), .B1(n3147), .A0N(n5531), .A1N(
        n3232), .Y(n3009) );
  OAI22XL U3763 ( .A0(n5645), .A1(n3146), .B0(n5724), .B1(n3231), .Y(n3007) );
  OAI22XL U3764 ( .A0(n5413), .A1(n3471), .B0(n5453), .B1(n3225), .Y(n3006) );
  NAND2XL U3765 ( .A(cal_cnt[5]), .B(n5010), .Y(n3151) );
  OAI22XL U3766 ( .A0(n5391), .A1(n3224), .B0(n5582), .B1(n3151), .Y(n3005) );
  NOR3XL U3767 ( .A(n3007), .B(n3006), .C(n3005), .Y(n3008) );
  OAI211XL U3768 ( .A0(n5483), .A1(n3241), .B0(n3009), .C0(n3008), .Y(n3010)
         );
  AOI22XL U3769 ( .A0(n3488), .A1(n3011), .B0(n3622), .B1(n3010), .Y(n3018) );
  NAND2XL U3770 ( .A(stringdata_ff[53]), .B(n3479), .Y(n3489) );
  OAI22XL U3771 ( .A0(n5529), .A1(n3232), .B0(n5460), .B1(n3471), .Y(n3013) );
  OAI22XL U3772 ( .A0(n5654), .A1(n3146), .B0(n5506), .B1(n3241), .Y(n3012) );
  AOI211XL U3773 ( .A0(stringdata_ff[62]), .A1(n3148), .B0(n3013), .C0(n3012), 
        .Y(n3015) );
  INVXL U3774 ( .A(n3016), .Y(n3499) );
  NOR2X1 U3775 ( .A(cal_cnt[4]), .B(n5562), .Y(n3244) );
  OAI2BB1XL U3776 ( .A0N(n3489), .A1N(n3499), .B0(n3244), .Y(n3017) );
  OAI211XL U3777 ( .A0(n3019), .A1(n3628), .B0(n3018), .C0(n3017), .Y(n3180)
         );
  OAI22XL U3778 ( .A0(n5392), .A1(n3224), .B0(n5496), .B1(n3247), .Y(n3023) );
  OAI22XL U3779 ( .A0(n5442), .A1(n3241), .B0(n5485), .B1(n3471), .Y(n3022) );
  OAI22XL U3780 ( .A0(n5398), .A1(n3231), .B0(n5426), .B1(n3225), .Y(n3021) );
  OAI22XL U3781 ( .A0(n5429), .A1(n3232), .B0(n5584), .B1(n3146), .Y(n3020) );
  NOR4XL U3782 ( .A(n3023), .B(n3022), .C(n3021), .D(n3020), .Y(n3037) );
  OAI22XL U3783 ( .A0(n5598), .A1(n3225), .B0(n5423), .B1(n3224), .Y(n3025) );
  OAI22XL U3784 ( .A0(n5527), .A1(n3471), .B0(n5715), .B1(n3232), .Y(n3024) );
  AOI211XL U3785 ( .A0(stringdata_ff[23]), .A1(n3483), .B0(n3025), .C0(n3024), 
        .Y(n3629) );
  OAI22XL U3786 ( .A0(n5609), .A1(n3231), .B0(n5507), .B1(n3146), .Y(n3638) );
  INVXL U3787 ( .A(n3638), .Y(n3026) );
  AOI222XL U3788 ( .A0(stringdata_ff[80]), .A1(n3239), .B0(stringdata_ff[72]), 
        .B1(n3243), .C0(stringdata_ff[61]), .C1(n3148), .Y(n3618) );
  OAI22XL U3789 ( .A0(n5649), .A1(n3146), .B0(n5461), .B1(n3241), .Y(n3616) );
  OAI22XL U3790 ( .A0(n5522), .A1(n3231), .B0(n5629), .B1(n3224), .Y(n3621) );
  AOI211XL U3791 ( .A0(stringdata_ff[93]), .A1(n5010), .B0(n3616), .C0(n3621), 
        .Y(n3027) );
  NAND2XL U3792 ( .A(n3618), .B(n3027), .Y(n3028) );
  OAI22XL U3793 ( .A0(n5468), .A1(n3232), .B0(n5388), .B1(n3151), .Y(n3034) );
  OAI22XL U3794 ( .A0(n5403), .A1(n3471), .B0(n5722), .B1(n3224), .Y(n3033) );
  AOI2BB2X1 U3795 ( .B0(stringdata_ff[59]), .B1(n3550), .A0N(n5660), .A1N(
        n3146), .Y(n3031) );
  AOI2BB2X1 U3796 ( .B0(stringdata_ff[100]), .B1(n3147), .A0N(n5444), .A1N(
        n3225), .Y(n3030) );
  OAI211XL U3797 ( .A0(n5414), .A1(n3241), .B0(n3031), .C0(n3030), .Y(n3032)
         );
  OAI31XL U3798 ( .A0(n3034), .A1(n3033), .A2(n3032), .B0(n3622), .Y(n3035) );
  OAI211XL U3799 ( .A0(n3037), .A1(n3628), .B0(n3036), .C0(n3035), .Y(n3184)
         );
  OAI22XL U3800 ( .A0(n3179), .A1(n3180), .B0(n3183), .B1(n3184), .Y(n3162) );
  OAI22XL U3801 ( .A0(n5455), .A1(n3225), .B0(n5606), .B1(n3224), .Y(n3545) );
  OAI22XL U3802 ( .A0(n5513), .A1(n3232), .B0(n5412), .B1(n3471), .Y(n3038) );
  AOI211XL U3803 ( .A0(n5010), .A1(stringdata_ff[45]), .B0(n3039), .C0(n3038), 
        .Y(n3541) );
  OAI21XL U3804 ( .A0(n5441), .A1(n3146), .B0(n3541), .Y(n3040) );
  AOI211XL U3805 ( .A0(stringdata_ff[14]), .A1(n3550), .B0(n3545), .C0(n3040), 
        .Y(n3056) );
  OAI22XL U3806 ( .A0(n5567), .A1(n3224), .B0(n5726), .B1(n3225), .Y(n3042) );
  OAI22XL U3807 ( .A0(n5475), .A1(n3471), .B0(n5729), .B1(n3232), .Y(n3041) );
  AOI222XL U3808 ( .A0(stringdata_ff[67]), .A1(n3483), .B0(stringdata_ff[56]), 
        .B1(n3550), .C0(stringdata_ff[96]), .C1(n5010), .Y(n3542) );
  NAND2XL U3809 ( .A(n3552), .B(n3542), .Y(n3048) );
  OAI22XL U3810 ( .A0(n5445), .A1(n3247), .B0(n5497), .B1(n3231), .Y(n3046) );
  OAI22XL U3811 ( .A0(n5408), .A1(n3146), .B0(n5706), .B1(n3224), .Y(n3045) );
  OAI22XL U3812 ( .A0(n5585), .A1(n3225), .B0(n5386), .B1(n3241), .Y(n3044) );
  OAI22XL U3813 ( .A0(n5716), .A1(n3232), .B0(n5433), .B1(n3471), .Y(n3043) );
  NOR4XL U3814 ( .A(n3046), .B(n3045), .C(n3044), .D(n3043), .Y(n3047) );
  AOI2BB2X1 U3815 ( .B0(n3244), .B1(n3048), .A0N(n3047), .A1N(n3628), .Y(n3055) );
  OAI22XL U3816 ( .A0(n5405), .A1(n3231), .B0(n5586), .B1(n3225), .Y(n3053) );
  OAI22XL U3817 ( .A0(n5435), .A1(n3224), .B0(n5499), .B1(n3471), .Y(n3052) );
  AOI2BB2X1 U3818 ( .B0(stringdata_ff[103]), .B1(n3147), .A0N(n5657), .A1N(
        n3146), .Y(n3050) );
  AOI2BB2X1 U3819 ( .B0(stringdata_ff[82]), .B1(n3239), .A0N(n5590), .A1N(
        n3241), .Y(n3049) );
  OAI211XL U3820 ( .A0(n5503), .A1(n3151), .B0(n3050), .C0(n3049), .Y(n3051)
         );
  OAI31XL U3821 ( .A0(n3053), .A1(n3052), .A2(n3051), .B0(n3622), .Y(n3054) );
  OAI22XL U3822 ( .A0(n5427), .A1(n3231), .B0(n5589), .B1(n3241), .Y(n3061) );
  OAI22XL U3823 ( .A0(n5449), .A1(n3471), .B0(n5387), .B1(n3224), .Y(n3060) );
  OAI22XL U3824 ( .A0(n5385), .A1(n3225), .B0(n5581), .B1(n3151), .Y(n3059) );
  AOI2BB2X1 U3825 ( .B0(stringdata_ff[104]), .B1(n3147), .A0N(n5659), .A1N(
        n3146), .Y(n3057) );
  OAI21XL U3826 ( .A0(n5524), .A1(n3232), .B0(n3057), .Y(n3058) );
  NOR2XL U3827 ( .A(n5603), .B(n3247), .Y(n3063) );
  OAI22XL U3828 ( .A0(n5599), .A1(n3241), .B0(n5711), .B1(n3225), .Y(n3062) );
  AOI211XL U3829 ( .A0(n3243), .A1(stringdata_ff[31]), .B0(n3063), .C0(n3062), 
        .Y(n3064) );
  INVXL U3830 ( .A(n3064), .Y(n3505) );
  OAI222XL U3831 ( .A0(n5504), .A1(n3232), .B0(n5717), .B1(n3146), .C0(n5641), 
        .C1(n3224), .Y(n3504) );
  AOI211XL U3832 ( .A0(stringdata_ff[15]), .A1(n3550), .B0(n3505), .C0(n3504), 
        .Y(n3070) );
  OAI22XL U3833 ( .A0(n5434), .A1(n3146), .B0(n5488), .B1(n3471), .Y(n3068) );
  OAI22XL U3834 ( .A0(n5384), .A1(n3224), .B0(n5422), .B1(n3225), .Y(n3067) );
  OAI22XL U3835 ( .A0(n5436), .A1(n3231), .B0(n5382), .B1(n3247), .Y(n3066) );
  OAI22XL U3836 ( .A0(n5399), .A1(n3241), .B0(n5421), .B1(n3232), .Y(n3065) );
  NOR4XL U3837 ( .A(n3068), .B(n3067), .C(n3066), .D(n3065), .Y(n3069) );
  OA22X1 U3838 ( .A0(n3242), .A1(n3070), .B0(n3069), .B1(n3628), .Y(n3075) );
  NOR2XL U3839 ( .A(n5494), .B(n3224), .Y(n3506) );
  OAI22XL U3840 ( .A0(n5545), .A1(n3146), .B0(n5672), .B1(n3247), .Y(n3072) );
  OAI22XL U3841 ( .A0(n5500), .A1(n3225), .B0(n5594), .B1(n3241), .Y(n3071) );
  AOI211XL U3842 ( .A0(stringdata_ff[81]), .A1(n3239), .B0(n3072), .C0(n3071), 
        .Y(n3516) );
  NAND2XL U3843 ( .A(stringdata_ff[57]), .B(n3550), .Y(n3507) );
  OAI211XL U3844 ( .A0(n3471), .A1(n5492), .B0(n3516), .C0(n3507), .Y(n3073)
         );
  OAI21XL U3845 ( .A0(n3506), .A1(n3073), .B0(n3244), .Y(n3074) );
  OAI211XL U3846 ( .A0(n3076), .A1(n3610), .B0(n3075), .C0(n3074), .Y(n3077)
         );
  OAI2BB2XL U3847 ( .B0(n3187), .B1(n3188), .A0N(n3185), .A1N(n3186), .Y(n3161) );
  NAND2XL U3848 ( .A(stringdata_ff[13]), .B(n3550), .Y(n3600) );
  OAI22XL U3849 ( .A0(n5566), .A1(n3247), .B0(n5474), .B1(n3471), .Y(n3079) );
  OAI22XL U3850 ( .A0(n5714), .A1(n3232), .B0(n5565), .B1(n3225), .Y(n3078) );
  AOI211XL U3851 ( .A0(stringdata_ff[39]), .A1(n3245), .B0(n3079), .C0(n3078), 
        .Y(n3080) );
  OA21XL U3852 ( .A0(n5628), .A1(n3241), .B0(n3080), .Y(n3605) );
  OAI211XL U3853 ( .A0(n3224), .A1(n5417), .B0(n3600), .C0(n3605), .Y(n3097)
         );
  OAI22XL U3854 ( .A0(n5451), .A1(n3232), .B0(n5401), .B1(n3471), .Y(n3084) );
  OAI22XL U3855 ( .A0(n5600), .A1(n3247), .B0(n5710), .B1(n3231), .Y(n3083) );
  OAI22XL U3856 ( .A0(n5383), .A1(n3225), .B0(n5707), .B1(n3224), .Y(n3082) );
  OAI22XL U3857 ( .A0(n5409), .A1(n3146), .B0(n5498), .B1(n3241), .Y(n3081) );
  NOR4XL U3858 ( .A(n3084), .B(n3083), .C(n3082), .D(n3081), .Y(n3091) );
  AOI2BB2X1 U3859 ( .B0(stringdata_ff[70]), .B1(n3483), .A0N(n5532), .A1N(
        n3232), .Y(n3089) );
  AOI2BB2X1 U3860 ( .B0(stringdata_ff[102]), .B1(n3147), .A0N(n5721), .A1N(
        n3224), .Y(n3088) );
  OAI22XL U3861 ( .A0(n5502), .A1(n3471), .B0(n5723), .B1(n3231), .Y(n3086) );
  OAI22XL U3862 ( .A0(n5727), .A1(n3225), .B0(n5438), .B1(n3151), .Y(n3085) );
  NAND3XL U3863 ( .A(n3089), .B(n3088), .C(n3087), .Y(n3090) );
  OAI2BB2XL U3864 ( .B0(n3091), .B1(n3628), .A0N(n3622), .A1N(n3090), .Y(n3096) );
  OAI22XL U3865 ( .A0(n5415), .A1(n3224), .B0(n5457), .B1(n3231), .Y(n3093) );
  OAI22XL U3866 ( .A0(n5655), .A1(n3146), .B0(n5462), .B1(n3471), .Y(n3092) );
  AOI211XL U3867 ( .A0(stringdata_ff[95]), .A1(n5010), .B0(n3093), .C0(n3092), 
        .Y(n3094) );
  OAI21XL U3868 ( .A0(n5627), .A1(n3232), .B0(n3094), .Y(n3598) );
  OAI22XL U3869 ( .A0(n5520), .A1(n3225), .B0(n5458), .B1(n3241), .Y(n3597) );
  OA21XL U3870 ( .A0(n3598), .A1(n3597), .B0(n3244), .Y(n3095) );
  OAI22XL U3871 ( .A0(n5712), .A1(n3225), .B0(n5484), .B1(n3241), .Y(n3101) );
  OAI22XL U3872 ( .A0(n5448), .A1(n3471), .B0(n5406), .B1(n3232), .Y(n3100) );
  OAI22XL U3873 ( .A0(n5718), .A1(n3146), .B0(n5708), .B1(n3231), .Y(n3099) );
  OAI22XL U3874 ( .A0(n5390), .A1(n3247), .B0(n5579), .B1(n3224), .Y(n3098) );
  NOR4XL U3875 ( .A(n3101), .B(n3100), .C(n3099), .D(n3098), .Y(n3116) );
  OAI22XL U3876 ( .A0(n5623), .A1(n3232), .B0(n5416), .B1(n3225), .Y(n3103) );
  OAI22XL U3877 ( .A0(n5543), .A1(n3146), .B0(n5456), .B1(n3241), .Y(n3102) );
  AOI211XL U3878 ( .A0(stringdata_ff[91]), .A1(n5010), .B0(n3103), .C0(n3102), 
        .Y(n3562) );
  AOI2BB2X1 U3879 ( .B0(stringdata_ff[50]), .B1(n3479), .A0N(n5601), .A1N(
        n3471), .Y(n3563) );
  OAI211XL U3880 ( .A0(n5407), .A1(n3231), .B0(n3562), .C0(n3563), .Y(n3108)
         );
  NAND2XL U3881 ( .A(stringdata_ff[10]), .B(n3550), .Y(n3564) );
  OAI22XL U3882 ( .A0(n5509), .A1(n3146), .B0(n5424), .B1(n3471), .Y(n3105) );
  OAI22XL U3883 ( .A0(n5597), .A1(n3241), .B0(n5705), .B1(n3224), .Y(n3104) );
  AOI211XL U3884 ( .A0(stringdata_ff[33]), .A1(n3239), .B0(n3105), .C0(n3104), 
        .Y(n3106) );
  OA21XL U3885 ( .A0(n5605), .A1(n3225), .B0(n3106), .Y(n3561) );
  OAI211XL U3886 ( .A0(n3247), .A1(n5588), .B0(n3564), .C0(n3561), .Y(n3107)
         );
  OAI22XL U3887 ( .A0(n5493), .A1(n3225), .B0(n5583), .B1(n3151), .Y(n3113) );
  OAI22XL U3888 ( .A0(n5523), .A1(n3232), .B0(n5397), .B1(n3241), .Y(n3112) );
  AOI2BB2X1 U3889 ( .B0(stringdata_ff[73]), .B1(n3243), .A0N(n5648), .A1N(
        n3146), .Y(n3110) );
  AOI2BB2X1 U3890 ( .B0(stringdata_ff[98]), .B1(n3147), .A0N(n5443), .A1N(
        n3224), .Y(n3109) );
  OAI31XL U3891 ( .A0(n3113), .A1(n3112), .A2(n3111), .B0(n3622), .Y(n3114) );
  AO22X1 U3892 ( .A0(n3181), .A1(n3182), .B0(n3177), .B1(n3178), .Y(n3160) );
  OAI22XL U3893 ( .A0(n5431), .A1(n3231), .B0(n5487), .B1(n3224), .Y(n3121) );
  OAI22XL U3894 ( .A0(n5439), .A1(n3225), .B0(n5719), .B1(n3146), .Y(n3120) );
  OAI22XL U3895 ( .A0(n5580), .A1(n3241), .B0(n5720), .B1(n3247), .Y(n3119) );
  OAI22XL U3896 ( .A0(n5593), .A1(n3232), .B0(n5481), .B1(n3471), .Y(n3118) );
  NOR4XL U3897 ( .A(n3121), .B(n3120), .C(n3119), .D(n3118), .Y(n3135) );
  OAI22XL U3898 ( .A0(n5510), .A1(n3146), .B0(n5608), .B1(n3224), .Y(n3123) );
  OAI22XL U3899 ( .A0(n5516), .A1(n3231), .B0(n5618), .B1(n3247), .Y(n3122) );
  AOI211XL U3900 ( .A0(stringdata_ff[18]), .A1(n3148), .B0(n3123), .C0(n3122), 
        .Y(n3579) );
  AOI222XL U3901 ( .A0(stringdata_ff[22]), .A1(n3483), .B0(stringdata_ff[29]), 
        .B1(n3243), .C0(stringdata_ff[34]), .C1(n3239), .Y(n3581) );
  NAND2XL U3902 ( .A(n3579), .B(n3581), .Y(n3127) );
  OAI22XL U3903 ( .A0(n5528), .A1(n3224), .B0(n5454), .B1(n3241), .Y(n3125) );
  OAI22XL U3904 ( .A0(n5518), .A1(n3471), .B0(n5418), .B1(n3231), .Y(n3124) );
  AOI211XL U3905 ( .A0(stringdata_ff[60]), .A1(n3148), .B0(n3125), .C0(n3124), 
        .Y(n3580) );
  AOI222XL U3906 ( .A0(stringdata_ff[83]), .A1(n3245), .B0(stringdata_ff[92]), 
        .B1(n5010), .C0(stringdata_ff[79]), .C1(n3239), .Y(n3582) );
  NAND2XL U3907 ( .A(n3580), .B(n3582), .Y(n3126) );
  AOI22XL U3908 ( .A0(n3488), .A1(n3127), .B0(n3244), .B1(n3126), .Y(n3134) );
  OAI22XL U3909 ( .A0(n5725), .A1(n3231), .B0(n5728), .B1(n3241), .Y(n3132) );
  OAI22XL U3910 ( .A0(n5395), .A1(n3224), .B0(n5490), .B1(n3225), .Y(n3131) );
  AOI2BB2X1 U3911 ( .B0(stringdata_ff[99]), .B1(n3147), .A0N(n5647), .A1N(
        n3146), .Y(n3129) );
  AOI2BB2X1 U3912 ( .B0(stringdata_ff[74]), .B1(n3243), .A0N(n5470), .A1N(
        n3232), .Y(n3128) );
  OAI211XL U3913 ( .A0(n5404), .A1(n3151), .B0(n3129), .C0(n3128), .Y(n3130)
         );
  OAI31XL U3914 ( .A0(n3132), .A1(n3131), .A2(n3130), .B0(n3622), .Y(n3133) );
  OAI22XL U3915 ( .A0(n5389), .A1(n3241), .B0(n5591), .B1(n3224), .Y(n3139) );
  OAI22XL U3916 ( .A0(n5400), .A1(n3471), .B0(n5709), .B1(n3231), .Y(n3138) );
  OAI22XL U3917 ( .A0(n5587), .A1(n3247), .B0(n5713), .B1(n3225), .Y(n3137) );
  OAI22XL U3918 ( .A0(n5437), .A1(n3146), .B0(n5394), .B1(n3232), .Y(n3136) );
  NOR4XL U3919 ( .A(n3139), .B(n3138), .C(n3137), .D(n3136), .Y(n3157) );
  OAI22XL U3920 ( .A0(n5450), .A1(n3232), .B0(n5514), .B1(n3241), .Y(n3141) );
  OAI22XL U3921 ( .A0(n5463), .A1(n3471), .B0(n5508), .B1(n3231), .Y(n3140) );
  AOI211XL U3922 ( .A0(stringdata_ff[21]), .A1(n3148), .B0(n3141), .C0(n3140), 
        .Y(n3525) );
  AOI222XL U3923 ( .A0(stringdata_ff[47]), .A1(n5010), .B0(stringdata_ff[40]), 
        .B1(n3245), .C0(stringdata_ff[8]), .C1(n3479), .Y(n3527) );
  NAND2XL U3924 ( .A(n3525), .B(n3527), .Y(n3145) );
  OAI22XL U3925 ( .A0(n5466), .A1(n3232), .B0(n5544), .B1(n3146), .Y(n3143) );
  OAI22XL U3926 ( .A0(n5464), .A1(n3224), .B0(n5592), .B1(n3471), .Y(n3142) );
  AOI222XL U3927 ( .A0(stringdata_ff[64]), .A1(n3148), .B0(stringdata_ff[68]), 
        .B1(n3483), .C0(stringdata_ff[58]), .C1(n3550), .Y(n3526) );
  NAND2XL U3928 ( .A(n3524), .B(n3526), .Y(n3144) );
  AOI22XL U3929 ( .A0(n3488), .A1(n3145), .B0(n3244), .B1(n3144), .Y(n3156) );
  OAI22XL U3930 ( .A0(n5644), .A1(n3146), .B0(n5491), .B1(n3471), .Y(n3154) );
  OAI22XL U3931 ( .A0(n5519), .A1(n3232), .B0(n5396), .B1(n3231), .Y(n3153) );
  AOI2BB2X1 U3932 ( .B0(stringdata_ff[105]), .B1(n3147), .A0N(n5440), .A1N(
        n3241), .Y(n3150) );
  AOI2BB2X1 U3933 ( .B0(stringdata_ff[66]), .B1(n3148), .A0N(n5410), .A1N(
        n3224), .Y(n3149) );
  OAI211XL U3934 ( .A0(n5489), .A1(n3151), .B0(n3150), .C0(n3149), .Y(n3152)
         );
  OAI31XL U3935 ( .A0(n3154), .A1(n3153), .A2(n3152), .B0(n3622), .Y(n3155) );
  OAI2BB2XL U3936 ( .B0(n3175), .B1(n3176), .A0N(n3189), .A1N(n3190), .Y(n3159) );
  OAI22XL U3937 ( .A0(cal_cnt[5]), .A1(n3172), .B0(n3599), .B1(n4140), .Y(
        n5070) );
  NOR2XL U3938 ( .A(n3218), .B(n4891), .Y(n3163) );
  OAI21XL U3939 ( .A0(n3163), .A1(n5420), .B0(n2947), .Y(n5327) );
  OAI22XL U3940 ( .A0(cal_cnt[3]), .A1(n3165), .B0(n4891), .B1(n3218), .Y(
        n5321) );
  NAND2XL U3941 ( .A(string_cnt_max[1]), .B(n5476), .Y(n3164) );
  NAND2XL U3942 ( .A(string_cnt_max[0]), .B(n5562), .Y(n4410) );
  AOI32XL U3943 ( .A0(n3164), .A1(n3218), .A2(n4410), .B0(n4409), .B1(n3218), 
        .Y(n3166) );
  CLKINVX1 U3944 ( .A(n3165), .Y(n4150) );
  NAND2XL U3945 ( .A(n5571), .B(n3218), .Y(n3391) );
  NAND2XL U3946 ( .A(n4150), .B(n3391), .Y(n5063) );
  INVXL U3947 ( .A(n5063), .Y(n3167) );
  NAND2XL U3948 ( .A(string_cnt_max[2]), .B(n3166), .Y(n3394) );
  OAI21XL U3949 ( .A0(n3393), .A1(n3167), .B0(n3394), .Y(n3168) );
  AOI222XL U3950 ( .A0(string_cnt_max[3]), .A1(n5321), .B0(string_cnt_max[3]), 
        .B1(n3168), .C0(n5321), .C1(n3168), .Y(n3169) );
  AOI222XL U3951 ( .A0(n5495), .A1(n5327), .B0(n5495), .B1(n3169), .C0(n5327), 
        .C1(n3169), .Y(n3170) );
  OAI2BB2XL U3952 ( .B0(n3178), .B1(n3177), .A0N(n3176), .A1N(n3175), .Y(n3194) );
  OAI2BB2XL U3953 ( .B0(n3182), .B1(n3181), .A0N(n3180), .A1N(n3179), .Y(n3193) );
  OAI2BB2XL U3954 ( .B0(n3186), .B1(n3185), .A0N(n3184), .A1N(n3183), .Y(n3192) );
  OAI2BB2XL U3955 ( .B0(n3190), .B1(n3189), .A0N(n3188), .A1N(n3187), .Y(n3191) );
  NOR4X1 U3956 ( .A(n3194), .B(n3193), .C(n3192), .D(n3191), .Y(n3195) );
  OAI31XL U3957 ( .A0(n3199), .A1(n3198), .A2(n3197), .B0(n3196), .Y(n3200) );
  AO22X1 U3958 ( .A0(n3203), .A1(n3202), .B0(n3201), .B1(n3200), .Y(n3894) );
  NOR2XL U3959 ( .A(pat_cnt[2]), .B(n3435), .Y(n4451) );
  NAND2XL U3960 ( .A(n5699), .B(pat_cnt[3]), .Y(n4450) );
  INVXL U3961 ( .A(n3204), .Y(n3205) );
  OAI21XL U3962 ( .A0(n5576), .A1(n3206), .B0(n3205), .Y(n3207) );
  NAND2XL U3963 ( .A(N1804), .B(n5577), .Y(n4671) );
  OAI22XL U3964 ( .A0(n4451), .A1(n3210), .B0(n4450), .B1(n3209), .Y(n3212) );
  OAI22XL U3965 ( .A0(n4692), .A1(n3212), .B0(n5079), .B1(n3434), .Y(n3217) );
  OAI22XL U3966 ( .A0(n5419), .A1(n4462), .B0(n5634), .B1(n3216), .Y(n3211) );
  OAI222XL U3967 ( .A0(n4690), .A1(n5546), .B0(n4460), .B1(n5419), .C0(n5662), 
        .C1(n3216), .Y(n3424) );
  OAI22XL U3968 ( .A0(N1594), .A1(pattern_ff[15]), .B0(n5419), .B1(
        pattern_ff[7]), .Y(n3213) );
  OAI21XL U3969 ( .A0(n5730), .A1(n3434), .B0(n4682), .Y(n3215) );
  OA22X1 U3970 ( .A0(n3213), .A1(n3214), .B0(n5666), .B1(n3215), .Y(n3404) );
  OAI22XL U3971 ( .A0(N1594), .A1(pattern_ff[14]), .B0(n5419), .B1(
        pattern_ff[6]), .Y(n4215) );
  OA22X1 U3972 ( .A0(n4215), .A1(n3214), .B0(n5478), .B1(n3215), .Y(n3412) );
  OAI22XL U3973 ( .A0(N1594), .A1(pattern_ff[12]), .B0(n5419), .B1(
        pattern_ff[4]), .Y(n4210) );
  OA22X1 U3974 ( .A0(n4210), .A1(n3214), .B0(n5477), .B1(n3215), .Y(n3408) );
  OAI22XL U3975 ( .A0(N1594), .A1(pattern_ff[8]), .B0(n5419), .B1(
        pattern_ff[0]), .Y(n4205) );
  OAI22XL U3976 ( .A0(n5425), .A1(n3215), .B0(n4205), .B1(n3214), .Y(n3274) );
  OAI222XL U3977 ( .A0(n5419), .A1(n4694), .B0(n5525), .B1(n3216), .C0(n5642), 
        .C1(n4690), .Y(n3422) );
  OAI222XL U3978 ( .A0(n5419), .A1(n4687), .B0(n4690), .B1(n5646), .C0(n5535), 
        .C1(n3216), .Y(n3423) );
  OR4X2 U3979 ( .A(n3420), .B(n3274), .C(n3410), .D(n3414), .Y(n3431) );
  NAND2XL U3980 ( .A(n3239), .B(n3639), .Y(n3219) );
  INVX3 U3981 ( .A(n4855), .Y(n4838) );
  OAI22XL U3982 ( .A0(n5442), .A1(n4875), .B0(n5609), .B1(n4838), .Y(n3222) );
  NAND2X1 U3983 ( .A(n3622), .B(n3243), .Y(n3220) );
  OAI22XL U3984 ( .A0(n5444), .A1(n3220), .B0(n5595), .B1(n2946), .Y(n3221) );
  NOR2X1 U3985 ( .A(n3225), .B(n3628), .Y(n4521) );
  OAI22XL U3986 ( .A0(n5459), .A1(n3223), .B0(n5392), .B1(n4858), .Y(n3230) );
  NOR2X1 U3987 ( .A(n3610), .B(n3224), .Y(n4597) );
  OAI22XL U3988 ( .A0(n5584), .A1(n4852), .B0(n5423), .B1(n4865), .Y(n3229) );
  OAI22XL U3989 ( .A0(n5522), .A1(n2949), .B0(n5426), .B1(n4829), .Y(n3228) );
  CLKINVX1 U3990 ( .A(n4540), .Y(n4857) );
  OAI22XL U3991 ( .A0(n5722), .A1(n4857), .B0(n5629), .B1(n3226), .Y(n3227) );
  OAI22XL U3992 ( .A0(n5414), .A1(n4847), .B0(n5507), .B1(n2947), .Y(n3238) );
  OAI22XL U3993 ( .A0(n5598), .A1(n4860), .B0(n5496), .B1(n4859), .Y(n3237) );
  NOR2X1 U3994 ( .A(n3610), .B(n3247), .Y(n4823) );
  OAI22XL U3995 ( .A0(n5468), .A1(n4867), .B0(n5526), .B1(n3825), .Y(n3236) );
  NAND2X1 U3996 ( .A(n3245), .B(n3639), .Y(n3233) );
  NAND2XL U3997 ( .A(n3639), .B(n3550), .Y(n3234) );
  OAI22XL U3998 ( .A0(n5485), .A1(n3233), .B0(n5388), .B1(n4874), .Y(n3235) );
  OAI22XL U3999 ( .A0(n5461), .A1(n3485), .B0(n5625), .B1(n2950), .Y(n3251) );
  OAI22XL U4000 ( .A0(n5398), .A1(n4868), .B0(n5715), .B1(n2944), .Y(n3250) );
  OAI22XL U4001 ( .A0(n5537), .A1(n4809), .B0(n5614), .B1(n2948), .Y(n3249) );
  NOR2X1 U4002 ( .A(n3247), .B(n3628), .Y(n4279) );
  OAI22XL U4003 ( .A0(n5403), .A1(n4873), .B0(n5429), .B1(n4876), .Y(n3248) );
  OAI22XL U4004 ( .A0(n5493), .A1(n3220), .B0(n5718), .B1(n4852), .Y(n3257) );
  OAI22XL U4005 ( .A0(n5448), .A1(n3233), .B0(n5705), .B1(n4865), .Y(n3256) );
  AOI211XL U4006 ( .A0(stringdata_ff[17]), .A1(n4330), .B0(n3257), .C0(n3256), 
        .Y(n3273) );
  OAI22XL U4007 ( .A0(n5588), .A1(n2946), .B0(n5484), .B1(n4875), .Y(n3261) );
  OAI22XL U4008 ( .A0(n5407), .A1(n2949), .B0(n5456), .B1(n3485), .Y(n3260) );
  OAI22XL U4009 ( .A0(n5523), .A1(n4867), .B0(n5397), .B1(n4847), .Y(n3259) );
  OAI22XL U4010 ( .A0(n5597), .A1(n2945), .B0(n5708), .B1(n4868), .Y(n3258) );
  OAI22XL U4011 ( .A0(n5443), .A1(n4857), .B0(n5601), .B1(n2950), .Y(n3265) );
  OAI22XL U4012 ( .A0(n5624), .A1(n2944), .B0(n5424), .B1(n2943), .Y(n3264) );
  OAI22XL U4013 ( .A0(n5521), .A1(n3226), .B0(n5390), .B1(n4859), .Y(n3263) );
  OAI22XL U4014 ( .A0(n5501), .A1(n4873), .B0(n5579), .B1(n4858), .Y(n3262) );
  OAI22XL U4015 ( .A0(n5623), .A1(n4809), .B0(n5406), .B1(n4876), .Y(n3269) );
  OAI22XL U4016 ( .A0(n5416), .A1(n2948), .B0(n5509), .B1(n2947), .Y(n3268) );
  OAI22XL U4017 ( .A0(n5712), .A1(n4829), .B0(n5583), .B1(n4874), .Y(n3267) );
  OAI22XL U4018 ( .A0(n5430), .A1(n3223), .B0(n5636), .B1(n4838), .Y(n3266) );
  NAND4XL U4019 ( .A(n3273), .B(n3272), .C(n3271), .D(n3270), .Y(n3402) );
  AO22X1 U4020 ( .A0(n3409), .A1(n3410), .B0(n3402), .B1(n3419), .Y(n3388) );
  OAI22XL U4021 ( .A0(n5492), .A1(n2950), .B0(n5385), .B1(n3220), .Y(n3276) );
  OAI22XL U4022 ( .A0(n5382), .A1(n4859), .B0(n5421), .B1(n4876), .Y(n3275) );
  OAI22XL U4023 ( .A0(n5384), .A1(n4858), .B0(n5488), .B1(n3233), .Y(n3280) );
  OAI22XL U4024 ( .A0(n5434), .A1(n4852), .B0(n5610), .B1(n2949), .Y(n3279) );
  OAI22XL U4025 ( .A0(n5449), .A1(n4873), .B0(n5524), .B1(n4867), .Y(n3278) );
  OAI22XL U4026 ( .A0(n5711), .A1(n4860), .B0(n5500), .B1(n2948), .Y(n3277) );
  OAI22XL U4027 ( .A0(n5504), .A1(n2944), .B0(n5594), .B1(n3485), .Y(n3284) );
  OAI22XL U4028 ( .A0(n5436), .A1(n4868), .B0(n5717), .B1(n2947), .Y(n3283) );
  OAI22XL U4029 ( .A0(n5512), .A1(n4838), .B0(n5427), .B1(n3223), .Y(n3282) );
  OAI22XL U4030 ( .A0(n5639), .A1(n2943), .B0(n5494), .B1(n3226), .Y(n3281) );
  OAI22XL U4031 ( .A0(n5387), .A1(n4857), .B0(n5581), .B1(n4874), .Y(n3288) );
  OAI22XL U4032 ( .A0(n5399), .A1(n4875), .B0(n5589), .B1(n4847), .Y(n3287) );
  OAI22XL U4033 ( .A0(n5599), .A1(n2945), .B0(n5422), .B1(n4829), .Y(n3286) );
  OAI22XL U4034 ( .A0(n5471), .A1(n4809), .B0(n5641), .B1(n4865), .Y(n3285) );
  NAND4XL U4035 ( .A(n3292), .B(n3291), .C(n3290), .D(n3289), .Y(n3411) );
  OAI22XL U4036 ( .A0(n5401), .A1(n3233), .B0(n5707), .B1(n4858), .Y(n3294) );
  OAI22XL U4037 ( .A0(n5714), .A1(n2944), .B0(n5611), .B1(n4838), .Y(n3293) );
  OAI22XL U4038 ( .A0(n5532), .A1(n4867), .B0(n5462), .B1(n2950), .Y(n3299) );
  OAI22XL U4039 ( .A0(n5621), .A1(n2947), .B0(n5383), .B1(n4829), .Y(n3298) );
  OAI22XL U4040 ( .A0(n5451), .A1(n4876), .B0(n5565), .B1(n4860), .Y(n3297) );
  OAI22XL U4041 ( .A0(n5721), .A1(n4857), .B0(n5417), .B1(n4865), .Y(n3296) );
  OAI22XL U4042 ( .A0(n5409), .A1(n4852), .B0(n5710), .B1(n4868), .Y(n3304) );
  OAI22XL U4043 ( .A0(n5502), .A1(n4873), .B0(n5415), .B1(n3226), .Y(n3303) );
  OAI22XL U4044 ( .A0(n5600), .A1(n4859), .B0(n5474), .B1(n2943), .Y(n3302) );
  OAI22XL U4045 ( .A0(n5566), .A1(n2946), .B0(n5520), .B1(n2948), .Y(n3301) );
  OAI22XL U4046 ( .A0(n5511), .A1(n4847), .B0(n5727), .B1(n3220), .Y(n3308) );
  OAI22XL U4047 ( .A0(n5627), .A1(n4809), .B0(n5438), .B1(n4874), .Y(n3307) );
  OAI22XL U4048 ( .A0(n5723), .A1(n3223), .B0(n5458), .B1(n3485), .Y(n3306) );
  OAI22XL U4049 ( .A0(n5457), .A1(n2949), .B0(n5498), .B1(n4875), .Y(n3305) );
  NAND4XL U4050 ( .A(n3312), .B(n3311), .C(n3310), .D(n3309), .Y(n3407) );
  AO22X1 U4051 ( .A0(n3411), .A1(n3412), .B0(n3407), .B1(n3408), .Y(n3387) );
  OAI22XL U4052 ( .A0(n5536), .A1(n4809), .B0(n5728), .B1(n4847), .Y(n3314) );
  OAI22XL U4053 ( .A0(n5720), .A1(n4859), .B0(n5454), .B1(n3485), .Y(n3313) );
  OAI22XL U4054 ( .A0(n5616), .A1(n2944), .B0(n5446), .B1(n4873), .Y(n3318) );
  OAI22XL U4055 ( .A0(n5487), .A1(n4858), .B0(n5439), .B1(n4829), .Y(n3317) );
  OAI22XL U4056 ( .A0(n5431), .A1(n4868), .B0(n5516), .B1(n4838), .Y(n3316) );
  OAI22XL U4057 ( .A0(n5593), .A1(n4876), .B0(n5719), .B1(n4852), .Y(n3315) );
  OAI22XL U4058 ( .A0(n5580), .A1(n4875), .B0(n5481), .B1(n3233), .Y(n3322) );
  OAI22XL U4059 ( .A0(n5467), .A1(n2943), .B0(n5608), .B1(n4865), .Y(n3321) );
  OAI22XL U4060 ( .A0(n5518), .A1(n2950), .B0(n5725), .B1(n3223), .Y(n3320) );
  OAI22XL U4061 ( .A0(n5395), .A1(n4857), .B0(n5635), .B1(n2948), .Y(n3319) );
  OAI22XL U4062 ( .A0(n5619), .A1(n2945), .B0(n5510), .B1(n2947), .Y(n3326) );
  OAI22XL U4063 ( .A0(n5470), .A1(n4867), .B0(n5490), .B1(n3220), .Y(n3325) );
  OAI22XL U4064 ( .A0(n5618), .A1(n2946), .B0(n5404), .B1(n4874), .Y(n3324) );
  OAI22XL U4065 ( .A0(n5638), .A1(n4860), .B0(n5418), .B1(n2949), .Y(n3323) );
  NAND4XL U4066 ( .A(n3330), .B(n3329), .C(n3328), .D(n3327), .Y(n3405) );
  OAI22XL U4067 ( .A0(n5716), .A1(n4876), .B0(n5475), .B1(n2950), .Y(n3332) );
  OAI22XL U4068 ( .A0(n5517), .A1(n2949), .B0(n5386), .B1(n4875), .Y(n3331) );
  AOI211XL U4069 ( .A0(stringdata_ff[14]), .A1(n4855), .B0(n3332), .C0(n3331), 
        .Y(n3348) );
  OAI22XL U4070 ( .A0(n5567), .A1(n3226), .B0(n5455), .B1(n4860), .Y(n3336) );
  OAI22XL U4071 ( .A0(n5405), .A1(n3223), .B0(n5503), .B1(n4874), .Y(n3335) );
  OAI22XL U4072 ( .A0(n5513), .A1(n2944), .B0(n5706), .B1(n4858), .Y(n3334) );
  OAI22XL U4073 ( .A0(n5640), .A1(n4867), .B0(n5412), .B1(n2943), .Y(n3333) );
  OAI22XL U4074 ( .A0(n5408), .A1(n4852), .B0(n5602), .B1(n3825), .Y(n3340) );
  OAI22XL U4075 ( .A0(n5441), .A1(n2947), .B0(n5585), .B1(n4829), .Y(n3339) );
  OAI22XL U4076 ( .A0(n5445), .A1(n4859), .B0(n5590), .B1(n4847), .Y(n3338) );
  OAI22XL U4077 ( .A0(n5435), .A1(n4857), .B0(n5499), .B1(n4873), .Y(n3337) );
  OAI22XL U4078 ( .A0(n5586), .A1(n3220), .B0(n5729), .B1(n4809), .Y(n3344) );
  OAI22XL U4079 ( .A0(n5530), .A1(n2946), .B0(n5637), .B1(n3485), .Y(n3343) );
  OAI22XL U4080 ( .A0(n5433), .A1(n3233), .B0(n5726), .B1(n2948), .Y(n3342) );
  OAI22XL U4081 ( .A0(n5497), .A1(n4868), .B0(n5606), .B1(n4865), .Y(n3341) );
  NAND4XL U4082 ( .A(n3348), .B(n3347), .C(n3346), .D(n3345), .Y(n3406) );
  AO22X1 U4083 ( .A0(n3433), .A1(n3405), .B0(n3432), .B1(n3406), .Y(n3386) );
  OAI22XL U4084 ( .A0(n5529), .A1(n4809), .B0(n5453), .B1(n3220), .Y(n3350) );
  OAI22XL U4085 ( .A0(n5613), .A1(n2948), .B0(n5447), .B1(n2949), .Y(n3349) );
  AOI211XL U4086 ( .A0(stringdata_ff[19]), .A1(n4330), .B0(n3350), .C0(n3349), 
        .Y(n3366) );
  OAI22XL U4087 ( .A0(n5452), .A1(n4852), .B0(n5531), .B1(n4867), .Y(n3354) );
  OAI22XL U4088 ( .A0(n5482), .A1(n4859), .B0(n5432), .B1(n4875), .Y(n3353) );
  OAI22XL U4089 ( .A0(n5411), .A1(n4829), .B0(n5506), .B1(n3485), .Y(n3352) );
  OAI22XL U4090 ( .A0(n5465), .A1(n2946), .B0(n5413), .B1(n4873), .Y(n3351) );
  OAI22XL U4091 ( .A0(n5393), .A1(n4868), .B0(n5724), .B1(n3223), .Y(n3358) );
  OAI22XL U4092 ( .A0(n5596), .A1(n2945), .B0(n5428), .B1(n4858), .Y(n3357) );
  OAI22XL U4093 ( .A0(n5626), .A1(n3226), .B0(n5483), .B1(n4847), .Y(n3356) );
  OAI22XL U4094 ( .A0(n5486), .A1(n4876), .B0(n5607), .B1(n4865), .Y(n3355) );
  OAI22XL U4095 ( .A0(n5402), .A1(n3233), .B0(n5651), .B1(n2947), .Y(n3362) );
  OAI22XL U4096 ( .A0(n5460), .A1(n2950), .B0(n5582), .B1(n4874), .Y(n3361) );
  OAI22XL U4097 ( .A0(n5620), .A1(n2944), .B0(n5391), .B1(n4857), .Y(n3360) );
  OAI22XL U4098 ( .A0(n5515), .A1(n2943), .B0(n5615), .B1(n4838), .Y(n3359) );
  NAND4XL U4099 ( .A(n3366), .B(n3365), .C(n3364), .D(n3363), .Y(n3413) );
  OAI22XL U4100 ( .A0(n5440), .A1(n4847), .B0(n5489), .B1(n4874), .Y(n3368) );
  OAI22XL U4101 ( .A0(n5463), .A1(n2943), .B0(n5410), .B1(n4857), .Y(n3367) );
  AOI211XL U4102 ( .A0(stringdata_ff[21]), .A1(n4330), .B0(n3368), .C0(n3367), 
        .Y(n3384) );
  OAI22XL U4103 ( .A0(n5466), .A1(n4809), .B0(n5591), .B1(n4858), .Y(n3372) );
  OAI22XL U4104 ( .A0(n5587), .A1(n4859), .B0(n5713), .B1(n4829), .Y(n3371) );
  OAI22XL U4105 ( .A0(n5622), .A1(n2946), .B0(n5514), .B1(n3825), .Y(n3370) );
  OAI22XL U4106 ( .A0(n5450), .A1(n2944), .B0(n5389), .B1(n4875), .Y(n3369) );
  OAI22XL U4107 ( .A0(n5464), .A1(n3226), .B0(n5396), .B1(n3223), .Y(n3376) );
  OAI22XL U4108 ( .A0(n5491), .A1(n4873), .B0(n5592), .B1(n2950), .Y(n3375) );
  OAI22XL U4109 ( .A0(n5437), .A1(n4852), .B0(n5519), .B1(n4867), .Y(n3374) );
  OAI22XL U4110 ( .A0(n5533), .A1(n2949), .B0(n5630), .B1(n4865), .Y(n3373) );
  OAI22XL U4111 ( .A0(n5709), .A1(n4868), .B0(n5633), .B1(n3485), .Y(n3380) );
  OAI22XL U4112 ( .A0(n5394), .A1(n4876), .B0(n5508), .B1(n4838), .Y(n3379) );
  OAI22XL U4113 ( .A0(n5400), .A1(n3233), .B0(n5612), .B1(n2948), .Y(n3378) );
  OAI22XL U4114 ( .A0(n5617), .A1(n2947), .B0(n5505), .B1(n3220), .Y(n3377) );
  NAND4XL U4115 ( .A(n3384), .B(n3383), .C(n3382), .D(n3381), .Y(n3403) );
  AO22X1 U4116 ( .A0(n3413), .A1(n3414), .B0(n3403), .B1(n3404), .Y(n3385) );
  NOR2XL U4117 ( .A(n3392), .B(n5473), .Y(n3390) );
  INVXL U4118 ( .A(n3400), .Y(n3389) );
  OAI21XL U4119 ( .A0(cal_cnt[4]), .A1(n3390), .B0(n3389), .Y(n3398) );
  OAI22XL U4120 ( .A0(cal_cnt[3]), .A1(n3392), .B0(n5473), .B1(n3391), .Y(
        n3396) );
  AO21X1 U4121 ( .A0(n5063), .A1(n3394), .B0(n3393), .Y(n3395) );
  AOI222XL U4122 ( .A0(n3396), .A1(n5578), .B0(n3396), .B1(n3395), .C0(n5578), 
        .C1(n3395), .Y(n3397) );
  AOI222XL U4123 ( .A0(string_cnt_max[4]), .A1(n3398), .B0(string_cnt_max[4]), 
        .B1(n3397), .C0(n3398), .C1(n3397), .Y(n3401) );
  OAI31XL U4124 ( .A0(n3400), .A1(n3401), .A2(n4901), .B0(n4905), .Y(n3399) );
  OAI22XL U4125 ( .A0(n3404), .A1(n3403), .B0(n3419), .B1(n3402), .Y(n3418) );
  OAI22XL U4126 ( .A0(n3432), .A1(n3406), .B0(n3433), .B1(n3405), .Y(n3417) );
  OAI22XL U4127 ( .A0(n3410), .A1(n3409), .B0(n3408), .B1(n3407), .Y(n3416) );
  OAI22XL U4128 ( .A0(n3414), .A1(n3413), .B0(n3412), .B1(n3411), .Y(n3415) );
  NAND3BX1 U4129 ( .AN(n3420), .B(n3433), .C(n3419), .Y(n3421) );
  NAND2BX1 U4130 ( .AN(n3425), .B(n3428), .Y(n3426) );
  NAND2XL U4131 ( .A(n5576), .B(N1802), .Y(n4667) );
  NOR2XL U4132 ( .A(n5576), .B(N1802), .Y(n4666) );
  AO21X1 U4133 ( .A0(n5577), .A1(n3434), .B0(n4452), .Y(n3437) );
  OA22X1 U4134 ( .A0(n3681), .A1(n4450), .B0(n3435), .B1(n5576), .Y(n3436) );
  OAI21XL U4135 ( .A0(pat_cnt[1]), .A1(n5696), .B0(pat_cnt[0]), .Y(n4198) );
  AOI2BB2X1 U4136 ( .B0(pat_cnt[1]), .B1(n3673), .A0N(n5419), .A1N(n4198), .Y(
        n4453) );
  AOI22X1 U4137 ( .A0(n4450), .A1(n3437), .B0(n3436), .B1(n4453), .Y(n3444) );
  OAI22XL U4138 ( .A0(n4235), .A1(n3438), .B0(n3444), .B1(n4692), .Y(n3457) );
  OAI22XL U4139 ( .A0(n4690), .A1(n5670), .B0(n3939), .B1(n5546), .Y(n3441) );
  OAI22XL U4140 ( .A0(n4228), .A1(n4460), .B0(n5540), .B1(n3957), .Y(n3440) );
  OAI22XL U4141 ( .A0(n4241), .A1(n5662), .B0(n5534), .B1(n3458), .Y(n3439) );
  OAI22XL U4142 ( .A0(n4944), .A1(n5643), .B0(n4247), .B1(n5479), .Y(n3443) );
  OAI22XL U4143 ( .A0(n4248), .A1(n5666), .B0(n4228), .B1(n5542), .Y(n3442) );
  AOI211XL U4144 ( .A0(n4251), .A1(pattern_ff[30]), .B0(n3443), .C0(n3442), 
        .Y(n3445) );
  OAI31XL U4145 ( .A0(N1802), .A1(n4235), .A2(n4672), .B0(n4682), .Y(n3454) );
  OAI22XL U4146 ( .A0(n3445), .A1(n3455), .B0(n5669), .B1(n3454), .Y(n3650) );
  OAI22XL U4147 ( .A0(n4944), .A1(n5539), .B0(n4247), .B1(n5679), .Y(n3447) );
  OAI22XL U4148 ( .A0(n4229), .A1(n5658), .B0(n5552), .B1(n4228), .Y(n3446) );
  OAI22XL U4149 ( .A0(n3448), .A1(n3455), .B0(n5665), .B1(n3454), .Y(n3662) );
  OAI22XL U4150 ( .A0(n4229), .A1(n5572), .B0(n4248), .B1(n5477), .Y(n3450) );
  OAI22XL U4151 ( .A0(n4944), .A1(n5548), .B0(n4228), .B1(n5656), .Y(n3449) );
  OAI22XL U4152 ( .A0(n3451), .A1(n3455), .B0(n5554), .B1(n3454), .Y(n3658) );
  OAI22XL U4153 ( .A0(n4247), .A1(n5667), .B0(n5550), .B1(n4228), .Y(n3453) );
  OAI22XL U4154 ( .A0(n4229), .A1(n5653), .B0(n4248), .B1(n5478), .Y(n3452) );
  OAI22XL U4155 ( .A0(n3456), .A1(n3455), .B0(n5555), .B1(n3454), .Y(n3523) );
  OAI22XL U4156 ( .A0(n4690), .A1(n5558), .B0(n4241), .B1(n5634), .Y(n3461) );
  OAI22XL U4157 ( .A0(n3939), .A1(n5549), .B0(n3957), .B1(n5632), .Y(n3460) );
  OAI22XL U4158 ( .A0(n4228), .A1(n4462), .B0(n5664), .B1(n3458), .Y(n3459) );
  OAI22XL U4159 ( .A0(n4228), .A1(n4687), .B0(n3957), .B1(n5604), .Y(n3464) );
  AOI2BB2X1 U4160 ( .B0(n4204), .B1(pattern_ff[11]), .A0N(n4690), .A1N(n5663), 
        .Y(n3462) );
  OAI21XL U4161 ( .A0(n3939), .A1(n5646), .B0(n3462), .Y(n3463) );
  OAI22XL U4162 ( .A0(n5541), .A1(n3957), .B0(n4228), .B1(n4694), .Y(n3467) );
  OAI21XL U4163 ( .A0(n5642), .A1(n3939), .B0(n3465), .Y(n3466) );
  OAI21XL U4164 ( .A0(n4901), .A1(n4628), .B0(n4905), .Y(n3898) );
  AO21X1 U4165 ( .A0(n5495), .A1(cal_cnt[4]), .B0(n4901), .Y(n4626) );
  OAI22XL U4166 ( .A0(n3479), .A1(n4628), .B0(n3477), .B1(n4905), .Y(n3476) );
  NAND2XL U4167 ( .A(n3964), .B(n3965), .Y(n4619) );
  INVXL U4168 ( .A(n4619), .Y(n3472) );
  NOR2XL U4169 ( .A(string_cnt_max[0]), .B(n5562), .Y(n3851) );
  OAI22XL U4170 ( .A0(n3851), .A1(n4411), .B0(n5476), .B1(n5574), .Y(n4618) );
  AOI222XL U4171 ( .A0(n3472), .A1(string_cnt_max[2]), .B0(n3472), .B1(n4618), 
        .C0(string_cnt_max[2]), .C1(n4618), .Y(n3473) );
  AOI222XL U4172 ( .A0(n5578), .A1(n3474), .B0(n5578), .B1(n3473), .C0(n3474), 
        .C1(n3473), .Y(n3475) );
  AOI221XL U4173 ( .A0(n3479), .A1(n3849), .B0(n4626), .B1(n3849), .C0(n3478), 
        .Y(n3647) );
  OAI22XL U4174 ( .A0(n5482), .A1(n2947), .B0(n5391), .B1(n2946), .Y(n3503) );
  NAND2XL U4175 ( .A(stringdata_ff[24]), .B(n3483), .Y(n3484) );
  OAI22XL U4176 ( .A0(n5432), .A1(n4860), .B0(n3628), .B1(n3484), .Y(n3502) );
  AOI2BB2X1 U4177 ( .B0(stringdata_ff[75]), .B1(n4784), .A0N(n5411), .A1N(
        n4838), .Y(n3486) );
  OAI21XL U4178 ( .A0(n3487), .A1(n3628), .B0(n3486), .Y(n3501) );
  OAI22XL U4179 ( .A0(n5402), .A1(n2945), .B0(n5582), .B1(n3623), .Y(n3493) );
  NAND2X1 U4180 ( .A(n3488), .B(n3550), .Y(n4866) );
  OAI22XL U4181 ( .A0(n5428), .A1(n4866), .B0(n3610), .B1(n3489), .Y(n3492) );
  OAI22XL U4182 ( .A0(n5486), .A1(n2943), .B0(n5393), .B1(n4865), .Y(n3491) );
  OAI22XL U4183 ( .A0(n5645), .A1(n4809), .B0(n5453), .B1(n2949), .Y(n3490) );
  OAI22XL U4184 ( .A0(n5531), .A1(n2950), .B0(n5724), .B1(n3226), .Y(n3496) );
  OAI22XL U4185 ( .A0(n3494), .A1(n3628), .B0(n5483), .B1(n2948), .Y(n3495) );
  AOI211XL U4186 ( .A0(stringdata_ff[41]), .A1(n4743), .B0(n3496), .C0(n3495), 
        .Y(n3497) );
  OAI21XL U4187 ( .A0(n3505), .A1(n3504), .B0(n3639), .Y(n3522) );
  AO22X1 U4188 ( .A0(stringdata_ff[78]), .A1(n4784), .B0(n3622), .B1(n3506), 
        .Y(n3511) );
  OAI22XL U4189 ( .A0(n5488), .A1(n2945), .B0(n5387), .B1(n2946), .Y(n3510) );
  OAI22XL U4190 ( .A0(n5399), .A1(n4860), .B0(n5581), .B1(n3623), .Y(n3509) );
  OAI22XL U4191 ( .A0(n5385), .A1(n2949), .B0(n3610), .B1(n3507), .Y(n3508) );
  OAI22XL U4192 ( .A0(n5422), .A1(n4838), .B0(n5492), .B1(n3220), .Y(n3515) );
  OAI22XL U4193 ( .A0(n5436), .A1(n4865), .B0(n5512), .B1(n4874), .Y(n3514) );
  OAI22XL U4194 ( .A0(n5384), .A1(n4866), .B0(n5421), .B1(n2943), .Y(n3513) );
  OAI22XL U4195 ( .A0(n5434), .A1(n2944), .B0(n5589), .B1(n2948), .Y(n3512) );
  OAI22XL U4196 ( .A0(n5524), .A1(n2950), .B0(n5427), .B1(n3226), .Y(n3518) );
  OAI22XL U4197 ( .A0(n3516), .A1(n3610), .B0(n5382), .B1(n2947), .Y(n3517) );
  OAI2BB2XL U4198 ( .B0(n3651), .B1(n3652), .A0N(n3659), .A1N(n3660), .Y(n3643) );
  OAI22XL U4199 ( .A0(n3525), .A1(n3628), .B0(n3524), .B1(n3610), .Y(n3540) );
  OAI22XL U4200 ( .A0(n3527), .A1(n3628), .B0(n3526), .B1(n3610), .Y(n3539) );
  OAI22XL U4201 ( .A0(n5644), .A1(n4809), .B0(n5519), .B1(n2950), .Y(n3531) );
  OAI22XL U4202 ( .A0(n5396), .A1(n3226), .B0(n5489), .B1(n3623), .Y(n3530) );
  OAI22XL U4203 ( .A0(n5491), .A1(n3485), .B0(n5440), .B1(n2948), .Y(n3529) );
  OAI22XL U4204 ( .A0(n5437), .A1(n2944), .B0(n5587), .B1(n2947), .Y(n3528) );
  OAI22XL U4205 ( .A0(n5400), .A1(n2945), .B0(n5591), .B1(n4866), .Y(n3535) );
  OAI22XL U4206 ( .A0(n5713), .A1(n4838), .B0(n5410), .B1(n2946), .Y(n3534) );
  OAI22XL U4207 ( .A0(n5709), .A1(n4865), .B0(n5389), .B1(n4860), .Y(n3533) );
  OAI22XL U4208 ( .A0(n5394), .A1(n2943), .B0(n5505), .B1(n2949), .Y(n3532) );
  OAI22XL U4209 ( .A0(n3542), .A1(n3610), .B0(n3541), .B1(n3628), .Y(n3560) );
  OA22X1 U4210 ( .A0(n5640), .A1(n2950), .B0(n5441), .B1(n3233), .Y(n3558) );
  OAI22XL U4211 ( .A0(n5435), .A1(n2946), .B0(n5706), .B1(n4866), .Y(n3544) );
  OAI22XL U4212 ( .A0(n5408), .A1(n2944), .B0(n5586), .B1(n2949), .Y(n3543) );
  AOI211XL U4213 ( .A0(n3639), .A1(n3545), .B0(n3544), .C0(n3543), .Y(n3557)
         );
  OAI22XL U4214 ( .A0(n5433), .A1(n2945), .B0(n5503), .B1(n3623), .Y(n3549) );
  OAI22XL U4215 ( .A0(n5590), .A1(n2948), .B0(n5499), .B1(n3485), .Y(n3548) );
  OAI22XL U4216 ( .A0(n5445), .A1(n2947), .B0(n5405), .B1(n3226), .Y(n3547) );
  OAI22XL U4217 ( .A0(n5657), .A1(n4809), .B0(n5386), .B1(n4860), .Y(n3546) );
  OAI22XL U4218 ( .A0(n5716), .A1(n2943), .B0(n5585), .B1(n4838), .Y(n3554) );
  OAI22XL U4219 ( .A0(n3552), .A1(n3610), .B0(n3628), .B1(n3551), .Y(n3553) );
  NAND4XL U4220 ( .A(n3558), .B(n3557), .C(n3556), .D(n3555), .Y(n3559) );
  OAI2BB2XL U4221 ( .B0(n3649), .B1(n3650), .A0N(n3663), .A1N(n3671), .Y(n3642) );
  OAI22XL U4222 ( .A0(n3562), .A1(n3610), .B0(n3561), .B1(n3628), .Y(n3578) );
  OAI22XL U4223 ( .A0(n5430), .A1(n3226), .B0(n5493), .B1(n2949), .Y(n3577) );
  OAI22XL U4224 ( .A0(n3563), .A1(n3610), .B0(n5579), .B1(n4866), .Y(n3576) );
  OAI22XL U4225 ( .A0(n5397), .A1(n2948), .B0(n5484), .B1(n4860), .Y(n3568) );
  OAI22XL U4226 ( .A0(n5648), .A1(n4809), .B0(n5708), .B1(n4865), .Y(n3567) );
  OAI22XL U4227 ( .A0(n5583), .A1(n3623), .B0(n3628), .B1(n3564), .Y(n3566) );
  OAI22XL U4228 ( .A0(n5407), .A1(n4859), .B0(n5712), .B1(n4838), .Y(n3565) );
  OAI22XL U4229 ( .A0(n5718), .A1(n2944), .B0(n5406), .B1(n2943), .Y(n3572) );
  OAI22XL U4230 ( .A0(n5501), .A1(n3485), .B0(n5443), .B1(n2946), .Y(n3571) );
  OAI22XL U4231 ( .A0(n5588), .A1(n4876), .B0(n5390), .B1(n2947), .Y(n3570) );
  OAI22XL U4232 ( .A0(n5523), .A1(n2950), .B0(n5448), .B1(n2945), .Y(n3569) );
  NOR4X1 U4233 ( .A(n3572), .B(n3571), .C(n3570), .D(n3569), .Y(n3573) );
  NAND2XL U4234 ( .A(n3574), .B(n3573), .Y(n3575) );
  OAI22XL U4235 ( .A0(n3580), .A1(n3610), .B0(n3579), .B1(n3628), .Y(n3595) );
  OAI22XL U4236 ( .A0(n3582), .A1(n3610), .B0(n3581), .B1(n3628), .Y(n3594) );
  OAI22XL U4237 ( .A0(n5593), .A1(n2943), .B0(n5446), .B1(n3485), .Y(n3586) );
  OAI22XL U4238 ( .A0(n5481), .A1(n2945), .B0(n5470), .B1(n2950), .Y(n3585) );
  OAI22XL U4239 ( .A0(n5487), .A1(n4866), .B0(n5439), .B1(n4838), .Y(n3584) );
  OAI22XL U4240 ( .A0(n5395), .A1(n2946), .B0(n5490), .B1(n2949), .Y(n3583) );
  OAI22XL U4241 ( .A0(n5431), .A1(n4865), .B0(n5647), .B1(n4809), .Y(n3590) );
  OAI22XL U4242 ( .A0(n5720), .A1(n2947), .B0(n5725), .B1(n3226), .Y(n3589) );
  OAI22XL U4243 ( .A0(n5580), .A1(n4860), .B0(n5728), .B1(n2948), .Y(n3588) );
  OAI22XL U4244 ( .A0(n5719), .A1(n2944), .B0(n5404), .B1(n3623), .Y(n3587) );
  OAI22XL U4245 ( .A0(n3661), .A1(n3662), .B0(n3653), .B1(n3654), .Y(n3641) );
  OAI22XL U4246 ( .A0(n5707), .A1(n4866), .B0(n5438), .B1(n3623), .Y(n3615) );
  OAI22XL U4247 ( .A0(n5727), .A1(n2949), .B0(n5383), .B1(n4838), .Y(n3614) );
  AOI2BB2X1 U4248 ( .B0(stringdata_ff[37]), .B1(n4312), .A0N(n5556), .A1N(
        n4809), .Y(n3596) );
  INVXL U4249 ( .A(n3598), .Y(n3611) );
  OAI22XL U4250 ( .A0(n5710), .A1(n4865), .B0(n5417), .B1(n4856), .Y(n3604) );
  OAI22XL U4251 ( .A0(n5532), .A1(n2950), .B0(n5723), .B1(n3226), .Y(n3603) );
  OAI22XL U4252 ( .A0(n5401), .A1(n2945), .B0(n3628), .B1(n3600), .Y(n3602) );
  OAI22XL U4253 ( .A0(n5600), .A1(n2947), .B0(n5498), .B1(n4860), .Y(n3601) );
  NOR4X1 U4254 ( .A(n3604), .B(n3603), .C(n3602), .D(n3601), .Y(n3609) );
  OAI22XL U4255 ( .A0(n5409), .A1(n2944), .B0(n5511), .B1(n2948), .Y(n3607) );
  OAI22XL U4256 ( .A0(n3605), .A1(n3628), .B0(n5721), .B1(n2946), .Y(n3606) );
  OAI211XL U4257 ( .A0(n3611), .A1(n3610), .B0(n3609), .C0(n3608), .Y(n3612)
         );
  INVXL U4258 ( .A(n3616), .Y(n3617) );
  AOI211XL U4259 ( .A0(n3618), .A1(n3617), .B0(cal_cnt[4]), .C0(cal_cnt[0]), 
        .Y(n3637) );
  AOI2BB2X1 U4260 ( .B0(stringdata_ff[48]), .B1(n4828), .A0N(n5442), .A1N(
        n4860), .Y(n3635) );
  OAI22XL U4261 ( .A0(n5398), .A1(n4865), .B0(n5426), .B1(n4838), .Y(n3620) );
  OAI22XL U4262 ( .A0(n5392), .A1(n4866), .B0(n5485), .B1(n2945), .Y(n3619) );
  OAI22XL U4263 ( .A0(n5660), .A1(n4809), .B0(n5444), .B1(n2949), .Y(n3627) );
  OAI22XL U4264 ( .A0(n5595), .A1(n4876), .B0(n5388), .B1(n3623), .Y(n3626) );
  OAI22XL U4265 ( .A0(n5403), .A1(n3485), .B0(n5584), .B1(n2944), .Y(n3625) );
  OAI22XL U4266 ( .A0(n5673), .A1(n4867), .B0(n5429), .B1(n2943), .Y(n3624) );
  OAI22XL U4267 ( .A0(n5468), .A1(n2950), .B0(n5722), .B1(n2946), .Y(n3631) );
  OAI22XL U4268 ( .A0(n3629), .A1(n3628), .B0(n5459), .B1(n3226), .Y(n3630) );
  OAI22XL U4269 ( .A0(n3657), .A1(n3658), .B0(n3655), .B1(n3656), .Y(n3640) );
  OAI31XL U4270 ( .A0(n3648), .A1(n3647), .A2(n3646), .B0(n3645), .Y(n3669) );
  AO22X1 U4271 ( .A0(n3652), .A1(n3651), .B0(n3650), .B1(n3649), .Y(n3667) );
  AO22X1 U4272 ( .A0(n3656), .A1(n3655), .B0(n3654), .B1(n3653), .Y(n3666) );
  OAI2BB2XL U4273 ( .B0(n3660), .B1(n3659), .A0N(n3658), .A1N(n3657), .Y(n3665) );
  OAI2BB2XL U4274 ( .B0(n3671), .B1(n3663), .A0N(n3662), .A1N(n3661), .Y(n3664) );
  OAI2BB2XL U4275 ( .B0(n3671), .B1(n3670), .A0N(n3669), .A1N(n3668), .Y(n3892) );
  OAI22XL U4276 ( .A0(n3673), .A1(n5480), .B0(n5419), .B1(n3672), .Y(n3676) );
  NOR2BX1 U4277 ( .AN(n3678), .B(n4454), .Y(n3674) );
  AO21X1 U4278 ( .A0(pat_cnt[2]), .A1(n3676), .B0(n3674), .Y(n3675) );
  AOI222XL U4279 ( .A0(n4450), .A1(n3678), .B0(n4450), .B1(n3677), .C0(n3678), 
        .C1(n3677), .Y(n3680) );
  OAI22XL U4280 ( .A0(n3681), .A1(n4945), .B0(n4692), .B1(n3680), .Y(n3689) );
  AOI222XL U4281 ( .A0(n4220), .A1(pattern_ff[17]), .B0(n4237), .B1(
        pattern_ff[9]), .C0(n4236), .C1(pattern_ff[1]), .Y(n3679) );
  OAI22XL U4282 ( .A0(n3679), .A1(n4692), .B0(n4690), .B1(n5632), .Y(n3876) );
  AOI222XL U4283 ( .A0(n4220), .A1(pattern_ff[22]), .B0(n4237), .B1(
        pattern_ff[14]), .C0(n4236), .C1(pattern_ff[6]), .Y(n3900) );
  OAI21XL U4284 ( .A0(n3681), .A1(n4672), .B0(n4682), .Y(n3685) );
  OAI22XL U4285 ( .A0(n3900), .A1(n3683), .B0(n3685), .B1(n5653), .Y(n3889) );
  AOI2BB2X1 U4286 ( .B0(n4220), .B1(pattern_ff[23]), .A0N(n4250), .A1N(n5479), 
        .Y(n3919) );
  OA21XL U4287 ( .A0(n4249), .A1(n5542), .B0(n3919), .Y(n3682) );
  OA22X1 U4288 ( .A0(n3682), .A1(n3683), .B0(n5569), .B1(n3685), .Y(n3864) );
  AOI222XL U4289 ( .A0(n4220), .A1(pattern_ff[16]), .B0(n4237), .B1(
        pattern_ff[8]), .C0(n4236), .C1(pattern_ff[0]), .Y(n3913) );
  OA22X1 U4290 ( .A0(n3913), .A1(n3683), .B0(n3685), .B1(n5658), .Y(n3871) );
  NAND2XL U4291 ( .A(n4236), .B(pattern_ff[4]), .Y(n3923) );
  AOI2BB2X1 U4292 ( .B0(n4220), .B1(pattern_ff[20]), .A0N(n4250), .A1N(n5575), 
        .Y(n3926) );
  AO21X1 U4293 ( .A0(n3923), .A1(n3926), .B0(n3683), .Y(n3684) );
  OA21XL U4294 ( .A0(n3685), .A1(n5572), .B0(n3684), .Y(n3866) );
  AO22X1 U4295 ( .A0(n4220), .A1(pattern_ff[18]), .B0(n4236), .B1(
        pattern_ff[2]), .Y(n3932) );
  AO21X1 U4296 ( .A0(n4237), .A1(pattern_ff[10]), .B0(n3932), .Y(n3686) );
  AO22X1 U4297 ( .A0(n4682), .A1(pattern_ff[26]), .B0(n5062), .B1(n3686), .Y(
        n3878) );
  NOR2XL U4298 ( .A(n4250), .B(n5535), .Y(n3947) );
  OAI221XL U4299 ( .A0(n4220), .A1(n3947), .B0(pattern_ff[19]), .B1(n3947), 
        .C0(n5062), .Y(n3687) );
  OAI211XL U4300 ( .A0(n5604), .A1(n4690), .B0(n3953), .C0(n3687), .Y(n3877)
         );
  AOI2BB2X1 U4301 ( .B0(n4236), .B1(pattern_ff[5]), .A0N(n4250), .A1N(n5662), 
        .Y(n3940) );
  OAI32XL U4302 ( .A0(n4689), .A1(n4692), .A2(n5546), .B0(n3940), .B1(n4692), 
        .Y(n3688) );
  OR4X2 U4303 ( .A(n3881), .B(n3869), .C(n3859), .D(n3880), .Y(n3888) );
  OAI22XL U4304 ( .A0(n5444), .A1(n2948), .B0(n5598), .B1(n4868), .Y(n3692) );
  OAI22XL U4305 ( .A0(n5722), .A1(n3226), .B0(n5496), .B1(n2946), .Y(n3691) );
  OAI22XL U4306 ( .A0(n5527), .A1(n4875), .B0(n5388), .B1(n4866), .Y(n3690) );
  NOR3XL U4307 ( .A(n3692), .B(n3691), .C(n3690), .Y(n3708) );
  OAI22XL U4308 ( .A0(n5403), .A1(n2950), .B0(n5461), .B1(n3220), .Y(n3696) );
  OAI22XL U4309 ( .A0(n5414), .A1(n3485), .B0(n5629), .B1(n4859), .Y(n3695) );
  OAI22XL U4310 ( .A0(n5468), .A1(n4809), .B0(n5609), .B1(n4858), .Y(n3694) );
  OAI22XL U4311 ( .A0(n5649), .A1(n4867), .B0(n5459), .B1(n2949), .Y(n3693) );
  OAI22XL U4312 ( .A0(n5625), .A1(n4847), .B0(n5526), .B1(n4829), .Y(n3700) );
  OAI22XL U4313 ( .A0(n5442), .A1(n2945), .B0(n5507), .B1(n4876), .Y(n3699) );
  OAI22XL U4314 ( .A0(n5715), .A1(n3233), .B0(n5423), .B1(n4874), .Y(n3698) );
  OAI22XL U4315 ( .A0(n5537), .A1(n4873), .B0(n5614), .B1(n3223), .Y(n3697) );
  OAI22XL U4316 ( .A0(n5426), .A1(n4860), .B0(n5584), .B1(n2947), .Y(n3704) );
  OAI22XL U4317 ( .A0(n5522), .A1(n4857), .B0(n5398), .B1(n4838), .Y(n3703) );
  OAI22XL U4318 ( .A0(n5392), .A1(n4865), .B0(n5485), .B1(n2943), .Y(n3702) );
  OAI22XL U4319 ( .A0(n5429), .A1(n2944), .B0(n5595), .B1(n4852), .Y(n3701) );
  NAND4XL U4320 ( .A(n3708), .B(n3707), .C(n3706), .D(n3705), .Y(n3868) );
  OAI22XL U4321 ( .A0(n5724), .A1(n2949), .B0(n5582), .B1(n4866), .Y(n3711) );
  OAI22XL U4322 ( .A0(n5428), .A1(n4865), .B0(n5393), .B1(n4838), .Y(n3710) );
  OAI22XL U4323 ( .A0(n5626), .A1(n4859), .B0(n5486), .B1(n2944), .Y(n3709) );
  OAI22XL U4324 ( .A0(n5483), .A1(n3485), .B0(n5447), .B1(n4857), .Y(n3715) );
  OAI22XL U4325 ( .A0(n5432), .A1(n2945), .B0(n5391), .B1(n3226), .Y(n3714) );
  OAI22XL U4326 ( .A0(n5596), .A1(n4829), .B0(n5531), .B1(n4809), .Y(n3713) );
  OAI22XL U4327 ( .A0(n5620), .A1(n3233), .B0(n5515), .B1(n4875), .Y(n3712) );
  OAI22XL U4328 ( .A0(n5402), .A1(n2943), .B0(n5506), .B1(n3220), .Y(n3719) );
  OAI22XL U4329 ( .A0(n5413), .A1(n2950), .B0(n5453), .B1(n2948), .Y(n3718) );
  OAI22XL U4330 ( .A0(n5460), .A1(n4847), .B0(n5607), .B1(n4874), .Y(n3717) );
  OAI22XL U4331 ( .A0(n5452), .A1(n2947), .B0(n5613), .B1(n3223), .Y(n3716) );
  OAI22XL U4332 ( .A0(n5615), .A1(n4858), .B0(n5411), .B1(n4860), .Y(n3723) );
  OAI22XL U4333 ( .A0(n5482), .A1(n2946), .B0(n5469), .B1(n4868), .Y(n3722) );
  OAI22XL U4334 ( .A0(n5529), .A1(n4873), .B0(n5654), .B1(n4867), .Y(n3721) );
  OAI22XL U4335 ( .A0(n5465), .A1(n4852), .B0(n5651), .B1(n4876), .Y(n3720) );
  NAND4XL U4336 ( .A(n3727), .B(n3726), .C(n3725), .D(n3724), .Y(n3858) );
  AO22X1 U4337 ( .A0(n3868), .A1(n3869), .B0(n3858), .B1(n3859), .Y(n3848) );
  OAI22XL U4338 ( .A0(n5593), .A1(n2944), .B0(n5481), .B1(n2943), .Y(n3731) );
  OAI22XL U4339 ( .A0(n5470), .A1(n4809), .B0(n5536), .B1(n4873), .Y(n3730) );
  OAI22XL U4340 ( .A0(n5439), .A1(n4860), .B0(n5616), .B1(n3233), .Y(n3729) );
  NOR3XL U4341 ( .A(n3731), .B(n3730), .C(n3729), .Y(n3747) );
  OAI22XL U4342 ( .A0(n5510), .A1(n4876), .B0(n5446), .B1(n2950), .Y(n3735) );
  OAI22XL U4343 ( .A0(n5467), .A1(n4875), .B0(n5725), .B1(n2949), .Y(n3734) );
  OAI22XL U4344 ( .A0(n5638), .A1(n4868), .B0(n5490), .B1(n2948), .Y(n3733) );
  OAI22XL U4345 ( .A0(n5580), .A1(n2945), .B0(n5418), .B1(n4857), .Y(n3732) );
  OAI22XL U4346 ( .A0(n5619), .A1(n4829), .B0(n5404), .B1(n4866), .Y(n3739) );
  OAI22XL U4347 ( .A0(n5431), .A1(n4838), .B0(n5635), .B1(n3223), .Y(n3738) );
  OAI22XL U4348 ( .A0(n5528), .A1(n4859), .B0(n5671), .B1(n4867), .Y(n3737) );
  OAI22XL U4349 ( .A0(n5720), .A1(n2946), .B0(n5518), .B1(n4847), .Y(n3736) );
  OAI22XL U4350 ( .A0(n5487), .A1(n4865), .B0(n5719), .B1(n2947), .Y(n3743) );
  OAI22XL U4351 ( .A0(n5516), .A1(n4858), .B0(n5454), .B1(n3220), .Y(n3742) );
  OAI22XL U4352 ( .A0(n5395), .A1(n3226), .B0(n5608), .B1(n4874), .Y(n3741) );
  OAI22XL U4353 ( .A0(n5618), .A1(n4852), .B0(n5728), .B1(n3485), .Y(n3740) );
  OAI22XL U4354 ( .A0(n5450), .A1(n3233), .B0(n5587), .B1(n2946), .Y(n3750) );
  OAI22XL U4355 ( .A0(n5437), .A1(n2947), .B0(n5591), .B1(n4865), .Y(n3749) );
  OAI22XL U4356 ( .A0(n5410), .A1(n3226), .B0(n5592), .B1(n4847), .Y(n3748) );
  NOR3XL U4357 ( .A(n3750), .B(n3749), .C(n3748), .Y(n3766) );
  OAI22XL U4358 ( .A0(n5508), .A1(n4858), .B0(n5612), .B1(n3223), .Y(n3754) );
  OAI22XL U4359 ( .A0(n5396), .A1(n2949), .B0(n5489), .B1(n4866), .Y(n3753) );
  OAI22XL U4360 ( .A0(n5464), .A1(n4859), .B0(n5631), .B1(n4868), .Y(n3752) );
  OAI22XL U4361 ( .A0(n5622), .A1(n4852), .B0(n5709), .B1(n4838), .Y(n3751) );
  OAI22XL U4362 ( .A0(n5617), .A1(n4876), .B0(n5440), .B1(n3485), .Y(n3758) );
  OAI22XL U4363 ( .A0(n5394), .A1(n2944), .B0(n5533), .B1(n4857), .Y(n3757) );
  OAI22XL U4364 ( .A0(n5400), .A1(n2943), .B0(n5491), .B1(n2950), .Y(n3756) );
  OAI22XL U4365 ( .A0(n5466), .A1(n4873), .B0(n5544), .B1(n4867), .Y(n3755) );
  NOR4X1 U4366 ( .A(n3758), .B(n3757), .C(n3756), .D(n3755), .Y(n3764) );
  OAI22XL U4367 ( .A0(n5463), .A1(n4875), .B0(n5505), .B1(n2948), .Y(n3762) );
  OAI22XL U4368 ( .A0(n5713), .A1(n4860), .B0(n5630), .B1(n4874), .Y(n3761) );
  OAI22XL U4369 ( .A0(n5519), .A1(n4809), .B0(n5633), .B1(n3220), .Y(n3760) );
  OAI22XL U4370 ( .A0(n5514), .A1(n4829), .B0(n5389), .B1(n2945), .Y(n3759) );
  AO22X1 U4371 ( .A0(n3862), .A1(n3890), .B0(n3863), .B1(n3864), .Y(n3847) );
  OAI22XL U4372 ( .A0(n5509), .A1(n4876), .B0(n5605), .B1(n4868), .Y(n3769) );
  OAI22XL U4373 ( .A0(n5448), .A1(n2943), .B0(n5597), .B1(n4829), .Y(n3768) );
  OAI22XL U4374 ( .A0(n5407), .A1(n4857), .B0(n5521), .B1(n4859), .Y(n3767) );
  NOR3XL U4375 ( .A(n3769), .B(n3768), .C(n3767), .Y(n3786) );
  OAI22XL U4376 ( .A0(n5430), .A1(n2949), .B0(n5718), .B1(n2947), .Y(n3774) );
  OAI22XL U4377 ( .A0(n5443), .A1(n3226), .B0(n5390), .B1(n2946), .Y(n3773) );
  OAI22XL U4378 ( .A0(n5579), .A1(n4865), .B0(n5424), .B1(n4875), .Y(n3772) );
  OAI22XL U4379 ( .A0(n5501), .A1(n2950), .B0(n5601), .B1(n4847), .Y(n3771) );
  OAI22XL U4380 ( .A0(n5397), .A1(n3485), .B0(n5456), .B1(n3220), .Y(n3778) );
  OAI22XL U4381 ( .A0(n5416), .A1(n3223), .B0(n5705), .B1(n4874), .Y(n3777) );
  OAI22XL U4382 ( .A0(n5623), .A1(n4873), .B0(n5493), .B1(n2948), .Y(n3776) );
  OAI22XL U4383 ( .A0(n5406), .A1(n2944), .B0(n5708), .B1(n4838), .Y(n3775) );
  OAI22XL U4384 ( .A0(n5543), .A1(n4867), .B0(n5588), .B1(n4852), .Y(n3782) );
  OAI22XL U4385 ( .A0(n5523), .A1(n4809), .B0(n5624), .B1(n3233), .Y(n3781) );
  OAI22XL U4386 ( .A0(n5484), .A1(n2945), .B0(n5583), .B1(n4866), .Y(n3780) );
  OAI22XL U4387 ( .A0(n5636), .A1(n4858), .B0(n5712), .B1(n4860), .Y(n3779) );
  OAI22XL U4388 ( .A0(n5409), .A1(n2947), .B0(n5628), .B1(n4829), .Y(n3789) );
  OAI22XL U4389 ( .A0(n5498), .A1(n2945), .B0(n5438), .B1(n4866), .Y(n3788) );
  OAI22XL U4390 ( .A0(n5655), .A1(n4867), .B0(n5723), .B1(n2949), .Y(n3787) );
  NOR3XL U4391 ( .A(n3789), .B(n3788), .C(n3787), .Y(n3805) );
  OAI22XL U4392 ( .A0(n5401), .A1(n2943), .B0(n5511), .B1(n3485), .Y(n3793) );
  OAI22XL U4393 ( .A0(n5721), .A1(n3226), .B0(n5611), .B1(n4858), .Y(n3792) );
  OAI22XL U4394 ( .A0(n5462), .A1(n4847), .B0(n5710), .B1(n4838), .Y(n3791) );
  OAI22XL U4395 ( .A0(n5520), .A1(n3223), .B0(n5457), .B1(n4857), .Y(n3790) );
  OAI22XL U4396 ( .A0(n5415), .A1(n4859), .B0(n5727), .B1(n2948), .Y(n3797) );
  OAI22XL U4397 ( .A0(n5532), .A1(n4809), .B0(n5707), .B1(n4865), .Y(n3796) );
  OAI22XL U4398 ( .A0(n5621), .A1(n4876), .B0(n5458), .B1(n3220), .Y(n3795) );
  OAI22XL U4399 ( .A0(n5714), .A1(n3233), .B0(n5600), .B1(n2946), .Y(n3794) );
  OAI22XL U4400 ( .A0(n5451), .A1(n2944), .B0(n5474), .B1(n4875), .Y(n3801) );
  OAI22XL U4401 ( .A0(n5627), .A1(n4873), .B0(n5383), .B1(n4860), .Y(n3800) );
  OAI22XL U4402 ( .A0(n5502), .A1(n2950), .B0(n5565), .B1(n4868), .Y(n3799) );
  OAI22XL U4403 ( .A0(n5566), .A1(n4852), .B0(n5417), .B1(n4874), .Y(n3798) );
  AO22X1 U4404 ( .A0(n3870), .A1(n3871), .B0(n3865), .B1(n3866), .Y(n3846) );
  OAI22XL U4405 ( .A0(n5513), .A1(n3233), .B0(n5602), .B1(n4829), .Y(n3808) );
  OAI22XL U4406 ( .A0(n5408), .A1(n2947), .B0(n5455), .B1(n4868), .Y(n3807) );
  OAI22XL U4407 ( .A0(n5726), .A1(n3223), .B0(n5538), .B1(n4858), .Y(n3806) );
  NOR3XL U4408 ( .A(n3808), .B(n3807), .C(n3806), .Y(n3824) );
  OAI22XL U4409 ( .A0(n5640), .A1(n4809), .B0(n5503), .B1(n4866), .Y(n3812) );
  OAI22XL U4410 ( .A0(n5567), .A1(n4859), .B0(n5475), .B1(n4847), .Y(n3811) );
  OAI22XL U4411 ( .A0(n5445), .A1(n2946), .B0(n5637), .B1(n3220), .Y(n3810) );
  OAI22XL U4412 ( .A0(n5405), .A1(n2949), .B0(n5553), .B1(n4867), .Y(n3809) );
  OAI22XL U4413 ( .A0(n5441), .A1(n4876), .B0(n5586), .B1(n2948), .Y(n3816) );
  OAI22XL U4414 ( .A0(n5706), .A1(n4865), .B0(n5412), .B1(n4875), .Y(n3815) );
  OAI22XL U4415 ( .A0(n5590), .A1(n3485), .B0(n5497), .B1(n4838), .Y(n3814) );
  OAI22XL U4416 ( .A0(n5499), .A1(n2950), .B0(n5729), .B1(n4873), .Y(n3813) );
  OAI22XL U4417 ( .A0(n5435), .A1(n3226), .B0(n5585), .B1(n4860), .Y(n3820) );
  OAI22XL U4418 ( .A0(n5433), .A1(n2943), .B0(n5386), .B1(n3825), .Y(n3819) );
  OAI22XL U4419 ( .A0(n5530), .A1(n4852), .B0(n5716), .B1(n2944), .Y(n3818) );
  OAI22XL U4420 ( .A0(n5517), .A1(n4857), .B0(n5606), .B1(n4874), .Y(n3817) );
  OAI22XL U4421 ( .A0(n5421), .A1(n2944), .B0(n5387), .B1(n3226), .Y(n3828) );
  OAI22XL U4422 ( .A0(n5449), .A1(n2950), .B0(n5385), .B1(n2948), .Y(n3827) );
  OAI22XL U4423 ( .A0(n5399), .A1(n2945), .B0(n5589), .B1(n3485), .Y(n3826) );
  OAI22XL U4424 ( .A0(n5639), .A1(n4875), .B0(n5512), .B1(n4858), .Y(n3832) );
  OAI22XL U4425 ( .A0(n5711), .A1(n4868), .B0(n5610), .B1(n4857), .Y(n3831) );
  OAI22XL U4426 ( .A0(n5504), .A1(n3233), .B0(n5427), .B1(n2949), .Y(n3830) );
  OAI22XL U4427 ( .A0(n5494), .A1(n4859), .B0(n5471), .B1(n4873), .Y(n3829) );
  OAI22XL U4428 ( .A0(n5434), .A1(n2947), .B0(n5603), .B1(n4852), .Y(n3836) );
  OAI22XL U4429 ( .A0(n5599), .A1(n4829), .B0(n5492), .B1(n4847), .Y(n3835) );
  OAI22XL U4430 ( .A0(n5545), .A1(n4867), .B0(n5581), .B1(n4866), .Y(n3834) );
  OAI22XL U4431 ( .A0(n5384), .A1(n4865), .B0(n5641), .B1(n4874), .Y(n3833) );
  OAI22XL U4432 ( .A0(n5488), .A1(n2943), .B0(n5382), .B1(n2946), .Y(n3840) );
  OAI22XL U4433 ( .A0(n5524), .A1(n4809), .B0(n5594), .B1(n3220), .Y(n3839) );
  OAI22XL U4434 ( .A0(n5436), .A1(n4838), .B0(n5500), .B1(n3223), .Y(n3838) );
  OAI22XL U4435 ( .A0(n5422), .A1(n4860), .B0(n5717), .B1(n4876), .Y(n3837) );
  AO22X1 U4436 ( .A0(n3867), .A1(n3880), .B0(n3860), .B1(n3861), .Y(n3845) );
  INVXL U4437 ( .A(n4905), .Y(n4630) );
  OAI21XL U4438 ( .A0(n3850), .A1(n4626), .B0(n3849), .Y(n3857) );
  OAI22XL U4439 ( .A0(cal_cnt[2]), .A1(n5473), .B0(n5571), .B1(cal_cnt[3]), 
        .Y(n3855) );
  OAI221XL U4440 ( .A0(cal_cnt[4]), .A1(n4891), .B0(n5420), .B1(n3850), .C0(
        string_cnt_max[4]), .Y(n3854) );
  OAI22XL U4441 ( .A0(n4409), .A1(n3851), .B0(cal_cnt[1]), .B1(n5574), .Y(
        n3896) );
  AOI222XL U4442 ( .A0(cal_cnt[2]), .A1(string_cnt_max[2]), .B0(cal_cnt[2]), 
        .B1(n3896), .C0(string_cnt_max[2]), .C1(n3896), .Y(n3852) );
  AO21X1 U4443 ( .A0(n5578), .A1(n3855), .B0(n3852), .Y(n3853) );
  OAI22XL U4444 ( .A0(n3861), .A1(n3860), .B0(n3859), .B1(n3858), .Y(n3875) );
  OAI22XL U4445 ( .A0(n3864), .A1(n3863), .B0(n3890), .B1(n3862), .Y(n3874) );
  OAI22XL U4446 ( .A0(n3880), .A1(n3867), .B0(n3866), .B1(n3865), .Y(n3873) );
  OAI22XL U4447 ( .A0(n3871), .A1(n3870), .B0(n3869), .B1(n3868), .Y(n3872) );
  NAND3BX1 U4448 ( .AN(n3881), .B(n3880), .C(n3879), .Y(n3882) );
  AOI222XL U4449 ( .A0(n3896), .A1(n3895), .B0(n5571), .B1(string_cnt_max[2]), 
        .C0(n5473), .C1(string_cnt_max[3]), .Y(n3897) );
  NOR2XL U4450 ( .A(n5335), .B(star_f), .Y(n5074) );
  OAI22XL U4451 ( .A0(n4944), .A1(n5668), .B0(n4229), .B1(n5555), .Y(n3902) );
  OAI22XL U4452 ( .A0(n3900), .A1(n5563), .B0(n4248), .B1(n5650), .Y(n3901) );
  ADDHXL U4453 ( .A(N1675), .B(N1594), .CO(n3905), .S(n5023) );
  AO22X1 U4454 ( .A0(n3904), .A1(pat_cnt[1]), .B0(pat_cnt[0]), .B1(N1594), .Y(
        n3903) );
  OAI21XL U4455 ( .A0(n3904), .A1(pat_cnt[1]), .B0(n3903), .Y(n3906) );
  NOR2XL U4456 ( .A(n3906), .B(n5028), .Y(n3907) );
  OAI2BB2XL U4457 ( .B0(pat_cnt[2]), .B1(n3907), .A0N(n3906), .A1N(n5028), .Y(
        n3908) );
  OA21XL U4458 ( .A0(n5577), .A1(n5033), .B0(n3908), .Y(n3911) );
  ADDHXL U4459 ( .A(N1804), .B(n3909), .CO(n3910), .S(n5033) );
  OA22X1 U4460 ( .A0(n3931), .A1(n5676), .B0(n3912), .B1(n3929), .Y(n4183) );
  OAI22XL U4461 ( .A0(n4944), .A1(n5551), .B0(n4229), .B1(n5665), .Y(n3915) );
  OAI22XL U4462 ( .A0(n3913), .A1(n5563), .B0(n4248), .B1(n5539), .Y(n3914) );
  OA22X1 U4463 ( .A0(n5674), .A1(n3931), .B0(n3916), .B1(n3929), .Y(n4060) );
  NAND2XL U4464 ( .A(N1802), .B(n4236), .Y(n3917) );
  OAI22XL U4465 ( .A0(n4247), .A1(n5569), .B0(n3917), .B1(n5542), .Y(n3921) );
  AOI2BB2X1 U4466 ( .B0(n4251), .B1(pattern_ff[44]), .A0N(n4944), .A1N(n5557), 
        .Y(n3918) );
  OAI21XL U4467 ( .A0(n3919), .A1(n5563), .B0(n3918), .Y(n3920) );
  OA22X1 U4468 ( .A0(n3931), .A1(n5697), .B0(n3922), .B1(n3929), .Y(n4185) );
  OAI22XL U4469 ( .A0(n5563), .A1(n3923), .B0(n4229), .B1(n5554), .Y(n3928) );
  AOI2BB2X1 U4470 ( .B0(n3924), .B1(pattern_ff[27]), .A0N(n4944), .A1N(n5678), 
        .Y(n3925) );
  OAI21XL U4471 ( .A0(n3926), .A1(n5563), .B0(n3925), .Y(n3927) );
  OA22X1 U4472 ( .A0(n3931), .A1(n5675), .B0(n3930), .B1(n3929), .Y(n4181) );
  NOR2XL U4473 ( .A(n4250), .B(n5525), .Y(n3933) );
  OAI21XL U4474 ( .A0(n3933), .A1(n3932), .B0(N1802), .Y(n3934) );
  OAI21XL U4475 ( .A0(n4944), .A1(n5695), .B0(n3934), .Y(n3935) );
  AOI211XL U4476 ( .A0(n4251), .A1(pattern_ff[39]), .B0(n3942), .C0(n3935), 
        .Y(n3936) );
  OAI22XL U4477 ( .A0(n3939), .A1(n5652), .B0(n4241), .B1(n5541), .Y(n3937) );
  OAI22XL U4478 ( .A0(n3939), .A1(n5534), .B0(n3957), .B1(n5670), .Y(n3946) );
  OAI22XL U4479 ( .A0(n4944), .A1(n5661), .B0(n3940), .B1(n5563), .Y(n3941) );
  OAI21XL U4480 ( .A0(n3942), .A1(n3941), .B0(n5062), .Y(n3944) );
  NAND2XL U4481 ( .A(n4682), .B(pattern_ff[52]), .Y(n3943) );
  AOI22XL U4482 ( .A0(n4682), .A1(pattern_ff[51]), .B0(n4242), .B1(
        pattern_ff[19]), .Y(n3952) );
  OAI22XL U4483 ( .A0(n4944), .A1(n5680), .B0(n4248), .B1(n5547), .Y(n3950) );
  OAI21XL U4484 ( .A0(n4247), .A1(n5604), .B0(n3955), .Y(n3949) );
  OAI2BB2XL U4485 ( .B0(n4229), .B1(n5663), .A0N(N1802), .A1N(n3947), .Y(n3948) );
  OAI31XL U4486 ( .A0(n3950), .A1(n3949), .A2(n3948), .B0(n5062), .Y(n3951) );
  AOI22XL U4487 ( .A0(n4252), .A1(pattern_ff[45]), .B0(n4238), .B1(
        pattern_ff[31]), .Y(n3954) );
  OAI22XL U4488 ( .A0(n4690), .A1(n5677), .B0(n3957), .B1(n5558), .Y(n3959) );
  OAI22XL U4489 ( .A0(n4241), .A1(n5632), .B0(n4259), .B1(n5549), .Y(n3958) );
  OAI31XL U4490 ( .A0(n5563), .A1(n4249), .A2(n4462), .B0(n3961), .Y(n4167) );
  NAND4BX1 U4491 ( .AN(n4190), .B(n4193), .C(n4192), .D(n3962), .Y(n4175) );
  OAI22XL U4492 ( .A0(n4147), .A1(n5523), .B0(n4149), .B1(n5648), .Y(n3969) );
  NAND2X1 U4493 ( .A(n5562), .B(n4623), .Y(n4407) );
  OAI2BB2XL U4494 ( .B0(n4152), .B1(n5623), .A0N(n4408), .A1N(
        stringdata_ff[106]), .Y(n3968) );
  OAI22XL U4495 ( .A0(n4412), .A1(n5543), .B0(n4151), .B1(n5686), .Y(n3967) );
  NAND2X1 U4496 ( .A(cal_cnt[0]), .B(n4623), .Y(n4148) );
  OAI22XL U4497 ( .A0(n4150), .A1(n5501), .B0(n4148), .B1(n5690), .Y(n3966) );
  NAND3XL U4498 ( .A(n5564), .B(n5473), .C(n5420), .Y(n4157) );
  OAI22XL U4499 ( .A0(n4147), .A1(n5708), .B0(n4151), .B1(n5597), .Y(n3973) );
  OAI22XL U4500 ( .A0(n4149), .A1(n5712), .B0(n4152), .B1(n5636), .Y(n3972) );
  OAI22XL U4501 ( .A0(n4150), .A1(n5579), .B0(n4407), .B1(n5424), .Y(n3971) );
  OAI22XL U4502 ( .A0(n4148), .A1(n5484), .B0(n4412), .B1(n5605), .Y(n3970) );
  NOR4XL U4503 ( .A(n3973), .B(n3972), .C(n3971), .D(n3970), .Y(n3975) );
  OAI22XL U4504 ( .A0(n3975), .A1(n4165), .B0(n4140), .B1(n5583), .Y(n3988) );
  OAI22XL U4505 ( .A0(n4147), .A1(n5430), .B0(n4152), .B1(n5407), .Y(n3979) );
  OAI22XL U4506 ( .A0(n4150), .A1(n5443), .B0(n4149), .B1(n5493), .Y(n3978) );
  OAI22XL U4507 ( .A0(n4148), .A1(n5397), .B0(n4407), .B1(n5601), .Y(n3977) );
  OAI22XL U4508 ( .A0(n4412), .A1(n5416), .B0(n4151), .B1(n5456), .Y(n3976) );
  NOR4XL U4509 ( .A(n3979), .B(n3978), .C(n3977), .D(n3976), .Y(n3986) );
  OAI22XL U4510 ( .A0(n4407), .A1(n5521), .B0(n4152), .B1(n5624), .Y(n3984) );
  OAI22XL U4511 ( .A0(n4149), .A1(n5718), .B0(n4151), .B1(n5588), .Y(n3983) );
  OAI22XL U4512 ( .A0(n4150), .A1(n5448), .B0(n4147), .B1(n5406), .Y(n3982) );
  OAI22XL U4513 ( .A0(n4148), .A1(n5390), .B0(n4412), .B1(n5509), .Y(n3981) );
  OAI22XL U4514 ( .A0(n3986), .A1(n4141), .B0(n3985), .B1(n4159), .Y(n3987) );
  OAI21XL U4515 ( .A0(n3990), .A1(n4157), .B0(n3989), .Y(n4061) );
  OAI22XL U4516 ( .A0(n4148), .A1(n5445), .B0(n4151), .B1(n5530), .Y(n3994) );
  OAI22XL U4517 ( .A0(n4147), .A1(n5716), .B0(n4149), .B1(n5408), .Y(n3993) );
  OAI22XL U4518 ( .A0(n4150), .A1(n5433), .B0(n4407), .B1(n5567), .Y(n3992) );
  OAI22XL U4519 ( .A0(n4412), .A1(n5441), .B0(n4152), .B1(n5513), .Y(n3991) );
  OAI22XL U4520 ( .A0(n4150), .A1(n5706), .B0(n4149), .B1(n5585), .Y(n3998) );
  OAI22XL U4521 ( .A0(n4147), .A1(n5497), .B0(n4151), .B1(n5602), .Y(n3997) );
  OAI22XL U4522 ( .A0(n4148), .A1(n5386), .B0(n4152), .B1(n5538), .Y(n3996) );
  OAI22XL U4523 ( .A0(n4407), .A1(n5412), .B0(n4412), .B1(n5455), .Y(n3995) );
  NOR4XL U4524 ( .A(n3998), .B(n3997), .C(n3996), .D(n3995), .Y(n3999) );
  OAI22XL U4525 ( .A0(n3999), .A1(n4165), .B0(n4140), .B1(n5503), .Y(n4011) );
  OAI22XL U4526 ( .A0(n4148), .A1(n5590), .B0(n4407), .B1(n5475), .Y(n4003) );
  OAI22XL U4527 ( .A0(n4147), .A1(n5405), .B0(n4412), .B1(n5726), .Y(n4002) );
  OAI22XL U4528 ( .A0(n4150), .A1(n5435), .B0(n4149), .B1(n5586), .Y(n4001) );
  OAI22XL U4529 ( .A0(n4152), .A1(n5517), .B0(n4151), .B1(n5637), .Y(n4000) );
  NOR4XL U4530 ( .A(n4003), .B(n4002), .C(n4001), .D(n4000), .Y(n4009) );
  OAI22XL U4531 ( .A0(n4150), .A1(n5499), .B0(n4151), .B1(n5694), .Y(n4007) );
  OAI2BB2XL U4532 ( .B0(n4147), .B1(n5640), .A0N(n4408), .A1N(
        stringdata_ff[111]), .Y(n4006) );
  OAI22XL U4533 ( .A0(n4148), .A1(n5682), .B0(n4152), .B1(n5729), .Y(n4005) );
  OAI22XL U4534 ( .A0(n4149), .A1(n5657), .B0(n4412), .B1(n5553), .Y(n4004) );
  OAI22XL U4535 ( .A0(n4009), .A1(n4141), .B0(n4008), .B1(n4157), .Y(n4010) );
  OAI21XL U4536 ( .A0(n4013), .A1(n4159), .B0(n4012), .Y(n4062) );
  OAI22XL U4537 ( .A0(n4060), .A1(n4061), .B0(n4192), .B1(n4062), .Y(n4174) );
  OAI22XL U4538 ( .A0(n4147), .A1(n5436), .B0(n4407), .B1(n5639), .Y(n4017) );
  OAI22XL U4539 ( .A0(n4150), .A1(n5384), .B0(n4151), .B1(n5599), .Y(n4016) );
  OAI22XL U4540 ( .A0(n4149), .A1(n5422), .B0(n4152), .B1(n5512), .Y(n4015) );
  OAI22XL U4541 ( .A0(n4148), .A1(n5399), .B0(n4412), .B1(n5711), .Y(n4014) );
  OAI22XL U4542 ( .A0(n4412), .A1(n5500), .B0(n4151), .B1(n5594), .Y(n4021) );
  OAI22XL U4543 ( .A0(n4147), .A1(n5427), .B0(n4407), .B1(n5492), .Y(n4020) );
  OAI22XL U4544 ( .A0(n4148), .A1(n5589), .B0(n4149), .B1(n5385), .Y(n4019) );
  OAI22XL U4545 ( .A0(n4150), .A1(n5387), .B0(n4152), .B1(n5610), .Y(n4018) );
  NOR4XL U4546 ( .A(n4021), .B(n4020), .C(n4019), .D(n4018), .Y(n4022) );
  OAI22XL U4547 ( .A0(n4022), .A1(n4141), .B0(n4140), .B1(n5581), .Y(n4034) );
  OAI22XL U4548 ( .A0(n4149), .A1(n5434), .B0(n4152), .B1(n5504), .Y(n4026) );
  OAI22XL U4549 ( .A0(n4412), .A1(n5717), .B0(n4151), .B1(n5603), .Y(n4025) );
  OAI22XL U4550 ( .A0(n4150), .A1(n5488), .B0(n4148), .B1(n5382), .Y(n4024) );
  OAI22XL U4551 ( .A0(n4147), .A1(n5421), .B0(n4407), .B1(n5494), .Y(n4023) );
  NOR4XL U4552 ( .A(n4026), .B(n4025), .C(n4024), .D(n4023), .Y(n4032) );
  OAI22XL U4553 ( .A0(n4150), .A1(n5449), .B0(n4412), .B1(n5545), .Y(n4030) );
  OAI22XL U4554 ( .A0(n4147), .A1(n5524), .B0(n4149), .B1(n5659), .Y(n4029) );
  OAI2BB2XL U4555 ( .B0(n4148), .B1(n5692), .A0N(n4408), .A1N(
        stringdata_ff[112]), .Y(n4028) );
  OAI22XL U4556 ( .A0(n4152), .A1(n5471), .B0(n4151), .B1(n5672), .Y(n4027) );
  OAI22XL U4557 ( .A0(n4032), .A1(n4159), .B0(n4031), .B1(n4157), .Y(n4033) );
  OAI21XL U4558 ( .A0(n4036), .A1(n4165), .B0(n4035), .Y(n4182) );
  OAI22XL U4559 ( .A0(n4150), .A1(n5403), .B0(n4148), .B1(n5691), .Y(n4040) );
  OAI22XL U4560 ( .A0(n4147), .A1(n5468), .B0(n4149), .B1(n5660), .Y(n4039) );
  OAI2BB2XL U4561 ( .B0(n4412), .B1(n5649), .A0N(n4408), .A1N(
        stringdata_ff[108]), .Y(n4038) );
  OAI22XL U4562 ( .A0(n4152), .A1(n5537), .B0(n4151), .B1(n5673), .Y(n4037) );
  OAI22XL U4563 ( .A0(n4407), .A1(n5629), .B0(n4152), .B1(n5715), .Y(n4044) );
  OAI22XL U4564 ( .A0(n4147), .A1(n5429), .B0(n4412), .B1(n5507), .Y(n4043) );
  OAI22XL U4565 ( .A0(n4150), .A1(n5485), .B0(n4151), .B1(n5595), .Y(n4042) );
  OAI22XL U4566 ( .A0(n4148), .A1(n5496), .B0(n4149), .B1(n5584), .Y(n4041) );
  NOR4XL U4567 ( .A(n4044), .B(n4043), .C(n4042), .D(n4041), .Y(n4045) );
  OAI22XL U4568 ( .A0(n4045), .A1(n4159), .B0(n5388), .B1(n4140), .Y(n4057) );
  OAI22XL U4569 ( .A0(n4147), .A1(n5398), .B0(n4149), .B1(n5426), .Y(n4049) );
  OAI22XL U4570 ( .A0(n4148), .A1(n5442), .B0(n4412), .B1(n5598), .Y(n4048) );
  OAI22XL U4571 ( .A0(n4152), .A1(n5609), .B0(n4151), .B1(n5526), .Y(n4047) );
  OAI22XL U4572 ( .A0(n4150), .A1(n5392), .B0(n4407), .B1(n5527), .Y(n4046) );
  NOR4XL U4573 ( .A(n4049), .B(n4048), .C(n4047), .D(n4046), .Y(n4055) );
  OAI22XL U4574 ( .A0(n4148), .A1(n5414), .B0(n4147), .B1(n5459), .Y(n4053) );
  OAI22XL U4575 ( .A0(n4152), .A1(n5522), .B0(n4151), .B1(n5461), .Y(n4052) );
  OAI22XL U4576 ( .A0(n4149), .A1(n5444), .B0(n4407), .B1(n5625), .Y(n4051) );
  OAI22XL U4577 ( .A0(n4150), .A1(n5722), .B0(n4412), .B1(n5614), .Y(n4050) );
  OAI22XL U4578 ( .A0(n4055), .A1(n4165), .B0(n4054), .B1(n4141), .Y(n4056) );
  OAI21XL U4579 ( .A0(n4059), .A1(n4157), .B0(n4058), .Y(n4186) );
  AO22X1 U4580 ( .A0(n4182), .A1(n4183), .B0(n4186), .B1(n4193), .Y(n4171) );
  AO22X1 U4581 ( .A0(n4062), .A1(n4192), .B0(n4061), .B1(n4060), .Y(n4170) );
  OAI22XL U4582 ( .A0(n4152), .A1(n5450), .B0(n4151), .B1(n5622), .Y(n4066) );
  OAI22XL U4583 ( .A0(n4149), .A1(n5437), .B0(n4412), .B1(n5617), .Y(n4065) );
  OAI22XL U4584 ( .A0(n4150), .A1(n5400), .B0(n4148), .B1(n5587), .Y(n4064) );
  OAI22XL U4585 ( .A0(n4147), .A1(n5394), .B0(n4407), .B1(n5464), .Y(n4063) );
  OAI22XL U4586 ( .A0(n4150), .A1(n5410), .B0(n4412), .B1(n5612), .Y(n4070) );
  OAI22XL U4587 ( .A0(n4148), .A1(n5440), .B0(n4149), .B1(n5505), .Y(n4069) );
  OAI22XL U4588 ( .A0(n4147), .A1(n5396), .B0(n4151), .B1(n5633), .Y(n4068) );
  OAI22XL U4589 ( .A0(n4407), .A1(n5592), .B0(n4152), .B1(n5533), .Y(n4067) );
  NOR4XL U4590 ( .A(n4070), .B(n4069), .C(n4068), .D(n4067), .Y(n4071) );
  OAI22XL U4591 ( .A0(n4071), .A1(n4141), .B0(n4140), .B1(n5489), .Y(n4083) );
  OAI22XL U4592 ( .A0(n4147), .A1(n5519), .B0(n4149), .B1(n5644), .Y(n4075) );
  OAI22XL U4593 ( .A0(n4152), .A1(n5466), .B0(n4151), .B1(n5687), .Y(n4074) );
  OAI22XL U4594 ( .A0(n4148), .A1(n5681), .B0(n4412), .B1(n5544), .Y(n4073) );
  OAI2BB2XL U4595 ( .B0(n4150), .B1(n5491), .A0N(n4408), .A1N(
        stringdata_ff[113]), .Y(n4072) );
  OAI22XL U4596 ( .A0(n4147), .A1(n5709), .B0(n4151), .B1(n5514), .Y(n4079) );
  OAI22XL U4597 ( .A0(n4148), .A1(n5389), .B0(n4149), .B1(n5713), .Y(n4078) );
  OAI22XL U4598 ( .A0(n4150), .A1(n5591), .B0(n4407), .B1(n5463), .Y(n4077) );
  OAI22XL U4599 ( .A0(n4412), .A1(n5631), .B0(n4152), .B1(n5508), .Y(n4076) );
  OAI22XL U4600 ( .A0(n4081), .A1(n4157), .B0(n4080), .B1(n4165), .Y(n4082) );
  OAI21XL U4601 ( .A0(n4085), .A1(n4159), .B0(n4084), .Y(n4184) );
  OAI22XL U4602 ( .A0(n4150), .A1(n5402), .B0(n4151), .B1(n5465), .Y(n4089) );
  OAI22XL U4603 ( .A0(n4149), .A1(n5452), .B0(n4407), .B1(n5626), .Y(n4088) );
  OAI22XL U4604 ( .A0(n4148), .A1(n5482), .B0(n4152), .B1(n5620), .Y(n4087) );
  OAI22XL U4605 ( .A0(n4147), .A1(n5486), .B0(n4412), .B1(n5651), .Y(n4086) );
  OAI22XL U4606 ( .A0(n4147), .A1(n5724), .B0(n4407), .B1(n5460), .Y(n4093) );
  OAI22XL U4607 ( .A0(n4148), .A1(n5483), .B0(n4412), .B1(n5613), .Y(n4092) );
  OAI22XL U4608 ( .A0(n4150), .A1(n5391), .B0(n4149), .B1(n5453), .Y(n4091) );
  OAI22XL U4609 ( .A0(n4152), .A1(n5447), .B0(n4151), .B1(n5506), .Y(n4090) );
  NOR4XL U4610 ( .A(n4093), .B(n4092), .C(n4091), .D(n4090), .Y(n4094) );
  OAI22XL U4611 ( .A0(n4094), .A1(n4141), .B0(n4140), .B1(n5582), .Y(n4106) );
  OAI22XL U4612 ( .A0(n4148), .A1(n5432), .B0(n4151), .B1(n5596), .Y(n4098) );
  OAI22XL U4613 ( .A0(n4150), .A1(n5428), .B0(n4407), .B1(n5515), .Y(n4097) );
  OAI22XL U4614 ( .A0(n4147), .A1(n5393), .B0(n4152), .B1(n5615), .Y(n4096) );
  OAI22XL U4615 ( .A0(n4149), .A1(n5411), .B0(n4412), .B1(n5469), .Y(n4095) );
  NOR4XL U4616 ( .A(n4098), .B(n4097), .C(n4096), .D(n4095), .Y(n4104) );
  OAI22XL U4617 ( .A0(n4148), .A1(n5684), .B0(n4152), .B1(n5529), .Y(n4102) );
  OAI22XL U4618 ( .A0(n4150), .A1(n5413), .B0(n4151), .B1(n5689), .Y(n4101) );
  OAI2BB2XL U4619 ( .B0(n4412), .B1(n5654), .A0N(n4408), .A1N(
        stringdata_ff[109]), .Y(n4100) );
  OAI22XL U4620 ( .A0(n4147), .A1(n5531), .B0(n4149), .B1(n5645), .Y(n4099) );
  OAI22XL U4621 ( .A0(n4104), .A1(n4165), .B0(n4103), .B1(n4157), .Y(n4105) );
  OAI21XL U4622 ( .A0(n4108), .A1(n4159), .B0(n4107), .Y(n4178) );
  AO22X1 U4623 ( .A0(n4184), .A1(n4185), .B0(n4178), .B1(n4179), .Y(n4169) );
  OAI22XL U4624 ( .A0(n4147), .A1(n5532), .B0(n4151), .B1(n5688), .Y(n4112) );
  OAI22XL U4625 ( .A0(n4148), .A1(n5683), .B0(n4149), .B1(n5556), .Y(n4111) );
  OAI22XL U4626 ( .A0(n4150), .A1(n5502), .B0(n4412), .B1(n5655), .Y(n4110) );
  OAI2BB2XL U4627 ( .B0(n4152), .B1(n5627), .A0N(n4408), .A1N(
        stringdata_ff[110]), .Y(n4109) );
  OAI22XL U4628 ( .A0(n4148), .A1(n5498), .B0(n4412), .B1(n5565), .Y(n4116) );
  OAI22XL U4629 ( .A0(n4147), .A1(n5710), .B0(n4407), .B1(n5474), .Y(n4115) );
  OAI22XL U4630 ( .A0(n4149), .A1(n5383), .B0(n4151), .B1(n5628), .Y(n4114) );
  OAI22XL U4631 ( .A0(n4150), .A1(n5707), .B0(n4152), .B1(n5611), .Y(n4113) );
  NOR4XL U4632 ( .A(n4116), .B(n4115), .C(n4114), .D(n4113), .Y(n4117) );
  OAI22XL U4633 ( .A0(n4117), .A1(n4165), .B0(n4140), .B1(n5438), .Y(n4129) );
  OAI22XL U4634 ( .A0(n4147), .A1(n5451), .B0(n4149), .B1(n5409), .Y(n4121) );
  OAI22XL U4635 ( .A0(n4407), .A1(n5415), .B0(n4412), .B1(n5621), .Y(n4120) );
  OAI22XL U4636 ( .A0(n4152), .A1(n5714), .B0(n4151), .B1(n5566), .Y(n4119) );
  OAI22XL U4637 ( .A0(n4150), .A1(n5401), .B0(n4148), .B1(n5600), .Y(n4118) );
  NOR4XL U4638 ( .A(n4121), .B(n4120), .C(n4119), .D(n4118), .Y(n4127) );
  OAI22XL U4639 ( .A0(n4147), .A1(n5723), .B0(n4407), .B1(n5462), .Y(n4125) );
  OAI22XL U4640 ( .A0(n4412), .A1(n5520), .B0(n4151), .B1(n5458), .Y(n4124) );
  OAI22XL U4641 ( .A0(n4150), .A1(n5721), .B0(n4148), .B1(n5511), .Y(n4123) );
  OAI22XL U4642 ( .A0(n4149), .A1(n5727), .B0(n4152), .B1(n5457), .Y(n4122) );
  OAI22XL U4643 ( .A0(n4127), .A1(n4159), .B0(n4126), .B1(n4141), .Y(n4128) );
  OAI21XL U4644 ( .A0(n4131), .A1(n4157), .B0(n4130), .Y(n4180) );
  OAI22XL U4645 ( .A0(n4407), .A1(n5467), .B0(n4151), .B1(n5619), .Y(n4135) );
  OAI22XL U4646 ( .A0(n4147), .A1(n5431), .B0(n4412), .B1(n5638), .Y(n4134) );
  OAI22XL U4647 ( .A0(n4148), .A1(n5580), .B0(n4152), .B1(n5516), .Y(n4133) );
  OAI22XL U4648 ( .A0(n4150), .A1(n5487), .B0(n4149), .B1(n5439), .Y(n4132) );
  OAI22XL U4649 ( .A0(n4150), .A1(n5395), .B0(n4151), .B1(n5454), .Y(n4139) );
  OAI22XL U4650 ( .A0(n4407), .A1(n5518), .B0(n4412), .B1(n5635), .Y(n4138) );
  OAI22XL U4651 ( .A0(n4147), .A1(n5725), .B0(n4149), .B1(n5490), .Y(n4137) );
  OAI22XL U4652 ( .A0(n4148), .A1(n5728), .B0(n4152), .B1(n5418), .Y(n4136) );
  NOR4XL U4653 ( .A(n4139), .B(n4138), .C(n4137), .D(n4136), .Y(n4142) );
  OAI22XL U4654 ( .A0(n4142), .A1(n4141), .B0(n4140), .B1(n5404), .Y(n4162) );
  OAI22XL U4655 ( .A0(n4148), .A1(n5720), .B0(n4151), .B1(n5618), .Y(n4146) );
  OAI22XL U4656 ( .A0(n4147), .A1(n5593), .B0(n4407), .B1(n5528), .Y(n4145) );
  OAI22XL U4657 ( .A0(n4150), .A1(n5481), .B0(n4152), .B1(n5616), .Y(n4144) );
  OAI22XL U4658 ( .A0(n4149), .A1(n5719), .B0(n4412), .B1(n5510), .Y(n4143) );
  OAI22XL U4659 ( .A0(n4148), .A1(n5685), .B0(n4147), .B1(n5470), .Y(n4156) );
  OAI2BB2XL U4660 ( .B0(n4412), .B1(n5671), .A0N(n4408), .A1N(
        stringdata_ff[107]), .Y(n4155) );
  OAI22XL U4661 ( .A0(n4150), .A1(n5446), .B0(n4149), .B1(n5647), .Y(n4154) );
  OAI22XL U4662 ( .A0(n4152), .A1(n5536), .B0(n4151), .B1(n5693), .Y(n4153) );
  OAI22XL U4663 ( .A0(n4160), .A1(n4159), .B0(n4158), .B1(n4157), .Y(n4161) );
  OAI21XL U4664 ( .A0(n4166), .A1(n4165), .B0(n4164), .Y(n4177) );
  AO22X1 U4665 ( .A0(n4180), .A1(n4181), .B0(n4177), .B1(n4191), .Y(n4168) );
  NOR4X1 U4666 ( .A(n4171), .B(n4170), .C(n4169), .D(n4168), .Y(n4172) );
  OAI22XL U4667 ( .A0(n4179), .A1(n4178), .B0(n4191), .B1(n4177), .Y(n4189) );
  OAI22XL U4668 ( .A0(n4183), .A1(n4182), .B0(n4181), .B1(n4180), .Y(n4188) );
  OAI22XL U4669 ( .A0(n4193), .A1(n4186), .B0(n4185), .B1(n4184), .Y(n4187) );
  AO22X1 U4670 ( .A0(n4197), .A1(n4196), .B0(n4195), .B1(n4194), .Y(n4940) );
  OA21XL U4671 ( .A0(pattern_ff[2]), .A1(n4246), .B0(n4682), .Y(n4203) );
  OAI22XL U4672 ( .A0(N1675), .A1(n5480), .B0(N1594), .B1(n4198), .Y(n4668) );
  OAI22XL U4673 ( .A0(n4250), .A1(n5642), .B0(n5525), .B1(n4249), .Y(n4688) );
  AOI22XL U4674 ( .A0(pattern_ff[39]), .A1(n4238), .B0(n4252), .B1(
        pattern_ff[50]), .Y(n4199) );
  OAI22XL U4675 ( .A0(n4201), .A1(n4692), .B0(n5541), .B1(n4259), .Y(n4202) );
  OAI22XL U4676 ( .A0(n4944), .A1(n5674), .B0(n4229), .B1(n5551), .Y(n4208) );
  OAI222XL U4677 ( .A0(n4205), .A1(n5696), .B0(n4250), .B1(n5425), .C0(n4689), 
        .C1(n5658), .Y(n4206) );
  INVXL U4678 ( .A(n4206), .Y(n4678) );
  OAI22XL U4679 ( .A0(n4678), .A1(n5563), .B0(n4247), .B1(n5539), .Y(n4207) );
  NAND2BX1 U4680 ( .AN(n4255), .B(n5062), .Y(n4226) );
  OAI22XL U4681 ( .A0(n4209), .A1(n4226), .B0(n5552), .B1(n4455), .Y(n4432) );
  OAI22XL U4682 ( .A0(n4944), .A1(n5675), .B0(n4248), .B1(n5554), .Y(n4213) );
  AOI222XL U4683 ( .A0(n4210), .A1(N1675), .B0(n4237), .B1(n5477), .C0(n4220), 
        .C1(n5572), .Y(n4211) );
  OAI22XL U4684 ( .A0(n5563), .A1(n4674), .B0(n4247), .B1(n5548), .Y(n4212) );
  OAI22XL U4685 ( .A0(n4214), .A1(n4226), .B0(n5656), .B1(n4455), .Y(n4428) );
  OAI22XL U4686 ( .A0(n4944), .A1(n5676), .B0(n4248), .B1(n5555), .Y(n4218) );
  OAI222XL U4687 ( .A0(n4215), .A1(n5696), .B0(n4250), .B1(n5478), .C0(n4689), 
        .C1(n5653), .Y(n4216) );
  INVXL U4688 ( .A(n4216), .Y(n4673) );
  OAI22XL U4689 ( .A0(n4673), .A1(n5563), .B0(n4247), .B1(n5650), .Y(n4217) );
  AOI211XL U4690 ( .A0(n4251), .A1(pattern_ff[49]), .B0(n4218), .C0(n4217), 
        .Y(n4219) );
  OAI22XL U4691 ( .A0(n4219), .A1(n4226), .B0(n5550), .B1(n4455), .Y(n4426) );
  OAI22XL U4692 ( .A0(n4229), .A1(n5557), .B0(n4248), .B1(n5669), .Y(n4225) );
  NAND2XL U4693 ( .A(pattern_ff[15]), .B(n5419), .Y(n4222) );
  OAI21XL U4694 ( .A0(pattern_ff[23]), .A1(n5419), .B0(n5696), .Y(n4221) );
  AOI22XL U4695 ( .A0(n4222), .A1(n4221), .B0(n5569), .B1(n4220), .Y(n4223) );
  OAI22XL U4696 ( .A0(n4675), .A1(n5563), .B0(n4247), .B1(n5643), .Y(n4224) );
  OAI22XL U4697 ( .A0(n4227), .A1(n4226), .B0(n5542), .B1(n4455), .Y(n4434) );
  OAI22XL U4698 ( .A0(n4229), .A1(n5661), .B0(n4228), .B1(n5540), .Y(n4232) );
  AOI222XL U4699 ( .A0(n4237), .A1(pattern_ff[21]), .B0(n4236), .B1(
        pattern_ff[13]), .C0(n4235), .C1(pattern_ff[5]), .Y(n4683) );
  AOI22XL U4700 ( .A0(n4252), .A1(pattern_ff[52]), .B0(n4238), .B1(
        pattern_ff[42]), .Y(n4230) );
  OAI21XL U4701 ( .A0(n4683), .A1(n5563), .B0(n4230), .Y(n4231) );
  OAI31XL U4702 ( .A0(n4232), .A1(n4255), .A2(n4231), .B0(n5062), .Y(n4234) );
  OAI21XL U4703 ( .A0(pattern_ff[5]), .A1(n4246), .B0(n4682), .Y(n4233) );
  AOI222XL U4704 ( .A0(n4237), .A1(pattern_ff[17]), .B0(n4236), .B1(
        pattern_ff[9]), .C0(n4235), .C1(pattern_ff[1]), .Y(n4679) );
  AOI2BB2X1 U4705 ( .B0(n4238), .B1(pattern_ff[38]), .A0N(n4944), .A1N(n5677), 
        .Y(n4239) );
  OAI21XL U4706 ( .A0(n4679), .A1(n5563), .B0(n4239), .Y(n4240) );
  AOI2BB2X1 U4707 ( .B0(n4242), .B1(pattern_ff[25]), .A0N(n4241), .A1N(n5664), 
        .Y(n4244) );
  OAI21XL U4708 ( .A0(pattern_ff[1]), .A1(n4246), .B0(n4682), .Y(n4243) );
  OAI21XL U4709 ( .A0(pattern_ff[3]), .A1(n4246), .B0(n4682), .Y(n4258) );
  OAI22XL U4710 ( .A0(n4248), .A1(n5663), .B0(n4247), .B1(n5547), .Y(n4256) );
  OAI22XL U4711 ( .A0(n4250), .A1(n5646), .B0(n4249), .B1(n5535), .Y(n4685) );
  AOI22XL U4712 ( .A0(n4252), .A1(pattern_ff[51]), .B0(n4251), .B1(
        pattern_ff[47]), .Y(n4253) );
  OAI31XL U4713 ( .A0(n4256), .A1(n4255), .A2(n4254), .B0(n5062), .Y(n4257) );
  OAI22XL U4714 ( .A0(n5727), .A1(n4847), .B0(n5611), .B1(n4860), .Y(n4276) );
  OAI22XL U4715 ( .A0(n5502), .A1(n4867), .B0(n5707), .B1(n4868), .Y(n4275) );
  AOI2BB2X1 U4716 ( .B0(stringdata_ff[63]), .B1(n4784), .A0N(n5566), .A1N(
        n3226), .Y(n4273) );
  OAI22XL U4717 ( .A0(n5462), .A1(n4809), .B0(n5498), .B1(n3233), .Y(n4261) );
  OAI22XL U4718 ( .A0(n5565), .A1(n2945), .B0(n5438), .B1(n4858), .Y(n4260) );
  AOI211XL U4719 ( .A0(stringdata_ff[49]), .A1(n4540), .B0(n4261), .C0(n4260), 
        .Y(n4272) );
  OAI22XL U4720 ( .A0(n5451), .A1(n4852), .B0(n5721), .B1(n3223), .Y(n4265) );
  OAI22XL U4721 ( .A0(n5401), .A1(n4876), .B0(n5710), .B1(n4829), .Y(n4264) );
  OAI22XL U4722 ( .A0(n5457), .A1(n2948), .B0(n5628), .B1(n2943), .Y(n4263) );
  OAI22XL U4723 ( .A0(n5409), .A1(n4859), .B0(n5723), .B1(n3220), .Y(n4262) );
  OAI22XL U4724 ( .A0(n5458), .A1(n2950), .B0(n5474), .B1(n2944), .Y(n4269) );
  OAI22XL U4725 ( .A0(n5621), .A1(n2946), .B0(n5417), .B1(n4838), .Y(n4268) );
  OAI22XL U4726 ( .A0(n5511), .A1(n4873), .B0(n5383), .B1(n4875), .Y(n4267) );
  OAI22XL U4727 ( .A0(n5415), .A1(n2949), .B0(n5714), .B1(n2947), .Y(n4266) );
  OAI22XL U4728 ( .A0(n5601), .A1(n4809), .B0(n5397), .B1(n4873), .Y(n4294) );
  OAI22XL U4729 ( .A0(n5390), .A1(n4857), .B0(n5605), .B1(n3825), .Y(n4293) );
  AOI2BB2X1 U4730 ( .B0(stringdata_ff[28]), .B1(n4743), .A0N(n5624), .A1N(
        n2947), .Y(n4291) );
  OAI22XL U4731 ( .A0(n5521), .A1(n2949), .B0(n5705), .B1(n4838), .Y(n4278) );
  OAI22XL U4732 ( .A0(n5416), .A1(n3485), .B0(n5597), .B1(n2943), .Y(n4277) );
  OAI22XL U4733 ( .A0(n5718), .A1(n4859), .B0(n5406), .B1(n4852), .Y(n4283) );
  OAI22XL U4734 ( .A0(n5708), .A1(n4829), .B0(n5484), .B1(n3233), .Y(n4282) );
  OAI22XL U4735 ( .A0(n5430), .A1(n3220), .B0(n5579), .B1(n4868), .Y(n4281) );
  OAI22XL U4736 ( .A0(n5501), .A1(n4867), .B0(n5456), .B1(n2950), .Y(n4280) );
  OAI22XL U4737 ( .A0(n5509), .A1(n2946), .B0(n5636), .B1(n4860), .Y(n4287) );
  OAI22XL U4738 ( .A0(n5588), .A1(n3226), .B0(n5712), .B1(n4875), .Y(n4286) );
  OAI22XL U4739 ( .A0(n5493), .A1(n4847), .B0(n5583), .B1(n4858), .Y(n4285) );
  OAI22XL U4740 ( .A0(n5407), .A1(n2948), .B0(n5443), .B1(n3223), .Y(n4284) );
  OAI22XL U4741 ( .A0(n4429), .A1(n4428), .B0(n4433), .B1(n4432), .Y(n4404) );
  OAI22XL U4742 ( .A0(n5488), .A1(n4876), .B0(n5427), .B1(n3220), .Y(n4311) );
  OAI22XL U4743 ( .A0(n5711), .A1(n2945), .B0(n5500), .B1(n3485), .Y(n4310) );
  AOI2BB2X1 U4744 ( .B0(stringdata_ff[7]), .B1(n4855), .A0N(n5589), .A1N(n4873), .Y(n4308) );
  OAI22XL U4745 ( .A0(n5512), .A1(n4860), .B0(n5382), .B1(n4857), .Y(n4296) );
  OAI22XL U4746 ( .A0(n5504), .A1(n2947), .B0(n5387), .B1(n3223), .Y(n4295) );
  OAI22XL U4747 ( .A0(n5449), .A1(n4867), .B0(n5594), .B1(n2950), .Y(n4300) );
  OAI22XL U4748 ( .A0(n5434), .A1(n4859), .B0(n5581), .B1(n4858), .Y(n4299) );
  OAI22XL U4749 ( .A0(n5421), .A1(n4852), .B0(n5610), .B1(n2948), .Y(n4298) );
  OAI22XL U4750 ( .A0(n5384), .A1(n4868), .B0(n5599), .B1(n2943), .Y(n4297) );
  OAI22XL U4751 ( .A0(n5399), .A1(n3233), .B0(n5492), .B1(n4809), .Y(n4304) );
  OAI22XL U4752 ( .A0(n5717), .A1(n2946), .B0(n5603), .B1(n3226), .Y(n4303) );
  OAI22XL U4753 ( .A0(n5422), .A1(n4875), .B0(n5494), .B1(n2949), .Y(n4302) );
  OAI22XL U4754 ( .A0(n5436), .A1(n4829), .B0(n5385), .B1(n4847), .Y(n4301) );
  OAI22XL U4755 ( .A0(n5637), .A1(n2950), .B0(n5538), .B1(n4860), .Y(n4329) );
  OAI22XL U4756 ( .A0(n5726), .A1(n3485), .B0(n5455), .B1(n3825), .Y(n4328) );
  AOI2BB2X1 U4757 ( .B0(stringdata_ff[26]), .B1(n4312), .A0N(n5445), .A1N(
        n4857), .Y(n4326) );
  OAI22XL U4758 ( .A0(n5706), .A1(n4868), .B0(n5497), .B1(n4829), .Y(n4314) );
  OAI22XL U4759 ( .A0(n5435), .A1(n3223), .B0(n5517), .B1(n2948), .Y(n4313) );
  OAI22XL U4760 ( .A0(n5408), .A1(n4859), .B0(n5590), .B1(n4873), .Y(n4318) );
  OAI22XL U4761 ( .A0(n5716), .A1(n4852), .B0(n5475), .B1(n4809), .Y(n4317) );
  OAI22XL U4762 ( .A0(n5585), .A1(n4875), .B0(n5503), .B1(n4858), .Y(n4316) );
  OAI22XL U4763 ( .A0(n5433), .A1(n4876), .B0(n5567), .B1(n2949), .Y(n4315) );
  OAI22XL U4764 ( .A0(n5586), .A1(n4847), .B0(n5412), .B1(n2944), .Y(n4322) );
  OAI22XL U4765 ( .A0(n5513), .A1(n2947), .B0(n5606), .B1(n4838), .Y(n4321) );
  OAI22XL U4766 ( .A0(n5530), .A1(n3226), .B0(n5386), .B1(n3233), .Y(n4320) );
  OAI22XL U4767 ( .A0(n5441), .A1(n2946), .B0(n5405), .B1(n3220), .Y(n4319) );
  NOR4X1 U4768 ( .A(n4322), .B(n4321), .C(n4320), .D(n4319), .Y(n4323) );
  OAI22XL U4769 ( .A0(n4427), .A1(n4426), .B0(n4441), .B1(n4440), .Y(n4403) );
  OAI22XL U4770 ( .A0(n5522), .A1(n2948), .B0(n5444), .B1(n4847), .Y(n4348) );
  OAI22XL U4771 ( .A0(n5429), .A1(n4852), .B0(n5496), .B1(n4857), .Y(n4347) );
  AOI2BB2X1 U4772 ( .B0(stringdata_ff[11]), .B1(n4330), .A0N(n5625), .A1N(
        n4809), .Y(n4345) );
  OAI22XL U4773 ( .A0(n5598), .A1(n2945), .B0(n5392), .B1(n4868), .Y(n4332) );
  OAI22XL U4774 ( .A0(n5614), .A1(n3485), .B0(n5526), .B1(n2943), .Y(n4331) );
  OAI22XL U4775 ( .A0(n5461), .A1(n2950), .B0(n5485), .B1(n4876), .Y(n4337) );
  OAI22XL U4776 ( .A0(n5459), .A1(n3220), .B0(n5388), .B1(n4858), .Y(n4336) );
  OAI22XL U4777 ( .A0(n5414), .A1(n4873), .B0(n5527), .B1(n2944), .Y(n4335) );
  OAI22XL U4778 ( .A0(n5403), .A1(n4867), .B0(n5423), .B1(n4838), .Y(n4334) );
  OAI22XL U4779 ( .A0(n5507), .A1(n2946), .B0(n5595), .B1(n3226), .Y(n4341) );
  OAI22XL U4780 ( .A0(n5426), .A1(n4875), .B0(n5584), .B1(n4859), .Y(n4340) );
  OAI22XL U4781 ( .A0(n5398), .A1(n4829), .B0(n5442), .B1(n3233), .Y(n4339) );
  OAI22XL U4782 ( .A0(n5722), .A1(n3223), .B0(n5715), .B1(n2947), .Y(n4338) );
  NOR4X1 U4783 ( .A(n4341), .B(n4340), .C(n4339), .D(n4338), .Y(n4342) );
  OAI22XL U4784 ( .A0(n5725), .A1(n3220), .B0(n5418), .B1(n2948), .Y(n4365) );
  OAI22XL U4785 ( .A0(n5481), .A1(n4876), .B0(n5719), .B1(n4859), .Y(n4364) );
  AOI2BB2X1 U4786 ( .B0(stringdata_ff[36]), .B1(n4597), .A0N(n5516), .A1N(
        n4860), .Y(n4362) );
  OAI22XL U4787 ( .A0(n5638), .A1(n2945), .B0(n5490), .B1(n4847), .Y(n4350) );
  OAI22XL U4788 ( .A0(n5720), .A1(n4857), .B0(n5404), .B1(n4858), .Y(n4349) );
  OAI22XL U4789 ( .A0(n5487), .A1(n4868), .B0(n5608), .B1(n4838), .Y(n4354) );
  OAI22XL U4790 ( .A0(n5467), .A1(n2944), .B0(n5528), .B1(n2949), .Y(n4353) );
  OAI22XL U4791 ( .A0(n5616), .A1(n2947), .B0(n5454), .B1(n2950), .Y(n4352) );
  OAI22XL U4792 ( .A0(n5446), .A1(n4867), .B0(n5728), .B1(n4873), .Y(n4351) );
  OAI22XL U4793 ( .A0(n5580), .A1(n3233), .B0(n5518), .B1(n4809), .Y(n4358) );
  OAI22XL U4794 ( .A0(n5439), .A1(n4875), .B0(n5395), .B1(n3223), .Y(n4357) );
  OAI22XL U4795 ( .A0(n5619), .A1(n2943), .B0(n5431), .B1(n4829), .Y(n4356) );
  OAI22XL U4796 ( .A0(n5618), .A1(n3226), .B0(n5510), .B1(n2946), .Y(n4355) );
  NOR4X1 U4797 ( .A(n4358), .B(n4357), .C(n4356), .D(n4355), .Y(n4359) );
  OAI22XL U4798 ( .A0(n4431), .A1(n4430), .B0(n4437), .B1(n4436), .Y(n4402) );
  OAI22XL U4799 ( .A0(n5486), .A1(n4852), .B0(n5582), .B1(n4858), .Y(n4383) );
  OAI22XL U4800 ( .A0(n5428), .A1(n4868), .B0(n5607), .B1(n4838), .Y(n4382) );
  AOI2BB2X1 U4801 ( .B0(stringdata_ff[38]), .B1(n4366), .A0N(n5626), .A1N(
        n2949), .Y(n4380) );
  OAI22XL U4802 ( .A0(n5482), .A1(n4857), .B0(n5391), .B1(n3223), .Y(n4368) );
  OAI22XL U4803 ( .A0(n5432), .A1(n3233), .B0(n5724), .B1(n3220), .Y(n4367) );
  AOI211XL U4804 ( .A0(stringdata_ff[65]), .A1(n4466), .B0(n4368), .C0(n4367), 
        .Y(n4379) );
  OAI22XL U4805 ( .A0(n5411), .A1(n4875), .B0(n5613), .B1(n3485), .Y(n4372) );
  OAI22XL U4806 ( .A0(n5393), .A1(n4829), .B0(n5469), .B1(n2945), .Y(n4371) );
  OAI22XL U4807 ( .A0(n5620), .A1(n2947), .B0(n5460), .B1(n4809), .Y(n4370) );
  OAI22XL U4808 ( .A0(n5615), .A1(n4860), .B0(n5447), .B1(n2948), .Y(n4369) );
  OAI22XL U4809 ( .A0(n5515), .A1(n2944), .B0(n5413), .B1(n4867), .Y(n4376) );
  OAI22XL U4810 ( .A0(n5465), .A1(n3226), .B0(n5506), .B1(n2950), .Y(n4375) );
  OAI22XL U4811 ( .A0(n5452), .A1(n4859), .B0(n5483), .B1(n4873), .Y(n4374) );
  OAI22XL U4812 ( .A0(n5402), .A1(n4876), .B0(n5596), .B1(n2943), .Y(n4373) );
  OAI22XL U4813 ( .A0(n5450), .A1(n2947), .B0(n5709), .B1(n4829), .Y(n4400) );
  OAI22XL U4814 ( .A0(n5463), .A1(n2944), .B0(n5505), .B1(n4847), .Y(n4399) );
  AOI2BB2X1 U4815 ( .B0(stringdata_ff[58]), .B1(n4696), .A0N(n5514), .A1N(
        n2943), .Y(n4397) );
  OAI22XL U4816 ( .A0(n5389), .A1(n3233), .B0(n5508), .B1(n4860), .Y(n4385) );
  OAI22XL U4817 ( .A0(n5622), .A1(n3226), .B0(n5394), .B1(n4852), .Y(n4384) );
  OAI22XL U4818 ( .A0(n5464), .A1(n2949), .B0(n5612), .B1(n3485), .Y(n4389) );
  OAI22XL U4819 ( .A0(n5587), .A1(n4857), .B0(n5410), .B1(n3223), .Y(n4388) );
  OAI22XL U4820 ( .A0(n5400), .A1(n4876), .B0(n5633), .B1(n2950), .Y(n4387) );
  OAI22XL U4821 ( .A0(n5491), .A1(n4867), .B0(n5713), .B1(n4875), .Y(n4386) );
  NOR4X1 U4822 ( .A(n4389), .B(n4388), .C(n4387), .D(n4386), .Y(n4395) );
  OAI22XL U4823 ( .A0(n5396), .A1(n3220), .B0(n5592), .B1(n4809), .Y(n4393) );
  OAI22XL U4824 ( .A0(n5440), .A1(n4873), .B0(n5630), .B1(n4838), .Y(n4392) );
  OAI22XL U4825 ( .A0(n5437), .A1(n4859), .B0(n5617), .B1(n2946), .Y(n4391) );
  OAI22XL U4826 ( .A0(n5631), .A1(n2945), .B0(n5489), .B1(n4858), .Y(n4390) );
  NOR4X1 U4827 ( .A(n4393), .B(n4392), .C(n4391), .D(n4390), .Y(n4394) );
  OAI22XL U4828 ( .A0(n4439), .A1(n4438), .B0(n4435), .B1(n4434), .Y(n4401) );
  NOR4X1 U4829 ( .A(n4404), .B(n4403), .C(n4402), .D(n4401), .Y(n4425) );
  NOR2XL U4830 ( .A(n4408), .B(n5473), .Y(n4406) );
  INVXL U4831 ( .A(n4419), .Y(n4405) );
  OAI21XL U4832 ( .A0(cal_cnt[4]), .A1(n4406), .B0(n4405), .Y(n4417) );
  OAI22XL U4833 ( .A0(cal_cnt[3]), .A1(n4408), .B0(n5473), .B1(n4407), .Y(
        n4415) );
  OA22X1 U4834 ( .A0(n4411), .A1(n4410), .B0(n4409), .B1(n5314), .Y(n4413) );
  OAI21XL U4835 ( .A0(cal_cnt[2]), .A1(n5314), .B0(n4412), .Y(n4893) );
  OAI21XL U4836 ( .A0(n4894), .A1(n4893), .B0(n4896), .Y(n4414) );
  AOI222XL U4837 ( .A0(n4415), .A1(n5578), .B0(n4415), .B1(n4414), .C0(n5578), 
        .C1(n4414), .Y(n4416) );
  AOI222XL U4838 ( .A0(string_cnt_max[4]), .A1(n4417), .B0(string_cnt_max[4]), 
        .B1(n4416), .C0(n4417), .C1(n4416), .Y(n4420) );
  OAI31XL U4839 ( .A0(n4419), .A1(n4420), .A2(n4901), .B0(n4905), .Y(n4418) );
  NOR4BX1 U4840 ( .AN(n4421), .B(n4440), .C(n4436), .D(n4438), .Y(n4422) );
  AOI221XL U4841 ( .A0(n4453), .A1(n4452), .B0(n4451), .B1(n4452), .C0(n4450), 
        .Y(n4457) );
  OAI22XL U4842 ( .A0(n4454), .A1(n4945), .B0(n4457), .B1(n4692), .Y(n4463) );
  OAI21XL U4843 ( .A0(n5535), .A1(n4690), .B0(n4687), .Y(n4651) );
  OAI21XL U4844 ( .A0(n4690), .A1(n4456), .B0(n4455), .Y(n4459) );
  AO22X1 U4845 ( .A0(pattern_ff[8]), .A1(n4459), .B0(pattern_ff[0]), .B1(n4458), .Y(n4654) );
  OAI21XL U4846 ( .A0(n5634), .A1(n4690), .B0(n4462), .Y(n4653) );
  OAI21XL U4847 ( .A0(n4690), .A1(n5525), .B0(n4694), .Y(n4652) );
  OR4X2 U4848 ( .A(n4654), .B(n4656), .C(n4640), .D(n4638), .Y(n4663) );
  OAI22XL U4849 ( .A0(n5437), .A1(n2946), .B0(n5713), .B1(n2945), .Y(n4464) );
  OAI22XL U4850 ( .A0(n5617), .A1(n4852), .B0(n5440), .B1(n2950), .Y(n4470) );
  OAI22XL U4851 ( .A0(n5587), .A1(n3226), .B0(n5491), .B1(n4809), .Y(n4469) );
  OAI22XL U4852 ( .A0(n5396), .A1(n2948), .B0(n5533), .B1(n3223), .Y(n4468) );
  OAI22XL U4853 ( .A0(n5508), .A1(n4868), .B0(n5630), .B1(n4858), .Y(n4467) );
  OAI22XL U4854 ( .A0(n5612), .A1(n3220), .B0(n5505), .B1(n3485), .Y(n4474) );
  OAI22XL U4855 ( .A0(n5394), .A1(n2947), .B0(n5489), .B1(n4865), .Y(n4473) );
  OAI22XL U4856 ( .A0(n5631), .A1(n4829), .B0(n5410), .B1(n2949), .Y(n4472) );
  OAI22XL U4857 ( .A0(n5450), .A1(n4876), .B0(n5592), .B1(n4873), .Y(n4471) );
  OAI22XL U4858 ( .A0(n5400), .A1(n2944), .B0(n5466), .B1(n4867), .Y(n4478) );
  OAI22XL U4859 ( .A0(n5622), .A1(n4859), .B0(n5709), .B1(n4860), .Y(n4477) );
  OAI22XL U4860 ( .A0(n5464), .A1(n4857), .B0(n5389), .B1(n2943), .Y(n4476) );
  OAI22XL U4861 ( .A0(n5514), .A1(n4875), .B0(n5463), .B1(n3233), .Y(n4475) );
  NAND4XL U4862 ( .A(n4482), .B(n4481), .C(n4480), .D(n4479), .Y(n4643) );
  OAI22XL U4863 ( .A0(n5510), .A1(n4852), .B0(n5728), .B1(n2950), .Y(n4483) );
  AOI211XL U4864 ( .A0(n4848), .A1(stringdata_ff[18]), .B0(n4484), .C0(n4483), 
        .Y(n4500) );
  OAI22XL U4865 ( .A0(n5516), .A1(n4868), .B0(n5404), .B1(n4865), .Y(n4488) );
  OAI22XL U4866 ( .A0(n5720), .A1(n3226), .B0(n5608), .B1(n4858), .Y(n4487) );
  OAI22XL U4867 ( .A0(n5580), .A1(n2943), .B0(n5536), .B1(n4867), .Y(n4486) );
  OAI22XL U4868 ( .A0(n5619), .A1(n4875), .B0(n5518), .B1(n4873), .Y(n4485) );
  OAI22XL U4869 ( .A0(n5618), .A1(n4859), .B0(n5395), .B1(n2949), .Y(n4492) );
  OAI22XL U4870 ( .A0(n5487), .A1(n4838), .B0(n5719), .B1(n2946), .Y(n4491) );
  OAI22XL U4871 ( .A0(n5616), .A1(n4876), .B0(n5454), .B1(n4847), .Y(n4490) );
  OAI22XL U4872 ( .A0(n5490), .A1(n3485), .B0(n5725), .B1(n2948), .Y(n4489) );
  OAI22XL U4873 ( .A0(n5467), .A1(n3233), .B0(n5418), .B1(n3223), .Y(n4496) );
  OAI22XL U4874 ( .A0(n5446), .A1(n4809), .B0(n5635), .B1(n3220), .Y(n4495) );
  OAI22XL U4875 ( .A0(n5439), .A1(n2945), .B0(n5528), .B1(n4857), .Y(n4494) );
  OAI22XL U4876 ( .A0(n5431), .A1(n4860), .B0(n5593), .B1(n2947), .Y(n4493) );
  NAND4XL U4877 ( .A(n4500), .B(n4499), .C(n4498), .D(n4497), .Y(n4639) );
  AO22X1 U4878 ( .A0(n4643), .A1(n4644), .B0(n4639), .B1(n4640), .Y(n4617) );
  OAI22XL U4879 ( .A0(n5475), .A1(n4873), .B0(n5412), .B1(n3233), .Y(n4501) );
  AOI211XL U4880 ( .A0(n4540), .A1(stringdata_ff[54]), .B0(n4502), .C0(n4501), 
        .Y(n4518) );
  OAI22XL U4881 ( .A0(n5585), .A1(n2945), .B0(n5538), .B1(n4868), .Y(n4506) );
  OAI22XL U4882 ( .A0(n5433), .A1(n2944), .B0(n5503), .B1(n4865), .Y(n4505) );
  OAI22XL U4883 ( .A0(n5729), .A1(n4867), .B0(n5455), .B1(n4829), .Y(n4504) );
  OAI22XL U4884 ( .A0(n5513), .A1(n4876), .B0(n5435), .B1(n2949), .Y(n4503) );
  OAI22XL U4885 ( .A0(n5602), .A1(n4875), .B0(n5386), .B1(n2943), .Y(n4510) );
  OAI22XL U4886 ( .A0(n5405), .A1(n2948), .B0(n5497), .B1(n4860), .Y(n4509) );
  OAI22XL U4887 ( .A0(n5408), .A1(n2946), .B0(n5517), .B1(n3223), .Y(n4508) );
  OAI22XL U4888 ( .A0(n5716), .A1(n2947), .B0(n5606), .B1(n4858), .Y(n4507) );
  OAI22XL U4889 ( .A0(n5586), .A1(n3485), .B0(n5499), .B1(n4809), .Y(n4514) );
  OAI22XL U4890 ( .A0(n5445), .A1(n3226), .B0(n5706), .B1(n4838), .Y(n4513) );
  OAI22XL U4891 ( .A0(n5530), .A1(n4859), .B0(n5590), .B1(n2950), .Y(n4512) );
  OAI22XL U4892 ( .A0(n5441), .A1(n4852), .B0(n5637), .B1(n4847), .Y(n4511) );
  OAI22XL U4893 ( .A0(n5512), .A1(n4868), .B0(n5581), .B1(n4865), .Y(n4519) );
  OAI22XL U4894 ( .A0(n5711), .A1(n4829), .B0(n5427), .B1(n2948), .Y(n4525) );
  OAI22XL U4895 ( .A0(n5384), .A1(n4838), .B0(n5434), .B1(n2946), .Y(n4524) );
  OAI22XL U4896 ( .A0(n5599), .A1(n4875), .B0(n5421), .B1(n2947), .Y(n4523) );
  OAI22XL U4897 ( .A0(n5639), .A1(n3233), .B0(n5382), .B1(n3226), .Y(n4522) );
  OAI22XL U4898 ( .A0(n5488), .A1(n2944), .B0(n5610), .B1(n3223), .Y(n4529) );
  OAI22XL U4899 ( .A0(n5717), .A1(n4852), .B0(n5589), .B1(n2950), .Y(n4528) );
  OAI22XL U4900 ( .A0(n5471), .A1(n4867), .B0(n5492), .B1(n4873), .Y(n4527) );
  OAI22XL U4901 ( .A0(n5436), .A1(n4860), .B0(n5399), .B1(n2943), .Y(n4526) );
  OAI22XL U4902 ( .A0(n5603), .A1(n4859), .B0(n5449), .B1(n4809), .Y(n4533) );
  OAI22XL U4903 ( .A0(n5504), .A1(n4876), .B0(n5594), .B1(n4847), .Y(n4532) );
  OAI22XL U4904 ( .A0(n5422), .A1(n2945), .B0(n5494), .B1(n4857), .Y(n4531) );
  OAI22XL U4905 ( .A0(n5500), .A1(n3220), .B0(n5387), .B1(n2949), .Y(n4530) );
  AO22X1 U4906 ( .A0(n4642), .A1(n4656), .B0(n4645), .B1(n4646), .Y(n4616) );
  OAI22XL U4907 ( .A0(n5444), .A1(n3485), .B0(n5485), .B1(n2944), .Y(n4538) );
  OAI22XL U4908 ( .A0(n5598), .A1(n4829), .B0(n5442), .B1(n2943), .Y(n4544) );
  OAI22XL U4909 ( .A0(n5584), .A1(n2946), .B0(n5388), .B1(n4865), .Y(n4543) );
  OAI22XL U4910 ( .A0(n5625), .A1(n4873), .B0(n5722), .B1(n2949), .Y(n4542) );
  OAI22XL U4911 ( .A0(n5537), .A1(n4867), .B0(n5459), .B1(n2948), .Y(n4541) );
  OAI22XL U4912 ( .A0(n5414), .A1(n2950), .B0(n5715), .B1(n4876), .Y(n4548) );
  OAI22XL U4913 ( .A0(n5403), .A1(n4809), .B0(n5496), .B1(n3226), .Y(n4547) );
  OAI22XL U4914 ( .A0(n5595), .A1(n4859), .B0(n5423), .B1(n4858), .Y(n4546) );
  OAI22XL U4915 ( .A0(n5614), .A1(n3220), .B0(n5392), .B1(n4838), .Y(n4545) );
  OAI22XL U4916 ( .A0(n5609), .A1(n4868), .B0(n5507), .B1(n4852), .Y(n4552) );
  OAI22XL U4917 ( .A0(n5527), .A1(n3233), .B0(n5429), .B1(n2947), .Y(n4551) );
  OAI22XL U4918 ( .A0(n5461), .A1(n4847), .B0(n5526), .B1(n4875), .Y(n4550) );
  OAI22XL U4919 ( .A0(n5522), .A1(n3223), .B0(n5398), .B1(n4860), .Y(n4549) );
  OAI22XL U4920 ( .A0(n5611), .A1(n4868), .B0(n5707), .B1(n4838), .Y(n4557) );
  OAI22XL U4921 ( .A0(n5723), .A1(n2948), .B0(n5727), .B1(n3485), .Y(n4563) );
  OAI22XL U4922 ( .A0(n5621), .A1(n4852), .B0(n5721), .B1(n2949), .Y(n4562) );
  OAI22XL U4923 ( .A0(n5415), .A1(n4857), .B0(n5600), .B1(n3226), .Y(n4561) );
  OAI22XL U4924 ( .A0(n5409), .A1(n2946), .B0(n5498), .B1(n2943), .Y(n4560) );
  OAI22XL U4925 ( .A0(n5474), .A1(n3233), .B0(n5628), .B1(n4875), .Y(n4567) );
  OAI22XL U4926 ( .A0(n5627), .A1(n4867), .B0(n5520), .B1(n3220), .Y(n4566) );
  OAI22XL U4927 ( .A0(n5401), .A1(n2944), .B0(n5457), .B1(n3223), .Y(n4565) );
  OAI22XL U4928 ( .A0(n5714), .A1(n4876), .B0(n5438), .B1(n4865), .Y(n4564) );
  OAI22XL U4929 ( .A0(n5502), .A1(n4809), .B0(n5710), .B1(n4860), .Y(n4571) );
  OAI22XL U4930 ( .A0(n5451), .A1(n2947), .B0(n5511), .B1(n2950), .Y(n4570) );
  OAI22XL U4931 ( .A0(n5462), .A1(n4873), .B0(n5417), .B1(n4858), .Y(n4569) );
  OAI22XL U4932 ( .A0(n5458), .A1(n4847), .B0(n5565), .B1(n4829), .Y(n4568) );
  AO22X1 U4933 ( .A0(n4637), .A1(n4638), .B0(n4633), .B1(n4634), .Y(n4615) );
  OAI22XL U4934 ( .A0(n5443), .A1(n2949), .B0(n5712), .B1(n3825), .Y(n4576) );
  AOI211XL U4935 ( .A0(n4578), .A1(stringdata_ff[10]), .B0(n4577), .C0(n4576), 
        .Y(n4594) );
  OAI22XL U4936 ( .A0(n5424), .A1(n3233), .B0(n5705), .B1(n4858), .Y(n4582) );
  OAI22XL U4937 ( .A0(n5407), .A1(n3223), .B0(n5624), .B1(n4876), .Y(n4581) );
  OAI22XL U4938 ( .A0(n5430), .A1(n2948), .B0(n5509), .B1(n4852), .Y(n4580) );
  OAI22XL U4939 ( .A0(n5623), .A1(n4867), .B0(n5484), .B1(n2943), .Y(n4579) );
  OAI22XL U4940 ( .A0(n5718), .A1(n2946), .B0(n5390), .B1(n3226), .Y(n4586) );
  OAI22XL U4941 ( .A0(n5521), .A1(n4857), .B0(n5588), .B1(n4859), .Y(n4585) );
  OAI22XL U4942 ( .A0(n5601), .A1(n4873), .B0(n5456), .B1(n4847), .Y(n4584) );
  OAI22XL U4943 ( .A0(n5501), .A1(n4809), .B0(n5406), .B1(n2947), .Y(n4583) );
  OAI22XL U4944 ( .A0(n5416), .A1(n3220), .B0(n5579), .B1(n4838), .Y(n4590) );
  OAI22XL U4945 ( .A0(n5397), .A1(n2950), .B0(n5583), .B1(n4865), .Y(n4589) );
  OAI22XL U4946 ( .A0(n5493), .A1(n3485), .B0(n5597), .B1(n4875), .Y(n4588) );
  OAI22XL U4947 ( .A0(n5448), .A1(n2944), .B0(n5708), .B1(n4860), .Y(n4587) );
  OAI22XL U4948 ( .A0(n5402), .A1(n2944), .B0(n5515), .B1(n3233), .Y(n4595) );
  AOI211XL U4949 ( .A0(n4597), .A1(stringdata_ff[38]), .B0(n4596), .C0(n4595), 
        .Y(n4613) );
  OAI22XL U4950 ( .A0(n5411), .A1(n2945), .B0(n5460), .B1(n4873), .Y(n4601) );
  OAI22XL U4951 ( .A0(n5620), .A1(n4876), .B0(n5724), .B1(n2948), .Y(n4600) );
  OAI22XL U4952 ( .A0(n5413), .A1(n4809), .B0(n5453), .B1(n3485), .Y(n4599) );
  OAI22XL U4953 ( .A0(n5626), .A1(n4857), .B0(n5428), .B1(n4838), .Y(n4598) );
  OAI22XL U4954 ( .A0(n5432), .A1(n2943), .B0(n5529), .B1(n4867), .Y(n4605) );
  OAI22XL U4955 ( .A0(n5486), .A1(n2947), .B0(n5582), .B1(n4865), .Y(n4604) );
  OAI22XL U4956 ( .A0(n5391), .A1(n2949), .B0(n5506), .B1(n4847), .Y(n4603) );
  OAI22XL U4957 ( .A0(n5465), .A1(n4859), .B0(n5596), .B1(n4875), .Y(n4602) );
  OAI22XL U4958 ( .A0(n5615), .A1(n4868), .B0(n5469), .B1(n4829), .Y(n4609) );
  OAI22XL U4959 ( .A0(n5613), .A1(n3220), .B0(n5447), .B1(n3223), .Y(n4608) );
  OAI22XL U4960 ( .A0(n5452), .A1(n2946), .B0(n5607), .B1(n4858), .Y(n4607) );
  OAI22XL U4961 ( .A0(n5393), .A1(n4860), .B0(n5483), .B1(n2950), .Y(n4606) );
  NAND4XL U4962 ( .A(n4613), .B(n4612), .C(n4611), .D(n4610), .Y(n4641) );
  AO22X1 U4963 ( .A0(n4635), .A1(n4636), .B0(n4641), .B1(n4665), .Y(n4614) );
  NOR2XL U4964 ( .A(n5010), .B(n4627), .Y(n4621) );
  AOI222XL U4965 ( .A0(string_cnt_max[2]), .A1(n4619), .B0(string_cnt_max[2]), 
        .B1(n4618), .C0(n4619), .C1(n4618), .Y(n4620) );
  AOI222XL U4966 ( .A0(n4621), .A1(n5578), .B0(n4621), .B1(n4620), .C0(n5578), 
        .C1(n4620), .Y(n4632) );
  NOR2XL U4967 ( .A(n4623), .B(n4622), .Y(n4624) );
  AOI2BB2X1 U4968 ( .B0(n4624), .B1(string_cnt_max[4]), .A0N(n4624), .A1N(
        n4905), .Y(n4625) );
  OAI21XL U4969 ( .A0(n4627), .A1(n4628), .B0(n4625), .Y(n4631) );
  OAI22XL U4970 ( .A0(n4632), .A1(n4631), .B0(n4630), .B1(n4629), .Y(n4660) );
  OAI22XL U4971 ( .A0(n4636), .A1(n4635), .B0(n4634), .B1(n4633), .Y(n4650) );
  OAI22XL U4972 ( .A0(n4640), .A1(n4639), .B0(n4638), .B1(n4637), .Y(n4649) );
  OAI22XL U4973 ( .A0(n4656), .A1(n4642), .B0(n4665), .B1(n4641), .Y(n4648) );
  OAI22XL U4974 ( .A0(n4646), .A1(n4645), .B0(n4644), .B1(n4643), .Y(n4647) );
  NAND3BX1 U4975 ( .AN(n4664), .B(n4656), .C(n4655), .Y(n4657) );
  AOI222XL U4976 ( .A0(n4669), .A1(n4668), .B0(n4669), .B1(n4667), .C0(n4668), 
        .C1(n4666), .Y(n4670) );
  NOR2BX1 U4977 ( .AN(n4671), .B(n4670), .Y(n4680) );
  OAI21XL U4978 ( .A0(N1802), .A1(n4672), .B0(n4682), .Y(n4676) );
  OAI22XL U4979 ( .A0(n4673), .A1(n4677), .B0(n5650), .B1(n4676), .Y(n4910) );
  OAI22XL U4980 ( .A0(n5548), .A1(n4676), .B0(n4674), .B1(n4677), .Y(n4908) );
  OAI22XL U4981 ( .A0(n4675), .A1(n4677), .B0(n5643), .B1(n4676), .Y(n4914) );
  OAI22XL U4982 ( .A0(n4678), .A1(n4677), .B0(n5539), .B1(n4676), .Y(n4922) );
  AOI221XL U4983 ( .A0(n4689), .A1(n4679), .B0(n5632), .B1(n4679), .C0(n4692), 
        .Y(n4681) );
  OAI22XL U4984 ( .A0(N1802), .A1(n4945), .B0(n4680), .B1(n4692), .Y(n4695) );
  OAI21XL U4985 ( .A0(n4689), .A1(n5540), .B0(n4683), .Y(n4684) );
  OAI2BB2XL U4986 ( .B0(n4690), .B1(n5534), .A0N(n5062), .A1N(n4684), .Y(n4932) );
  AOI2BB1X1 U4987 ( .A0N(n4689), .A1N(n5604), .B0(n4685), .Y(n4686) );
  OAI222XL U4988 ( .A0(n4687), .A1(n4693), .B0(n4692), .B1(n4686), .C0(n4690), 
        .C1(n5547), .Y(n4906) );
  AOI2BB1X1 U4989 ( .A0N(n4689), .A1N(n5541), .B0(n4688), .Y(n4691) );
  OAI222XL U4990 ( .A0(n4694), .A1(n4693), .B0(n4692), .B1(n4691), .C0(n4690), 
        .C1(n5652), .Y(n4907) );
  OAI22XL U4991 ( .A0(n5586), .A1(n3223), .B0(n5538), .B1(n4865), .Y(n4700) );
  NAND2XL U4992 ( .A(stringdata_ff[67]), .B(n4696), .Y(n4697) );
  OAI22XL U4993 ( .A0(n5499), .A1(n4847), .B0(n5606), .B1(n4866), .Y(n4705) );
  OAI22XL U4994 ( .A0(n5585), .A1(n4868), .B0(n5412), .B1(n2945), .Y(n4704) );
  OAI22XL U4995 ( .A0(n5513), .A1(n2943), .B0(n5455), .B1(n4838), .Y(n4703) );
  OAI22XL U4996 ( .A0(n5475), .A1(n3485), .B0(n5602), .B1(n4860), .Y(n4702) );
  OAI22XL U4997 ( .A0(n5441), .A1(n2944), .B0(n5517), .B1(n3226), .Y(n4709) );
  OAI22XL U4998 ( .A0(n5726), .A1(n2949), .B0(n5386), .B1(n4829), .Y(n4708) );
  OAI22XL U4999 ( .A0(n5408), .A1(n4876), .B0(n5729), .B1(n2950), .Y(n4707) );
  OAI22XL U5000 ( .A0(n5590), .A1(n3220), .B0(n5553), .B1(n4809), .Y(n4706) );
  NOR4X1 U5001 ( .A(n4709), .B(n4708), .C(n4707), .D(n4706), .Y(n4715) );
  OAI22XL U5002 ( .A0(n5445), .A1(n4852), .B0(n5716), .B1(n3233), .Y(n4713) );
  OAI22XL U5003 ( .A0(n5435), .A1(n4859), .B0(n5497), .B1(n4858), .Y(n4712) );
  OAI22XL U5004 ( .A0(n5433), .A1(n4875), .B0(n5640), .B1(n4873), .Y(n4711) );
  OAI22XL U5005 ( .A0(n5530), .A1(n2947), .B0(n5706), .B1(n4874), .Y(n4710) );
  OAI22XL U5006 ( .A0(n5501), .A1(n4847), .B0(n5601), .B1(n3485), .Y(n4720) );
  OAI22XL U5007 ( .A0(n5493), .A1(n3223), .B0(n5712), .B1(n4868), .Y(n4719) );
  OAI22XL U5008 ( .A0(n5407), .A1(n3226), .B0(n5588), .B1(n2947), .Y(n4718) );
  OAI22XL U5009 ( .A0(n5579), .A1(n4874), .B0(n5424), .B1(n2945), .Y(n4725) );
  OAI22XL U5010 ( .A0(n5416), .A1(n2949), .B0(n5636), .B1(n4865), .Y(n4724) );
  OAI22XL U5011 ( .A0(n5624), .A1(n2943), .B0(n5406), .B1(n3233), .Y(n4723) );
  OAI22XL U5012 ( .A0(n5521), .A1(n2946), .B0(n5708), .B1(n4858), .Y(n4722) );
  OAI22XL U5013 ( .A0(n5443), .A1(n4859), .B0(n5597), .B1(n4860), .Y(n4729) );
  OAI22XL U5014 ( .A0(n5523), .A1(n4873), .B0(n5605), .B1(n4838), .Y(n4728) );
  OAI22XL U5015 ( .A0(n5430), .A1(n4857), .B0(n5509), .B1(n2944), .Y(n4727) );
  OAI22XL U5016 ( .A0(n5397), .A1(n3220), .B0(n5583), .B1(n4856), .Y(n4726) );
  OAI22XL U5017 ( .A0(n5623), .A1(n2950), .B0(n5448), .B1(n4875), .Y(n4733) );
  OAI22XL U5018 ( .A0(n5543), .A1(n4809), .B0(n5718), .B1(n4876), .Y(n4732) );
  OAI22XL U5019 ( .A0(n5648), .A1(n4867), .B0(n5484), .B1(n4829), .Y(n4731) );
  OAI22XL U5020 ( .A0(n5456), .A1(n2948), .B0(n5390), .B1(n4852), .Y(n4730) );
  AND4X1 U5021 ( .A(n4737), .B(n4736), .C(n4735), .D(n4734), .Y(n4923) );
  OAI2BB2XL U5022 ( .B0(n4916), .B1(n4917), .A0N(n4922), .A1N(n4923), .Y(n4888) );
  OAI22XL U5023 ( .A0(n5432), .A1(n4829), .B0(n5607), .B1(n4866), .Y(n4742) );
  AOI2BB2X1 U5024 ( .B0(stringdata_ff[12]), .B1(n4738), .A0N(n5515), .A1N(
        n2945), .Y(n4740) );
  NAND2XL U5025 ( .A(stringdata_ff[84]), .B(n4849), .Y(n4739) );
  OAI211XL U5026 ( .A0(n4852), .A1(n5482), .B0(n4740), .C0(n4739), .Y(n4741)
         );
  OAI22XL U5027 ( .A0(n5460), .A1(n3485), .B0(n5391), .B1(n4859), .Y(n4747) );
  OAI22XL U5028 ( .A0(n5411), .A1(n4868), .B0(n5447), .B1(n3226), .Y(n4746) );
  OAI22XL U5029 ( .A0(n5428), .A1(n4874), .B0(n5613), .B1(n2949), .Y(n4745) );
  OAI22XL U5030 ( .A0(n5620), .A1(n2943), .B0(n5393), .B1(n4858), .Y(n4744) );
  OAI22XL U5031 ( .A0(n5469), .A1(n4838), .B0(n5529), .B1(n2950), .Y(n4751) );
  OAI22XL U5032 ( .A0(n5465), .A1(n2947), .B0(n5531), .B1(n4873), .Y(n4750) );
  OAI22XL U5033 ( .A0(n5645), .A1(n4867), .B0(n5483), .B1(n3220), .Y(n4749) );
  OAI22XL U5034 ( .A0(n5596), .A1(n4860), .B0(n5453), .B1(n3223), .Y(n4748) );
  OAI22XL U5035 ( .A0(n5452), .A1(n4876), .B0(n5506), .B1(n2948), .Y(n4755) );
  OAI22XL U5036 ( .A0(n5626), .A1(n2946), .B0(n5413), .B1(n4847), .Y(n4754) );
  OAI22XL U5037 ( .A0(n5724), .A1(n4857), .B0(n5582), .B1(n4856), .Y(n4753) );
  OAI22XL U5038 ( .A0(n5402), .A1(n4875), .B0(n5486), .B1(n3233), .Y(n4752) );
  OAI22XL U5039 ( .A0(n5434), .A1(n4876), .B0(n5610), .B1(n3226), .Y(n4762) );
  OAI22XL U5040 ( .A0(n5382), .A1(n4852), .B0(n5594), .B1(n2948), .Y(n4761) );
  OAI22XL U5041 ( .A0(n5494), .A1(n2946), .B0(n5641), .B1(n4866), .Y(n4760) );
  OAI22XL U5042 ( .A0(n5639), .A1(n2945), .B0(n5427), .B1(n4857), .Y(n4767) );
  OAI22XL U5043 ( .A0(n5436), .A1(n4858), .B0(n5524), .B1(n4873), .Y(n4766) );
  OAI22XL U5044 ( .A0(n5599), .A1(n4860), .B0(n5399), .B1(n4829), .Y(n4765) );
  OAI22XL U5045 ( .A0(n5504), .A1(n2943), .B0(n5589), .B1(n3220), .Y(n4764) );
  OAI22XL U5046 ( .A0(n5717), .A1(n2944), .B0(n5387), .B1(n4859), .Y(n4771) );
  OAI22XL U5047 ( .A0(n5512), .A1(n4865), .B0(n5421), .B1(n3233), .Y(n4770) );
  OAI22XL U5048 ( .A0(n5545), .A1(n4809), .B0(n5471), .B1(n2950), .Y(n4769) );
  OAI22XL U5049 ( .A0(n5500), .A1(n2949), .B0(n5581), .B1(n4856), .Y(n4768) );
  OAI22XL U5050 ( .A0(n5488), .A1(n4875), .B0(n5385), .B1(n3223), .Y(n4775) );
  OAI22XL U5051 ( .A0(n5449), .A1(n4847), .B0(n5659), .B1(n4867), .Y(n4774) );
  OAI22XL U5052 ( .A0(n5422), .A1(n4868), .B0(n5603), .B1(n2947), .Y(n4773) );
  OAI22XL U5053 ( .A0(n5711), .A1(n4838), .B0(n5492), .B1(n3485), .Y(n4772) );
  AND4X1 U5054 ( .A(n4779), .B(n4778), .C(n4777), .D(n4776), .Y(n4911) );
  OAI2BB2XL U5055 ( .B0(n4918), .B1(n4919), .A0N(n4910), .A1N(n4911), .Y(n4887) );
  OAI22XL U5056 ( .A0(n5720), .A1(n4852), .B0(n5510), .B1(n2944), .Y(n4783) );
  AOI2BB2X1 U5057 ( .B0(stringdata_ff[83]), .B1(n4849), .A0N(n5516), .A1N(
        n4865), .Y(n4781) );
  NAND2XL U5058 ( .A(stringdata_ff[42]), .B(n4828), .Y(n4780) );
  OAI211XL U5059 ( .A0(n4875), .A1(n5481), .B0(n4781), .C0(n4780), .Y(n4782)
         );
  OAI22XL U5060 ( .A0(n5439), .A1(n4868), .B0(n5608), .B1(n4866), .Y(n4788) );
  OAI22XL U5061 ( .A0(n5619), .A1(n4860), .B0(n5487), .B1(n4874), .Y(n4787) );
  OAI22XL U5062 ( .A0(n5719), .A1(n4876), .B0(n5446), .B1(n4847), .Y(n4786) );
  OAI22XL U5063 ( .A0(n5616), .A1(n2943), .B0(n5536), .B1(n2950), .Y(n4785) );
  OAI22XL U5064 ( .A0(n5431), .A1(n4858), .B0(n5490), .B1(n3223), .Y(n4792) );
  OAI22XL U5065 ( .A0(n5593), .A1(n3233), .B0(n5454), .B1(n2948), .Y(n4791) );
  OAI22XL U5066 ( .A0(n5528), .A1(n2946), .B0(n5647), .B1(n4867), .Y(n4790) );
  OAI22XL U5067 ( .A0(n5418), .A1(n3226), .B0(n5728), .B1(n3220), .Y(n4789) );
  OAI22XL U5068 ( .A0(n5638), .A1(n4838), .B0(n5470), .B1(n4873), .Y(n4796) );
  OAI22XL U5069 ( .A0(n5467), .A1(n2945), .B0(n5404), .B1(n4856), .Y(n4795) );
  OAI22XL U5070 ( .A0(n5635), .A1(n2949), .B0(n5725), .B1(n4857), .Y(n4794) );
  OAI22XL U5071 ( .A0(n5580), .A1(n4829), .B0(n5395), .B1(n4859), .Y(n4793) );
  OAI22XL U5072 ( .A0(n5587), .A1(n4852), .B0(n5440), .B1(n3220), .Y(n4803) );
  OAI22XL U5073 ( .A0(n5591), .A1(n4874), .B0(n5489), .B1(n4856), .Y(n4802) );
  OAI22XL U5074 ( .A0(n5437), .A1(n4876), .B0(n5592), .B1(n3485), .Y(n4801) );
  OAI22XL U5075 ( .A0(n5622), .A1(n2947), .B0(n5394), .B1(n3233), .Y(n4808) );
  OAI22XL U5076 ( .A0(n5709), .A1(n4858), .B0(n5633), .B1(n2948), .Y(n4807) );
  OAI22XL U5077 ( .A0(n5450), .A1(n2943), .B0(n5508), .B1(n4865), .Y(n4806) );
  OAI22XL U5078 ( .A0(n5631), .A1(n4838), .B0(n5396), .B1(n4857), .Y(n4805) );
  OAI22XL U5079 ( .A0(n5617), .A1(n2944), .B0(n5400), .B1(n4875), .Y(n4813) );
  OAI22XL U5080 ( .A0(n5463), .A1(n2945), .B0(n5630), .B1(n4866), .Y(n4812) );
  OAI22XL U5081 ( .A0(n5464), .A1(n2946), .B0(n5544), .B1(n4809), .Y(n4811) );
  OAI22XL U5082 ( .A0(n5644), .A1(n4867), .B0(n5519), .B1(n4873), .Y(n4810) );
  OAI22XL U5083 ( .A0(n5491), .A1(n4847), .B0(n5612), .B1(n2949), .Y(n4817) );
  OAI22XL U5084 ( .A0(n5410), .A1(n4859), .B0(n5505), .B1(n3223), .Y(n4816) );
  OAI22XL U5085 ( .A0(n5514), .A1(n4860), .B0(n5389), .B1(n4829), .Y(n4815) );
  OAI22XL U5086 ( .A0(n5466), .A1(n2950), .B0(n5713), .B1(n4868), .Y(n4814) );
  AND4X1 U5087 ( .A(n4821), .B(n4820), .C(n4819), .D(n4818), .Y(n4915) );
  OAI2BB2XL U5088 ( .B0(n4912), .B1(n4913), .A0N(n4914), .A1N(n4915), .Y(n4886) );
  OAI22XL U5089 ( .A0(n5459), .A1(n4857), .B0(n5629), .B1(n2946), .Y(n4827) );
  AOI2BB2X1 U5090 ( .B0(stringdata_ff[55]), .B1(n4822), .A0N(n5649), .A1N(
        n4809), .Y(n4825) );
  NAND2XL U5091 ( .A(stringdata_ff[87]), .B(n4823), .Y(n4824) );
  OAI211XL U5092 ( .A0(n2943), .A1(n5715), .B0(n4825), .C0(n4824), .Y(n4826)
         );
  OAI22XL U5093 ( .A0(n5722), .A1(n4859), .B0(n5507), .B1(n2944), .Y(n4833) );
  OAI22XL U5094 ( .A0(n5414), .A1(n3220), .B0(n5426), .B1(n4868), .Y(n4832) );
  OAI22XL U5095 ( .A0(n5442), .A1(n4829), .B0(n5392), .B1(n4874), .Y(n4831) );
  OAI22XL U5096 ( .A0(n5468), .A1(n4873), .B0(n5625), .B1(n3485), .Y(n4830) );
  OAI22XL U5097 ( .A0(n5461), .A1(n2948), .B0(n5388), .B1(n4856), .Y(n4837) );
  OAI22XL U5098 ( .A0(n5429), .A1(n3233), .B0(n5496), .B1(n4852), .Y(n4836) );
  OAI22XL U5099 ( .A0(n5403), .A1(n4847), .B0(n5485), .B1(n4875), .Y(n4835) );
  OAI22XL U5100 ( .A0(n5526), .A1(n4860), .B0(n5423), .B1(n4866), .Y(n4834) );
  OAI22XL U5101 ( .A0(n5614), .A1(n2949), .B0(n5527), .B1(n2945), .Y(n4842) );
  OAI22XL U5102 ( .A0(n5398), .A1(n4858), .B0(n5598), .B1(n4838), .Y(n4841) );
  OAI22XL U5103 ( .A0(n5444), .A1(n3223), .B0(n5584), .B1(n4876), .Y(n4840) );
  OAI22XL U5104 ( .A0(n5537), .A1(n2950), .B0(n5609), .B1(n4865), .Y(n4839) );
  OAI22XL U5105 ( .A0(n5502), .A1(n4847), .B0(n5727), .B1(n3223), .Y(n4854) );
  AOI2BB2X1 U5106 ( .B0(stringdata_ff[27]), .B1(n4848), .A0N(n5627), .A1N(
        n2950), .Y(n4851) );
  NAND2XL U5107 ( .A(stringdata_ff[85]), .B(n4849), .Y(n4850) );
  OAI22XL U5108 ( .A0(n5621), .A1(n2944), .B0(n5438), .B1(n4856), .Y(n4864) );
  OAI22XL U5109 ( .A0(n5723), .A1(n4857), .B0(n5457), .B1(n3226), .Y(n4863) );
  OAI22XL U5110 ( .A0(n5721), .A1(n4859), .B0(n5710), .B1(n4858), .Y(n4862) );
  OAI22XL U5111 ( .A0(n5451), .A1(n3233), .B0(n5628), .B1(n4860), .Y(n4861) );
  OAI22XL U5112 ( .A0(n5511), .A1(n3220), .B0(n5611), .B1(n4865), .Y(n4872) );
  OAI22XL U5113 ( .A0(n5556), .A1(n4867), .B0(n5417), .B1(n4866), .Y(n4871) );
  OAI22XL U5114 ( .A0(n5415), .A1(n2946), .B0(n5474), .B1(n3825), .Y(n4870) );
  OAI22XL U5115 ( .A0(n5462), .A1(n3485), .B0(n5383), .B1(n4868), .Y(n4869) );
  OAI22XL U5116 ( .A0(n5532), .A1(n4873), .B0(n5714), .B1(n2943), .Y(n4880) );
  OAI22XL U5117 ( .A0(n5520), .A1(n2949), .B0(n5707), .B1(n4874), .Y(n4879) );
  OAI22XL U5118 ( .A0(n5401), .A1(n4875), .B0(n5458), .B1(n2948), .Y(n4878) );
  OAI22XL U5119 ( .A0(n5409), .A1(n4876), .B0(n5566), .B1(n2947), .Y(n4877) );
  AND4X1 U5120 ( .A(n4884), .B(n4883), .C(n4882), .D(n4881), .Y(n4909) );
  OAI2BB2XL U5121 ( .B0(n4920), .B1(n4921), .A0N(n4908), .A1N(n4909), .Y(n4885) );
  AOI2BB1X1 U5122 ( .A0N(cal_cnt[4]), .A1N(n4890), .B0(n4904), .Y(n4900) );
  OAI22XL U5123 ( .A0(cal_cnt[3]), .A1(n4892), .B0(n5314), .B1(n4891), .Y(
        n4898) );
  AO21X1 U5124 ( .A0(n4896), .A1(n4895), .B0(n4894), .Y(n4897) );
  AOI222XL U5125 ( .A0(string_cnt_max[3]), .A1(n4898), .B0(string_cnt_max[3]), 
        .B1(n4897), .C0(n4898), .C1(n4897), .Y(n4899) );
  AOI222XL U5126 ( .A0(n4900), .A1(n5495), .B0(n4900), .B1(n4899), .C0(n5495), 
        .C1(n4899), .Y(n4903) );
  OAI21XL U5127 ( .A0(n4904), .A1(n4901), .B0(n4905), .Y(n4902) );
  OAI2BB2XL U5128 ( .B0(n4905), .B1(n4904), .A0N(n4903), .A1N(n4902), .Y(n4931) );
  OAI22XL U5129 ( .A0(n4911), .A1(n4910), .B0(n4909), .B1(n4908), .Y(n4927) );
  OAI2BB2XL U5130 ( .B0(n4915), .B1(n4914), .A0N(n4913), .A1N(n4912), .Y(n4926) );
  AO22X1 U5131 ( .A0(n4919), .A1(n4918), .B0(n4917), .B1(n4916), .Y(n4925) );
  OAI2BB2XL U5132 ( .B0(n4923), .B1(n4922), .A0N(n4921), .A1N(n4920), .Y(n4924) );
  AO22X1 U5133 ( .A0(n4936), .A1(n4935), .B0(n4934), .B1(n4933), .Y(n4937) );
  NAND4X1 U5134 ( .A(n4940), .B(n4939), .C(n4938), .D(n4937), .Y(n4941) );
  NOR2X2 U5135 ( .A(n4942), .B(n4941), .Y(n5061) );
  OAI21X2 U5136 ( .A0(n4945), .A1(n4944), .B0(n5139), .Y(n5325) );
  INVX3 U5137 ( .A(n5325), .Y(n5328) );
  OAI2BB2XL U5138 ( .B0(n5328), .B1(n5420), .A0N(n5328), .A1N(front_cnt[4]), 
        .Y(n4946) );
  INVXL U5139 ( .A(n4946), .Y(n5339) );
  OAI2BB2XL U5140 ( .B0(n5328), .B1(n5562), .A0N(n5328), .A1N(front_cnt[0]), 
        .Y(n4947) );
  INVXL U5141 ( .A(n4947), .Y(n5340) );
  OAI2BB2XL U5142 ( .B0(n5328), .B1(n5571), .A0N(n5328), .A1N(front_cnt[2]), 
        .Y(n4948) );
  INVXL U5143 ( .A(n4948), .Y(n5341) );
  NOR3XL U5144 ( .A(n5472), .B(n5560), .C(n5700), .Y(n5151) );
  NAND2XL U5145 ( .A(curr_state[0]), .B(n5568), .Y(n5156) );
  NOR3XL U5146 ( .A(curr_state[1]), .B(n5156), .C(n5698), .Y(n4990) );
  NOR2BX1 U5147 ( .AN(n4973), .B(n5561), .Y(n4957) );
  NAND2X1 U5148 ( .A(isstring), .B(chardata[4]), .Y(n5241) );
  OAI22XL U5149 ( .A0(n5167), .A1(n5707), .B0(n5166), .B1(n5241), .Y(n4949) );
  INVXL U5150 ( .A(n4949), .Y(n5342) );
  NOR2X1 U5151 ( .A(chardata[5]), .B(n5160), .Y(n5247) );
  OAI22XL U5152 ( .A0(n5167), .A1(n5706), .B0(n5166), .B1(n5247), .Y(n4950) );
  INVXL U5153 ( .A(n4950), .Y(n5343) );
  NAND3XL U5154 ( .A(string_cnt[1]), .B(string_cnt[0]), .C(n5560), .Y(n5230)
         );
  NAND2X1 U5155 ( .A(isstring), .B(chardata[0]), .Y(n5238) );
  OAI22XL U5156 ( .A0(n5175), .A1(n5712), .B0(n5174), .B1(n5238), .Y(n4951) );
  INVXL U5157 ( .A(n4951), .Y(n5344) );
  NAND2X1 U5158 ( .A(isstring), .B(chardata[7]), .Y(n5239) );
  OAI22XL U5159 ( .A0(n5175), .A1(n5713), .B0(n5174), .B1(n5239), .Y(n4952) );
  INVXL U5160 ( .A(n4952), .Y(n5345) );
  NAND3XL U5161 ( .A(string_cnt[2]), .B(n5472), .C(n5700), .Y(n5227) );
  NAND2X1 U5162 ( .A(isstring), .B(chardata[6]), .Y(n5240) );
  OAI22XL U5163 ( .A0(n5173), .A1(n5711), .B0(n5172), .B1(n5240), .Y(n4953) );
  INVXL U5164 ( .A(n4953), .Y(n5346) );
  NAND3XL U5165 ( .A(string_cnt[2]), .B(string_cnt[0]), .C(n5472), .Y(n5224)
         );
  OAI22XL U5166 ( .A0(n5171), .A1(n5708), .B0(n5170), .B1(n5238), .Y(n4954) );
  INVXL U5167 ( .A(n4954), .Y(n5347) );
  OAI22XL U5168 ( .A0(n5171), .A1(n5710), .B0(n5170), .B1(n5241), .Y(n4955) );
  INVXL U5169 ( .A(n4955), .Y(n5348) );
  OAI22XL U5170 ( .A0(n5171), .A1(n5709), .B0(n5170), .B1(n5239), .Y(n4956) );
  INVXL U5171 ( .A(n4956), .Y(n5349) );
  NAND3XL U5172 ( .A(string_cnt[0]), .B(n5472), .C(n5560), .Y(n5237) );
  NAND2X1 U5173 ( .A(isstring), .B(chardata[1]), .Y(n5244) );
  OAI22XL U5174 ( .A0(n5214), .A1(n5728), .B0(n5213), .B1(n5244), .Y(n4958) );
  INVXL U5175 ( .A(n4958), .Y(n5350) );
  OAI22XL U5176 ( .A0(n5210), .A1(n5727), .B0(n5209), .B1(n5241), .Y(n4959) );
  INVXL U5177 ( .A(n4959), .Y(n5351) );
  OAI22XL U5178 ( .A0(n5206), .A1(n5725), .B0(n5205), .B1(n5244), .Y(n4960) );
  INVXL U5179 ( .A(n4960), .Y(n5352) );
  NAND2X1 U5180 ( .A(isstring), .B(chardata[3]), .Y(n5242) );
  OAI22XL U5181 ( .A0(n5206), .A1(n5724), .B0(n5205), .B1(n5242), .Y(n4961) );
  INVXL U5182 ( .A(n4961), .Y(n5353) );
  OAI22XL U5183 ( .A0(n5206), .A1(n5723), .B0(n5205), .B1(n5241), .Y(n4962) );
  INVXL U5184 ( .A(n4962), .Y(n5354) );
  NAND2X1 U5185 ( .A(isstring), .B(chardata[2]), .Y(n5243) );
  OAI22XL U5186 ( .A0(n5201), .A1(n5722), .B0(n5200), .B1(n5243), .Y(n4963) );
  INVXL U5187 ( .A(n4963), .Y(n5355) );
  OAI22XL U5188 ( .A0(n5201), .A1(n5721), .B0(n5200), .B1(n5241), .Y(n4964) );
  INVXL U5189 ( .A(n4964), .Y(n5356) );
  OAI22XL U5190 ( .A0(n5208), .A1(n5726), .B0(n5207), .B1(n5247), .Y(n4965) );
  INVXL U5191 ( .A(n4965), .Y(n5357) );
  OAI22XL U5192 ( .A0(n5196), .A1(n5720), .B0(n5195), .B1(n5244), .Y(n4966) );
  INVXL U5193 ( .A(n4966), .Y(n5358) );
  OAI22XL U5194 ( .A0(n5192), .A1(n5718), .B0(n5191), .B1(n5238), .Y(n4967) );
  INVXL U5195 ( .A(n4967), .Y(n5359) );
  OAI22XL U5196 ( .A0(n5192), .A1(n5719), .B0(n5191), .B1(n5244), .Y(n4968) );
  INVXL U5197 ( .A(n4968), .Y(n5360) );
  OAI22XL U5198 ( .A0(n5190), .A1(n5717), .B0(n5189), .B1(n5240), .Y(n4969) );
  INVXL U5199 ( .A(n4969), .Y(n5361) );
  NAND3XL U5200 ( .A(string_cnt[2]), .B(string_cnt[1]), .C(n5700), .Y(n5202)
         );
  OAI22XL U5201 ( .A0(n5186), .A1(n5715), .B0(n5185), .B1(n5243), .Y(n4970) );
  INVXL U5202 ( .A(n4970), .Y(n5362) );
  OAI22XL U5203 ( .A0(n5186), .A1(n5714), .B0(n5185), .B1(n5241), .Y(n4971) );
  INVXL U5204 ( .A(n4971), .Y(n5363) );
  OAI22XL U5205 ( .A0(n5188), .A1(n5716), .B0(n5187), .B1(n5247), .Y(n4972) );
  INVXL U5206 ( .A(n4972), .Y(n5364) );
  OAI22XL U5207 ( .A0(n5223), .A1(n5729), .B0(n5222), .B1(n5247), .Y(n4974) );
  INVXL U5208 ( .A(n4974), .Y(n5365) );
  NAND3XL U5209 ( .A(n5472), .B(n5560), .C(n5700), .Y(n5216) );
  NOR2X1 U5210 ( .A(n5216), .B(n5236), .Y(n5248) );
  AOI2BB2X1 U5211 ( .B0(n5248), .B1(n5238), .A0N(n5248), .A1N(
        stringdata_ff[106]), .Y(n4975) );
  INVXL U5212 ( .A(n4975), .Y(n5366) );
  AOI2BB2X1 U5213 ( .B0(n5248), .B1(n5244), .A0N(n5248), .A1N(
        stringdata_ff[107]), .Y(n4976) );
  INVXL U5214 ( .A(n4976), .Y(n5367) );
  AOI2BB2X1 U5215 ( .B0(n5248), .B1(n5243), .A0N(n5248), .A1N(
        stringdata_ff[108]), .Y(n4977) );
  INVXL U5216 ( .A(n4977), .Y(n5368) );
  AOI2BB2X1 U5217 ( .B0(n5248), .B1(n5242), .A0N(n5248), .A1N(
        stringdata_ff[109]), .Y(n4978) );
  INVXL U5218 ( .A(n4978), .Y(n5369) );
  AOI2BB2X1 U5219 ( .B0(n5248), .B1(n5241), .A0N(n5248), .A1N(
        stringdata_ff[110]), .Y(n4979) );
  INVXL U5220 ( .A(n4979), .Y(n5370) );
  AOI2BB2X1 U5221 ( .B0(n5248), .B1(n5240), .A0N(n5248), .A1N(
        stringdata_ff[112]), .Y(n4980) );
  INVXL U5222 ( .A(n4980), .Y(n5371) );
  AOI2BB2X1 U5223 ( .B0(n5248), .B1(n5239), .A0N(n5248), .A1N(
        stringdata_ff[113]), .Y(n4981) );
  INVXL U5224 ( .A(n4981), .Y(n5372) );
  NOR2XL U5225 ( .A(string_cnt[4]), .B(string_cnt[3]), .Y(n4982) );
  OAI211XL U5226 ( .A0(isstring), .A1(n4990), .B0(string_cnt[5]), .C0(n4982), 
        .Y(n5161) );
  OAI22XL U5227 ( .A0(n5165), .A1(n5705), .B0(n5164), .B1(n5238), .Y(n4983) );
  INVXL U5228 ( .A(n4983), .Y(n5373) );
  NAND2XL U5229 ( .A(string_cnt[2]), .B(string_cnt[0]), .Y(n4984) );
  NOR4XL U5230 ( .A(n5160), .B(n5472), .C(n4984), .D(n5561), .Y(n5153) );
  NAND2XL U5231 ( .A(string_cnt[4]), .B(n5153), .Y(n4986) );
  NAND3XL U5232 ( .A(string_cnt[5]), .B(isstring), .C(n4986), .Y(n4985) );
  OAI21XL U5233 ( .A0(string_cnt[5]), .A1(n4986), .B0(n4985), .Y(n4987) );
  INVXL U5234 ( .A(n4987), .Y(n5374) );
  NOR2XL U5235 ( .A(n5259), .B(n5266), .Y(n4989) );
  OAI21XL U5236 ( .A0(n5256), .A1(n5730), .B0(n5253), .Y(n4993) );
  INVXL U5237 ( .A(n4993), .Y(n5375) );
  NOR2XL U5238 ( .A(cal_cnt[0]), .B(head_f), .Y(n5009) );
  AOI21XL U5239 ( .A0(head_f), .A1(cal_cnt[0]), .B0(n5009), .Y(n4995) );
  NOR2XL U5240 ( .A(n5704), .B(n5731), .Y(n5022) );
  NOR2XL U5241 ( .A(front_cnt[0]), .B(head_f), .Y(n4997) );
  AOI21XL U5242 ( .A0(head_f), .A1(front_cnt[0]), .B0(n4997), .Y(n4994) );
  NAND2XL U5243 ( .A(star_f), .B(n5022), .Y(n5020) );
  OAI22XL U5244 ( .A0(n4995), .A1(n5018), .B0(n4994), .B1(n5020), .Y(n4996) );
  INVXL U5245 ( .A(n4996), .Y(n5376) );
  NAND2XL U5246 ( .A(n4997), .B(n5703), .Y(n5001) );
  OA21XL U5247 ( .A0(n4997), .A1(n5703), .B0(n5001), .Y(n4999) );
  OAI22XL U5248 ( .A0(cal_cnt[1]), .A1(n5009), .B0(n5476), .B1(n5002), .Y(
        n4998) );
  OAI22XL U5249 ( .A0(n4999), .A1(n5020), .B0(n4998), .B1(n5018), .Y(n5000) );
  INVXL U5250 ( .A(n5000), .Y(n5377) );
  NOR2XL U5251 ( .A(front_cnt[2]), .B(n5001), .Y(n5008) );
  AOI21XL U5252 ( .A0(front_cnt[2]), .A1(n5001), .B0(n5008), .Y(n5006) );
  NOR2XL U5253 ( .A(n5003), .B(n5002), .Y(n5011) );
  OAI22XL U5254 ( .A0(n5006), .A1(n5020), .B0(n5005), .B1(n5018), .Y(n5007) );
  INVXL U5255 ( .A(n5007), .Y(n5378) );
  NAND2XL U5256 ( .A(n5008), .B(n5702), .Y(n5015) );
  OA21XL U5257 ( .A0(n5008), .A1(n5702), .B0(n5015), .Y(n5013) );
  NAND2XL U5258 ( .A(n5010), .B(n5009), .Y(n5016) );
  OA21XL U5259 ( .A0(n5011), .A1(n5473), .B0(n5016), .Y(n5012) );
  OAI22XL U5260 ( .A0(n5020), .A1(n5013), .B0(n5018), .B1(n5012), .Y(n5014) );
  INVXL U5261 ( .A(n5014), .Y(n5379) );
  AOI2BB2X1 U5262 ( .B0(front_cnt[4]), .B1(n5015), .A0N(front_cnt[4]), .A1N(
        n5015), .Y(n5019) );
  AOI2BB2X1 U5263 ( .B0(cal_cnt[4]), .B1(n5016), .A0N(cal_cnt[4]), .A1N(n5016), 
        .Y(n5017) );
  OAI22XL U5264 ( .A0(n5020), .A1(n5019), .B0(n5018), .B1(n5017), .Y(n5021) );
  INVXL U5265 ( .A(n5021), .Y(n5380) );
  INVXL U5266 ( .A(n5022), .Y(n5381) );
  ADDHXL U5267 ( .A(end_f), .B(string_cnt_max[0]), .CO(n5029), .S(n5084) );
  NOR2BX1 U5268 ( .AN(n5023), .B(n5730), .Y(n5030) );
  ADDFXL U5269 ( .A(pat_cnt[0]), .B(n5024), .CI(n5084), .CO(n5032), .S(n5025)
         );
  OAI21XL U5270 ( .A0(n5026), .A1(n5476), .B0(n5025), .Y(n5027) );
  OAI2BB2XL U5271 ( .B0(n5027), .B1(cal_cnt[0]), .A0N(n5026), .A1N(n5476), .Y(
        n5041) );
  NOR2BX1 U5272 ( .AN(n5028), .B(n5730), .Y(n5035) );
  ADDHXL U5273 ( .A(string_cnt_max[1]), .B(n5029), .CO(n5034), .S(n5081) );
  ADDFXL U5274 ( .A(DP_OP_542J1_123_7011_n30), .B(n5030), .CI(n5480), .CO(
        n5037), .S(n5031) );
  NOR2BX1 U5275 ( .AN(n5033), .B(n5730), .Y(n5042) );
  ADDHXL U5276 ( .A(string_cnt_max[2]), .B(n5034), .CO(n5043), .S(n5083) );
  ADDFXL U5277 ( .A(n5576), .B(n5035), .CI(n5083), .CO(n5045), .S(n5038) );
  ADDFX1 U5278 ( .A(n5038), .B(n5037), .CI(n5036), .CO(n5044), .S(n5039) );
  AOI222XL U5279 ( .A0(n5041), .A1(n5040), .B0(n5571), .B1(n5039), .C0(n5473), 
        .C1(n5047), .Y(n5050) );
  ADDFXL U5280 ( .A(n5577), .B(n5042), .CI(n5088), .CO(n5054), .S(n5046) );
  ADDHXL U5281 ( .A(string_cnt_max[3]), .B(n5043), .CO(n5051), .S(n5088) );
  OAI22XL U5282 ( .A0(n5047), .A1(n5473), .B0(n5048), .B1(n5420), .Y(n5049) );
  OAI2BB2XL U5283 ( .B0(n5050), .B1(n5049), .A0N(n5420), .A1N(n5048), .Y(n5058) );
  ADDHXL U5284 ( .A(string_cnt_max[4]), .B(n5051), .CO(n5052), .S(n5077) );
  AOI2BB2X1 U5285 ( .B0(string_cnt_max[5]), .B1(n5052), .A0N(string_cnt_max[5]), .A1N(n5052), .Y(n5076) );
  AOI2BB2X1 U5286 ( .B0(n5055), .B1(n5093), .A0N(n5055), .A1N(n5093), .Y(n5056) );
  AOI2BB2X1 U5287 ( .B0(n5076), .B1(n5056), .A0N(n5076), .A1N(n5056), .Y(n5057) );
  OAI2BB2X1 U5288 ( .B0(cal_cnt[5]), .B1(n5059), .A0N(n5058), .A1N(n5057), .Y(
        n5158) );
  NOR2X2 U5289 ( .A(front_or_back), .B(n5158), .Y(n5333) );
  NAND2XL U5290 ( .A(cal_cnt[0]), .B(N1594), .Y(n5312) );
  AOI222XL U5291 ( .A0(n5476), .A1(n5696), .B0(n5476), .B1(n5312), .C0(n5696), 
        .C1(n5312), .Y(n5060) );
  OAI22XL U5292 ( .A0(cal_cnt[2]), .A1(n5563), .B0(n5571), .B1(N1802), .Y(
        n5109) );
  NOR2XL U5293 ( .A(n5571), .B(n5563), .Y(n5069) );
  OAI21XL U5294 ( .A0(cal_cnt[2]), .A1(N1802), .B0(n5060), .Y(n5068) );
  OAI22XL U5295 ( .A0(n5060), .A1(n5109), .B0(n5069), .B1(n5068), .Y(n5064) );
  AOI32X1 U5296 ( .A0(n5062), .A1(n5061), .A2(match_f_ff), .B0(n5074), .B1(
        n5061), .Y(n5304) );
  NAND2BX1 U5297 ( .AN(n5333), .B(n5304), .Y(n5144) );
  NAND2BX1 U5298 ( .AN(n5144), .B(n5328), .Y(n5326) );
  OAI22XL U5299 ( .A0(n5328), .A1(n5064), .B0(n5063), .B1(n5326), .Y(n5065) );
  OAI22XL U5300 ( .A0(n5067), .A1(n5335), .B0(n5571), .B1(n5334), .Y(n2586) );
  NAND2BX1 U5301 ( .AN(n5069), .B(n5068), .Y(n5319) );
  AOI222XL U5302 ( .A0(N1804), .A1(cal_cnt[3]), .B0(N1804), .B1(n5319), .C0(
        cal_cnt[3]), .C1(n5319), .Y(n5330) );
  OAI2BB2XL U5303 ( .B0(cal_cnt[5]), .B1(n5329), .A0N(cal_cnt[5]), .A1N(n5329), 
        .Y(n5071) );
  OAI22XL U5304 ( .A0(n5328), .A1(n5071), .B0(n5070), .B1(n5326), .Y(n5072) );
  NAND2XL U5305 ( .A(curr_state[2]), .B(n5731), .Y(N609) );
  INVXL U5306 ( .A(n5074), .Y(n5148) );
  NAND2BX1 U5307 ( .AN(n5084), .B(N1594), .Y(n5080) );
  OAI21XL U5308 ( .A0(n5077), .A1(n5094), .B0(n5076), .Y(n5075) );
  OAI31XL U5309 ( .A0(n5077), .A1(n5076), .A2(n5094), .B0(n5075), .Y(n5078) );
  INVXL U5310 ( .A(n5079), .Y(n5101) );
  ADDFXL U5311 ( .A(n5081), .B(n5696), .CI(n5080), .CO(n5082), .S(n5086) );
  ADDFXL U5312 ( .A(n5083), .B(n5563), .CI(n5082), .CO(n5087), .S(n5089) );
  AOI22XL U5313 ( .A0(n5086), .A1(n5476), .B0(n5089), .B1(n5571), .Y(n5092) );
  AOI2BB2X1 U5314 ( .B0(n5084), .B1(N1594), .A0N(n5084), .A1N(N1594), .Y(n5085) );
  ADDFXL U5315 ( .A(n5088), .B(n5699), .CI(n5087), .CO(n5094), .S(n5095) );
  OAI22XL U5316 ( .A0(n5089), .A1(n5571), .B0(n5095), .B1(n5473), .Y(n5090) );
  AOI21XL U5317 ( .A0(n5092), .A1(n5091), .B0(n5090), .Y(n5098) );
  AOI2BB2X1 U5318 ( .B0(n5094), .B1(n5093), .A0N(n5094), .A1N(n5093), .Y(n5096) );
  AO22X1 U5319 ( .A0(n5096), .A1(n5420), .B0(n5095), .B1(n5473), .Y(n5097) );
  OAI22XL U5320 ( .A0(n5098), .A1(n5097), .B0(n5096), .B1(n5420), .Y(n5099) );
  AO21X1 U5321 ( .A0(n5102), .A1(cal_cnt[5]), .B0(n5099), .Y(n5100) );
  NAND2XL U5322 ( .A(N1802), .B(n5571), .Y(n5103) );
  AOI2BB2X1 U5323 ( .B0(pat_cnt[2]), .B1(n5103), .A0N(n5571), .A1N(N1802), .Y(
        n5129) );
  OAI22XL U5324 ( .A0(cal_cnt[1]), .A1(N1675), .B0(n5476), .B1(n5696), .Y(
        n5313) );
  AOI2BB2X1 U5325 ( .B0(n5480), .B1(n5311), .A0N(n5480), .A1N(n5311), .Y(n5116) );
  NAND2XL U5326 ( .A(cal_cnt[0]), .B(pat_cnt[0]), .Y(n5106) );
  OAI22XL U5327 ( .A0(cal_cnt[0]), .A1(DP_OP_542J1_123_7011_n30), .B0(n5562), 
        .B1(pat_cnt[0]), .Y(n5104) );
  NAND2XL U5328 ( .A(n5419), .B(n5104), .Y(n5111) );
  NAND2XL U5329 ( .A(n5112), .B(n5573), .Y(n5105) );
  OAI31XL U5330 ( .A0(N1594), .A1(end_f), .A2(n5106), .B0(n5107), .Y(n5115) );
  OAI21XL U5331 ( .A0(n5116), .A1(n5115), .B0(n5107), .Y(n5121) );
  NAND2XL U5332 ( .A(N1675), .B(n5476), .Y(n5108) );
  AOI2BB2X1 U5333 ( .B0(pat_cnt[1]), .B1(n5108), .A0N(n5476), .A1N(N1675), .Y(
        n5120) );
  AOI2BB2X1 U5334 ( .B0(pat_cnt[2]), .B1(n5109), .A0N(pat_cnt[2]), .A1N(n5109), 
        .Y(n5119) );
  NOR2XL U5335 ( .A(N1804), .B(n5473), .Y(n5110) );
  NOR2XL U5336 ( .A(cal_cnt[3]), .B(n5699), .Y(n5130) );
  NOR2XL U5337 ( .A(n5110), .B(n5130), .Y(n5320) );
  OAI2BB2XL U5338 ( .B0(pat_cnt[3]), .B1(n5320), .A0N(pat_cnt[3]), .A1N(n5320), 
        .Y(n5127) );
  AND2X1 U5339 ( .A(n5112), .B(n5111), .Y(n5114) );
  NOR2XL U5340 ( .A(end_f), .B(n5114), .Y(n5113) );
  AOI211XL U5341 ( .A0(end_f), .A1(n5114), .B0(n5559), .C0(n5113), .Y(n5118)
         );
  AOI2BB2X1 U5342 ( .B0(n5116), .B1(n5115), .A0N(n5116), .A1N(n5115), .Y(n5117) );
  AOI222XL U5343 ( .A0(string_cnt_max[1]), .A1(n5118), .B0(string_cnt_max[1]), 
        .B1(n5117), .C0(n5118), .C1(n5117), .Y(n5124) );
  ADDFXL U5344 ( .A(n5121), .B(n5120), .CI(n5119), .CO(n5128), .S(n5122) );
  NOR2XL U5345 ( .A(n5122), .B(string_cnt_max[2]), .Y(n5123) );
  OAI2BB2XL U5346 ( .B0(n5124), .B1(n5123), .A0N(n5122), .A1N(
        string_cnt_max[2]), .Y(n5125) );
  AOI222XL U5347 ( .A0(string_cnt_max[3]), .A1(n5126), .B0(string_cnt_max[3]), 
        .B1(n5125), .C0(n5126), .C1(n5125), .Y(n5133) );
  ADDFXL U5348 ( .A(n5129), .B(n5128), .CI(n5127), .CO(n5134), .S(n5126) );
  OAI22XL U5349 ( .A0(N1804), .A1(n5473), .B0(n5130), .B1(n5577), .Y(n5135) );
  AOI2BB2X1 U5350 ( .B0(n5134), .B1(n5135), .A0N(n5134), .A1N(n5135), .Y(n5131) );
  AOI2BB2X1 U5351 ( .B0(cal_cnt[4]), .B1(n5131), .A0N(cal_cnt[4]), .A1N(n5131), 
        .Y(n5132) );
  AOI222XL U5352 ( .A0(n5495), .A1(n5133), .B0(n5495), .B1(n5132), .C0(n5133), 
        .C1(n5132), .Y(n5142) );
  NOR2BX1 U5353 ( .AN(n5134), .B(n5135), .Y(n5137) );
  NOR2BX1 U5354 ( .AN(n5135), .B(n5134), .Y(n5136) );
  OAI22XL U5355 ( .A0(cal_cnt[4]), .A1(n5137), .B0(n5420), .B1(n5136), .Y(
        n5138) );
  AOI2BB2X1 U5356 ( .B0(cal_cnt[5]), .B1(n5138), .A0N(cal_cnt[5]), .A1N(n5138), 
        .Y(n5141) );
  OA21XL U5357 ( .A0(n5141), .A1(n5142), .B0(string_cnt_max[5]), .Y(n5140) );
  AOI211XL U5358 ( .A0(n5142), .A1(n5141), .B0(n5140), .C0(n5139), .Y(n5145)
         );
  OAI21XL U5359 ( .A0(n5145), .A1(n5144), .B0(n5143), .Y(n5146) );
  NAND2XL U5360 ( .A(curr_state[1]), .B(n5568), .Y(n5150) );
  NOR3XL U5361 ( .A(curr_state[2]), .B(curr_state[0]), .C(curr_state[1]), .Y(
        n5154) );
  NAND3XL U5362 ( .A(ispattern_ff), .B(n5154), .C(n5698), .Y(n5149) );
  OAI211XL U5363 ( .A0(n5150), .A1(N612), .B0(n5337), .C0(n5149), .Y(N611) );
  NAND2XL U5364 ( .A(pat_cnt[0]), .B(ispattern), .Y(n5255) );
  NOR2XL U5365 ( .A(n5480), .B(n5255), .Y(n5257) );
  AOI211XL U5366 ( .A0(n5480), .A1(n5255), .B0(n5257), .C0(n5256), .Y(n2663)
         );
  NAND2XL U5367 ( .A(isstring), .B(string_cnt[0]), .Y(N845) );
  AOI211XL U5368 ( .A0(n5560), .A1(n5230), .B0(n5151), .C0(n5160), .Y(N847) );
  AOI211XL U5369 ( .A0(n5219), .A1(n5561), .B0(n5153), .C0(n5160), .Y(N848) );
  OAI32XL U5370 ( .A0(n5153), .A1(n5701), .A2(n5160), .B0(string_cnt[4]), .B1(
        n5152), .Y(N849) );
  AOI221XL U5371 ( .A0(string_cnt[1]), .A1(string_cnt[0]), .B0(n5472), .B1(
        n5700), .C0(n5160), .Y(N846) );
  INVXL U5372 ( .A(n5309), .Y(n5157) );
  OAI21XL U5373 ( .A0(isstring_ff), .A1(ispattern_ff), .B0(n5154), .Y(n5155)
         );
  OAI21XL U5374 ( .A0(n5157), .A1(n5156), .B0(n5155), .Y(N610) );
  OAI21XL U5375 ( .A0(n5159), .A1(n5325), .B0(n5731), .Y(n2941) );
  OAI22XL U5376 ( .A0(ispattern), .A1(n5160), .B0(n5256), .B1(n5698), .Y(n2940) );
  OAI22XL U5377 ( .A0(n5163), .A1(n5583), .B0(n5162), .B1(n5238), .Y(n2939) );
  OAI22XL U5378 ( .A0(n5163), .A1(n5489), .B0(n5162), .B1(n5239), .Y(n2938) );
  OAI22XL U5379 ( .A0(n5163), .A1(n5581), .B0(n5162), .B1(n5240), .Y(n2937) );
  OAI22XL U5380 ( .A0(n5163), .A1(n5503), .B0(n5162), .B1(n5247), .Y(n2936) );
  OAI22XL U5381 ( .A0(n5163), .A1(n5438), .B0(n5162), .B1(n5241), .Y(n2935) );
  OAI22XL U5382 ( .A0(n5163), .A1(n5582), .B0(n5162), .B1(n5242), .Y(n2934) );
  OAI22XL U5383 ( .A0(n5163), .A1(n5388), .B0(n5162), .B1(n5243), .Y(n2933) );
  OAI22XL U5384 ( .A0(n5163), .A1(n5404), .B0(n5162), .B1(n5244), .Y(n2932) );
  OAI22XL U5385 ( .A0(n5165), .A1(n5630), .B0(n5164), .B1(n5239), .Y(n2930) );
  OAI22XL U5386 ( .A0(n5165), .A1(n5641), .B0(n5164), .B1(n5240), .Y(n2929) );
  OAI22XL U5387 ( .A0(n5165), .A1(n5606), .B0(n5164), .B1(n5247), .Y(n2928) );
  OAI22XL U5388 ( .A0(n5165), .A1(n5417), .B0(n5164), .B1(n5241), .Y(n2927) );
  OAI22XL U5389 ( .A0(n5165), .A1(n5607), .B0(n5164), .B1(n5242), .Y(n2926) );
  OAI22XL U5390 ( .A0(n5165), .A1(n5423), .B0(n5164), .B1(n5243), .Y(n2925) );
  OAI22XL U5391 ( .A0(n5165), .A1(n5608), .B0(n5164), .B1(n5244), .Y(n2924) );
  OAI22XL U5392 ( .A0(n5167), .A1(n5579), .B0(n5166), .B1(n5238), .Y(n2923) );
  OAI22XL U5393 ( .A0(n5167), .A1(n5591), .B0(n5166), .B1(n5239), .Y(n2922) );
  OAI22XL U5394 ( .A0(n5167), .A1(n5384), .B0(n5166), .B1(n5240), .Y(n2921) );
  OAI22XL U5395 ( .A0(n5167), .A1(n5428), .B0(n5166), .B1(n5242), .Y(n2918) );
  OAI22XL U5396 ( .A0(n5167), .A1(n5392), .B0(n5166), .B1(n5243), .Y(n2917) );
  OAI22XL U5397 ( .A0(n5167), .A1(n5487), .B0(n5166), .B1(n5244), .Y(n2916) );
  OAI22XL U5398 ( .A0(n5169), .A1(n5636), .B0(n5168), .B1(n5238), .Y(n2915) );
  OAI22XL U5399 ( .A0(n5169), .A1(n5508), .B0(n5168), .B1(n5239), .Y(n2914) );
  OAI22XL U5400 ( .A0(n5169), .A1(n5512), .B0(n5168), .B1(n5240), .Y(n2913) );
  OAI22XL U5401 ( .A0(n5169), .A1(n5538), .B0(n5168), .B1(n5247), .Y(n2912) );
  OAI22XL U5402 ( .A0(n5169), .A1(n5611), .B0(n5168), .B1(n5241), .Y(n2911) );
  OAI22XL U5403 ( .A0(n5169), .A1(n5615), .B0(n5168), .B1(n5242), .Y(n2910) );
  OAI22XL U5404 ( .A0(n5169), .A1(n5609), .B0(n5168), .B1(n5243), .Y(n2909) );
  OAI22XL U5405 ( .A0(n5169), .A1(n5516), .B0(n5168), .B1(n5244), .Y(n2908) );
  OAI22XL U5406 ( .A0(n5171), .A1(n5436), .B0(n5170), .B1(n5240), .Y(n2905) );
  OAI22XL U5407 ( .A0(n5171), .A1(n5497), .B0(n5170), .B1(n5247), .Y(n2904) );
  OAI22XL U5408 ( .A0(n5171), .A1(n5393), .B0(n5170), .B1(n5242), .Y(n2902) );
  OAI22XL U5409 ( .A0(n5171), .A1(n5398), .B0(n5170), .B1(n5243), .Y(n2901) );
  OAI22XL U5410 ( .A0(n5171), .A1(n5431), .B0(n5170), .B1(n5244), .Y(n2900) );
  OAI22XL U5411 ( .A0(n5173), .A1(n5605), .B0(n5172), .B1(n5238), .Y(n2899) );
  OAI22XL U5412 ( .A0(n5173), .A1(n5631), .B0(n5172), .B1(n5239), .Y(n2898) );
  OAI22XL U5413 ( .A0(n5173), .A1(n5455), .B0(n5172), .B1(n5247), .Y(n2896) );
  OAI22XL U5414 ( .A0(n5173), .A1(n5565), .B0(n5172), .B1(n5241), .Y(n2895) );
  OAI22XL U5415 ( .A0(n5173), .A1(n5469), .B0(n5172), .B1(n5242), .Y(n2894) );
  OAI22XL U5416 ( .A0(n5173), .A1(n5598), .B0(n5172), .B1(n5243), .Y(n2893) );
  OAI22XL U5417 ( .A0(n5173), .A1(n5638), .B0(n5172), .B1(n5244), .Y(n2892) );
  OAI22XL U5418 ( .A0(n5175), .A1(n5422), .B0(n5174), .B1(n5240), .Y(n2889) );
  OAI22XL U5419 ( .A0(n5175), .A1(n5585), .B0(n5174), .B1(n5247), .Y(n2888) );
  OAI22XL U5420 ( .A0(n5175), .A1(n5383), .B0(n5174), .B1(n5241), .Y(n2887) );
  OAI22XL U5421 ( .A0(n5175), .A1(n5411), .B0(n5174), .B1(n5242), .Y(n2886) );
  OAI22XL U5422 ( .A0(n5175), .A1(n5426), .B0(n5174), .B1(n5243), .Y(n2885) );
  OAI22XL U5423 ( .A0(n5175), .A1(n5439), .B0(n5174), .B1(n5244), .Y(n2884) );
  NAND3XL U5424 ( .A(string_cnt[1]), .B(n5560), .C(n5700), .Y(n5233) );
  OAI22XL U5425 ( .A0(n5177), .A1(n5597), .B0(n5176), .B1(n5238), .Y(n2883) );
  OAI22XL U5426 ( .A0(n5177), .A1(n5514), .B0(n5176), .B1(n5239), .Y(n2882) );
  OAI22XL U5427 ( .A0(n5177), .A1(n5599), .B0(n5176), .B1(n5240), .Y(n2881) );
  OAI22XL U5428 ( .A0(n5177), .A1(n5602), .B0(n5176), .B1(n5247), .Y(n2880) );
  OAI22XL U5429 ( .A0(n5177), .A1(n5628), .B0(n5176), .B1(n5241), .Y(n2879) );
  OAI22XL U5430 ( .A0(n5177), .A1(n5596), .B0(n5176), .B1(n5242), .Y(n2878) );
  OAI22XL U5431 ( .A0(n5177), .A1(n5526), .B0(n5176), .B1(n5243), .Y(n2877) );
  OAI22XL U5432 ( .A0(n5177), .A1(n5619), .B0(n5176), .B1(n5244), .Y(n2876) );
  OAI22XL U5433 ( .A0(n5179), .A1(n5484), .B0(n5178), .B1(n5238), .Y(n2875) );
  OAI22XL U5434 ( .A0(n5179), .A1(n5389), .B0(n5178), .B1(n5239), .Y(n2874) );
  OAI22XL U5435 ( .A0(n5179), .A1(n5399), .B0(n5178), .B1(n5240), .Y(n2873) );
  OAI22XL U5436 ( .A0(n5179), .A1(n5386), .B0(n5178), .B1(n5247), .Y(n2872) );
  OAI22XL U5437 ( .A0(n5179), .A1(n5498), .B0(n5178), .B1(n5241), .Y(n2871) );
  OAI22XL U5438 ( .A0(n5179), .A1(n5432), .B0(n5178), .B1(n5242), .Y(n2870) );
  OAI22XL U5439 ( .A0(n5179), .A1(n5442), .B0(n5178), .B1(n5243), .Y(n2869) );
  OAI22XL U5440 ( .A0(n5179), .A1(n5580), .B0(n5178), .B1(n5244), .Y(n2868) );
  OAI22XL U5441 ( .A0(n5182), .A1(n5424), .B0(n5181), .B1(n5238), .Y(n2867) );
  OAI22XL U5442 ( .A0(n5182), .A1(n5463), .B0(n5181), .B1(n5239), .Y(n2866) );
  OAI22XL U5443 ( .A0(n5182), .A1(n5639), .B0(n5181), .B1(n5240), .Y(n2865) );
  OAI22XL U5444 ( .A0(n5182), .A1(n5412), .B0(n5181), .B1(n5247), .Y(n2864) );
  OAI22XL U5445 ( .A0(n5182), .A1(n5474), .B0(n5181), .B1(n5241), .Y(n2863) );
  OAI22XL U5446 ( .A0(n5182), .A1(n5515), .B0(n5181), .B1(n5242), .Y(n2862) );
  OAI22XL U5447 ( .A0(n5182), .A1(n5527), .B0(n5181), .B1(n5243), .Y(n2861) );
  OAI22XL U5448 ( .A0(n5182), .A1(n5467), .B0(n5181), .B1(n5244), .Y(n2860) );
  OAI22XL U5449 ( .A0(n5184), .A1(n5448), .B0(n5183), .B1(n5238), .Y(n2859) );
  OAI22XL U5450 ( .A0(n5184), .A1(n5400), .B0(n5183), .B1(n5239), .Y(n2858) );
  OAI22XL U5451 ( .A0(n5184), .A1(n5488), .B0(n5183), .B1(n5240), .Y(n2857) );
  OAI22XL U5452 ( .A0(n5184), .A1(n5433), .B0(n5183), .B1(n5247), .Y(n2856) );
  OAI22XL U5453 ( .A0(n5184), .A1(n5401), .B0(n5183), .B1(n5241), .Y(n2855) );
  OAI22XL U5454 ( .A0(n5184), .A1(n5402), .B0(n5183), .B1(n5242), .Y(n2854) );
  OAI22XL U5455 ( .A0(n5184), .A1(n5485), .B0(n5183), .B1(n5243), .Y(n2853) );
  OAI22XL U5456 ( .A0(n5184), .A1(n5481), .B0(n5183), .B1(n5244), .Y(n2852) );
  OAI22XL U5457 ( .A0(n5186), .A1(n5624), .B0(n5185), .B1(n5238), .Y(n2851) );
  OAI22XL U5458 ( .A0(n5186), .A1(n5450), .B0(n5185), .B1(n5239), .Y(n2850) );
  OAI22XL U5459 ( .A0(n5186), .A1(n5504), .B0(n5185), .B1(n5240), .Y(n2849) );
  OAI22XL U5460 ( .A0(n5186), .A1(n5513), .B0(n5185), .B1(n5247), .Y(n2848) );
  OAI22XL U5461 ( .A0(n5186), .A1(n5620), .B0(n5185), .B1(n5242), .Y(n2846) );
  OAI22XL U5462 ( .A0(n5186), .A1(n5616), .B0(n5185), .B1(n5244), .Y(n2844) );
  OAI22XL U5463 ( .A0(n5188), .A1(n5406), .B0(n5187), .B1(n5238), .Y(n2843) );
  OAI22XL U5464 ( .A0(n5188), .A1(n5394), .B0(n5187), .B1(n5239), .Y(n2842) );
  OAI22XL U5465 ( .A0(n5188), .A1(n5421), .B0(n5187), .B1(n5240), .Y(n2841) );
  OAI22XL U5466 ( .A0(n5188), .A1(n5451), .B0(n5187), .B1(n5241), .Y(n2839) );
  OAI22XL U5467 ( .A0(n5188), .A1(n5486), .B0(n5187), .B1(n5242), .Y(n2838) );
  OAI22XL U5468 ( .A0(n5188), .A1(n5429), .B0(n5187), .B1(n5243), .Y(n2837) );
  OAI22XL U5469 ( .A0(n5188), .A1(n5593), .B0(n5187), .B1(n5244), .Y(n2836) );
  OAI22XL U5470 ( .A0(n5190), .A1(n5509), .B0(n5189), .B1(n5238), .Y(n2835) );
  OAI22XL U5471 ( .A0(n5190), .A1(n5617), .B0(n5189), .B1(n5239), .Y(n2834) );
  OAI22XL U5472 ( .A0(n5190), .A1(n5441), .B0(n5189), .B1(n5247), .Y(n2832) );
  OAI22XL U5473 ( .A0(n5190), .A1(n5621), .B0(n5189), .B1(n5241), .Y(n2831) );
  OAI22XL U5474 ( .A0(n5190), .A1(n5651), .B0(n5189), .B1(n5242), .Y(n2830) );
  OAI22XL U5475 ( .A0(n5190), .A1(n5507), .B0(n5189), .B1(n5243), .Y(n2829) );
  OAI22XL U5476 ( .A0(n5190), .A1(n5510), .B0(n5189), .B1(n5244), .Y(n2828) );
  OAI22XL U5477 ( .A0(n5192), .A1(n5437), .B0(n5191), .B1(n5239), .Y(n2826) );
  OAI22XL U5478 ( .A0(n5192), .A1(n5434), .B0(n5191), .B1(n5240), .Y(n2825) );
  OAI22XL U5479 ( .A0(n5192), .A1(n5408), .B0(n5191), .B1(n5247), .Y(n2824) );
  OAI22XL U5480 ( .A0(n5192), .A1(n5409), .B0(n5191), .B1(n5241), .Y(n2823) );
  OAI22XL U5481 ( .A0(n5192), .A1(n5452), .B0(n5191), .B1(n5242), .Y(n2822) );
  OAI22XL U5482 ( .A0(n5192), .A1(n5584), .B0(n5191), .B1(n5243), .Y(n2821) );
  OAI22XL U5483 ( .A0(n5194), .A1(n5588), .B0(n5193), .B1(n5238), .Y(n2819) );
  OAI22XL U5484 ( .A0(n5194), .A1(n5622), .B0(n5193), .B1(n5239), .Y(n2818) );
  OAI22XL U5485 ( .A0(n5194), .A1(n5603), .B0(n5193), .B1(n5240), .Y(n2817) );
  OAI22XL U5486 ( .A0(n5194), .A1(n5530), .B0(n5193), .B1(n5247), .Y(n2816) );
  OAI22XL U5487 ( .A0(n5194), .A1(n5566), .B0(n5193), .B1(n5241), .Y(n2815) );
  OAI22XL U5488 ( .A0(n5194), .A1(n5465), .B0(n5193), .B1(n5242), .Y(n2814) );
  OAI22XL U5489 ( .A0(n5194), .A1(n5595), .B0(n5193), .B1(n5243), .Y(n2813) );
  OAI22XL U5490 ( .A0(n5194), .A1(n5618), .B0(n5193), .B1(n5244), .Y(n2812) );
  OAI22XL U5491 ( .A0(n5196), .A1(n5390), .B0(n5195), .B1(n5238), .Y(n2811) );
  OAI22XL U5492 ( .A0(n5196), .A1(n5587), .B0(n5195), .B1(n5239), .Y(n2810) );
  OAI22XL U5493 ( .A0(n5196), .A1(n5382), .B0(n5195), .B1(n5240), .Y(n2809) );
  OAI22XL U5494 ( .A0(n5196), .A1(n5445), .B0(n5195), .B1(n5247), .Y(n2808) );
  OAI22XL U5495 ( .A0(n5196), .A1(n5600), .B0(n5195), .B1(n5241), .Y(n2807) );
  OAI22XL U5496 ( .A0(n5196), .A1(n5482), .B0(n5195), .B1(n5242), .Y(n2806) );
  OAI22XL U5497 ( .A0(n5196), .A1(n5496), .B0(n5195), .B1(n5243), .Y(n2805) );
  OAI22XL U5498 ( .A0(n5199), .A1(n5521), .B0(n5198), .B1(n5238), .Y(n2803) );
  OAI22XL U5499 ( .A0(n5199), .A1(n5464), .B0(n5198), .B1(n5239), .Y(n2802) );
  OAI22XL U5500 ( .A0(n5199), .A1(n5494), .B0(n5198), .B1(n5240), .Y(n2801) );
  OAI22XL U5501 ( .A0(n5199), .A1(n5567), .B0(n5198), .B1(n5247), .Y(n2800) );
  OAI22XL U5502 ( .A0(n5199), .A1(n5415), .B0(n5198), .B1(n5241), .Y(n2799) );
  OAI22XL U5503 ( .A0(n5199), .A1(n5626), .B0(n5198), .B1(n5242), .Y(n2798) );
  OAI22XL U5504 ( .A0(n5199), .A1(n5629), .B0(n5198), .B1(n5243), .Y(n2797) );
  OAI22XL U5505 ( .A0(n5199), .A1(n5528), .B0(n5198), .B1(n5244), .Y(n2796) );
  OAI22XL U5506 ( .A0(n5201), .A1(n5443), .B0(n5200), .B1(n5238), .Y(n2795) );
  OAI22XL U5507 ( .A0(n5201), .A1(n5410), .B0(n5200), .B1(n5239), .Y(n2794) );
  OAI22XL U5508 ( .A0(n5201), .A1(n5387), .B0(n5200), .B1(n5240), .Y(n2793) );
  OAI22XL U5509 ( .A0(n5201), .A1(n5435), .B0(n5200), .B1(n5247), .Y(n2792) );
  OAI22XL U5510 ( .A0(n5201), .A1(n5391), .B0(n5200), .B1(n5242), .Y(n2790) );
  OAI22XL U5511 ( .A0(n5201), .A1(n5395), .B0(n5200), .B1(n5244), .Y(n2788) );
  OAI22XL U5512 ( .A0(n5204), .A1(n5407), .B0(n5203), .B1(n5238), .Y(n2787) );
  OAI22XL U5513 ( .A0(n5204), .A1(n5533), .B0(n5203), .B1(n5239), .Y(n2786) );
  OAI22XL U5514 ( .A0(n5204), .A1(n5610), .B0(n5203), .B1(n5240), .Y(n2785) );
  OAI22XL U5515 ( .A0(n5204), .A1(n5517), .B0(n5203), .B1(n5247), .Y(n2784) );
  OAI22XL U5516 ( .A0(n5204), .A1(n5457), .B0(n5203), .B1(n5241), .Y(n2783) );
  OAI22XL U5517 ( .A0(n5204), .A1(n5447), .B0(n5203), .B1(n5242), .Y(n2782) );
  OAI22XL U5518 ( .A0(n5204), .A1(n5522), .B0(n5203), .B1(n5243), .Y(n2781) );
  OAI22XL U5519 ( .A0(n5204), .A1(n5418), .B0(n5203), .B1(n5244), .Y(n2780) );
  OAI22XL U5520 ( .A0(n5206), .A1(n5430), .B0(n5205), .B1(n5238), .Y(n2779) );
  OAI22XL U5521 ( .A0(n5206), .A1(n5396), .B0(n5205), .B1(n5239), .Y(n2778) );
  OAI22XL U5522 ( .A0(n5206), .A1(n5427), .B0(n5205), .B1(n5240), .Y(n2777) );
  OAI22XL U5523 ( .A0(n5206), .A1(n5405), .B0(n5205), .B1(n5247), .Y(n2776) );
  OAI22XL U5524 ( .A0(n5206), .A1(n5459), .B0(n5205), .B1(n5243), .Y(n2773) );
  OAI22XL U5525 ( .A0(n5208), .A1(n5416), .B0(n5207), .B1(n5238), .Y(n2771) );
  OAI22XL U5526 ( .A0(n5208), .A1(n5612), .B0(n5207), .B1(n5239), .Y(n2770) );
  OAI22XL U5527 ( .A0(n5208), .A1(n5500), .B0(n5207), .B1(n5240), .Y(n2769) );
  OAI22XL U5528 ( .A0(n5208), .A1(n5520), .B0(n5207), .B1(n5241), .Y(n2767) );
  OAI22XL U5529 ( .A0(n5208), .A1(n5613), .B0(n5207), .B1(n5242), .Y(n2766) );
  OAI22XL U5530 ( .A0(n5208), .A1(n5614), .B0(n5207), .B1(n5243), .Y(n2765) );
  OAI22XL U5531 ( .A0(n5208), .A1(n5635), .B0(n5207), .B1(n5244), .Y(n2764) );
  OAI22XL U5532 ( .A0(n5210), .A1(n5493), .B0(n5209), .B1(n5238), .Y(n2763) );
  OAI22XL U5533 ( .A0(n5210), .A1(n5505), .B0(n5209), .B1(n5239), .Y(n2762) );
  OAI22XL U5534 ( .A0(n5210), .A1(n5385), .B0(n5209), .B1(n5240), .Y(n2761) );
  OAI22XL U5535 ( .A0(n5210), .A1(n5586), .B0(n5209), .B1(n5247), .Y(n2760) );
  OAI22XL U5536 ( .A0(n5210), .A1(n5453), .B0(n5209), .B1(n5242), .Y(n2758) );
  OAI22XL U5537 ( .A0(n5210), .A1(n5444), .B0(n5209), .B1(n5243), .Y(n2757) );
  OAI22XL U5538 ( .A0(n5210), .A1(n5490), .B0(n5209), .B1(n5244), .Y(n2756) );
  OAI22XL U5539 ( .A0(n5212), .A1(n5456), .B0(n5211), .B1(n5238), .Y(n2755) );
  OAI22XL U5540 ( .A0(n5212), .A1(n5633), .B0(n5211), .B1(n5239), .Y(n2754) );
  OAI22XL U5541 ( .A0(n5212), .A1(n5594), .B0(n5211), .B1(n5240), .Y(n2753) );
  OAI22XL U5542 ( .A0(n5212), .A1(n5637), .B0(n5211), .B1(n5247), .Y(n2752) );
  OAI22XL U5543 ( .A0(n5212), .A1(n5458), .B0(n5211), .B1(n5241), .Y(n2751) );
  OAI22XL U5544 ( .A0(n5212), .A1(n5506), .B0(n5211), .B1(n5242), .Y(n2750) );
  OAI22XL U5545 ( .A0(n5212), .A1(n5461), .B0(n5211), .B1(n5243), .Y(n2749) );
  OAI22XL U5546 ( .A0(n5212), .A1(n5454), .B0(n5211), .B1(n5244), .Y(n2748) );
  OAI22XL U5547 ( .A0(n5214), .A1(n5397), .B0(n5213), .B1(n5238), .Y(n2747) );
  OAI22XL U5548 ( .A0(n5214), .A1(n5440), .B0(n5213), .B1(n5239), .Y(n2746) );
  OAI22XL U5549 ( .A0(n5214), .A1(n5589), .B0(n5213), .B1(n5240), .Y(n2745) );
  OAI22XL U5550 ( .A0(n5214), .A1(n5590), .B0(n5213), .B1(n5247), .Y(n2744) );
  OAI22XL U5551 ( .A0(n5214), .A1(n5511), .B0(n5213), .B1(n5241), .Y(n2743) );
  OAI22XL U5552 ( .A0(n5214), .A1(n5483), .B0(n5213), .B1(n5242), .Y(n2742) );
  OAI22XL U5553 ( .A0(n5214), .A1(n5414), .B0(n5213), .B1(n5243), .Y(n2741) );
  OAI22XL U5554 ( .A0(n5218), .A1(n5601), .B0(n5217), .B1(n5238), .Y(n2739) );
  OAI22XL U5555 ( .A0(n5218), .A1(n5592), .B0(n5217), .B1(n5239), .Y(n2738) );
  OAI22XL U5556 ( .A0(n5218), .A1(n5492), .B0(n5217), .B1(n5240), .Y(n2737) );
  OAI22XL U5557 ( .A0(n5218), .A1(n5475), .B0(n5217), .B1(n5247), .Y(n2736) );
  OAI22XL U5558 ( .A0(n5218), .A1(n5462), .B0(n5217), .B1(n5241), .Y(n2735) );
  OAI22XL U5559 ( .A0(n5218), .A1(n5460), .B0(n5217), .B1(n5242), .Y(n2734) );
  OAI22XL U5560 ( .A0(n5218), .A1(n5625), .B0(n5217), .B1(n5243), .Y(n2733) );
  OAI22XL U5561 ( .A0(n5218), .A1(n5518), .B0(n5217), .B1(n5244), .Y(n2732) );
  OAI22XL U5562 ( .A0(n5221), .A1(n5501), .B0(n5220), .B1(n5238), .Y(n2731) );
  OAI22XL U5563 ( .A0(n5221), .A1(n5491), .B0(n5220), .B1(n5239), .Y(n2730) );
  OAI22XL U5564 ( .A0(n5221), .A1(n5449), .B0(n5220), .B1(n5240), .Y(n2729) );
  OAI22XL U5565 ( .A0(n5221), .A1(n5499), .B0(n5220), .B1(n5247), .Y(n2728) );
  OAI22XL U5566 ( .A0(n5221), .A1(n5502), .B0(n5220), .B1(n5241), .Y(n2727) );
  OAI22XL U5567 ( .A0(n5221), .A1(n5413), .B0(n5220), .B1(n5242), .Y(n2726) );
  OAI22XL U5568 ( .A0(n5221), .A1(n5403), .B0(n5220), .B1(n5243), .Y(n2725) );
  OAI22XL U5569 ( .A0(n5221), .A1(n5446), .B0(n5220), .B1(n5244), .Y(n2724) );
  OAI22XL U5570 ( .A0(n5223), .A1(n5623), .B0(n5222), .B1(n5238), .Y(n2723) );
  OAI22XL U5571 ( .A0(n5223), .A1(n5466), .B0(n5222), .B1(n5239), .Y(n2722) );
  OAI22XL U5572 ( .A0(n5223), .A1(n5471), .B0(n5222), .B1(n5240), .Y(n2721) );
  OAI22XL U5573 ( .A0(n5223), .A1(n5627), .B0(n5222), .B1(n5241), .Y(n2719) );
  OAI22XL U5574 ( .A0(n5223), .A1(n5529), .B0(n5222), .B1(n5242), .Y(n2718) );
  OAI22XL U5575 ( .A0(n5223), .A1(n5537), .B0(n5222), .B1(n5243), .Y(n2717) );
  OAI22XL U5576 ( .A0(n5223), .A1(n5536), .B0(n5222), .B1(n5244), .Y(n2716) );
  OAI22XL U5577 ( .A0(n5226), .A1(n5523), .B0(n5225), .B1(n5238), .Y(n2715) );
  OAI22XL U5578 ( .A0(n5226), .A1(n5519), .B0(n5225), .B1(n5239), .Y(n2714) );
  OAI22XL U5579 ( .A0(n5226), .A1(n5524), .B0(n5225), .B1(n5240), .Y(n2713) );
  OAI22XL U5580 ( .A0(n5226), .A1(n5640), .B0(n5225), .B1(n5247), .Y(n2712) );
  OAI22XL U5581 ( .A0(n5226), .A1(n5532), .B0(n5225), .B1(n5241), .Y(n2711) );
  OAI22XL U5582 ( .A0(n5226), .A1(n5531), .B0(n5225), .B1(n5242), .Y(n2710) );
  OAI22XL U5583 ( .A0(n5226), .A1(n5468), .B0(n5225), .B1(n5243), .Y(n2709) );
  OAI22XL U5584 ( .A0(n5226), .A1(n5470), .B0(n5225), .B1(n5244), .Y(n2708) );
  OAI22XL U5585 ( .A0(n5229), .A1(n5543), .B0(n5228), .B1(n5238), .Y(n2707) );
  OAI22XL U5586 ( .A0(n5229), .A1(n5544), .B0(n5228), .B1(n5239), .Y(n2706) );
  OAI22XL U5587 ( .A0(n5229), .A1(n5545), .B0(n5228), .B1(n5240), .Y(n2705) );
  OAI22XL U5588 ( .A0(n5229), .A1(n5553), .B0(n5228), .B1(n5247), .Y(n2704) );
  OAI22XL U5589 ( .A0(n5229), .A1(n5655), .B0(n5228), .B1(n5241), .Y(n2703) );
  OAI22XL U5590 ( .A0(n5229), .A1(n5654), .B0(n5228), .B1(n5242), .Y(n2702) );
  OAI22XL U5591 ( .A0(n5229), .A1(n5649), .B0(n5228), .B1(n5243), .Y(n2701) );
  OAI22XL U5592 ( .A0(n5229), .A1(n5671), .B0(n5228), .B1(n5244), .Y(n2700) );
  OAI22XL U5593 ( .A0(n5232), .A1(n5648), .B0(n5231), .B1(n5238), .Y(n2699) );
  OAI22XL U5594 ( .A0(n5232), .A1(n5644), .B0(n5231), .B1(n5239), .Y(n2698) );
  OAI22XL U5595 ( .A0(n5232), .A1(n5659), .B0(n5231), .B1(n5240), .Y(n2697) );
  OAI22XL U5596 ( .A0(n5232), .A1(n5657), .B0(n5231), .B1(n5247), .Y(n2696) );
  OAI22XL U5597 ( .A0(n5232), .A1(n5556), .B0(n5231), .B1(n5241), .Y(n2695) );
  OAI22XL U5598 ( .A0(n5232), .A1(n5645), .B0(n5231), .B1(n5242), .Y(n2694) );
  OAI22XL U5599 ( .A0(n5232), .A1(n5660), .B0(n5231), .B1(n5243), .Y(n2693) );
  OAI22XL U5600 ( .A0(n5232), .A1(n5647), .B0(n5231), .B1(n5244), .Y(n2692) );
  OAI22XL U5601 ( .A0(n5235), .A1(n5686), .B0(n5234), .B1(n5238), .Y(n2691) );
  OAI22XL U5602 ( .A0(n5235), .A1(n5687), .B0(n5234), .B1(n5239), .Y(n2690) );
  OAI22XL U5603 ( .A0(n5235), .A1(n5672), .B0(n5234), .B1(n5240), .Y(n2689) );
  OAI22XL U5604 ( .A0(n5235), .A1(n5694), .B0(n5234), .B1(n5247), .Y(n2688) );
  OAI22XL U5605 ( .A0(n5235), .A1(n5688), .B0(n5234), .B1(n5241), .Y(n2687) );
  OAI22XL U5606 ( .A0(n5235), .A1(n5689), .B0(n5234), .B1(n5242), .Y(n2686) );
  OAI22XL U5607 ( .A0(n5235), .A1(n5673), .B0(n5234), .B1(n5243), .Y(n2685) );
  OAI22XL U5608 ( .A0(n5235), .A1(n5693), .B0(n5234), .B1(n5244), .Y(n2684) );
  OAI22XL U5609 ( .A0(n5246), .A1(n5690), .B0(n5245), .B1(n5238), .Y(n2683) );
  OAI22XL U5610 ( .A0(n5246), .A1(n5681), .B0(n5245), .B1(n5239), .Y(n2682) );
  OAI22XL U5611 ( .A0(n5246), .A1(n5692), .B0(n5245), .B1(n5240), .Y(n2681) );
  OAI22XL U5612 ( .A0(n5246), .A1(n5682), .B0(n5245), .B1(n5247), .Y(n2680) );
  OAI22XL U5613 ( .A0(n5246), .A1(n5683), .B0(n5245), .B1(n5241), .Y(n2679) );
  OAI22XL U5614 ( .A0(n5246), .A1(n5684), .B0(n5245), .B1(n5242), .Y(n2678) );
  OAI22XL U5615 ( .A0(n5246), .A1(n5691), .B0(n5245), .B1(n5243), .Y(n2677) );
  OAI22XL U5616 ( .A0(n5246), .A1(n5685), .B0(n5245), .B1(n5244), .Y(n2676) );
  AOI2BB2X1 U5617 ( .B0(n5248), .B1(n5247), .A0N(n5248), .A1N(
        stringdata_ff[111]), .Y(n2672) );
  AOI221XL U5618 ( .A0(n5259), .A1(n5573), .B0(n5261), .B1(n5573), .C0(n5256), 
        .Y(n2665) );
  OAI22XL U5619 ( .A0(n5419), .A1(n5254), .B0(DP_OP_542J1_123_7011_n30), .B1(
        n5253), .Y(n2662) );
  OAI22XL U5620 ( .A0(n5696), .A1(n5254), .B0(n5480), .B1(n5253), .Y(n2661) );
  OAI22XL U5621 ( .A0(n5563), .A1(n5254), .B0(n5576), .B1(n5253), .Y(n2660) );
  OAI22XL U5622 ( .A0(n5699), .A1(n5254), .B0(n5577), .B1(n5253), .Y(n2659) );
  NOR2XL U5623 ( .A(n5303), .B(DP_OP_542J1_123_7011_n30), .Y(n5292) );
  OA21XL U5624 ( .A0(ispattern), .A1(n5292), .B0(n5255), .Y(n2658) );
  AO22X1 U5625 ( .A0(pat_cnt[2]), .A1(n5258), .B0(n5576), .B1(n5257), .Y(n2657) );
  NOR2XL U5626 ( .A(n5258), .B(n5285), .Y(n5260) );
  NAND2XL U5627 ( .A(pat_cnt[0]), .B(n5270), .Y(n5268) );
  OAI21XL U5628 ( .A0(n5260), .A1(n5577), .B0(n5268), .Y(n2656) );
  OAI22XL U5629 ( .A0(n5552), .A1(n5269), .B0(n5268), .B1(n5293), .Y(n2655) );
  OAI2BB2XL U5630 ( .B0(n5264), .B1(n5294), .A0N(n5268), .A1N(pattern_ff[1]), 
        .Y(n2654) );
  AOI2BB1X1 U5631 ( .A0N(n5263), .A1N(n5262), .B0(n5303), .Y(n5295) );
  OAI2BB2XL U5632 ( .B0(n5264), .B1(n5295), .A0N(pattern_ff[2]), .A1N(n5268), 
        .Y(n2653) );
  OAI2BB2XL U5633 ( .B0(n5264), .B1(n5296), .A0N(n5268), .A1N(pattern_ff[3]), 
        .Y(n2652) );
  OAI22XL U5634 ( .A0(n5656), .A1(n5269), .B0(n5268), .B1(n5297), .Y(n2651) );
  OA22X1 U5635 ( .A0(n5298), .A1(n5268), .B0(n5269), .B1(pattern_ff[5]), .Y(
        n2650) );
  OAI22XL U5636 ( .A0(n5550), .A1(n5269), .B0(n5268), .B1(n5299), .Y(n2649) );
  OAI22XL U5637 ( .A0(n5542), .A1(n5269), .B0(n5268), .B1(n5300), .Y(n2648) );
  NAND2XL U5638 ( .A(n5270), .B(DP_OP_542J1_123_7011_n30), .Y(n5273) );
  OAI22XL U5639 ( .A0(n5679), .A1(n5274), .B0(n5293), .B1(n5273), .Y(n2647) );
  OAI22XL U5640 ( .A0(n5272), .A1(n5634), .B0(n5271), .B1(n5294), .Y(n2646) );
  OAI22XL U5641 ( .A0(n5295), .A1(n5271), .B0(n5272), .B1(n5525), .Y(n2645) );
  OAI22XL U5642 ( .A0(n5272), .A1(n5535), .B0(n5271), .B1(n5296), .Y(n2644) );
  OAI22XL U5643 ( .A0(n5575), .A1(n5274), .B0(n5297), .B1(n5273), .Y(n2643) );
  AOI2BB2X1 U5644 ( .B0(n5288), .B1(n5272), .A0N(n5274), .A1N(pattern_ff[13]), 
        .Y(n2642) );
  OAI22XL U5645 ( .A0(n5667), .A1(n5274), .B0(n5299), .B1(n5273), .Y(n2641) );
  OAI22XL U5646 ( .A0(n5479), .A1(n5274), .B0(n5300), .B1(n5273), .Y(n2640) );
  NOR2XL U5647 ( .A(pat_cnt[0]), .B(n5303), .Y(n5287) );
  NOR2XL U5648 ( .A(pat_cnt[1]), .B(pat_cnt[3]), .Y(n5286) );
  OAI22XL U5649 ( .A0(n5276), .A1(n5425), .B0(n5275), .B1(n5293), .Y(n2639) );
  OAI22XL U5650 ( .A0(n5276), .A1(n5549), .B0(n5275), .B1(n5294), .Y(n2638) );
  OAI22XL U5651 ( .A0(n5276), .A1(n5642), .B0(n5275), .B1(n5295), .Y(n2637) );
  OAI22XL U5652 ( .A0(n5276), .A1(n5646), .B0(n5275), .B1(n5296), .Y(n2636) );
  OAI22XL U5653 ( .A0(n5276), .A1(n5477), .B0(n5275), .B1(n5297), .Y(n2635) );
  OAI22XL U5654 ( .A0(n5276), .A1(n5546), .B0(n5275), .B1(n5288), .Y(n2634) );
  OAI22XL U5655 ( .A0(n5276), .A1(n5478), .B0(n5275), .B1(n5299), .Y(n2633) );
  OAI22XL U5656 ( .A0(n5276), .A1(n5666), .B0(n5275), .B1(n5300), .Y(n2632) );
  OAI22XL U5657 ( .A0(n5279), .A1(n5658), .B0(n5278), .B1(n5293), .Y(n2631) );
  OAI22XL U5658 ( .A0(n5279), .A1(n5632), .B0(n5278), .B1(n5294), .Y(n2630) );
  OAI22XL U5659 ( .A0(n5279), .A1(n5541), .B0(n5278), .B1(n5295), .Y(n2629) );
  OAI22XL U5660 ( .A0(n5279), .A1(n5604), .B0(n5278), .B1(n5296), .Y(n2628) );
  OAI22XL U5661 ( .A0(n5279), .A1(n5572), .B0(n5278), .B1(n5297), .Y(n2627) );
  OAI22XL U5662 ( .A0(n5279), .A1(n5540), .B0(n5278), .B1(n5288), .Y(n2626) );
  OAI22XL U5663 ( .A0(n5279), .A1(n5653), .B0(n5278), .B1(n5299), .Y(n2625) );
  OAI22XL U5664 ( .A0(n5279), .A1(n5569), .B0(n5278), .B1(n5300), .Y(n2624) );
  AOI31XL U5665 ( .A0(pat_cnt[1]), .A1(n5285), .A2(n5577), .B0(n5303), .Y(
        n5282) );
  OAI22XL U5666 ( .A0(n5281), .A1(n5539), .B0(n5280), .B1(n5293), .Y(n2623) );
  OAI22XL U5667 ( .A0(n5281), .A1(n5664), .B0(n5280), .B1(n5294), .Y(n2622) );
  OAI22XL U5668 ( .A0(n5281), .A1(n5652), .B0(n5280), .B1(n5295), .Y(n2621) );
  OAI22XL U5669 ( .A0(n5281), .A1(n5547), .B0(n5280), .B1(n5296), .Y(n2620) );
  OAI22XL U5670 ( .A0(n5281), .A1(n5548), .B0(n5280), .B1(n5297), .Y(n2619) );
  OAI22XL U5671 ( .A0(n5281), .A1(n5534), .B0(n5280), .B1(n5288), .Y(n2618) );
  OAI22XL U5672 ( .A0(n5281), .A1(n5650), .B0(n5280), .B1(n5299), .Y(n2617) );
  OAI22XL U5673 ( .A0(n5281), .A1(n5643), .B0(n5280), .B1(n5300), .Y(n2616) );
  OAI22XL U5674 ( .A0(n5284), .A1(n5665), .B0(n5283), .B1(n5293), .Y(n2615) );
  OAI22XL U5675 ( .A0(n5284), .A1(n5558), .B0(n5283), .B1(n5294), .Y(n2614) );
  OAI2BB2XL U5676 ( .B0(n5283), .B1(n5295), .A0N(n5283), .A1N(pattern_ff[39]), 
        .Y(n2613) );
  OAI22XL U5677 ( .A0(n5284), .A1(n5663), .B0(n5283), .B1(n5296), .Y(n2612) );
  OAI22XL U5678 ( .A0(n5284), .A1(n5554), .B0(n5283), .B1(n5297), .Y(n2611) );
  OAI22XL U5679 ( .A0(n5284), .A1(n5670), .B0(n5283), .B1(n5288), .Y(n2610) );
  OAI22XL U5680 ( .A0(n5284), .A1(n5555), .B0(n5283), .B1(n5299), .Y(n2609) );
  OAI22XL U5681 ( .A0(n5284), .A1(n5669), .B0(n5283), .B1(n5300), .Y(n2608) );
  OAI22XL U5682 ( .A0(n5290), .A1(n5551), .B0(n5289), .B1(n5293), .Y(n2607) );
  OAI2BB2XL U5683 ( .B0(n5289), .B1(n5294), .A0N(n5289), .A1N(pattern_ff[45]), 
        .Y(n2606) );
  OAI22XL U5684 ( .A0(n5290), .A1(n5695), .B0(n5289), .B1(n5295), .Y(n2605) );
  OAI22XL U5685 ( .A0(n5290), .A1(n5680), .B0(n5289), .B1(n5296), .Y(n2604) );
  OAI22XL U5686 ( .A0(n5290), .A1(n5678), .B0(n5289), .B1(n5297), .Y(n2603) );
  OAI22XL U5687 ( .A0(n5290), .A1(n5661), .B0(n5289), .B1(n5288), .Y(n2602) );
  OAI22XL U5688 ( .A0(n5290), .A1(n5668), .B0(n5289), .B1(n5299), .Y(n2601) );
  OAI22XL U5689 ( .A0(n5290), .A1(n5557), .B0(n5289), .B1(n5300), .Y(n2600) );
  OAI22XL U5690 ( .A0(n5302), .A1(n5674), .B0(n5301), .B1(n5293), .Y(n2599) );
  OAI22XL U5691 ( .A0(n5302), .A1(n5677), .B0(n5301), .B1(n5294), .Y(n2598) );
  OAI2BB2XL U5692 ( .B0(n5301), .B1(n5295), .A0N(n5301), .A1N(pattern_ff[50]), 
        .Y(n2597) );
  OAI2BB2XL U5693 ( .B0(n5301), .B1(n5296), .A0N(n5301), .A1N(pattern_ff[51]), 
        .Y(n2596) );
  OAI22XL U5694 ( .A0(n5302), .A1(n5675), .B0(n5301), .B1(n5297), .Y(n2595) );
  AO22X1 U5695 ( .A0(n5302), .A1(n5298), .B0(n5301), .B1(pattern_ff[52]), .Y(
        n2594) );
  OAI22XL U5696 ( .A0(n5302), .A1(n5676), .B0(n5301), .B1(n5299), .Y(n2593) );
  OAI22XL U5697 ( .A0(n5302), .A1(n5697), .B0(n5301), .B1(n5300), .Y(n2592) );
  OAI21XL U5698 ( .A0(n5305), .A1(N612), .B0(n5304), .Y(n2591) );
  INVXL U5699 ( .A(n5312), .Y(n5310) );
  AOI211XL U5700 ( .A0(n5562), .A1(n5419), .B0(n5310), .C0(n5328), .Y(n5306)
         );
  OAI222XL U5701 ( .A0(n5334), .A1(n5562), .B0(n5309), .B1(head_f), .C0(n5335), 
        .C1(n5308), .Y(n2590) );
  AOI221XL U5702 ( .A0(n5313), .A1(n5312), .B0(n5311), .B1(n5310), .C0(n5328), 
        .Y(n5317) );
  OAI22XL U5703 ( .A0(n5318), .A1(n5335), .B0(n5476), .B1(n5334), .Y(n2588) );
  OAI22XL U5704 ( .A0(n5328), .A1(n5476), .B0(n5325), .B1(n5703), .Y(n2587) );
  AOI2BB2X1 U5705 ( .B0(n5320), .B1(n5319), .A0N(n5320), .A1N(n5319), .Y(n5322) );
  OAI22XL U5706 ( .A0(n5328), .A1(n5322), .B0(n5321), .B1(n5326), .Y(n5323) );
  OAI22XL U5707 ( .A0(n5324), .A1(n5335), .B0(n5473), .B1(n5334), .Y(n2584) );
  OAI22XL U5708 ( .A0(n5328), .A1(n5473), .B0(n5325), .B1(n5702), .Y(n2583) );
  NOR2BXL U5709 ( .AN(n5327), .B(n5326), .Y(n5332) );
  AOI211XL U5710 ( .A0(n5420), .A1(n5330), .B0(n5329), .C0(n5328), .Y(n5331)
         );
  OAI22XL U5711 ( .A0(n5336), .A1(n5335), .B0(n5420), .B1(n5334), .Y(n2582) );
  OAI22XL U5712 ( .A0(n5338), .A1(n5559), .B0(n5337), .B1(n5700), .Y(n2578) );
  OAI22XL U5713 ( .A0(n5338), .A1(n5495), .B0(n5337), .B1(n5701), .Y(n2576) );
  OAI22XL U5714 ( .A0(n5338), .A1(n5578), .B0(n5337), .B1(n5561), .Y(n2575) );
  OAI22XL U5715 ( .A0(n5338), .A1(n5570), .B0(n5337), .B1(n5560), .Y(n2574) );
  OAI22XL U5716 ( .A0(n5338), .A1(n5574), .B0(n5337), .B1(n5472), .Y(n2573) );
endmodule

