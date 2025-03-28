//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/DebugLines" {
Properties {
}
SubShader {
 Pass {
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 38721
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec3 in_POSITION0;
in  vec4 in_COLOR0;
out vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 99
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %9 %11 %23 %84 
                                              OpDecorate %9 RelaxedPrecision 
                                              OpDecorate %9 Location 9 
                                              OpDecorate %11 RelaxedPrecision 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %12 RelaxedPrecision 
                                              OpDecorate %13 RelaxedPrecision 
                                              OpDecorate %16 RelaxedPrecision 
                                              OpDecorate %17 RelaxedPrecision 
                                              OpDecorate %18 RelaxedPrecision 
                                              OpDecorate %23 Location 23 
                                              OpDecorate %28 ArrayStride 28 
                                              OpDecorate %29 ArrayStride 29 
                                              OpMemberDecorate %30 0 Offset 30 
                                              OpMemberDecorate %30 1 Offset 30 
                                              OpDecorate %30 Block 
                                              OpDecorate %32 DescriptorSet 32 
                                              OpDecorate %32 Binding 32 
                                              OpMemberDecorate %82 0 BuiltIn 82 
                                              OpMemberDecorate %82 1 BuiltIn 82 
                                              OpMemberDecorate %82 2 BuiltIn 82 
                                              OpDecorate %82 Block 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Output %7 
                         Output f32_4* %9 = OpVariable Output 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                  f32 %14 = OpConstant 3.67402E-40 
                                  f32 %15 = OpConstant 3.67402E-40 
                                      %19 = OpTypePointer Private %7 
                       Private f32_4* %20 = OpVariable Private 
                                      %21 = OpTypeVector %6 3 
                                      %22 = OpTypePointer Input %21 
                         Input f32_3* %23 = OpVariable Input 
                                      %26 = OpTypeInt 32 0 
                                  u32 %27 = OpConstant 4 
                                      %28 = OpTypeArray %7 %27 
                                      %29 = OpTypeArray %7 %27 
                                      %30 = OpTypeStruct %28 %29 
                                      %31 = OpTypePointer Uniform %30 
Uniform struct {f32_4[4]; f32_4[4];}* %32 = OpVariable Uniform 
                                      %33 = OpTypeInt 32 1 
                                  i32 %34 = OpConstant 0 
                                  i32 %35 = OpConstant 1 
                                      %36 = OpTypePointer Uniform %7 
                                  i32 %47 = OpConstant 2 
                                  i32 %56 = OpConstant 3 
                       Private f32_4* %60 = OpVariable Private 
                                  u32 %80 = OpConstant 1 
                                      %81 = OpTypeArray %6 %80 
                                      %82 = OpTypeStruct %7 %6 %81 
                                      %83 = OpTypePointer Output %82 
 Output struct {f32_4; f32; f32[1];}* %84 = OpVariable Output 
                                      %93 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                              OpStore %9 %12 
                                f32_4 %13 = OpLoad %9 
                                f32_4 %16 = OpCompositeConstruct %14 %14 %14 %14 
                                f32_4 %17 = OpCompositeConstruct %15 %15 %15 %15 
                                f32_4 %18 = OpExtInst %1 43 %13 %16 %17 
                                              OpStore %9 %18 
                                f32_3 %24 = OpLoad %23 
                                f32_4 %25 = OpVectorShuffle %24 %24 1 1 1 1 
                       Uniform f32_4* %37 = OpAccessChain %32 %34 %35 
                                f32_4 %38 = OpLoad %37 
                                f32_4 %39 = OpFMul %25 %38 
                                              OpStore %20 %39 
                       Uniform f32_4* %40 = OpAccessChain %32 %34 %34 
                                f32_4 %41 = OpLoad %40 
                                f32_3 %42 = OpLoad %23 
                                f32_4 %43 = OpVectorShuffle %42 %42 0 0 0 0 
                                f32_4 %44 = OpFMul %41 %43 
                                f32_4 %45 = OpLoad %20 
                                f32_4 %46 = OpFAdd %44 %45 
                                              OpStore %20 %46 
                       Uniform f32_4* %48 = OpAccessChain %32 %34 %47 
                                f32_4 %49 = OpLoad %48 
                                f32_3 %50 = OpLoad %23 
                                f32_4 %51 = OpVectorShuffle %50 %50 2 2 2 2 
                                f32_4 %52 = OpFMul %49 %51 
                                f32_4 %53 = OpLoad %20 
                                f32_4 %54 = OpFAdd %52 %53 
                                              OpStore %20 %54 
                                f32_4 %55 = OpLoad %20 
                       Uniform f32_4* %57 = OpAccessChain %32 %34 %56 
                                f32_4 %58 = OpLoad %57 
                                f32_4 %59 = OpFAdd %55 %58 
                                              OpStore %20 %59 
                                f32_4 %61 = OpLoad %20 
                                f32_4 %62 = OpVectorShuffle %61 %61 1 1 1 1 
                       Uniform f32_4* %63 = OpAccessChain %32 %35 %35 
                                f32_4 %64 = OpLoad %63 
                                f32_4 %65 = OpFMul %62 %64 
                                              OpStore %60 %65 
                       Uniform f32_4* %66 = OpAccessChain %32 %35 %34 
                                f32_4 %67 = OpLoad %66 
                                f32_4 %68 = OpLoad %20 
                                f32_4 %69 = OpVectorShuffle %68 %68 0 0 0 0 
                                f32_4 %70 = OpFMul %67 %69 
                                f32_4 %71 = OpLoad %60 
                                f32_4 %72 = OpFAdd %70 %71 
                                              OpStore %60 %72 
                       Uniform f32_4* %73 = OpAccessChain %32 %35 %47 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %20 
                                f32_4 %76 = OpVectorShuffle %75 %75 2 2 2 2 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %60 
                                f32_4 %79 = OpFAdd %77 %78 
                                              OpStore %60 %79 
                       Uniform f32_4* %85 = OpAccessChain %32 %35 %56 
                                f32_4 %86 = OpLoad %85 
                                f32_4 %87 = OpLoad %20 
                                f32_4 %88 = OpVectorShuffle %87 %87 3 3 3 3 
                                f32_4 %89 = OpFMul %86 %88 
                                f32_4 %90 = OpLoad %60 
                                f32_4 %91 = OpFAdd %89 %90 
                        Output f32_4* %92 = OpAccessChain %84 %34 
                                              OpStore %92 %91 
                          Output f32* %94 = OpAccessChain %84 %34 %80 
                                  f32 %95 = OpLoad %94 
                                  f32 %96 = OpFNegate %95 
                          Output f32* %97 = OpAccessChain %84 %34 %80 
                                              OpStore %97 %96 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 14
; Schema: 0
                     OpCapability Shader 
              %1 = OpExtInstImport "GLSL.std.450" 
                     OpMemoryModel Logical GLSL450 
                     OpEntryPoint Fragment %4 "main" %9 %11 
                     OpExecutionMode %4 OriginUpperLeft 
                     OpDecorate %9 RelaxedPrecision 
                     OpDecorate %9 Location 9 
                     OpDecorate %11 RelaxedPrecision 
                     OpDecorate %11 Location 11 
                     OpDecorate %12 RelaxedPrecision 
              %2 = OpTypeVoid 
              %3 = OpTypeFunction %2 
              %6 = OpTypeFloat 32 
              %7 = OpTypeVector %6 4 
              %8 = OpTypePointer Output %7 
Output f32_4* %9 = OpVariable Output 
             %10 = OpTypePointer Input %7 
Input f32_4* %11 = OpVariable Input 
         void %4 = OpFunction None %3 
              %5 = OpLabel 
       f32_4 %12 = OpLoad %11 
                     OpStore %9 %12 
                     OpReturn
                     OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
}
}
}
}