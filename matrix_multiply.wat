;;4x4 matrix multiplication using SIMD instruction set
;;Created by Otto-Ville Lamminpää
;;ottoville.lamminpaa@gmail.com

;;  LICENSE
;;  This code can be freely used, as long as author is mentioned in credits section of the software
;;  If this code, or any part of it, is included in software or set viewable to public audiance, this LICENSE section must be included with the code 

(module
    (import "env" "memory" (memory $mem 1 2))
    (func $row
        (param $v0 v128)
        (param $v1 v128)
        (param $v2 v128)
        (param $v3 v128)
        (param $pointers v128)
        (result v128)
        (f32x4.add
            (f32x4.mul
                (f32x4.splat
                    (f32x4.extract_lane 0
                        (local.get $pointers)
                    )
                )
                (local.get $v0)
            )
            (f32x4.mul
                (f32x4.splat
                    (f32x4.extract_lane 1
                        (local.get $pointers)
                    )
                )
                (local.get $v1)
            )
        )
        (f32x4.add
            (f32x4.mul
                (f32x4.splat
                    (f32x4.extract_lane 2
                        (local.get $pointers)
                    )
                )
                (local.get $v2)

            )
            (f32x4.mul
                (f32x4.splat
                    (f32x4.extract_lane 3
                        (local.get $pointers)
                    )
                )
                (local.get $v3)

            )
        )
        f32x4.add
    )
    (func $multiply
        (param $0 i32)
        (param $1 i32)
        (param $2 i32)
        
        (local $v0 v128)
        (local $v1 v128)
        (local $v2 v128)
        (local $v3 v128)

        local.get $2
        (call $row
            (local.tee $v0
                (v128.load
                    (local.get $1)
                )
            )
            (local.tee $v1
                (v128.load offset=16
                    (local.get $1)
                )
            )
            (local.tee $v2
                (v128.load offset=32
                   (local.get $1)
                )
            )
            (local.tee $v3
                (v128.load offset=48
                    (local.get $1)
                )
            )
            (v128.load
                (local.get $0)
            )
            
        )
        v128.store
        i32.const 16
        local.get $2
        i32.add
        (call $row
            (local.get $v0)
            (local.get $v1)
            (local.get $v2)
            (local.get $v3)
            (v128.load offset=16
                (local.get $0)
            )
            
        )
        v128.store
        i32.const 32
        local.get $2
        i32.add
        (call $row
            (local.get $v0)
            (local.get $v1)
            (local.get $v2)
            (local.get $v3)
            (v128.load offset=32
                (local.get $0)
            )
            
        )
        v128.store
        i32.const 48
        local.get $2
        i32.add
        (call $row
            (local.get $v0)
            (local.get $v1)
            (local.get $v2)
            (local.get $v3)
            (v128.load offset=48
                (local.get $0)
            )
            
        )
        v128.store
    )
    (export "multiply" (func $multiply))
)
