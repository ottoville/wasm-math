;;4x4 matrix multiplication using SIMD instruction set
;;Created by Otto-Ville Lamminpää
;;otto-ville.lamminpaa@gmail.com

(module
    (global $gv0 (mut v128) (v128.const i32x4 0 0 0 0))
    (global $v0 (mut v128) (v128.const i32x4 0 0 0 0))
    (func $multiply
        (param $0 f32)
        (param $1 f32)
        (param $2 f32)
        (param $3 f32)
        (param $4 f32)
        (param $5 f32)
        (param $6 f32)
        (param $7 f32)
        (param $8 f32)
        (param $9 f32)
        (param $10 f32)
        (param $11 f32)
        (param $12 f32)
        (param $13 f32)
        (param $14 f32)
        (param $15 f32)

        (param $o0 f32)
        (param $o1 f32)
        (param $o2 f32)
        (param $o3 f32)
        (param $o4 f32)
        (param $o5 f32)
        (param $o6 f32)
        (param $o7 f32)
        (param $o8 f32)
        (param $o9 f32)
        (param $o10 f32)
        (param $o11 f32)
        (param $o12 f32)
        (param $o13 f32)
        (param $o14 f32)
        (param $o15 f32)

        (result f32 f32 f32 f32 f32 f32 f32 f32 f32 f32 f32 f32 f32 f32 f32 f32) 

        (call $transpose
            (f32x4.mul 
                (call $initv128 (local.get $0) (local.get $1) (local.get $2) (local.get $3))
                (call $initv128 (local.get $o0) (local.get $o4) (local.get $o8) (local.get $o12))
            )
            (f32x4.mul 
                (call $initv128 (local.get $0) (local.get $1) (local.get $2) (local.get $3))
                (call $initv128 (local.get $o1) (local.get $o5) (local.get $o9) (local.get $o13))
            )
            (f32x4.mul 
                (call $initv128 (local.get $0) (local.get $1) (local.get $2) (local.get $3) )
                (call $initv128 (local.get $o2) (local.get $o6) (local.get $o10) (local.get $o14) )
            )
            (f32x4.mul
                (call $initv128 (local.get $0) (local.get $1) (local.get $2) (local.get $3))
                (call $initv128 (local.get $o3) (local.get $o7) (local.get $o11) (local.get $o15))
            )
        )
        global.set $v0
        global.get $v0
        f32x4.extract_lane 0
        global.get $v0
        f32x4.extract_lane 1
        global.get $v0
        f32x4.extract_lane 2
        global.get $v0
        f32x4.extract_lane 3

    ;;Second
        (call $transpose
            (f32x4.mul
                (call $initv128 (local.get $4) (local.get $5) (local.get $6) (local.get $7))
                (call $initv128 (local.get $o0) (local.get $o4) (local.get $o8) (local.get $o12))
            ) 
            (f32x4.mul
                (call $initv128 (local.get $4) (local.get $5) (local.get $6) (local.get $7) )
                (call $initv128 (local.get $o1) (local.get $o5) (local.get $o9) (local.get $o13))
            ) 
            (f32x4.mul
                (call $initv128 (local.get $4) (local.get $5) (local.get $6) (local.get $7) )
                (call $initv128 (local.get $o2) (local.get $o6) (local.get $o10) (local.get $o14))
            ) 
            (f32x4.mul 
                (call $initv128 (local.get $4) (local.get $5) (local.get $6) (local.get $7) )
                (call $initv128 (local.get $o3) (local.get $o7) (local.get $o11) (local.get $o15))
            ) 
        )
        global.set $v0
        global.get $v0

        f32x4.extract_lane 0
        global.get $v0
        f32x4.extract_lane 1
        global.get $v0
        f32x4.extract_lane 2
        global.get $v0
        f32x4.extract_lane 3
    ;;Third
        (call $transpose
            (f32x4.mul
                (call $initv128 (local.get $8) (local.get $9) (local.get $10) (local.get $11) )
                (call $initv128  (local.get $o0) (local.get $o4) (local.get $o8) (local.get $o12)) )
            (f32x4.mul
                (call $initv128 (local.get $8) (local.get $9) (local.get $10) (local.get $11))
                (call $initv128 (local.get $o1) (local.get $o5) (local.get $o9) (local.get $o13)) )
            (f32x4.mul
                (call $initv128 (local.get $8) (local.get $9) (local.get $10) (local.get $11))
                (call $initv128 (local.get $o2) (local.get $o6) (local.get $o10) (local.get $o14)) )
            (f32x4.mul
                (call $initv128 (local.get $8) (local.get $9) (local.get $10) (local.get $11))
                (call $initv128  (local.get $o3) (local.get $o7) (local.get $o11) (local.get $o15))
            )
        )
        global.set $v0
        global.get $v0

        f32x4.extract_lane 0
        global.get $v0
        f32x4.extract_lane 1
        global.get $v0
        f32x4.extract_lane 2
        global.get $v0
        f32x4.extract_lane 3
    ;;Fourth
        (call $transpose
            (f32x4.mul
                (call $initv128 (local.get $12) (local.get $13) (local.get $14) (local.get $15))
                (call $initv128 (local.get $o0) (local.get $o4) (local.get $o8) (local.get $o12))
            )
            (f32x4.mul
                (call $initv128 (local.get $12) (local.get $13) (local.get $14) (local.get $15))
                (call $initv128 (local.get $o1) (local.get $o5) (local.get $o9) (local.get $o13)) 
            )
            (f32x4.mul
                (call $initv128 (local.get $12) (local.get $13) (local.get $14) (local.get $15))
                (call $initv128  (local.get $o2) (local.get $o6) (local.get $o10) (local.get $o14)) 
            )
            (f32x4.mul
                (call $initv128 (local.get $12) (local.get $13) (local.get $14) (local.get $15))
                (call $initv128 (local.get $o3) (local.get $o7) (local.get $o11) (local.get $o15)) 
            )
        )
        global.set $v0
        global.get $v0

        f32x4.extract_lane 0
        global.get $v0
        f32x4.extract_lane 1
        global.get $v0
        f32x4.extract_lane 2
        global.get $v0
        f32x4.extract_lane 3
    )
    (func $transpose
        (param $v0 v128)
        (param $v1 v128)
        (param $v2 v128)
        (param $v3 v128)
        (result v128)
            local.get $v0
                local.get $v1
                v8x16.shuffle 0 1 2 3 16 17 18 19 8 9 10 11 12 13 14 15

                local.get $v2
                v8x16.shuffle 0 1 2 3 4 5 6 7 16 17 18 19 12 13 14 15

                local.get $v3
                v8x16.shuffle 0 1 2 3 4 5 6 7 8 9 10 11 16 17 18 19

            local.get $v0
                local.get $v1
                v8x16.shuffle  4 5 6 7 20 21 22 23 8 9 10 11 12 13 14 15

                local.get $v2
                v8x16.shuffle 0 1 2 3 4 5 6 7 20 21 22 23 12 13 14 15

                local.get $v3
                v8x16.shuffle 0 1 2 3 4 5 6 7 8 9 10 11 20 21 22 23 

            local.get $v0
                local.get $v1
                v8x16.shuffle  8 9 10 11 24 25 26 27 8 9 10 11 12 13 14 15

                local.get $v2
                v8x16.shuffle 0 1 2 3 4 5 6 7 24 25 26 27 12 13 14 15

                local.get $v3
                v8x16.shuffle 0 1 2 3 4 5 6 7 8 9 10 11 24 25 26 27

            local.get $v0
                local.get $v1
                v8x16.shuffle  12 13 14 15 28 29 30 31 8 9 10 11 12 13 14 15

                local.get $v2
                v8x16.shuffle 0 1 2 3 4 5 6 7 28 29 30 31 12 13 14 15

                local.get $v3
                v8x16.shuffle 0 1 2 3 4 5 6 7 8 9 10 11 28 29 30 31
            f32x4.add
            f32x4.add
            f32x4.add
    )
    (func $initv128
        (param $t0 f32)
        (param $t1 f32)
        (param $t2 f32)
        (param $t3 f32)
        (result v128)
            global.get $gv0
            local.get $t0
            f32x4.replace_lane 0
            local.get $t1
            f32x4.replace_lane 1
            local.get $t2
            f32x4.replace_lane 2
            local.get $t3
            f32x4.replace_lane 3
    )
    (export "multiply" (func $multiply))
)