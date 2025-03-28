//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Effects/SimpleStencilMask" {
Properties {
}
SubShader {
 LOD 110
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" }
 Pass {
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" }
  Cull Off
  Stencil {
   Ref 1
   Comp Always
   Pass Replace
   Fail Replace
   ZFail Replace
  }
  Fog {
   Mode Off
  }
  GpuProgramID 37849
Program "vp" {
SubProgram "d3d11 " {
Keywords { "SATURATION_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SATURATION_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat2 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat2 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

layout(location = 0) out vec4 SV_Target0;
void main()
{
    if((int(0xFFFFFFFFu))!=0){discard;}
    SV_Target0 = vec4(0.5, 0.5, 0.5, 0.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "SATURATION_OFF" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 131
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %46 %106 %116 %117 %121 %123 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate %46 Location 46 
                                                      OpMemberDecorate %104 0 BuiltIn 104 
                                                      OpMemberDecorate %104 1 BuiltIn 104 
                                                      OpMemberDecorate %104 2 BuiltIn 104 
                                                      OpDecorate %104 Block 
                                                      OpDecorate %116 RelaxedPrecision 
                                                      OpDecorate %116 Location 116 
                                                      OpDecorate %117 Location 117 
                                                      OpDecorate %121 Location 121 
                                                      OpDecorate %123 Location 123 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeStruct %12 %13 %6 %6 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32_4[4]; f32_4[4]; f32; f32;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 3 
                                              %19 = OpTypePointer Uniform %6 
                                          f32 %22 = OpConstant 3.67402E-40 
                                          u32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Private %6 
                                          i32 %29 = OpConstant 2 
                                          f32 %36 = OpConstant 3.67402E-40 
                                 Private f32* %39 = OpVariable Private 
                                          f32 %43 = OpConstant 3.67402E-40 
                                              %45 = OpTypePointer Input %7 
                                 Input f32_4* %46 = OpVariable Input 
                                          u32 %47 = OpConstant 1 
                                              %48 = OpTypePointer Input %6 
                                          i32 %59 = OpConstant 0 
                                          i32 %60 = OpConstant 1 
                                              %61 = OpTypePointer Uniform %7 
                               Private f32_4* %83 = OpVariable Private 
                                             %103 = OpTypeArray %6 %47 
                                             %104 = OpTypeStruct %7 %6 %103 
                                             %105 = OpTypePointer Output %104 
        Output struct {f32_4; f32; f32[1];}* %106 = OpVariable Output 
                                             %114 = OpTypePointer Output %7 
                               Output f32_4* %116 = OpVariable Output 
                                Input f32_4* %117 = OpVariable Input 
                                             %119 = OpTypeVector %6 2 
                                             %120 = OpTypePointer Output %119 
                               Output f32_2* %121 = OpVariable Output 
                                             %122 = OpTypePointer Input %119 
                                Input f32_2* %123 = OpVariable Input 
                                             %125 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %20 = OpAccessChain %16 %18 
                                          f32 %21 = OpLoad %20 
                                          f32 %23 = OpFAdd %21 %22 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                                      OpStore %26 %23 
                                 Private f32* %27 = OpAccessChain %9 %24 
                                          f32 %28 = OpLoad %27 
                                 Uniform f32* %30 = OpAccessChain %16 %29 
                                          f32 %31 = OpLoad %30 
                                          f32 %32 = OpFMul %28 %31 
                                 Private f32* %33 = OpAccessChain %9 %24 
                                                      OpStore %33 %32 
                                 Private f32* %34 = OpAccessChain %9 %24 
                                          f32 %35 = OpLoad %34 
                                          f32 %37 = OpFMul %35 %36 
                                 Private f32* %38 = OpAccessChain %9 %24 
                                                      OpStore %38 %37 
                                 Uniform f32* %40 = OpAccessChain %16 %29 
                                          f32 %41 = OpLoad %40 
                                          f32 %42 = OpFNegate %41 
                                          f32 %44 = OpFAdd %42 %43 
                                                      OpStore %39 %44 
                                   Input f32* %49 = OpAccessChain %46 %47 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpLoad %39 
                                          f32 %52 = OpFMul %50 %51 
                                 Private f32* %53 = OpAccessChain %9 %24 
                                          f32 %54 = OpLoad %53 
                                          f32 %55 = OpFAdd %52 %54 
                                 Private f32* %56 = OpAccessChain %9 %24 
                                                      OpStore %56 %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                               Uniform f32_4* %62 = OpAccessChain %16 %59 %60 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpFMul %58 %63 
                                                      OpStore %9 %64 
                               Uniform f32_4* %65 = OpAccessChain %16 %59 %59 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpLoad %46 
                                        f32_4 %68 = OpVectorShuffle %67 %67 0 0 0 0 
                                        f32_4 %69 = OpFMul %66 %68 
                                        f32_4 %70 = OpLoad %9 
                                        f32_4 %71 = OpFAdd %69 %70 
                                                      OpStore %9 %71 
                               Uniform f32_4* %72 = OpAccessChain %16 %59 %29 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %46 
                                        f32_4 %75 = OpVectorShuffle %74 %74 2 2 2 2 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %9 %78 
                                        f32_4 %79 = OpLoad %9 
                               Uniform f32_4* %80 = OpAccessChain %16 %59 %18 
                                        f32_4 %81 = OpLoad %80 
                                        f32_4 %82 = OpFAdd %79 %81 
                                                      OpStore %9 %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_4 %85 = OpVectorShuffle %84 %84 1 1 1 1 
                               Uniform f32_4* %86 = OpAccessChain %16 %60 %60 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpFMul %85 %87 
                                                      OpStore %83 %88 
                               Uniform f32_4* %89 = OpAccessChain %16 %60 %59 
                                        f32_4 %90 = OpLoad %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpVectorShuffle %91 %91 0 0 0 0 
                                        f32_4 %93 = OpFMul %90 %92 
                                        f32_4 %94 = OpLoad %83 
                                        f32_4 %95 = OpFAdd %93 %94 
                                                      OpStore %83 %95 
                               Uniform f32_4* %96 = OpAccessChain %16 %60 %29 
                                        f32_4 %97 = OpLoad %96 
                                        f32_4 %98 = OpLoad %9 
                                        f32_4 %99 = OpVectorShuffle %98 %98 2 2 2 2 
                                       f32_4 %100 = OpFMul %97 %99 
                                       f32_4 %101 = OpLoad %83 
                                       f32_4 %102 = OpFAdd %100 %101 
                                                      OpStore %83 %102 
                              Uniform f32_4* %107 = OpAccessChain %16 %60 %18 
                                       f32_4 %108 = OpLoad %107 
                                       f32_4 %109 = OpLoad %9 
                                       f32_4 %110 = OpVectorShuffle %109 %109 3 3 3 3 
                                       f32_4 %111 = OpFMul %108 %110 
                                       f32_4 %112 = OpLoad %83 
                                       f32_4 %113 = OpFAdd %111 %112 
                               Output f32_4* %115 = OpAccessChain %106 %59 
                                                      OpStore %115 %113 
                                       f32_4 %118 = OpLoad %117 
                                                      OpStore %116 %118 
                                       f32_2 %124 = OpLoad %123 
                                                      OpStore %121 %124 
                                 Output f32* %126 = OpAccessChain %106 %59 %47 
                                         f32 %127 = OpLoad %126 
                                         f32 %128 = OpFNegate %127 
                                 Output f32* %129 = OpAccessChain %106 %59 %47 
                                                      OpStore %129 %128 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 19
; Schema: 0
                      OpCapability Shader 
               %1 = OpExtInstImport "GLSL.std.450" 
                      OpMemoryModel Logical GLSL450 
                      OpEntryPoint Fragment %4 "main" %14 
                      OpExecutionMode %4 OriginUpperLeft 
                      OpDecorate %14 RelaxedPrecision 
                      OpDecorate %14 Location 14 
               %2 = OpTypeVoid 
               %3 = OpTypeFunction %2 
               %6 = OpTypeBool 
          bool %7 = OpConstantTrue 
              %11 = OpTypeFloat 32 
              %12 = OpTypeVector %11 4 
              %13 = OpTypePointer Output %12 
Output f32_4* %14 = OpVariable Output 
          f32 %15 = OpConstant 3.67402E-40 
          f32 %16 = OpConstant 3.67402E-40 
        f32_4 %17 = OpConstantComposite %15 %15 %15 %16 
          void %4 = OpFunction None %3 
               %5 = OpLabel 
                      OpSelectionMerge %9 None 
                      OpBranchConditional %7 %8 %9 
               %8 = OpLabel 
                      OpKill
               %9 = OpLabel 
                      OpStore %14 %17 
                      OpReturn
                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "SATURATION_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SATURATION_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat2 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat2 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

layout(location = 0) out vec4 SV_Target0;
void main()
{
    if((int(0xFFFFFFFFu))!=0){discard;}
    SV_Target0 = vec4(0.5, 0.5, 0.5, 0.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "SATURATION_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 131
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %46 %106 %116 %117 %121 %123 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate %46 Location 46 
                                                      OpMemberDecorate %104 0 BuiltIn 104 
                                                      OpMemberDecorate %104 1 BuiltIn 104 
                                                      OpMemberDecorate %104 2 BuiltIn 104 
                                                      OpDecorate %104 Block 
                                                      OpDecorate %116 RelaxedPrecision 
                                                      OpDecorate %116 Location 116 
                                                      OpDecorate %117 Location 117 
                                                      OpDecorate %121 Location 121 
                                                      OpDecorate %123 Location 123 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeStruct %12 %13 %6 %6 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32_4[4]; f32_4[4]; f32; f32;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 3 
                                              %19 = OpTypePointer Uniform %6 
                                          f32 %22 = OpConstant 3.67402E-40 
                                          u32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Private %6 
                                          i32 %29 = OpConstant 2 
                                          f32 %36 = OpConstant 3.67402E-40 
                                 Private f32* %39 = OpVariable Private 
                                          f32 %43 = OpConstant 3.67402E-40 
                                              %45 = OpTypePointer Input %7 
                                 Input f32_4* %46 = OpVariable Input 
                                          u32 %47 = OpConstant 1 
                                              %48 = OpTypePointer Input %6 
                                          i32 %59 = OpConstant 0 
                                          i32 %60 = OpConstant 1 
                                              %61 = OpTypePointer Uniform %7 
                               Private f32_4* %83 = OpVariable Private 
                                             %103 = OpTypeArray %6 %47 
                                             %104 = OpTypeStruct %7 %6 %103 
                                             %105 = OpTypePointer Output %104 
        Output struct {f32_4; f32; f32[1];}* %106 = OpVariable Output 
                                             %114 = OpTypePointer Output %7 
                               Output f32_4* %116 = OpVariable Output 
                                Input f32_4* %117 = OpVariable Input 
                                             %119 = OpTypeVector %6 2 
                                             %120 = OpTypePointer Output %119 
                               Output f32_2* %121 = OpVariable Output 
                                             %122 = OpTypePointer Input %119 
                                Input f32_2* %123 = OpVariable Input 
                                             %125 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %20 = OpAccessChain %16 %18 
                                          f32 %21 = OpLoad %20 
                                          f32 %23 = OpFAdd %21 %22 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                                      OpStore %26 %23 
                                 Private f32* %27 = OpAccessChain %9 %24 
                                          f32 %28 = OpLoad %27 
                                 Uniform f32* %30 = OpAccessChain %16 %29 
                                          f32 %31 = OpLoad %30 
                                          f32 %32 = OpFMul %28 %31 
                                 Private f32* %33 = OpAccessChain %9 %24 
                                                      OpStore %33 %32 
                                 Private f32* %34 = OpAccessChain %9 %24 
                                          f32 %35 = OpLoad %34 
                                          f32 %37 = OpFMul %35 %36 
                                 Private f32* %38 = OpAccessChain %9 %24 
                                                      OpStore %38 %37 
                                 Uniform f32* %40 = OpAccessChain %16 %29 
                                          f32 %41 = OpLoad %40 
                                          f32 %42 = OpFNegate %41 
                                          f32 %44 = OpFAdd %42 %43 
                                                      OpStore %39 %44 
                                   Input f32* %49 = OpAccessChain %46 %47 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpLoad %39 
                                          f32 %52 = OpFMul %50 %51 
                                 Private f32* %53 = OpAccessChain %9 %24 
                                          f32 %54 = OpLoad %53 
                                          f32 %55 = OpFAdd %52 %54 
                                 Private f32* %56 = OpAccessChain %9 %24 
                                                      OpStore %56 %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                               Uniform f32_4* %62 = OpAccessChain %16 %59 %60 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpFMul %58 %63 
                                                      OpStore %9 %64 
                               Uniform f32_4* %65 = OpAccessChain %16 %59 %59 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpLoad %46 
                                        f32_4 %68 = OpVectorShuffle %67 %67 0 0 0 0 
                                        f32_4 %69 = OpFMul %66 %68 
                                        f32_4 %70 = OpLoad %9 
                                        f32_4 %71 = OpFAdd %69 %70 
                                                      OpStore %9 %71 
                               Uniform f32_4* %72 = OpAccessChain %16 %59 %29 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %46 
                                        f32_4 %75 = OpVectorShuffle %74 %74 2 2 2 2 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %9 %78 
                                        f32_4 %79 = OpLoad %9 
                               Uniform f32_4* %80 = OpAccessChain %16 %59 %18 
                                        f32_4 %81 = OpLoad %80 
                                        f32_4 %82 = OpFAdd %79 %81 
                                                      OpStore %9 %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_4 %85 = OpVectorShuffle %84 %84 1 1 1 1 
                               Uniform f32_4* %86 = OpAccessChain %16 %60 %60 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpFMul %85 %87 
                                                      OpStore %83 %88 
                               Uniform f32_4* %89 = OpAccessChain %16 %60 %59 
                                        f32_4 %90 = OpLoad %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpVectorShuffle %91 %91 0 0 0 0 
                                        f32_4 %93 = OpFMul %90 %92 
                                        f32_4 %94 = OpLoad %83 
                                        f32_4 %95 = OpFAdd %93 %94 
                                                      OpStore %83 %95 
                               Uniform f32_4* %96 = OpAccessChain %16 %60 %29 
                                        f32_4 %97 = OpLoad %96 
                                        f32_4 %98 = OpLoad %9 
                                        f32_4 %99 = OpVectorShuffle %98 %98 2 2 2 2 
                                       f32_4 %100 = OpFMul %97 %99 
                                       f32_4 %101 = OpLoad %83 
                                       f32_4 %102 = OpFAdd %100 %101 
                                                      OpStore %83 %102 
                              Uniform f32_4* %107 = OpAccessChain %16 %60 %18 
                                       f32_4 %108 = OpLoad %107 
                                       f32_4 %109 = OpLoad %9 
                                       f32_4 %110 = OpVectorShuffle %109 %109 3 3 3 3 
                                       f32_4 %111 = OpFMul %108 %110 
                                       f32_4 %112 = OpLoad %83 
                                       f32_4 %113 = OpFAdd %111 %112 
                               Output f32_4* %115 = OpAccessChain %106 %59 
                                                      OpStore %115 %113 
                                       f32_4 %118 = OpLoad %117 
                                                      OpStore %116 %118 
                                       f32_2 %124 = OpLoad %123 
                                                      OpStore %121 %124 
                                 Output f32* %126 = OpAccessChain %106 %59 %47 
                                         f32 %127 = OpLoad %126 
                                         f32 %128 = OpFNegate %127 
                                 Output f32* %129 = OpAccessChain %106 %59 %47 
                                                      OpStore %129 %128 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 19
; Schema: 0
                      OpCapability Shader 
               %1 = OpExtInstImport "GLSL.std.450" 
                      OpMemoryModel Logical GLSL450 
                      OpEntryPoint Fragment %4 "main" %14 
                      OpExecutionMode %4 OriginUpperLeft 
                      OpDecorate %14 RelaxedPrecision 
                      OpDecorate %14 Location 14 
               %2 = OpTypeVoid 
               %3 = OpTypeFunction %2 
               %6 = OpTypeBool 
          bool %7 = OpConstantTrue 
              %11 = OpTypeFloat 32 
              %12 = OpTypeVector %11 4 
              %13 = OpTypePointer Output %12 
Output f32_4* %14 = OpVariable Output 
          f32 %15 = OpConstant 3.67402E-40 
          f32 %16 = OpConstant 3.67402E-40 
        f32_4 %17 = OpConstantComposite %15 %15 %15 %16 
          void %4 = OpFunction None %3 
               %5 = OpLabel 
                      OpSelectionMerge %9 None 
                      OpBranchConditional %7 %8 %9 
               %8 = OpLabel 
                      OpKill
               %9 = OpLabel 
                      OpStore %14 %17 
                      OpReturn
                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "SATURATION_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SATURATION_OFF" }
""
}
SubProgram "vulkan " {
Keywords { "SATURATION_OFF" }
""
}
SubProgram "d3d11 " {
Keywords { "SATURATION_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SATURATION_ON" }
""
}
SubProgram "vulkan " {
Keywords { "SATURATION_ON" }
""
}
}
}
}
Fallback "tk2d/BlendVertexColor"
}