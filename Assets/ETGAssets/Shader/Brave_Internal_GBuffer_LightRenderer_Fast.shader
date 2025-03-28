//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/GBuffer_LightRenderer_Fast" {
Properties {
_LightPos ("Light Position", Vector) = (0,0,0,0)
_LightRadius ("Light Radius", Float) = 1
_LightIntensity ("Light Intensity", Float) = 0
_LightColor ("Light Color", Color) = (0,0,0,0)
}
SubShader {
 Pass {
  Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
  ZTest Always
  GpuProgramID 3302
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
uniform 	vec4 _CameraWS;
uniform 	float _CameraOrthoSize;
uniform 	float _CameraOrthoSizeX;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
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
    u_xlat0.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_CameraOrthoSizeX, _CameraOrthoSize);
    u_xlat0.z = float(0.0);
    u_xlat0.w = float(0.0);
    vs_TEXCOORD1 = u_xlat0 + _CameraWS;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _LightPos;
uniform 	float _LightRadius;
uniform 	float _LightIntensity;
uniform 	vec4 _LightColor;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
int u_xlati1;
float u_xlat2;
int u_xlati3;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD1.xy) + _LightPos.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat2 = _LightRadius * _LightRadius;
    u_xlat2 = float(1.0) / u_xlat2;
    u_xlat0.x = (-u_xlat0.x) * u_xlat2 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.w = u_xlat0.x * u_xlat0.x;
    u_xlat1.x = u_xlat0.w * abs(_LightIntensity);
    u_xlat0.xyz = u_xlat1.xxx * _LightColor.xyz;
    u_xlat1 = u_xlat0 + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat0.x = min(abs(_LightIntensity), 1.0);
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = u_xlat0.wwww * u_xlat1;
    u_xlat0 = u_xlat0.xxxx * u_xlat1;
    u_xlati1 = int((0.0<_LightIntensity) ? 0xFFFFFFFFu : uint(0u));
    u_xlati3 = int((_LightIntensity<0.0) ? 0xFFFFFFFFu : uint(0u));
    u_xlati1 = (-u_xlati1) + u_xlati3;
    u_xlat1.x = float(u_xlati1);
    SV_Target0 = u_xlat0 * u_xlat1.xxxx;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 127
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %72 %84 %85 %116 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpMemberDecorate %18 4 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpMemberDecorate %70 0 BuiltIn 70 
                                                      OpMemberDecorate %70 1 BuiltIn 70 
                                                      OpMemberDecorate %70 2 BuiltIn 70 
                                                      OpDecorate %70 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %116 Location 116 
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
                                              %18 = OpTypeStruct %16 %17 %7 %6 %6 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32; f32;}* %20 = OpVariable Uniform 
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
                                 Input f32_4* %85 = OpVariable Input 
                                          f32 %90 = OpConstant 3.67402E-40 
                                        f32_2 %91 = OpConstantComposite %90 %90 
                                          f32 %93 = OpConstant 3.67402E-40 
                                        f32_2 %94 = OpConstantComposite %93 %93 
                                         i32 %100 = OpConstant 4 
                                             %101 = OpTypePointer Uniform %6 
                                         f32 %110 = OpConstant 3.67402E-40 
                                         u32 %111 = OpConstant 2 
                                             %112 = OpTypePointer Private %6 
                                         u32 %114 = OpConstant 3 
                               Output f32_4* %116 = OpVariable Output 
                                             %121 = OpTypePointer Output %6 
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
                                        f32_4 %86 = OpLoad %85 
                                        f32_2 %87 = OpVectorShuffle %86 %86 0 1 
                                                      OpStore %84 %87 
                                        f32_4 %88 = OpLoad %85 
                                        f32_2 %89 = OpVectorShuffle %88 %88 0 1 
                                        f32_2 %92 = OpFMul %89 %91 
                                        f32_2 %95 = OpFAdd %92 %94 
                                        f32_4 %96 = OpLoad %9 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 2 3 
                                                      OpStore %9 %97 
                                        f32_4 %98 = OpLoad %9 
                                        f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                Uniform f32* %102 = OpAccessChain %20 %100 
                                         f32 %103 = OpLoad %102 
                                Uniform f32* %104 = OpAccessChain %20 %44 
                                         f32 %105 = OpLoad %104 
                                       f32_2 %106 = OpCompositeConstruct %103 %105 
                                       f32_2 %107 = OpFMul %99 %106 
                                       f32_4 %108 = OpLoad %9 
                                       f32_4 %109 = OpVectorShuffle %108 %107 4 5 2 3 
                                                      OpStore %9 %109 
                                Private f32* %113 = OpAccessChain %9 %111 
                                                      OpStore %113 %110 
                                Private f32* %115 = OpAccessChain %9 %114 
                                                      OpStore %115 %110 
                                       f32_4 %117 = OpLoad %9 
                              Uniform f32_4* %118 = OpAccessChain %20 %35 
                                       f32_4 %119 = OpLoad %118 
                                       f32_4 %120 = OpFAdd %117 %119 
                                                      OpStore %116 %120 
                                 Output f32* %122 = OpAccessChain %72 %22 %68 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpFNegate %123 
                                 Output f32* %125 = OpAccessChain %72 %22 %68 
                                                      OpStore %125 %124 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 147
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %11 %141 
                                                  OpExecutionMode %4 OriginUpperLeft 
                                                  OpDecorate %11 Location 11 
                                                  OpMemberDecorate %16 0 Offset 16 
                                                  OpMemberDecorate %16 1 Offset 16 
                                                  OpMemberDecorate %16 2 Offset 16 
                                                  OpMemberDecorate %16 3 Offset 16 
                                                  OpDecorate %16 Block 
                                                  OpDecorate %18 DescriptorSet 18 
                                                  OpDecorate %18 Binding 18 
                                                  OpDecorate %141 Location 141 
                                           %2 = OpTypeVoid 
                                           %3 = OpTypeFunction %2 
                                           %6 = OpTypeFloat 32 
                                           %7 = OpTypeVector %6 4 
                                           %8 = OpTypePointer Private %7 
                            Private f32_4* %9 = OpVariable Private 
                                          %10 = OpTypePointer Input %7 
                             Input f32_4* %11 = OpVariable Input 
                                          %12 = OpTypeVector %6 2 
                                          %16 = OpTypeStruct %7 %6 %6 %7 
                                          %17 = OpTypePointer Uniform %16 
