//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/GBuffer_LightRenderer_Coronal" {
Properties {
_LightPos ("Light Position", Vector) = (0,0,0,0)
_LightRadius ("Light Radius", Float) = 1
_LightIntensity ("Light Intensity", Float) = 0
_LightColor ("Light Color", Color) = (0,0,0,0)
_CoronaTex ("Corona (RGB)", 2D) = "white" { }
}
SubShader {
 Pass {
  Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
  ZTest Always
  GpuProgramID 17373
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
    u_xlat0.xy = u_xlat0.xy * vec2(_CameraOrthoSize);
    u_xlat0.z = u_xlat0.x * 1.77777696;
    u_xlat0.w = 0.0;
    vs_TEXCOORD1 = u_xlat0.zyww + _CameraWS;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 _SinTime;
uniform 	vec4 _LightPos;
uniform 	float _LightRadius;
uniform 	float _LightIntensity;
uniform 	vec4 _LightColor;
uniform  sampler2D _LightMaskTex;
uniform  sampler2D _CoronaTex;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat16_1;
vec4 u_xlat10_1;
int u_xlati1;
float u_xlat2;
bool u_xlatb2;
float u_xlat3;
int u_xlati3;
bool u_xlatb3;
float u_xlat4;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD1.yx) + _LightPos.yx;
    u_xlat4 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat6 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat4 = u_xlat4 * u_xlat6;
    u_xlat6 = u_xlat4 * u_xlat4;
    u_xlat1.x = u_xlat6 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat6 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat6 * u_xlat1.x + -0.330299497;
    u_xlat6 = u_xlat6 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat6 * u_xlat4;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
    u_xlatb3 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1.x = u_xlatb3 ? u_xlat1.x : float(0.0);
    u_xlat4 = u_xlat4 * u_xlat6 + u_xlat1.x;
    u_xlatb6 = u_xlat0.y<(-u_xlat0.y);
    u_xlat6 = u_xlatb6 ? -3.14159274 : float(0.0);
    u_xlat4 = u_xlat6 + u_xlat4;
    u_xlat6 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb6 = u_xlat6<(-u_xlat6);
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlatb2 = u_xlat1.x>=(-u_xlat1.x);
    u_xlatb2 = u_xlatb2 && u_xlatb6;
    u_xlat2 = (u_xlatb2) ? (-u_xlat4) : u_xlat4;
    u_xlat2 = u_xlat2 + 3.1400001;
    u_xlat1.x = u_xlat2 * 0.159235656;
    u_xlat2 = _LightRadius * _LightRadius;
    u_xlat2 = float(1.0) / u_xlat2;
    u_xlat0.x = (-u_xlat0.x) * u_xlat2 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat1.y = u_xlat0.x * u_xlat0.x + _Time.x;
    u_xlat10_1 = texture(_CoronaTex, u_xlat1.xy);
    u_xlat2 = u_xlat0.x * u_xlat0.x + (-u_xlat10_1.x);
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * abs(_LightIntensity);
    u_xlat0.xzw = u_xlat0.xxx * _LightColor.xyz;
    u_xlat1.x = _SinTime.z * 0.00333333341 + u_xlat2;
    u_xlatb2 = u_xlat2<0.100000001;
    u_xlat1.x = u_xlat1.x * 4.0;
    u_xlat1.x = roundEven(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 0.25;
    u_xlat1.w = (u_xlatb2) ? 0.0 : u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xzw * u_xlat1.www;
    u_xlat1.xyz = u_xlat0.xyz + u_xlat0.xyz;
    u_xlat0 = u_xlat1 + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat10_1 = texture(_LightMaskTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = (-u_xlat10_1.x) + 1.0;
    u_xlat3 = min(abs(_LightIntensity), 1.0);
    u_xlat1.x = u_xlat16_1 * u_xlat3;
    u_xlat0 = u_xlat1.xxxx * u_xlat0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(u_xlat3) * u_xlat0;
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
; Bound: 130
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %72 %84 %85 %118 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpMemberDecorate %70 0 BuiltIn 70 
                                                      OpMemberDecorate %70 1 BuiltIn 70 
                                                      OpMemberDecorate %70 2 BuiltIn 70 
                                                      OpDecorate %70 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %118 Location 118 
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
                                              %18 = OpTypeStruct %16 %17 %7 %6 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32;}* %20 = OpVariable Uniform 
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
                                             %100 = OpTypePointer Uniform %6 
                                         u32 %107 = OpConstant 0 
                                             %108 = OpTypePointer Private %6 
                                         f32 %111 = OpConstant 3.67402E-40 
                                         u32 %113 = OpConstant 2 
                                         f32 %115 = OpConstant 3.67402E-40 
                                         u32 %116 = OpConstant 3 
                               Output f32_4* %118 = OpVariable Output 
                                             %124 = OpTypePointer Output %6 
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
                                Uniform f32* %101 = OpAccessChain %20 %44 
                                         f32 %102 = OpLoad %101 
                                       f32_2 %103 = OpCompositeConstruct %102 %102 
                                       f32_2 %104 = OpFMul %99 %103 
                                       f32_4 %105 = OpLoad %9 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                                      OpStore %9 %106 
                                Private f32* %109 = OpAccessChain %9 %107 
                                         f32 %110 = OpLoad %109 
                                         f32 %112 = OpFMul %110 %111 
                                Private f32* %114 = OpAccessChain %9 %113 
                                                      OpStore %114 %112 
                                Private f32* %117 = OpAccessChain %9 %116 
                                                      OpStore %117 %115 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpVectorShuffle %119 %119 2 1 3 3 
                              Uniform f32_4* %121 = OpAccessChain %20 %35 
                                       f32_4 %122 = OpLoad %121 
                                       f32_4 %123 = OpFAdd %120 %122 
                                                      OpStore %118 %123 
                                 Output f32* %125 = OpAccessChain %72 %22 %68 
                                         f32 %126 = OpLoad %125 
                                         f32 %127 = OpFNegate %126 
                                 Output f32* %128 = OpAccessChain %72 %22 %68 
                                                      OpStore %128 %127 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 376
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %313 %370 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %11 Location 11 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpMemberDecorate %16 5 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %221 DescriptorSet 221 
                                                      OpDecorate %221 Binding 221 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %310 DescriptorSet 310 
                                                      OpDecorate %310 Binding 310 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %313 Location 313 
                                                      OpDecorate %316 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %325 RelaxedPrecision 
                                                      OpDecorate %370 Location 370 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %16 = OpTypeStruct %7 %7 %7 %6 %6 %7 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {f32_4; f32_4; f32_4; f32; f32; f32_4;}* %18 = OpVariable Uniform 
                                              %19 = OpTypeInt 32 1 
                                          i32 %20 = OpConstant 2 
                                              %21 = OpTypePointer Uniform %7 
                                              %28 = OpTypePointer Private %6 
                                 Private f32* %29 = OpVariable Private 
                                              %30 = OpTypeInt 32 0 
                                          u32 %31 = OpConstant 1 
                                          u32 %35 = OpConstant 0 
                                          f32 %40 = OpConstant 3.67402E-40 
                                 Private f32* %43 = OpVariable Private 
                               Private f32_4* %57 = OpVariable Private 
                                          f32 %59 = OpConstant 3.67402E-40 
                                          f32 %61 = OpConstant 3.67402E-40 
                                          f32 %68 = OpConstant 3.67402E-40 
                                          f32 %75 = OpConstant 3.67402E-40 
                                          f32 %82 = OpConstant 3.67402E-40 
                                          f32 %90 = OpConstant 3.67402E-40 
                                          f32 %92 = OpConstant 3.67402E-40 
                                              %95 = OpTypeBool 
                                              %96 = OpTypePointer Private %95 
                                Private bool* %97 = OpVariable Private 
                                             %105 = OpTypePointer Function %6 
                                         f32 %113 = OpConstant 3.67402E-40 
                               Private bool* %122 = OpVariable Private 
                                         f32 %133 = OpConstant 3.67402E-40 
                               Private bool* %160 = OpVariable Private 
                                Private f32* %170 = OpVariable Private 
                                         f32 %181 = OpConstant 3.67402E-40 
                                         f32 %184 = OpConstant 3.67402E-40 
                                         i32 %187 = OpConstant 3 
                                             %188 = OpTypePointer Uniform %6 
                                         i32 %212 = OpConstant 0 
                                Private f32* %217 = OpVariable Private 
                                             %218 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %219 = OpTypeSampledImage %218 
                                             %220 = OpTypePointer UniformConstant %219 
 UniformConstant read_only Texture2DSampled* %221 = OpVariable UniformConstant 
                                         i32 %245 = OpConstant 4 
                                             %251 = OpTypeVector %6 3 
                                         i32 %254 = OpConstant 5 
                                Private f32* %261 = OpVariable Private 
                                         i32 %262 = OpConstant 1 
                                         u32 %263 = OpConstant 2 
                                         f32 %266 = OpConstant 3.67402E-40 
                                         f32 %271 = OpConstant 3.67402E-40 
                                         f32 %274 = OpConstant 3.67402E-40 
                                         f32 %279 = OpConstant 3.67402E-40 
                                         f32 %296 = OpConstant 3.67402E-40 
                                         u32 %298 = OpConstant 3 
                                         f32 %302 = OpConstant 3.67402E-40 
                                       f32_3 %303 = OpConstantComposite %302 %302 %302 
                                       f32_3 %305 = OpConstantComposite %296 %296 %296 
                                Private f32* %309 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %310 = OpVariable UniformConstant 
                                             %312 = OpTypePointer Input %12 
                                Input f32_2* %313 = OpVariable Input 
                                Private f32* %317 = OpVariable Private 
                                       f32_4 %333 = OpConstantComposite %40 %40 %40 %40 
                                             %339 = OpTypePointer Private %19 
                                Private i32* %340 = OpVariable Private 
                                             %341 = OpTypePointer Function %30 
                                         u32 %348 = OpConstant 4294967295 
                                Private i32* %352 = OpVariable Private 
                                             %369 = OpTypePointer Output %7 
                               Output f32_4* %370 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %106 = OpVariable Function 
                               Function f32* %129 = OpVariable Function 
                               Function f32* %171 = OpVariable Function 
                               Function f32* %281 = OpVariable Function 
                               Function u32* %342 = OpVariable Function 
                               Function u32* %353 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 1 0 
                                        f32_2 %15 = OpFNegate %14 
                               Uniform f32_4* %22 = OpAccessChain %18 %20 
                                        f32_4 %23 = OpLoad %22 
                                        f32_2 %24 = OpVectorShuffle %23 %23 1 0 
                                        f32_2 %25 = OpFAdd %15 %24 
                                        f32_4 %26 = OpLoad %9 
                                        f32_4 %27 = OpVectorShuffle %26 %25 4 5 2 3 
                                                      OpStore %9 %27 
                                 Private f32* %32 = OpAccessChain %9 %31 
                                          f32 %33 = OpLoad %32 
                                          f32 %34 = OpExtInst %1 4 %33 
                                 Private f32* %36 = OpAccessChain %9 %35 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpExtInst %1 4 %37 
                                          f32 %39 = OpExtInst %1 40 %34 %38 
                                                      OpStore %29 %39 
                                          f32 %41 = OpLoad %29 
                                          f32 %42 = OpFDiv %40 %41 
                                                      OpStore %29 %42 
                                 Private f32* %44 = OpAccessChain %9 %31 
                                          f32 %45 = OpLoad %44 
                                          f32 %46 = OpExtInst %1 4 %45 
                                 Private f32* %47 = OpAccessChain %9 %35 
                                          f32 %48 = OpLoad %47 
                                          f32 %49 = OpExtInst %1 4 %48 
                                          f32 %50 = OpExtInst %1 37 %46 %49 
                                                      OpStore %43 %50 
                                          f32 %51 = OpLoad %29 
                                          f32 %52 = OpLoad %43 
                                          f32 %53 = OpFMul %51 %52 
                                                      OpStore %29 %53 
                                          f32 %54 = OpLoad %29 
                                          f32 %55 = OpLoad %29 
                                          f32 %56 = OpFMul %54 %55 
                                                      OpStore %43 %56 
                                          f32 %58 = OpLoad %43 
                                          f32 %60 = OpFMul %58 %59 
                                          f32 %62 = OpFAdd %60 %61 
                                 Private f32* %63 = OpAccessChain %57 %35 
                                                      OpStore %63 %62 
                                          f32 %64 = OpLoad %43 
                                 Private f32* %65 = OpAccessChain %57 %35 
                                          f32 %66 = OpLoad %65 
                                          f32 %67 = OpFMul %64 %66 
                                          f32 %69 = OpFAdd %67 %68 
                                 Private f32* %70 = OpAccessChain %57 %35 
                                                      OpStore %70 %69 
                                          f32 %71 = OpLoad %43 
                                 Private f32* %72 = OpAccessChain %57 %35 
                                          f32 %73 = OpLoad %72 
                                          f32 %74 = OpFMul %71 %73 
                                          f32 %76 = OpFAdd %74 %75 
                                 Private f32* %77 = OpAccessChain %57 %35 
                                                      OpStore %77 %76 
                                          f32 %78 = OpLoad %43 
                                 Private f32* %79 = OpAccessChain %57 %35 
                                          f32 %80 = OpLoad %79 
                                          f32 %81 = OpFMul %78 %80 
                                          f32 %83 = OpFAdd %81 %82 
                                                      OpStore %43 %83 
                                          f32 %84 = OpLoad %43 
                                          f32 %85 = OpLoad %29 
                                          f32 %86 = OpFMul %84 %85 
                                 Private f32* %87 = OpAccessChain %57 %35 
                                                      OpStore %87 %86 
                                 Private f32* %88 = OpAccessChain %57 %35 
                                          f32 %89 = OpLoad %88 
                                          f32 %91 = OpFMul %89 %90 
                                          f32 %93 = OpFAdd %91 %92 
                                 Private f32* %94 = OpAccessChain %57 %35 
                                                      OpStore %94 %93 
                                 Private f32* %98 = OpAccessChain %9 %31 
                                          f32 %99 = OpLoad %98 
                                         f32 %100 = OpExtInst %1 4 %99 
                                Private f32* %101 = OpAccessChain %9 %35 
                                         f32 %102 = OpLoad %101 
                                         f32 %103 = OpExtInst %1 4 %102 
                                        bool %104 = OpFOrdLessThan %100 %103 
                                                      OpStore %97 %104 
                                        bool %107 = OpLoad %97 
                                                      OpSelectionMerge %109 None 
                                                      OpBranchConditional %107 %108 %112 
                                             %108 = OpLabel 
                                Private f32* %110 = OpAccessChain %57 %35 
                                         f32 %111 = OpLoad %110 
                                                      OpStore %106 %111 
                                                      OpBranch %109 
                                             %112 = OpLabel 
                                                      OpStore %106 %113 
                                                      OpBranch %109 
                                             %109 = OpLabel 
                                         f32 %114 = OpLoad %106 
                                Private f32* %115 = OpAccessChain %57 %35 
                                                      OpStore %115 %114 
                                         f32 %116 = OpLoad %29 
                                         f32 %117 = OpLoad %43 
                                         f32 %118 = OpFMul %116 %117 
                                Private f32* %119 = OpAccessChain %57 %35 
                                         f32 %120 = OpLoad %119 
                                         f32 %121 = OpFAdd %118 %120 
                                                      OpStore %29 %121 
                                Private f32* %123 = OpAccessChain %9 %31 
                                         f32 %124 = OpLoad %123 
                                Private f32* %125 = OpAccessChain %9 %31 
                                         f32 %126 = OpLoad %125 
                                         f32 %127 = OpFNegate %126 
                                        bool %128 = OpFOrdLessThan %124 %127 
                                                      OpStore %122 %128 
                                        bool %130 = OpLoad %122 
                                                      OpSelectionMerge %132 None 
                                                      OpBranchConditional %130 %131 %134 
                                             %131 = OpLabel 
                                                      OpStore %129 %133 
                                                      OpBranch %132 
                                             %134 = OpLabel 
                                                      OpStore %129 %113 
                                                      OpBranch %132 
                                             %132 = OpLabel 
                                         f32 %135 = OpLoad %129 
                                                      OpStore %43 %135 
                                         f32 %136 = OpLoad %43 
                                         f32 %137 = OpLoad %29 
                                         f32 %138 = OpFAdd %136 %137 
                                                      OpStore %29 %138 
                                Private f32* %139 = OpAccessChain %9 %31 
                                         f32 %140 = OpLoad %139 
                                Private f32* %141 = OpAccessChain %9 %35 
                                         f32 %142 = OpLoad %141 
                                         f32 %143 = OpExtInst %1 37 %140 %142 
                                                      OpStore %43 %143 
                                         f32 %144 = OpLoad %43 
                                         f32 %145 = OpLoad %43 
                                         f32 %146 = OpFNegate %145 
                                        bool %147 = OpFOrdLessThan %144 %146 
                                                      OpStore %122 %147 
                                Private f32* %148 = OpAccessChain %9 %31 
                                         f32 %149 = OpLoad %148 
                                Private f32* %150 = OpAccessChain %9 %35 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpExtInst %1 40 %149 %151 
                                Private f32* %153 = OpAccessChain %57 %35 
                                                      OpStore %153 %152 
                                       f32_4 %154 = OpLoad %9 
                                       f32_2 %155 = OpVectorShuffle %154 %154 0 1 
                                       f32_4 %156 = OpLoad %9 
                                       f32_2 %157 = OpVectorShuffle %156 %156 0 1 
                                         f32 %158 = OpDot %155 %157 
                                Private f32* %159 = OpAccessChain %9 %35 
                                                      OpStore %159 %158 
                                Private f32* %161 = OpAccessChain %57 %35 
                                         f32 %162 = OpLoad %161 
                                Private f32* %163 = OpAccessChain %57 %35 
                                         f32 %164 = OpLoad %163 
                                         f32 %165 = OpFNegate %164 
                                        bool %166 = OpFOrdGreaterThanEqual %162 %165 
                                                      OpStore %160 %166 
                                        bool %167 = OpLoad %160 
                                        bool %168 = OpLoad %122 
                                        bool %169 = OpLogicalAnd %167 %168 
                                                      OpStore %160 %169 
                                        bool %172 = OpLoad %160 
                                                      OpSelectionMerge %174 None 
                                                      OpBranchConditional %172 %173 %177 
                                             %173 = OpLabel 
                                         f32 %175 = OpLoad %29 
                                         f32 %176 = OpFNegate %175 
                                                      OpStore %171 %176 
                                                      OpBranch %174 
                                             %177 = OpLabel 
                                         f32 %178 = OpLoad %29 
                                                      OpStore %171 %178 
                                                      OpBranch %174 
                                             %174 = OpLabel 
                                         f32 %179 = OpLoad %171 
                                                      OpStore %170 %179 
                                         f32 %180 = OpLoad %170 
                                         f32 %182 = OpFAdd %180 %181 
                                                      OpStore %170 %182 
                                         f32 %183 = OpLoad %170 
                                         f32 %185 = OpFMul %183 %184 
                                Private f32* %186 = OpAccessChain %57 %35 
                                                      OpStore %186 %185 
                                Uniform f32* %189 = OpAccessChain %18 %187 
                                         f32 %190 = OpLoad %189 
                                Uniform f32* %191 = OpAccessChain %18 %187 
                                         f32 %192 = OpLoad %191 
                                         f32 %193 = OpFMul %190 %192 
                                                      OpStore %170 %193 
                                         f32 %194 = OpLoad %170 
                                         f32 %195 = OpFDiv %40 %194 
                                                      OpStore %170 %195 
                                Private f32* %196 = OpAccessChain %9 %35 
                                         f32 %197 = OpLoad %196 
                                         f32 %198 = OpFNegate %197 
                                         f32 %199 = OpLoad %170 
                                         f32 %200 = OpFMul %198 %199 
                                         f32 %201 = OpFAdd %200 %40 
                                Private f32* %202 = OpAccessChain %9 %35 
                                                      OpStore %202 %201 
                                Private f32* %203 = OpAccessChain %9 %35 
                                         f32 %204 = OpLoad %203 
                                         f32 %205 = OpExtInst %1 40 %204 %113 
                                Private f32* %206 = OpAccessChain %9 %35 
                                                      OpStore %206 %205 
                                Private f32* %207 = OpAccessChain %9 %35 
                                         f32 %208 = OpLoad %207 
                                Private f32* %209 = OpAccessChain %9 %35 
                                         f32 %210 = OpLoad %209 
                                         f32 %211 = OpFMul %208 %210 
                                Uniform f32* %213 = OpAccessChain %18 %212 %35 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpFAdd %211 %214 
                                Private f32* %216 = OpAccessChain %57 %31 
                                                      OpStore %216 %215 
                  read_only Texture2DSampled %222 = OpLoad %221 
                                       f32_4 %223 = OpLoad %57 
                                       f32_2 %224 = OpVectorShuffle %223 %223 0 1 
                                       f32_4 %225 = OpImageSampleImplicitLod %222 %224 
                                         f32 %226 = OpCompositeExtract %225 0 
                                                      OpStore %217 %226 
                                Private f32* %227 = OpAccessChain %9 %35 
                                         f32 %228 = OpLoad %227 
                                Private f32* %229 = OpAccessChain %9 %35 
                                         f32 %230 = OpLoad %229 
                                         f32 %231 = OpFMul %228 %230 
                                         f32 %232 = OpLoad %217 
                                         f32 %233 = OpFNegate %232 
                                         f32 %234 = OpFAdd %231 %233 
                                                      OpStore %170 %234 
                                         f32 %235 = OpLoad %170 
                                         f32 %236 = OpExtInst %1 43 %235 %113 %40 
                                                      OpStore %170 %236 
                                Private f32* %237 = OpAccessChain %9 %35 
                                         f32 %238 = OpLoad %237 
                                Private f32* %239 = OpAccessChain %9 %35 
                                         f32 %240 = OpLoad %239 
                                         f32 %241 = OpFMul %238 %240 
                                Private f32* %242 = OpAccessChain %9 %35 
                                                      OpStore %242 %241 
                                Private f32* %243 = OpAccessChain %9 %35 
                                         f32 %244 = OpLoad %243 
                                Uniform f32* %246 = OpAccessChain %18 %245 
                                         f32 %247 = OpLoad %246 
                                         f32 %248 = OpExtInst %1 4 %247 
                                         f32 %249 = OpFMul %244 %248 
                                Private f32* %250 = OpAccessChain %9 %35 
                                                      OpStore %250 %249 
                                       f32_4 %252 = OpLoad %9 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 0 0 
                              Uniform f32_4* %255 = OpAccessChain %18 %254 
                                       f32_4 %256 = OpLoad %255 
                                       f32_3 %257 = OpVectorShuffle %256 %256 0 1 2 
                                       f32_3 %258 = OpFMul %253 %257 
                                       f32_4 %259 = OpLoad %9 
                                       f32_4 %260 = OpVectorShuffle %259 %258 4 1 5 6 
                                                      OpStore %9 %260 
                                Uniform f32* %264 = OpAccessChain %18 %262 %263 
                                         f32 %265 = OpLoad %264 
                                         f32 %267 = OpFMul %265 %266 
                                         f32 %268 = OpLoad %170 
                                         f32 %269 = OpFAdd %267 %268 
                                                      OpStore %261 %269 
                                         f32 %270 = OpLoad %170 
                                        bool %272 = OpFOrdLessThan %270 %271 
                                                      OpStore %160 %272 
                                         f32 %273 = OpLoad %261 
                                         f32 %275 = OpFMul %273 %274 
                                                      OpStore %261 %275 
                                         f32 %276 = OpLoad %261 
                                         f32 %277 = OpExtInst %1 2 %276 
                                                      OpStore %261 %277 
                                         f32 %278 = OpLoad %261 
                                         f32 %280 = OpFMul %278 %279 
                                                      OpStore %261 %280 
                                        bool %282 = OpLoad %160 
                                                      OpSelectionMerge %284 None 
                                                      OpBranchConditional %282 %283 %285 
                                             %283 = OpLabel 
                                                      OpStore %281 %113 
                                                      OpBranch %284 
                                             %285 = OpLabel 
                                         f32 %286 = OpLoad %261 
                                                      OpStore %281 %286 
                                                      OpBranch %284 
                                             %284 = OpLabel 
                                         f32 %287 = OpLoad %281 
                                                      OpStore %261 %287 
                                       f32_4 %288 = OpLoad %9 
                                       f32_3 %289 = OpVectorShuffle %288 %288 0 2 3 
                                         f32 %290 = OpLoad %261 
                                       f32_3 %291 = OpCompositeConstruct %290 %290 %290 
                                       f32_3 %292 = OpFMul %289 %291 
                                       f32_4 %293 = OpLoad %9 
                                       f32_4 %294 = OpVectorShuffle %293 %292 4 5 6 3 
                                                      OpStore %9 %294 
                                         f32 %295 = OpLoad %261 
                                         f32 %297 = OpFAdd %295 %296 
                                Private f32* %299 = OpAccessChain %57 %298 
                                                      OpStore %299 %297 
                                       f32_4 %300 = OpLoad %9 
                                       f32_3 %301 = OpVectorShuffle %300 %300 0 1 2 
                                       f32_3 %304 = OpFMul %301 %303 
                                       f32_3 %306 = OpFAdd %304 %305 
                                       f32_4 %307 = OpLoad %57 
                                       f32_4 %308 = OpVectorShuffle %307 %306 4 5 6 3 
                                                      OpStore %57 %308 
                  read_only Texture2DSampled %311 = OpLoad %310 
                                       f32_2 %314 = OpLoad %313 
                                       f32_4 %315 = OpImageSampleImplicitLod %311 %314 
                                         f32 %316 = OpCompositeExtract %315 0 
                                                      OpStore %309 %316 
                                         f32 %318 = OpLoad %309 
                                         f32 %319 = OpFNegate %318 
                                         f32 %320 = OpFAdd %319 %40 
                                                      OpStore %317 %320 
                                Uniform f32* %321 = OpAccessChain %18 %245 
                                         f32 %322 = OpLoad %321 
                                         f32 %323 = OpExtInst %1 4 %322 
                                         f32 %324 = OpExtInst %1 37 %323 %40 
                                                      OpStore %170 %324 
                                         f32 %325 = OpLoad %317 
                                         f32 %326 = OpLoad %170 
                                         f32 %327 = OpFMul %325 %326 
                                Private f32* %328 = OpAccessChain %9 %35 
                                                      OpStore %328 %327 
                                       f32_4 %329 = OpLoad %9 
                                       f32_4 %330 = OpVectorShuffle %329 %329 0 0 0 0 
                                       f32_4 %331 = OpLoad %57 
                                       f32_4 %332 = OpFMul %330 %331 
                                       f32_4 %334 = OpFAdd %332 %333 
                                                      OpStore %57 %334 
                                         f32 %335 = OpLoad %170 
                                       f32_4 %336 = OpCompositeConstruct %335 %335 %335 %335 
                                       f32_4 %337 = OpLoad %57 
                                       f32_4 %338 = OpFMul %336 %337 
                                                      OpStore %9 %338 
                                Uniform f32* %343 = OpAccessChain %18 %245 
                                         f32 %344 = OpLoad %343 
                                        bool %345 = OpFOrdLessThan %113 %344 
                                                      OpSelectionMerge %347 None 
                                                      OpBranchConditional %345 %346 %349 
                                             %346 = OpLabel 
                                                      OpStore %342 %348 
                                                      OpBranch %347 
                                             %349 = OpLabel 
                                                      OpStore %342 %35 
                                                      OpBranch %347 
                                             %347 = OpLabel 
                                         u32 %350 = OpLoad %342 
                                         i32 %351 = OpBitcast %350 
                                                      OpStore %340 %351 
                                Uniform f32* %354 = OpAccessChain %18 %245 
                                         f32 %355 = OpLoad %354 
                                        bool %356 = OpFOrdLessThan %355 %113 
                                                      OpSelectionMerge %358 None 
                                                      OpBranchConditional %356 %357 %359 
                                             %357 = OpLabel 
                                                      OpStore %353 %348 
                                                      OpBranch %358 
                                             %359 = OpLabel 
                                                      OpStore %353 %35 
                                                      OpBranch %358 
                                             %358 = OpLabel 
                                         u32 %360 = OpLoad %353 
                                         i32 %361 = OpBitcast %360 
                                                      OpStore %352 %361 
                                         i32 %362 = OpLoad %340 
                                         i32 %363 = OpSNegate %362 
                                         i32 %364 = OpLoad %352 
                                         i32 %365 = OpIAdd %363 %364 
                                                      OpStore %340 %365 
                                         i32 %366 = OpLoad %340 
                                         f32 %367 = OpConvertSToF %366 
                                Private f32* %368 = OpAccessChain %57 %35 
                                                      OpStore %368 %367 
                                       f32_4 %371 = OpLoad %9 
                                       f32_4 %372 = OpLoad %57 
                                       f32_4 %373 = OpVectorShuffle %372 %372 0 0 0 0 
                                       f32_4 %374 = OpFMul %371 %373 
                                                      OpStore %370 %374 
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
  GpuProgramID 119674
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