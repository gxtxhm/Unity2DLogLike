//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/DistortionRadius" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_WaveCenter ("Wave Center", Vector) = (0,0,0,0)
_Strength ("Strength", Float) = 0.01
_TimePulse ("Time Factor", Range(0, 1)) = 0
_RadiusFactor ("Radius Factor", Float) = 1
}
SubShader {
 Pass {
  GpuProgramID 44945
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
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 _WaveCenter;
uniform 	float _Strength;
uniform 	float _TimePulse;
uniform 	float _RadiusFactor;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat1;
float u_xlat2;
float u_xlat4;
void main()
{
    u_xlat0 = _Time.x * 100.0;
    u_xlat0 = sin(u_xlat0);
    u_xlat0 = u_xlat0 + 1.0;
    u_xlat0 = u_xlat0 * 0.25 + 0.5;
    u_xlat0 = _Strength * u_xlat0 + (-_Strength);
    u_xlat0 = _TimePulse * u_xlat0 + _Strength;
    u_xlat1.xy = vs_TEXCOORD0.xy + (-_WaveCenter.xy);
    u_xlat1.zw = u_xlat1.xx * vec2(1.77777779, 1.77777779);
    u_xlat2 = dot(u_xlat1.yz, u_xlat1.yw);
    u_xlat2 = sqrt(u_xlat2);
    u_xlat2 = (-u_xlat2) + _RadiusFactor;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat4 = u_xlat2 * u_xlat2;
    u_xlat2 = u_xlat4 * (-u_xlat2);
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2 = u_xlat1.x * 1.77777779;
    u_xlat1.y = u_xlat0 * u_xlat1.y + vs_TEXCOORD0.y;
    u_xlat1.x = u_xlat0 * u_xlat2 + vs_TEXCOORD0.x;
    SV_Target0 = texture(_MainTex, u_xlat1.xy);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate %84 RelaxedPrecision 
                                              OpDecorate %84 Location 84 
                                              OpDecorate %86 RelaxedPrecision 
                                              OpDecorate %86 Location 86 
                                              OpDecorate %87 RelaxedPrecision 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %14 = OpTypeInt 32 0 
                                  u32 %15 = OpConstant 4 
                                      %16 = OpTypeArray %7 %15 
                                      %17 = OpTypeArray %7 %15 
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 2 
                                      %83 = OpTypePointer Output %82 
                        Output f32_2* %84 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_2* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_2 %87 = OpLoad %86 
                                              OpStore %84 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 130
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %53 %120 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpMemberDecorate %10 0 Offset 10 
                                                      OpMemberDecorate %10 1 Offset 10 
                                                      OpMemberDecorate %10 2 Offset 10 
                                                      OpMemberDecorate %10 3 Offset 10 
                                                      OpMemberDecorate %10 4 Offset 10 
                                                      OpDecorate %10 Block 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %53 Location 53 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %94 RelaxedPrecision 
                                                      OpDecorate %97 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %109 RelaxedPrecision 
                                                      OpDecorate %112 RelaxedPrecision 
                                                      OpDecorate %116 RelaxedPrecision 
                                                      OpDecorate %120 Location 120 
                                                      OpDecorate %124 RelaxedPrecision 
                                                      OpDecorate %124 DescriptorSet 124 
                                                      OpDecorate %124 Binding 124 
                                                      OpDecorate %125 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypePointer Private %6 
                                  Private f32* %8 = OpVariable Private 
                                               %9 = OpTypeVector %6 4 
                                              %10 = OpTypeStruct %9 %9 %6 %6 %6 
                                              %11 = OpTypePointer Uniform %10 
Uniform struct {f32_4; f32_4; f32; f32; f32;}* %12 = OpVariable Uniform 
                                              %13 = OpTypeInt 32 1 
                                          i32 %14 = OpConstant 0 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 0 
                                              %17 = OpTypePointer Uniform %6 
                                          f32 %20 = OpConstant 3.67402E-40 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %28 = OpConstant 3.67402E-40 
                                          f32 %30 = OpConstant 3.67402E-40 
                                          i32 %32 = OpConstant 2 
                                          i32 %41 = OpConstant 3 
                                              %49 = OpTypePointer Private %9 
                               Private f32_4* %50 = OpVariable Private 
                                              %51 = OpTypeVector %6 2 
                                              %52 = OpTypePointer Input %51 
                                 Input f32_2* %53 = OpVariable Input 
                                          i32 %55 = OpConstant 1 
                                              %56 = OpTypePointer Uniform %9 
                                          f32 %66 = OpConstant 3.67402E-40 
                                        f32_2 %67 = OpConstantComposite %66 %66 
                                 Private f32* %71 = OpVariable Private 
                                          i32 %81 = OpConstant 4 
                                          f32 %86 = OpConstant 3.67402E-40 
                                 Private f32* %88 = OpVariable Private 
                                         u32 %103 = OpConstant 1 
                                             %107 = OpTypePointer Input %6 
                                             %119 = OpTypePointer Output %9 
                               Output f32_4* %120 = OpVariable Output 
                                             %121 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %122 = OpTypeSampledImage %121 
                                             %123 = OpTypePointer UniformConstant %122 
 UniformConstant read_only Texture2DSampled* %124 = OpVariable UniformConstant 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %18 = OpAccessChain %12 %14 %16 
                                          f32 %19 = OpLoad %18 
                                          f32 %21 = OpFMul %19 %20 
                                                      OpStore %8 %21 
                                          f32 %22 = OpLoad %8 
                                          f32 %23 = OpExtInst %1 13 %22 
                                                      OpStore %8 %23 
                                          f32 %24 = OpLoad %8 
                                          f32 %26 = OpFAdd %24 %25 
                                                      OpStore %8 %26 
                                          f32 %27 = OpLoad %8 
                                          f32 %29 = OpFMul %27 %28 
                                          f32 %31 = OpFAdd %29 %30 
                                                      OpStore %8 %31 
                                 Uniform f32* %33 = OpAccessChain %12 %32 
                                          f32 %34 = OpLoad %33 
                                          f32 %35 = OpLoad %8 
                                          f32 %36 = OpFMul %34 %35 
                                 Uniform f32* %37 = OpAccessChain %12 %32 
                                          f32 %38 = OpLoad %37 
                                          f32 %39 = OpFNegate %38 
                                          f32 %40 = OpFAdd %36 %39 
                                                      OpStore %8 %40 
                                 Uniform f32* %42 = OpAccessChain %12 %41 
                                          f32 %43 = OpLoad %42 
                                          f32 %44 = OpLoad %8 
                                          f32 %45 = OpFMul %43 %44 
                                 Uniform f32* %46 = OpAccessChain %12 %32 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpFAdd %45 %47 
                                                      OpStore %8 %48 
                                        f32_2 %54 = OpLoad %53 
                               Uniform f32_4* %57 = OpAccessChain %12 %55 
                                        f32_4 %58 = OpLoad %57 
                                        f32_2 %59 = OpVectorShuffle %58 %58 0 1 
                                        f32_2 %60 = OpFNegate %59 
                                        f32_2 %61 = OpFAdd %54 %60 
                                        f32_4 %62 = OpLoad %50 
                                        f32_4 %63 = OpVectorShuffle %62 %61 4 5 2 3 
                                                      OpStore %50 %63 
                                        f32_4 %64 = OpLoad %50 
                                        f32_2 %65 = OpVectorShuffle %64 %64 0 0 
                                        f32_2 %68 = OpFMul %65 %67 
                                        f32_4 %69 = OpLoad %50 
                                        f32_4 %70 = OpVectorShuffle %69 %68 0 1 4 5 
                                                      OpStore %50 %70 
                                        f32_4 %72 = OpLoad %50 
                                        f32_2 %73 = OpVectorShuffle %72 %72 1 2 
                                        f32_4 %74 = OpLoad %50 
                                        f32_2 %75 = OpVectorShuffle %74 %74 1 3 
                                          f32 %76 = OpDot %73 %75 
                                                      OpStore %71 %76 
                                          f32 %77 = OpLoad %71 
                                          f32 %78 = OpExtInst %1 31 %77 
                                                      OpStore %71 %78 
                                          f32 %79 = OpLoad %71 
                                          f32 %80 = OpFNegate %79 
                                 Uniform f32* %82 = OpAccessChain %12 %81 
                                          f32 %83 = OpLoad %82 
                                          f32 %84 = OpFAdd %80 %83 
                                                      OpStore %71 %84 
                                          f32 %85 = OpLoad %71 
                                          f32 %87 = OpExtInst %1 43 %85 %86 %25 
                                                      OpStore %71 %87 
                                          f32 %89 = OpLoad %71 
                                          f32 %90 = OpFNegate %89 
                                          f32 %91 = OpLoad %71 
                                          f32 %92 = OpFMul %90 %91 
                                                      OpStore %88 %92 
                                          f32 %93 = OpLoad %71 
                                          f32 %94 = OpLoad %88 
                                          f32 %95 = OpFMul %93 %94 
                                                      OpStore %88 %95 
                                          f32 %96 = OpLoad %8 
                                          f32 %97 = OpLoad %88 
                                          f32 %98 = OpFMul %96 %97 
                                                      OpStore %88 %98 
                                 Private f32* %99 = OpAccessChain %50 %16 
                                         f32 %100 = OpLoad %99 
                                         f32 %101 = OpFMul %100 %66 
                                                      OpStore %8 %101 
                                         f32 %102 = OpLoad %88 
                                Private f32* %104 = OpAccessChain %50 %103 
                                         f32 %105 = OpLoad %104 
                                         f32 %106 = OpFMul %102 %105 
                                  Input f32* %108 = OpAccessChain %53 %103 
                                         f32 %109 = OpLoad %108 
                                         f32 %110 = OpFAdd %106 %109 
                                Private f32* %111 = OpAccessChain %50 %103 
                                                      OpStore %111 %110 
                                         f32 %112 = OpLoad %88 
                                         f32 %113 = OpLoad %8 
                                         f32 %114 = OpFMul %112 %113 
                                  Input f32* %115 = OpAccessChain %53 %16 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFAdd %114 %116 
                                Private f32* %118 = OpAccessChain %50 %16 
                                                      OpStore %118 %117 
                  read_only Texture2DSampled %125 = OpLoad %124 
                                       f32_4 %126 = OpLoad %50 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                       f32_4 %128 = OpImageSampleImplicitLod %125 %127 
                                                      OpStore %120 %128 
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