Uniform struct {f32_4; f32; f32; f32_4;}* %18 = OpVariable Uniform 
                                          %19 = OpTypeInt 32 1 
                                      i32 %20 = OpConstant 0 
                                          %21 = OpTypePointer Uniform %7 
                                          %33 = OpTypeInt 32 0 
                                      u32 %34 = OpConstant 0 
                                          %35 = OpTypePointer Private %6 
                             Private f32* %37 = OpVariable Private 
                                      i32 %38 = OpConstant 1 
                                          %39 = OpTypePointer Uniform %6 
                                      f32 %45 = OpConstant 3.67402E-40 
                                      f32 %57 = OpConstant 3.67402E-40 
                                      u32 %65 = OpConstant 3 
                           Private f32_4* %67 = OpVariable Private 
                                      i32 %70 = OpConstant 2 
                                          %76 = OpTypeVector %6 3 
                                      i32 %79 = OpConstant 3 
                                      f32 %87 = OpConstant 3.67402E-40 
                                    f32_4 %88 = OpConstantComposite %87 %87 %87 %87 
                                    f32_4 %99 = OpConstantComposite %45 %45 %45 %45 
                                         %109 = OpTypePointer Private %19 
                            Private i32* %110 = OpVariable Private 
                                         %111 = OpTypePointer Function %33 
                                         %115 = OpTypeBool 
                                     u32 %119 = OpConstant 4294967295 
                            Private i32* %123 = OpVariable Private 
                                         %140 = OpTypePointer Output %7 
                           Output f32_4* %141 = OpVariable Output 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                           Function u32* %112 = OpVariable Function 
                           Function u32* %124 = OpVariable Function 
                                    f32_4 %13 = OpLoad %11 
                                    f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                                    f32_2 %15 = OpFNegate %14 
                           Uniform f32_4* %22 = OpAccessChain %18 %20 
                                    f32_4 %23 = OpLoad %22 
                                    f32_2 %24 = OpVectorShuffle %23 %23 0 1 
                                    f32_2 %25 = OpFAdd %15 %24 
                                    f32_4 %26 = OpLoad %9 
                                    f32_4 %27 = OpVectorShuffle %26 %25 4 5 2 3 
                                                  OpStore %9 %27 
                                    f32_4 %28 = OpLoad %9 
                                    f32_2 %29 = OpVectorShuffle %28 %28 0 1 
                                    f32_4 %30 = OpLoad %9 
                                    f32_2 %31 = OpVectorShuffle %30 %30 0 1 
                                      f32 %32 = OpDot %29 %31 
                             Private f32* %36 = OpAccessChain %9 %34 
                                                  OpStore %36 %32 
                             Uniform f32* %40 = OpAccessChain %18 %38 
                                      f32 %41 = OpLoad %40 
                             Uniform f32* %42 = OpAccessChain %18 %38 
                                      f32 %43 = OpLoad %42 
                                      f32 %44 = OpFMul %41 %43 
                                                  OpStore %37 %44 
                                      f32 %46 = OpLoad %37 
                                      f32 %47 = OpFDiv %45 %46 
                                                  OpStore %37 %47 
                             Private f32* %48 = OpAccessChain %9 %34 
                                      f32 %49 = OpLoad %48 
                                      f32 %50 = OpFNegate %49 
                                      f32 %51 = OpLoad %37 
                                      f32 %52 = OpFMul %50 %51 
                                      f32 %53 = OpFAdd %52 %45 
                             Private f32* %54 = OpAccessChain %9 %34 
                                                  OpStore %54 %53 
                             Private f32* %55 = OpAccessChain %9 %34 
                                      f32 %56 = OpLoad %55 
                                      f32 %58 = OpExtInst %1 40 %56 %57 
                             Private f32* %59 = OpAccessChain %9 %34 
                                                  OpStore %59 %58 
                             Private f32* %60 = OpAccessChain %9 %34 
                                      f32 %61 = OpLoad %60 
                             Private f32* %62 = OpAccessChain %9 %34 
                                      f32 %63 = OpLoad %62 
                                      f32 %64 = OpFMul %61 %63 
                             Private f32* %66 = OpAccessChain %9 %65 
                                                  OpStore %66 %64 
                             Private f32* %68 = OpAccessChain %9 %65 
                                      f32 %69 = OpLoad %68 
                             Uniform f32* %71 = OpAccessChain %18 %70 
                                      f32 %72 = OpLoad %71 
                                      f32 %73 = OpExtInst %1 4 %72 
                                      f32 %74 = OpFMul %69 %73 
                             Private f32* %75 = OpAccessChain %67 %34 
                                                  OpStore %75 %74 
                                    f32_4 %77 = OpLoad %67 
                                    f32_3 %78 = OpVectorShuffle %77 %77 0 0 0 
                           Uniform f32_4* %80 = OpAccessChain %18 %79 
                                    f32_4 %81 = OpLoad %80 
                                    f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                                    f32_3 %83 = OpFMul %78 %82 
                                    f32_4 %84 = OpLoad %9 
                                    f32_4 %85 = OpVectorShuffle %84 %83 4 5 6 3 
                                                  OpStore %9 %85 
                                    f32_4 %86 = OpLoad %9 
                                    f32_4 %89 = OpFAdd %86 %88 
                                                  OpStore %67 %89 
                             Uniform f32* %90 = OpAccessChain %18 %70 
                                      f32 %91 = OpLoad %90 
                                      f32 %92 = OpExtInst %1 4 %91 
                                      f32 %93 = OpExtInst %1 37 %92 %45 
                             Private f32* %94 = OpAccessChain %9 %34 
                                                  OpStore %94 %93 
                                    f32_4 %95 = OpLoad %9 
                                    f32_4 %96 = OpVectorShuffle %95 %95 0 0 0 0 
                                    f32_4 %97 = OpLoad %67 
                                    f32_4 %98 = OpFMul %96 %97 
                                   f32_4 %100 = OpFAdd %98 %99 
                                                  OpStore %67 %100 
                                   f32_4 %101 = OpLoad %9 
                                   f32_4 %102 = OpVectorShuffle %101 %101 3 3 3 3 
                                   f32_4 %103 = OpLoad %67 
                                   f32_4 %104 = OpFMul %102 %103 
                                                  OpStore %67 %104 
                                   f32_4 %105 = OpLoad %9 
                                   f32_4 %106 = OpVectorShuffle %105 %105 0 0 0 0 
                                   f32_4 %107 = OpLoad %67 
                                   f32_4 %108 = OpFMul %106 %107 
                                                  OpStore %9 %108 
                            Uniform f32* %113 = OpAccessChain %18 %70 
                                     f32 %114 = OpLoad %113 
                                    bool %116 = OpFOrdLessThan %57 %114 
                                                  OpSelectionMerge %118 None 
                                                  OpBranchConditional %116 %117 %120 
                                         %117 = OpLabel 
                                                  OpStore %112 %119 
                                                  OpBranch %118 
                                         %120 = OpLabel 
                                                  OpStore %112 %34 
                                                  OpBranch %118 
                                         %118 = OpLabel 
                                     u32 %121 = OpLoad %112 
                                     i32 %122 = OpBitcast %121 
                                                  OpStore %110 %122 
                            Uniform f32* %125 = OpAccessChain %18 %70 
                                     f32 %126 = OpLoad %125 
                                    bool %127 = OpFOrdLessThan %126 %57 
                                                  OpSelectionMerge %129 None 
                                                  OpBranchConditional %127 %128 %130 
                                         %128 = OpLabel 
                                                  OpStore %124 %119 
                                                  OpBranch %129 
                                         %130 = OpLabel 
                                                  OpStore %124 %34 
                                                  OpBranch %129 
                                         %129 = OpLabel 
                                     u32 %131 = OpLoad %124 
                                     i32 %132 = OpBitcast %131 
                                                  OpStore %123 %132 
                                     i32 %133 = OpLoad %110 
                                     i32 %134 = OpSNegate %133 
                                     i32 %135 = OpLoad %123 
                                     i32 %136 = OpIAdd %134 %135 
                                                  OpStore %110 %136 
                                     i32 %137 = OpLoad %110 
                                     f32 %138 = OpConvertSToF %137 
                            Private f32* %139 = OpAccessChain %67 %34 
                                                  OpStore %139 %138 
                                   f32_4 %142 = OpLoad %9 
                                   f32_4 %143 = OpLoad %67 
                                   f32_4 %144 = OpVectorShuffle %143 %143 0 0 0 0 
                                   f32_4 %145 = OpFMul %142 %144 
                                                  OpStore %141 %145 
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
 Pass {
  Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
  ZTest Always
  GpuProgramID 122579
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
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 glstate_lightmodel_ambient;
layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 88
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 
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
                                      %82 = OpTypePointer Output %6 
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
                          Output f32* %83 = OpAccessChain %72 %22 %68 
                                  f32 %84 = OpLoad %83 
                                  f32 %85 = OpFNegate %84 
                          Output f32* %86 = OpAccessChain %72 %22 %68 
                                              OpStore %86 %85 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 35
; Schema: 0
                                 OpCapability Shader 
                          %1 = OpExtInstImport "GLSL.std.450" 
                                 OpMemoryModel Logical GLSL450 
                                 OpEntryPoint Fragment %4 "main" %25 
                                 OpExecutionMode %4 OriginUpperLeft 
                                 OpDecorate %9 RelaxedPrecision 
                                 OpMemberDecorate %11 0 RelaxedPrecision 
                                 OpMemberDecorate %11 0 Offset 11 
                                 OpDecorate %11 Block 
                                 OpDecorate %13 DescriptorSet 13 
                                 OpDecorate %13 Binding 13 
                                 OpDecorate %18 RelaxedPrecision 
                                 OpDecorate %19 RelaxedPrecision 
                                 OpDecorate %21 RelaxedPrecision 
                                 OpDecorate %22 RelaxedPrecision 
                                 OpDecorate %23 RelaxedPrecision 
                                 OpDecorate %25 Location 25 
                                 OpDecorate %26 RelaxedPrecision 
                          %2 = OpTypeVoid 
                          %3 = OpTypeFunction %2 
                          %6 = OpTypeFloat 32 
                          %7 = OpTypeVector %6 3 
                          %8 = OpTypePointer Private %7 
           Private f32_3* %9 = OpVariable Private 
                         %10 = OpTypeVector %6 4 
                         %11 = OpTypeStruct %10 
                         %12 = OpTypePointer Uniform %11 
Uniform struct {f32_4;}* %13 = OpVariable Uniform 
                         %14 = OpTypeInt 32 1 
                     i32 %15 = OpConstant 0 
                         %16 = OpTypePointer Uniform %10 
                         %24 = OpTypePointer Output %10 
           Output f32_4* %25 = OpVariable Output 
                     f32 %29 = OpConstant 3.67402E-40 
                         %30 = OpTypeInt 32 0 
                     u32 %31 = OpConstant 3 
                         %32 = OpTypePointer Output %6 
                     void %4 = OpFunction None %3 
                          %5 = OpLabel 
          Uniform f32_4* %17 = OpAccessChain %13 %15 
                   f32_4 %18 = OpLoad %17 
                   f32_3 %19 = OpVectorShuffle %18 %18 0 1 2 
          Uniform f32_4* %20 = OpAccessChain %13 %15 
                   f32_4 %21 = OpLoad %20 
                   f32_3 %22 = OpVectorShuffle %21 %21 0 1 2 
                   f32_3 %23 = OpFAdd %19 %22 
                                 OpStore %9 %23 
                   f32_3 %26 = OpLoad %9 
                   f32_4 %27 = OpLoad %25 
                   f32_4 %28 = OpVectorShuffle %27 %26 4 5 6 3 
                                 OpStore %25 %28 
             Output f32* %33 = OpAccessChain %25 %31 
                                 OpStore %33 %29 
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
Fallback "Diffuse"
}