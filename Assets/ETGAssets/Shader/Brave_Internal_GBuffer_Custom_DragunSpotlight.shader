//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/GBuffer_Custom_DragunSpotlight" {
Properties {
_LightPos ("Light Position", Vector) = (0,0,0,0)
_LightRadius ("Light Radius", Float) = 1
_LightIntensity ("Light Intensity", Float) = 0
_LightColor ("Light Color", Color) = (0,0,0,0)
_LightOrigin ("Light Origin", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
  ZTest Always
  GpuProgramID 38157
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
uniform 	vec4 _LightOrigin;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
int u_xlati1;
vec4 u_xlat2;
bool u_xlatb3;
vec2 u_xlat4;
int u_xlati4;
vec2 u_xlat6;
bool u_xlatb9;
float u_xlat10;
void main()
{
    u_xlat0.xy = _LightPos.xy + (-_LightOrigin.xy);
    u_xlat6.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat0.xy = u_xlat0.xy / u_xlat6.xx;
    u_xlat1.xy = vs_TEXCOORD1.xy + (-_LightOrigin.xy);
    u_xlat0.x = dot(u_xlat1.xy, u_xlat0.xy);
    u_xlat0.x = u_xlat0.x / u_xlat6.x;
    u_xlatb3 = u_xlat0.x<1.0;
    u_xlat0.x = u_xlat0.x * _LightRadius;
    u_xlat0.x = u_xlat0.x * 0.75;
    u_xlat6.xy = (-_LightPos.xy) + _LightOrigin.xy;
    u_xlat1.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat4.xy = (-vs_TEXCOORD1.xy) + _LightPos.xy;
    u_xlat10 = dot(u_xlat6.xy, u_xlat4.xy);
    u_xlat1.x = u_xlat10 / u_xlat1.x;
    u_xlat6.xy = (-u_xlat6.xy) * u_xlat1.xx + u_xlat4.xy;
    u_xlat1.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat6.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlatb9 = u_xlat6.x<u_xlat0.x;
    u_xlat0.x = u_xlat6.x / u_xlat0.x;
    u_xlatb3 = u_xlatb3 && u_xlatb9;
    u_xlat6.x = u_xlat0.x * u_xlat0.x;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * -0.5 + 0.5;
    u_xlat6.x = _LightRadius * _LightRadius;
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat6.x = (-u_xlat1.x) * u_xlat6.x + 1.0;
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat1.w = u_xlat6.x * u_xlat6.x;
    u_xlat2.w = max(u_xlat0.x, u_xlat1.w);
    u_xlat0.x = u_xlat2.w * abs(_LightIntensity);
    u_xlat2.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.x = u_xlat1.w * abs(_LightIntensity);
    u_xlat1.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0 = (bool(u_xlatb3)) ? u_xlat2 : u_xlat1;
    u_xlat1 = u_xlat0 + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat0.x = min(abs(_LightIntensity), 1.0);
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = u_xlat0.wwww * u_xlat1;
    u_xlat0 = u_xlat0.xxxx * u_xlat1;
    u_xlati1 = int((0.0<_LightIntensity) ? 0xFFFFFFFFu : uint(0u));
    u_xlati4 = int((_LightIntensity<0.0) ? 0xFFFFFFFFu : uint(0u));
    u_xlati1 = (-u_xlati1) + u_xlati4;
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
; Bound: 321
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %52 %315 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpMemberDecorate %10 0 Offset 10 
                                                      OpMemberDecorate %10 1 Offset 10 
                                                      OpMemberDecorate %10 2 Offset 10 
                                                      OpMemberDecorate %10 3 Offset 10 
                                                      OpMemberDecorate %10 4 Offset 10 
                                                      OpDecorate %10 Block 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate %52 Location 52 
                                                      OpDecorate %315 Location 315 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeStruct %7 %6 %6 %7 %7 
                                              %11 = OpTypePointer Uniform %10 
Uniform struct {f32_4; f32; f32; f32_4; f32_4;}* %12 = OpVariable Uniform 
                                              %13 = OpTypeInt 32 1 
                                          i32 %14 = OpConstant 0 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Uniform %7 
                                          i32 %20 = OpConstant 4 
                                              %28 = OpTypePointer Private %15 
                               Private f32_2* %29 = OpVariable Private 
                                              %35 = OpTypeInt 32 0 
                                          u32 %36 = OpConstant 0 
                                              %37 = OpTypePointer Private %6 
                               Private f32_4* %50 = OpVariable Private 
                                              %51 = OpTypePointer Input %7 
                                 Input f32_4* %52 = OpVariable Input 
                                              %74 = OpTypeBool 
                                              %75 = OpTypePointer Private %74 
                                Private bool* %76 = OpVariable Private 
                                          f32 %79 = OpConstant 3.67402E-40 
                                          i32 %83 = OpConstant 1 
                                              %84 = OpTypePointer Uniform %6 
                                          f32 %91 = OpConstant 3.67402E-40 
                              Private f32_2* %106 = OpVariable Private 
                                Private f32* %114 = OpVariable Private 
                               Private bool* %142 = OpVariable Private 
                                         f32 %177 = OpConstant 3.67402E-40 
                                         f32 %179 = OpConstant 3.67402E-40 
                                         f32 %202 = OpConstant 3.67402E-40 
                                         u32 %210 = OpConstant 3 
                              Private f32_4* %212 = OpVariable Private 
                                         i32 %221 = OpConstant 2 
                                             %227 = OpTypeVector %6 3 
                                         i32 %230 = OpConstant 3 
                                             %252 = OpTypePointer Function %7 
                                         f32 %262 = OpConstant 3.67402E-40 
                                       f32_4 %263 = OpConstantComposite %262 %262 %262 %262 
                                       f32_4 %274 = OpConstantComposite %79 %79 %79 %79 
                                             %284 = OpTypePointer Private %13 
                                Private i32* %285 = OpVariable Private 
                                             %286 = OpTypePointer Function %35 
                                         u32 %293 = OpConstant 4294967295 
                                Private i32* %297 = OpVariable Private 
                                             %314 = OpTypePointer Output %7 
                               Output f32_4* %315 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_4* %253 = OpVariable Function 
                               Function u32* %287 = OpVariable Function 
                               Function u32* %298 = OpVariable Function 
                               Uniform f32_4* %17 = OpAccessChain %12 %14 
                                        f32_4 %18 = OpLoad %17 
                                        f32_2 %19 = OpVectorShuffle %18 %18 0 1 
                               Uniform f32_4* %21 = OpAccessChain %12 %20 
                                        f32_4 %22 = OpLoad %21 
                                        f32_2 %23 = OpVectorShuffle %22 %22 0 1 
                                        f32_2 %24 = OpFNegate %23 
                                        f32_2 %25 = OpFAdd %19 %24 
                                        f32_4 %26 = OpLoad %9 
                                        f32_4 %27 = OpVectorShuffle %26 %25 4 5 2 3 
                                                      OpStore %9 %27 
                                        f32_4 %30 = OpLoad %9 
                                        f32_2 %31 = OpVectorShuffle %30 %30 0 1 
                                        f32_4 %32 = OpLoad %9 
                                        f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                                          f32 %34 = OpDot %31 %33 
                                 Private f32* %38 = OpAccessChain %29 %36 
                                                      OpStore %38 %34 
                                 Private f32* %39 = OpAccessChain %29 %36 
                                          f32 %40 = OpLoad %39 
                                          f32 %41 = OpExtInst %1 31 %40 
                                 Private f32* %42 = OpAccessChain %29 %36 
                                                      OpStore %42 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_2 %44 = OpVectorShuffle %43 %43 0 1 
                                        f32_2 %45 = OpLoad %29 
                                        f32_2 %46 = OpVectorShuffle %45 %45 0 0 
                                        f32_2 %47 = OpFDiv %44 %46 
                                        f32_4 %48 = OpLoad %9 
                                        f32_4 %49 = OpVectorShuffle %48 %47 4 5 2 3 
                                                      OpStore %9 %49 
                                        f32_4 %53 = OpLoad %52 
                                        f32_2 %54 = OpVectorShuffle %53 %53 0 1 
                               Uniform f32_4* %55 = OpAccessChain %12 %20 
                                        f32_4 %56 = OpLoad %55 
                                        f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                                        f32_2 %58 = OpFNegate %57 
                                        f32_2 %59 = OpFAdd %54 %58 
                                        f32_4 %60 = OpLoad %50 
                                        f32_4 %61 = OpVectorShuffle %60 %59 4 5 2 3 
                                                      OpStore %50 %61 
                                        f32_4 %62 = OpLoad %50 
                                        f32_2 %63 = OpVectorShuffle %62 %62 0 1 
                                        f32_4 %64 = OpLoad %9 
                                        f32_2 %65 = OpVectorShuffle %64 %64 0 1 
                                          f32 %66 = OpDot %63 %65 
                                 Private f32* %67 = OpAccessChain %9 %36 
                                                      OpStore %67 %66 
                                 Private f32* %68 = OpAccessChain %9 %36 
                                          f32 %69 = OpLoad %68 
                                 Private f32* %70 = OpAccessChain %29 %36 
                                          f32 %71 = OpLoad %70 
                                          f32 %72 = OpFDiv %69 %71 
                                 Private f32* %73 = OpAccessChain %9 %36 
                                                      OpStore %73 %72 
                                 Private f32* %77 = OpAccessChain %9 %36 
                                          f32 %78 = OpLoad %77 
                                         bool %80 = OpFOrdLessThan %78 %79 
                                                      OpStore %76 %80 
                                 Private f32* %81 = OpAccessChain %9 %36 
                                          f32 %82 = OpLoad %81 
                                 Uniform f32* %85 = OpAccessChain %12 %83 
                                          f32 %86 = OpLoad %85 
                                          f32 %87 = OpFMul %82 %86 
                                 Private f32* %88 = OpAccessChain %9 %36 
                                                      OpStore %88 %87 
                                 Private f32* %89 = OpAccessChain %9 %36 
                                          f32 %90 = OpLoad %89 
                                          f32 %92 = OpFMul %90 %91 
                                 Private f32* %93 = OpAccessChain %9 %36 
                                                      OpStore %93 %92 
                               Uniform f32_4* %94 = OpAccessChain %12 %14 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                                        f32_2 %97 = OpFNegate %96 
                               Uniform f32_4* %98 = OpAccessChain %12 %20 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                                       f32_2 %101 = OpFAdd %97 %100 
                                                      OpStore %29 %101 
                                       f32_2 %102 = OpLoad %29 
                                       f32_2 %103 = OpLoad %29 
                                         f32 %104 = OpDot %102 %103 
                                Private f32* %105 = OpAccessChain %50 %36 
                                                      OpStore %105 %104 
                                       f32_4 %107 = OpLoad %52 
                                       f32_2 %108 = OpVectorShuffle %107 %107 0 1 
                                       f32_2 %109 = OpFNegate %108 
                              Uniform f32_4* %110 = OpAccessChain %12 %14 
                                       f32_4 %111 = OpLoad %110 
                                       f32_2 %112 = OpVectorShuffle %111 %111 0 1 
                                       f32_2 %113 = OpFAdd %109 %112 
                                                      OpStore %106 %113 
                                       f32_2 %115 = OpLoad %29 
                                       f32_2 %116 = OpLoad %106 
                                         f32 %117 = OpDot %115 %116 
                                                      OpStore %114 %117 
                                         f32 %118 = OpLoad %114 
                                Private f32* %119 = OpAccessChain %50 %36 
                                         f32 %120 = OpLoad %119 
                                         f32 %121 = OpFDiv %118 %120 
                                Private f32* %122 = OpAccessChain %50 %36 
                                                      OpStore %122 %121 
                                       f32_2 %123 = OpLoad %29 
                                       f32_2 %124 = OpFNegate %123 
                                       f32_4 %125 = OpLoad %50 
                                       f32_2 %126 = OpVectorShuffle %125 %125 0 0 
                                       f32_2 %127 = OpFMul %124 %126 
                                       f32_2 %128 = OpLoad %106 
                                       f32_2 %129 = OpFAdd %127 %128 
                                                      OpStore %29 %129 
                                       f32_2 %130 = OpLoad %106 
                                       f32_2 %131 = OpLoad %106 
                                         f32 %132 = OpDot %130 %131 
                                Private f32* %133 = OpAccessChain %50 %36 
                                                      OpStore %133 %132 
                                       f32_2 %134 = OpLoad %29 
                                       f32_2 %135 = OpLoad %29 
                                         f32 %136 = OpDot %134 %135 
                                Private f32* %137 = OpAccessChain %29 %36 
                                                      OpStore %137 %136 
                                Private f32* %138 = OpAccessChain %29 %36 
                                         f32 %139 = OpLoad %138 
                                         f32 %140 = OpExtInst %1 31 %139 
                                Private f32* %141 = OpAccessChain %29 %36 
                                                      OpStore %141 %140 
                                Private f32* %143 = OpAccessChain %29 %36 
                                         f32 %144 = OpLoad %143 
                                Private f32* %145 = OpAccessChain %9 %36 
                                         f32 %146 = OpLoad %145 
                                        bool %147 = OpFOrdLessThan %144 %146 
                                                      OpStore %142 %147 
                                Private f32* %148 = OpAccessChain %29 %36 
                                         f32 %149 = OpLoad %148 
                                Private f32* %150 = OpAccessChain %9 %36 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFDiv %149 %151 
                                Private f32* %153 = OpAccessChain %9 %36 
                                                      OpStore %153 %152 
                                        bool %154 = OpLoad %76 
                                        bool %155 = OpLoad %142 
                                        bool %156 = OpLogicalAnd %154 %155 
                                                      OpStore %76 %156 
                                Private f32* %157 = OpAccessChain %9 %36 
                                         f32 %158 = OpLoad %157 
                                Private f32* %159 = OpAccessChain %9 %36 
                                         f32 %160 = OpLoad %159 
                                         f32 %161 = OpFMul %158 %160 
                                Private f32* %162 = OpAccessChain %29 %36 
                                                      OpStore %162 %161 
                                Private f32* %163 = OpAccessChain %29 %36 
                                         f32 %164 = OpLoad %163 
                                Private f32* %165 = OpAccessChain %29 %36 
                                         f32 %166 = OpLoad %165 
                                         f32 %167 = OpFMul %164 %166 
                                Private f32* %168 = OpAccessChain %29 %36 
                                                      OpStore %168 %167 
                                Private f32* %169 = OpAccessChain %29 %36 
                                         f32 %170 = OpLoad %169 
                                Private f32* %171 = OpAccessChain %9 %36 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFMul %170 %172 
                                Private f32* %174 = OpAccessChain %9 %36 
                                                      OpStore %174 %173 
                                Private f32* %175 = OpAccessChain %9 %36 
                                         f32 %176 = OpLoad %175 
                                         f32 %178 = OpFMul %176 %177 
                                         f32 %180 = OpFAdd %178 %179 
                                Private f32* %181 = OpAccessChain %9 %36 
                                                      OpStore %181 %180 
                                Uniform f32* %182 = OpAccessChain %12 %83 
                                         f32 %183 = OpLoad %182 
                                Uniform f32* %184 = OpAccessChain %12 %83 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFMul %183 %185 
                                Private f32* %187 = OpAccessChain %29 %36 
                                                      OpStore %187 %186 
                                Private f32* %188 = OpAccessChain %29 %36 
                                         f32 %189 = OpLoad %188 
                                         f32 %190 = OpFDiv %79 %189 
                                Private f32* %191 = OpAccessChain %29 %36 
                                                      OpStore %191 %190 
                                Private f32* %192 = OpAccessChain %50 %36 
                                         f32 %193 = OpLoad %192 
                                         f32 %194 = OpFNegate %193 
                                Private f32* %195 = OpAccessChain %29 %36 
                                         f32 %196 = OpLoad %195 
                                         f32 %197 = OpFMul %194 %196 
                                         f32 %198 = OpFAdd %197 %79 
                                Private f32* %199 = OpAccessChain %29 %36 
                                                      OpStore %199 %198 
                                Private f32* %200 = OpAccessChain %29 %36 
                                         f32 %201 = OpLoad %200 
                                         f32 %203 = OpExtInst %1 40 %201 %202 
                                Private f32* %204 = OpAccessChain %29 %36 
                                                      OpStore %204 %203 
                                Private f32* %205 = OpAccessChain %29 %36 
                                         f32 %206 = OpLoad %205 
                                Private f32* %207 = OpAccessChain %29 %36 
                                         f32 %208 = OpLoad %207 
                                         f32 %209 = OpFMul %206 %208 
                                Private f32* %211 = OpAccessChain %50 %210 
                                                      OpStore %211 %209 
                                Private f32* %213 = OpAccessChain %9 %36 
                                         f32 %214 = OpLoad %213 
                                Private f32* %215 = OpAccessChain %50 %210 
                                         f32 %216 = OpLoad %215 
                                         f32 %217 = OpExtInst %1 40 %214 %216 
                                Private f32* %218 = OpAccessChain %212 %210 
                                                      OpStore %218 %217 
                                Private f32* %219 = OpAccessChain %212 %210 
                                         f32 %220 = OpLoad %219 
                                Uniform f32* %222 = OpAccessChain %12 %221 
                                         f32 %223 = OpLoad %222 
                                         f32 %224 = OpExtInst %1 4 %223 
                                         f32 %225 = OpFMul %220 %224 
                                Private f32* %226 = OpAccessChain %9 %36 
                                                      OpStore %226 %225 
                                       f32_4 %228 = OpLoad %9 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 0 0 
                              Uniform f32_4* %231 = OpAccessChain %12 %230 
                                       f32_4 %232 = OpLoad %231 
                                       f32_3 %233 = OpVectorShuffle %232 %232 0 1 2 
                                       f32_3 %234 = OpFMul %229 %233 
                                       f32_4 %235 = OpLoad %212 
                                       f32_4 %236 = OpVectorShuffle %235 %234 4 5 6 3 
                                                      OpStore %212 %236 
                                Private f32* %237 = OpAccessChain %50 %210 
                                         f32 %238 = OpLoad %237 
                                Uniform f32* %239 = OpAccessChain %12 %221 
                                         f32 %240 = OpLoad %239 
                                         f32 %241 = OpExtInst %1 4 %240 
                                         f32 %242 = OpFMul %238 %241 
                                Private f32* %243 = OpAccessChain %9 %36 
                                                      OpStore %243 %242 
                                       f32_4 %244 = OpLoad %9 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 0 0 
                              Uniform f32_4* %246 = OpAccessChain %12 %230 
                                       f32_4 %247 = OpLoad %246 
                                       f32_3 %248 = OpVectorShuffle %247 %247 0 1 2 
                                       f32_3 %249 = OpFMul %245 %248 
                                       f32_4 %250 = OpLoad %50 
                                       f32_4 %251 = OpVectorShuffle %250 %249 4 5 6 3 
                                                      OpStore %50 %251 
                                        bool %254 = OpLoad %76 
                                                      OpSelectionMerge %256 None 
                                                      OpBranchConditional %254 %255 %258 
                                             %255 = OpLabel 
                                       f32_4 %257 = OpLoad %212 
                                                      OpStore %253 %257 
                                                      OpBranch %256 
                                             %258 = OpLabel 
                                       f32_4 %259 = OpLoad %50 
                                                      OpStore %253 %259 
                                                      OpBranch %256 
                                             %256 = OpLabel 
                                       f32_4 %260 = OpLoad %253 
                                                      OpStore %9 %260 
                                       f32_4 %261 = OpLoad %9 
                                       f32_4 %264 = OpFAdd %261 %263 
                                                      OpStore %50 %264 
                                Uniform f32* %265 = OpAccessChain %12 %221 
                                         f32 %266 = OpLoad %265 
                                         f32 %267 = OpExtInst %1 4 %266 
                                         f32 %268 = OpExtInst %1 37 %267 %79 
                                Private f32* %269 = OpAccessChain %9 %36 
                                                      OpStore %269 %268 
                                       f32_4 %270 = OpLoad %9 
                                       f32_4 %271 = OpVectorShuffle %270 %270 0 0 0 0 
                                       f32_4 %272 = OpLoad %50 
                                       f32_4 %273 = OpFMul %271 %272 
                                       f32_4 %275 = OpFAdd %273 %274 
                                                      OpStore %50 %275 
                                       f32_4 %276 = OpLoad %9 
                                       f32_4 %277 = OpVectorShuffle %276 %276 3 3 3 3 
                                       f32_4 %278 = OpLoad %50 
                                       f32_4 %279 = OpFMul %277 %278 
                                                      OpStore %50 %279 
                                       f32_4 %280 = OpLoad %9 
                                       f32_4 %281 = OpVectorShuffle %280 %280 0 0 0 0 
                                       f32_4 %282 = OpLoad %50 
                                       f32_4 %283 = OpFMul %281 %282 
                                                      OpStore %9 %283 
                                Uniform f32* %288 = OpAccessChain %12 %221 
                                         f32 %289 = OpLoad %288 
                                        bool %290 = OpFOrdLessThan %202 %289 
                                                      OpSelectionMerge %292 None 
                                                      OpBranchConditional %290 %291 %294 
                                             %291 = OpLabel 
                                                      OpStore %287 %293 
                                                      OpBranch %292 
                                             %294 = OpLabel 
                                                      OpStore %287 %36 
                                                      OpBranch %292 
                                             %292 = OpLabel 
                                         u32 %295 = OpLoad %287 
                                         i32 %296 = OpBitcast %295 
                                                      OpStore %285 %296 
                                Uniform f32* %299 = OpAccessChain %12 %221 
                                         f32 %300 = OpLoad %299 
                                        bool %301 = OpFOrdLessThan %300 %202 
                                                      OpSelectionMerge %303 None 
                                                      OpBranchConditional %301 %302 %304 
                                             %302 = OpLabel 
                                                      OpStore %298 %293 
                                                      OpBranch %303 
                                             %304 = OpLabel 
                                                      OpStore %298 %36 
                                                      OpBranch %303 
                                             %303 = OpLabel 
                                         u32 %305 = OpLoad %298 
                                         i32 %306 = OpBitcast %305 
                                                      OpStore %297 %306 
                                         i32 %307 = OpLoad %285 
                                         i32 %308 = OpSNegate %307 
                                         i32 %309 = OpLoad %297 
                                         i32 %310 = OpIAdd %308 %309 
                                                      OpStore %285 %310 
                                         i32 %311 = OpLoad %285 
                                         f32 %312 = OpConvertSToF %311 
                                Private f32* %313 = OpAccessChain %50 %36 
                                                      OpStore %313 %312 
                                       f32_4 %316 = OpLoad %9 
                                       f32_4 %317 = OpLoad %50 
                                       f32_4 %318 = OpVectorShuffle %317 %317 0 0 0 0 
                                       f32_4 %319 = OpFMul %316 %318 
                                                      OpStore %315 %319 
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
  GpuProgramID 67755
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