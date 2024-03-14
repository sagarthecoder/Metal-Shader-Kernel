
//
//  CustomFilterKernel.ci.metal
//  GIF-Maker
//
//  Created by Sagar on 25/9/23.
//

#include <metal_stdlib>
using namespace metal;
#include <CoreImage/CoreImage.h>


extern "C" { namespace coreimage {
    
    float4 makeLeftSideTransparent(sampler src, float maximumLeftPositionX) {
        float2 position = src.coord();
        if (position.x <= maximumLeftPositionX) {
            return float4(0,0,0,0);
            
        } else {
            return src.sample(position);
        }
    }
    
}}

