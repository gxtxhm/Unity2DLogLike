//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/GlitchUnlit" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
_Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
_Color ("Tint", Color) = (1,1,1,1)
[MaterialToggle] PixelSnap ("Pixel snap", Float) = 0
_GlitchInterval ("Glitch interval time [seconds]", Float) = 0.1
_DispProbability ("Displacement Glitch Probability", Float) = 0.4
_DispIntensity ("Displacement Glitch Intensity", Float) = 0.01
_ColorProbability ("Color Glitch Probability", Float) = 0.4
_ColorIntensity ("Color Glitch Intensity", Float) = 0.04
[MaterialToggle] _WrapDispCoords ("Wrap disp glitch (off = clamp)", Float) = 1
[MaterialToggle] _DispGlitchOn ("Displacement Glitch On", Float) = 1
[MaterialToggle] _ColorGlitchOn ("Color Glitch On", Float) = 1
}
SubShader {
 LOD 110
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" }
 Pass {
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" }
  Cull Off
  Fog {
   Mode Off
  }
  Lighting On
  GpuProgramID 8949
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _GlitchInterval;
uniform 	float _DispIntensity;
uniform 	float _DispProbability;
uniform 	float _ColorIntensity;
uniform 	float _ColorProbability;
uniform 	float _DispGlitchOn;
uniform 	float _ColorGlitchOn;
uniform 	float _WrapDispCoords;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat10_2;
bvec2 u_xlatb2;
vec2 u_xlat3;
vec2 u_xlat4;
vec4 u_xlat10_4;
vec2 u_xlat5;
bool u_xlatb6;
float u_xlat10;
bool u_xlatb10;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.x = _Time.y / _GlitchInterval;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat5.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat5.xy;
    u_xlat0.x = u_xlat0.x * _GlitchInterval + u_xlat5.x;
    u_xlat0.x = u_xlat5.y + u_xlat0.x;
    u_xlat5.x = u_xlat0.x + 2.79299998;
    u_xlat5.xy = u_xlat5.xx * vec2(-91.2228012, 91.2228012);
    u_xlat5.xy = sin(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy * vec2(43758.5469, 43758.5469);
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat10 = u_xlat5.y * 0.0199999996 + 0.200000003;
    u_xlat10 = vs_TEXCOORD0.y / u_xlat10;
    u_xlat10 = floor(u_xlat10);
    u_xlat15 = u_xlat0.x + u_xlat10;
    u_xlat10 = (-u_xlat0.x) + u_xlat10;
    u_xlat1 = u_xlat0.xxxx * vec4(-65.2432022, 91.2228012, 65.2432022, -91.2228012);
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 * vec4(43758.5469, 43758.5469, 43758.5469, 43758.5469);
    u_xlat1 = fract(u_xlat1);
    u_xlat0.x = u_xlat15 * 78.2330017;
    u_xlat0.x = u_xlat10 * 12.9898005 + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + -0.5;
    u_xlat0.x = u_xlat0.x * _DispIntensity + vs_TEXCOORD0.x;
    u_xlatb10 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat15 = fract(abs(u_xlat0.x));
    u_xlat0.x = u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10 = (u_xlatb10) ? u_xlat15 : (-u_xlat15);
    u_xlatb15 = _WrapDispCoords==1.0;
    u_xlat0.x = (u_xlatb15) ? u_xlat10 : u_xlat0.x;
    u_xlatb10 = u_xlat1.x<_DispProbability;
    u_xlatb2.xy = equal(vec4(_DispGlitchOn, _ColorGlitchOn, _DispGlitchOn, _DispGlitchOn), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb10 = u_xlatb10 && u_xlatb2.x;
    u_xlat3.x = (u_xlatb10) ? u_xlat0.x : vs_TEXCOORD0.x;
    u_xlat4.x = u_xlat5.x * _ColorIntensity + u_xlat3.x;
    u_xlat4.y = u_xlat5.x * _ColorIntensity + vs_TEXCOORD0.y;
    u_xlat0 = texture(_MainTex, u_xlat4.xy);
    u_xlat1.xz = u_xlat1.zw + vec2(-0.5, -0.5);
    u_xlatb6 = u_xlat1.y<_ColorProbability;
    u_xlatb6 = u_xlatb2.y && u_xlatb6;
    u_xlat2.xy = u_xlat1.xz * vec2(_ColorIntensity) + u_xlat3.xx;
    u_xlat2.zw = u_xlat1.xz * vec2(_ColorIntensity) + vs_TEXCOORD0.yy;
    u_xlat10_4 = texture(_MainTex, u_xlat2.xz);
    u_xlat10_2 = texture(_MainTex, u_xlat2.yw);
    u_xlat16_1 = u_xlat10_2.w + u_xlat10_4.w;
    u_xlat0.x = u_xlat10_4.x;
    u_xlat0.y = u_xlat10_2.y;
    u_xlat1.x = u_xlat0.w + u_xlat16_1;
    u_xlat0.w = u_xlat1.x * 0.333333343;
    u_xlat3.y = vs_TEXCOORD0.y;
    u_xlat2 = texture(_MainTex, u_xlat3.xy);
    u_xlat0 = (bool(u_xlatb6)) ? u_xlat0 : u_xlat2;
    u_xlat1.x = u_xlat0.w + -0.100000001;
    SV_Target0 = u_xlat0;
    u_xlatb0 = u_xlat1.x<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
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
                                              OpDecorate %84 Location 84 
                                              OpDecorate %86 Location 86 
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
; Bound: 439
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %121 %399 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpMemberDecorate %14 4 Offset 14 
                                                      OpMemberDecorate %14 5 Offset 14 
                                                      OpMemberDecorate %14 6 Offset 14 
                                                      OpMemberDecorate %14 7 Offset 14 
                                                      OpMemberDecorate %14 8 Offset 14 
                                                      OpMemberDecorate %14 9 Offset 14 
                                                      OpMemberDecorate %14 10 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate %121 Location 121 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %310 DescriptorSet 310 
                                                      OpDecorate %310 Binding 310 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %352 RelaxedPrecision 
                                                      OpDecorate %356 RelaxedPrecision 
                                                      OpDecorate %359 RelaxedPrecision 
                                                      OpDecorate %360 RelaxedPrecision 
                                                      OpDecorate %364 RelaxedPrecision 
                                                      OpDecorate %365 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %374 RelaxedPrecision 
                                                      OpDecorate %376 RelaxedPrecision 
                                                      OpDecorate %378 RelaxedPrecision 
                                                      OpDecorate %382 RelaxedPrecision 
                                                      OpDecorate %389 RelaxedPrecision 
                                                      OpDecorate %394 RelaxedPrecision 
                                                      OpDecorate %395 RelaxedPrecision 
                                                      OpDecorate %397 RelaxedPrecision 
                                                      OpDecorate %399 RelaxedPrecision 
                                                      OpDecorate %399 Location 399 
                                                      OpDecorate %400 RelaxedPrecision 
                                                      OpDecorate %404 RelaxedPrecision 
                                                      OpDecorate %419 RelaxedPrecision 
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
                                              %14 = OpTypeStruct %7 %12 %13 %6 %6 %6 %6 %6 %6 %6 %6 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32; f32; f32; f32; f32; f32; f32; f32;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 0 
                                          u32 %19 = OpConstant 1 
                                              %20 = OpTypePointer Uniform %6 
                                          i32 %23 = OpConstant 3 
                                          u32 %27 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                              %34 = OpTypeVector %6 2 
                                              %35 = OpTypePointer Private %34 
                               Private f32_2* %36 = OpVariable Private 
                                          i32 %37 = OpConstant 1 
                                              %38 = OpTypePointer Uniform %7 
                                          i32 %42 = OpConstant 2 
                                          f32 %91 = OpConstant 3.67402E-40 
                                          f32 %96 = OpConstant 3.67402E-40 
                                          f32 %97 = OpConstant 3.67402E-40 
                                        f32_2 %98 = OpConstantComposite %96 %97 
                                         f32 %103 = OpConstant 3.67402E-40 
                                       f32_2 %104 = OpConstantComposite %103 %103 
                                         f32 %109 = OpConstant 3.67402E-40 
                                       f32_2 %110 = OpConstantComposite %109 %109 
                              Private f32_2* %112 = OpVariable Private 
                                         f32 %115 = OpConstant 3.67402E-40 
                                         f32 %117 = OpConstant 3.67402E-40 
                                             %120 = OpTypePointer Input %34 
                                Input f32_2* %121 = OpVariable Input 
                                             %122 = OpTypePointer Input %6 
                                Private f32* %133 = OpVariable Private 
                              Private f32_4* %146 = OpVariable Private 
                                         f32 %149 = OpConstant 3.67402E-40 
                                         f32 %150 = OpConstant 3.67402E-40 
                                       f32_4 %151 = OpConstantComposite %149 %97 %150 %96 
                                       f32_4 %156 = OpConstantComposite %103 %103 %103 %103 
                                         f32 %161 = OpConstant 3.67402E-40 
                                         f32 %166 = OpConstant 3.67402E-40 
                                         i32 %190 = OpConstant 4 
                                             %198 = OpTypeBool 
                                             %199 = OpTypePointer Private %198 
                               Private bool* %200 = OpVariable Private 
                                         f32 %216 = OpConstant 3.67402E-40 
                                         f32 %217 = OpConstant 3.67402E-40 
                                             %220 = OpTypePointer Function %6 
                               Private bool* %231 = OpVariable Private 
                                         i32 %232 = OpConstant 10 
                                         i32 %249 = OpConstant 5 
                                             %253 = OpTypeVector %198 2 
                                             %254 = OpTypePointer Private %253 
                             Private bool_2* %255 = OpVariable Private 
                                         i32 %256 = OpConstant 8 
                                         i32 %259 = OpConstant 9 
                                       f32_4 %267 = OpConstantComposite %217 %217 %216 %216 
                                             %268 = OpTypeVector %198 4 
                              Private f32_2* %275 = OpVariable Private 
                              Private f32_2* %287 = OpVariable Private 
                                         i32 %290 = OpConstant 6 
                                             %307 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %308 = OpTypeSampledImage %307 
                                             %309 = OpTypePointer UniformConstant %308 
 UniformConstant read_only Texture2DSampled* %310 = OpVariable UniformConstant 
                               Private bool* %320 = OpVariable Private 
                                         i32 %323 = OpConstant 7 
                              Private f32_4* %331 = OpVariable Private 
                              Private f32_2* %359 = OpVariable Private 
                                Private f32* %365 = OpVariable Private 
                                         u32 %366 = OpConstant 3 
                                         f32 %377 = OpConstant 3.67402E-40 
                                Private f32* %394 = OpVariable Private 
                                         f32 %396 = OpConstant 3.67402E-40 
                                             %398 = OpTypePointer Output %7 
                               Output f32_4* %399 = OpVariable Output 
                                             %401 = OpTypePointer Output %6 
                               Private bool* %403 = OpVariable Private 
                                         i32 %408 = OpConstant -1 
                                             %425 = OpTypePointer Function %34 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %221 = OpVariable Function 
                               Function f32* %236 = OpVariable Function 
                               Function f32* %276 = OpVariable Function 
                               Function f32* %385 = OpVariable Function 
                               Function f32* %414 = OpVariable Function 
                             Function f32_2* %426 = OpVariable Function 
                                 Uniform f32* %21 = OpAccessChain %16 %18 %19 
                                          f32 %22 = OpLoad %21 
                                 Uniform f32* %24 = OpAccessChain %16 %23 
                                          f32 %25 = OpLoad %24 
                                          f32 %26 = OpFDiv %22 %25 
                                 Private f32* %29 = OpAccessChain %9 %27 
                                                      OpStore %29 %26 
                                 Private f32* %30 = OpAccessChain %9 %27 
                                          f32 %31 = OpLoad %30 
                                          f32 %32 = OpExtInst %1 8 %31 
                                 Private f32* %33 = OpAccessChain %9 %27 
                                                      OpStore %33 %32 
                               Uniform f32_4* %39 = OpAccessChain %16 %37 %23 
                                        f32_4 %40 = OpLoad %39 
                                        f32_2 %41 = OpVectorShuffle %40 %40 1 1 
                               Uniform f32_4* %43 = OpAccessChain %16 %42 %37 
                                        f32_4 %44 = OpLoad %43 
                                        f32_2 %45 = OpVectorShuffle %44 %44 0 1 
                                        f32_2 %46 = OpFMul %41 %45 
                                                      OpStore %36 %46 
                               Uniform f32_4* %47 = OpAccessChain %16 %42 %18 
                                        f32_4 %48 = OpLoad %47 
                                        f32_2 %49 = OpVectorShuffle %48 %48 0 1 
                               Uniform f32_4* %50 = OpAccessChain %16 %37 %23 
                                        f32_4 %51 = OpLoad %50 
                                        f32_2 %52 = OpVectorShuffle %51 %51 0 0 
                                        f32_2 %53 = OpFMul %49 %52 
                                        f32_2 %54 = OpLoad %36 
                                        f32_2 %55 = OpFAdd %53 %54 
                                                      OpStore %36 %55 
                               Uniform f32_4* %56 = OpAccessChain %16 %42 %42 
                                        f32_4 %57 = OpLoad %56 
                                        f32_2 %58 = OpVectorShuffle %57 %57 0 1 
                               Uniform f32_4* %59 = OpAccessChain %16 %37 %23 
                                        f32_4 %60 = OpLoad %59 
                                        f32_2 %61 = OpVectorShuffle %60 %60 2 2 
                                        f32_2 %62 = OpFMul %58 %61 
                                        f32_2 %63 = OpLoad %36 
                                        f32_2 %64 = OpFAdd %62 %63 
                                                      OpStore %36 %64 
                               Uniform f32_4* %65 = OpAccessChain %16 %42 %23 
                                        f32_4 %66 = OpLoad %65 
                                        f32_2 %67 = OpVectorShuffle %66 %66 0 1 
                               Uniform f32_4* %68 = OpAccessChain %16 %37 %23 
                                        f32_4 %69 = OpLoad %68 
                                        f32_2 %70 = OpVectorShuffle %69 %69 3 3 
                                        f32_2 %71 = OpFMul %67 %70 
                                        f32_2 %72 = OpLoad %36 
                                        f32_2 %73 = OpFAdd %71 %72 
                                                      OpStore %36 %73 
                                 Private f32* %74 = OpAccessChain %9 %27 
                                          f32 %75 = OpLoad %74 
                                 Uniform f32* %76 = OpAccessChain %16 %23 
                                          f32 %77 = OpLoad %76 
                                          f32 %78 = OpFMul %75 %77 
                                 Private f32* %79 = OpAccessChain %36 %27 
                                          f32 %80 = OpLoad %79 
                                          f32 %81 = OpFAdd %78 %80 
                                 Private f32* %82 = OpAccessChain %9 %27 
                                                      OpStore %82 %81 
                                 Private f32* %83 = OpAccessChain %36 %19 
                                          f32 %84 = OpLoad %83 
                                 Private f32* %85 = OpAccessChain %9 %27 
                                          f32 %86 = OpLoad %85 
                                          f32 %87 = OpFAdd %84 %86 
                                 Private f32* %88 = OpAccessChain %9 %27 
                                                      OpStore %88 %87 
                                 Private f32* %89 = OpAccessChain %9 %27 
                                          f32 %90 = OpLoad %89 
                                          f32 %92 = OpFAdd %90 %91 
                                 Private f32* %93 = OpAccessChain %36 %27 
                                                      OpStore %93 %92 
                                        f32_2 %94 = OpLoad %36 
                                        f32_2 %95 = OpVectorShuffle %94 %94 0 0 
                                        f32_2 %99 = OpFMul %95 %98 
                                                      OpStore %36 %99 
                                       f32_2 %100 = OpLoad %36 
                                       f32_2 %101 = OpExtInst %1 13 %100 
                                                      OpStore %36 %101 
                                       f32_2 %102 = OpLoad %36 
                                       f32_2 %105 = OpFMul %102 %104 
                                                      OpStore %36 %105 
                                       f32_2 %106 = OpLoad %36 
                                       f32_2 %107 = OpExtInst %1 10 %106 
                                                      OpStore %36 %107 
                                       f32_2 %108 = OpLoad %36 
                                       f32_2 %111 = OpFAdd %108 %110 
                                                      OpStore %36 %111 
                                Private f32* %113 = OpAccessChain %36 %19 
                                         f32 %114 = OpLoad %113 
                                         f32 %116 = OpFMul %114 %115 
                                         f32 %118 = OpFAdd %116 %117 
                                Private f32* %119 = OpAccessChain %112 %27 
                                                      OpStore %119 %118 
                                  Input f32* %123 = OpAccessChain %121 %19 
                                         f32 %124 = OpLoad %123 
                                Private f32* %125 = OpAccessChain %112 %27 
                                         f32 %126 = OpLoad %125 
                                         f32 %127 = OpFDiv %124 %126 
                                Private f32* %128 = OpAccessChain %112 %27 
                                                      OpStore %128 %127 
                                Private f32* %129 = OpAccessChain %112 %27 
                                         f32 %130 = OpLoad %129 
                                         f32 %131 = OpExtInst %1 8 %130 
                                Private f32* %132 = OpAccessChain %112 %27 
                                                      OpStore %132 %131 
                                Private f32* %134 = OpAccessChain %9 %27 
                                         f32 %135 = OpLoad %134 
                                Private f32* %136 = OpAccessChain %112 %27 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFAdd %135 %137 
                                                      OpStore %133 %138 
                                Private f32* %139 = OpAccessChain %9 %27 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFNegate %140 
                                Private f32* %142 = OpAccessChain %112 %27 
                                         f32 %143 = OpLoad %142 
                                         f32 %144 = OpFAdd %141 %143 
                                Private f32* %145 = OpAccessChain %112 %27 
                                                      OpStore %145 %144 
                                       f32_4 %147 = OpLoad %9 
                                       f32_4 %148 = OpVectorShuffle %147 %147 0 0 0 0 
                                       f32_4 %152 = OpFMul %148 %151 
                                                      OpStore %146 %152 
                                       f32_4 %153 = OpLoad %146 
                                       f32_4 %154 = OpExtInst %1 13 %153 
                                                      OpStore %146 %154 
                                       f32_4 %155 = OpLoad %146 
                                       f32_4 %157 = OpFMul %155 %156 
                                                      OpStore %146 %157 
                                       f32_4 %158 = OpLoad %146 
                                       f32_4 %159 = OpExtInst %1 10 %158 
                                                      OpStore %146 %159 
                                         f32 %160 = OpLoad %133 
                                         f32 %162 = OpFMul %160 %161 
                                Private f32* %163 = OpAccessChain %9 %27 
                                                      OpStore %163 %162 
                                Private f32* %164 = OpAccessChain %112 %27 
                                         f32 %165 = OpLoad %164 
                                         f32 %167 = OpFMul %165 %166 
                                Private f32* %168 = OpAccessChain %9 %27 
                                         f32 %169 = OpLoad %168 
                                         f32 %170 = OpFAdd %167 %169 
                                Private f32* %171 = OpAccessChain %9 %27 
                                                      OpStore %171 %170 
                                Private f32* %172 = OpAccessChain %9 %27 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpExtInst %1 13 %173 
                                Private f32* %175 = OpAccessChain %9 %27 
                                                      OpStore %175 %174 
                                Private f32* %176 = OpAccessChain %9 %27 
                                         f32 %177 = OpLoad %176 
                                         f32 %178 = OpFMul %177 %103 
                                Private f32* %179 = OpAccessChain %9 %27 
                                                      OpStore %179 %178 
                                Private f32* %180 = OpAccessChain %9 %27 
                                         f32 %181 = OpLoad %180 
                                         f32 %182 = OpExtInst %1 10 %181 
                                Private f32* %183 = OpAccessChain %9 %27 
                                                      OpStore %183 %182 
                                Private f32* %184 = OpAccessChain %9 %27 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFAdd %185 %109 
                                Private f32* %187 = OpAccessChain %9 %27 
                                                      OpStore %187 %186 
                                Private f32* %188 = OpAccessChain %9 %27 
                                         f32 %189 = OpLoad %188 
                                Uniform f32* %191 = OpAccessChain %16 %190 
                                         f32 %192 = OpLoad %191 
                                         f32 %193 = OpFMul %189 %192 
                                  Input f32* %194 = OpAccessChain %121 %27 
                                         f32 %195 = OpLoad %194 
                                         f32 %196 = OpFAdd %193 %195 
                                Private f32* %197 = OpAccessChain %9 %27 
                                                      OpStore %197 %196 
                                Private f32* %201 = OpAccessChain %9 %27 
                                         f32 %202 = OpLoad %201 
                                Private f32* %203 = OpAccessChain %9 %27 
                                         f32 %204 = OpLoad %203 
                                         f32 %205 = OpFNegate %204 
                                        bool %206 = OpFOrdGreaterThanEqual %202 %205 
                                                      OpStore %200 %206 
                                Private f32* %207 = OpAccessChain %9 %27 
                                         f32 %208 = OpLoad %207 
                                         f32 %209 = OpExtInst %1 4 %208 
                                         f32 %210 = OpExtInst %1 10 %209 
                                                      OpStore %133 %210 
                                Private f32* %211 = OpAccessChain %9 %27 
                                         f32 %212 = OpLoad %211 
                                Private f32* %213 = OpAccessChain %9 %27 
                                                      OpStore %213 %212 
                                Private f32* %214 = OpAccessChain %9 %27 
                                         f32 %215 = OpLoad %214 
                                         f32 %218 = OpExtInst %1 43 %215 %216 %217 
                                Private f32* %219 = OpAccessChain %9 %27 
                                                      OpStore %219 %218 
                                        bool %222 = OpLoad %200 
                                                      OpSelectionMerge %224 None 
                                                      OpBranchConditional %222 %223 %226 
                                             %223 = OpLabel 
                                         f32 %225 = OpLoad %133 
                                                      OpStore %221 %225 
                                                      OpBranch %224 
                                             %226 = OpLabel 
                                         f32 %227 = OpLoad %133 
                                         f32 %228 = OpFNegate %227 
                                                      OpStore %221 %228 
                                                      OpBranch %224 
                                             %224 = OpLabel 
                                         f32 %229 = OpLoad %221 
                                Private f32* %230 = OpAccessChain %112 %27 
                                                      OpStore %230 %229 
                                Uniform f32* %233 = OpAccessChain %16 %232 
                                         f32 %234 = OpLoad %233 
                                        bool %235 = OpFOrdEqual %234 %217 
                                                      OpStore %231 %235 
                                        bool %237 = OpLoad %231 
                                                      OpSelectionMerge %239 None 
                                                      OpBranchConditional %237 %238 %242 
                                             %238 = OpLabel 
                                Private f32* %240 = OpAccessChain %112 %27 
                                         f32 %241 = OpLoad %240 
                                                      OpStore %236 %241 
                                                      OpBranch %239 
                                             %242 = OpLabel 
                                Private f32* %243 = OpAccessChain %9 %27 
                                         f32 %244 = OpLoad %243 
                                                      OpStore %236 %244 
                                                      OpBranch %239 
                                             %239 = OpLabel 
                                         f32 %245 = OpLoad %236 
                                Private f32* %246 = OpAccessChain %9 %27 
                                                      OpStore %246 %245 
                                Private f32* %247 = OpAccessChain %146 %27 
                                         f32 %248 = OpLoad %247 
                                Uniform f32* %250 = OpAccessChain %16 %249 
                                         f32 %251 = OpLoad %250 
                                        bool %252 = OpFOrdLessThan %248 %251 
                                                      OpStore %200 %252 
                                Uniform f32* %257 = OpAccessChain %16 %256 
                                         f32 %258 = OpLoad %257 
                                Uniform f32* %260 = OpAccessChain %16 %259 
                                         f32 %261 = OpLoad %260 
                                Uniform f32* %262 = OpAccessChain %16 %256 
                                         f32 %263 = OpLoad %262 
                                Uniform f32* %264 = OpAccessChain %16 %256 
                                         f32 %265 = OpLoad %264 
                                       f32_4 %266 = OpCompositeConstruct %258 %261 %263 %265 
                                      bool_4 %269 = OpFOrdEqual %266 %267 
                                      bool_2 %270 = OpVectorShuffle %269 %269 0 1 
                                                      OpStore %255 %270 
                                        bool %271 = OpLoad %200 
                                      bool_2 %272 = OpLoad %255 
                                        bool %273 = OpCompositeExtract %272 0 
                                        bool %274 = OpLogicalAnd %271 %273 
                                                      OpStore %200 %274 
                                        bool %277 = OpLoad %200 
                                                      OpSelectionMerge %279 None 
                                                      OpBranchConditional %277 %278 %282 
                                             %278 = OpLabel 
                                Private f32* %280 = OpAccessChain %9 %27 
                                         f32 %281 = OpLoad %280 
                                                      OpStore %276 %281 
                                                      OpBranch %279 
                                             %282 = OpLabel 
                                  Input f32* %283 = OpAccessChain %121 %27 
                                         f32 %284 = OpLoad %283 
                                                      OpStore %276 %284 
                                                      OpBranch %279 
                                             %279 = OpLabel 
                                         f32 %285 = OpLoad %276 
                                Private f32* %286 = OpAccessChain %275 %27 
                                                      OpStore %286 %285 
                                Private f32* %288 = OpAccessChain %36 %27 
                                         f32 %289 = OpLoad %288 
                                Uniform f32* %291 = OpAccessChain %16 %290 
                                         f32 %292 = OpLoad %291 
                                         f32 %293 = OpFMul %289 %292 
                                Private f32* %294 = OpAccessChain %275 %27 
                                         f32 %295 = OpLoad %294 
                                         f32 %296 = OpFAdd %293 %295 
                                Private f32* %297 = OpAccessChain %287 %27 
                                                      OpStore %297 %296 
                                Private f32* %298 = OpAccessChain %36 %27 
                                         f32 %299 = OpLoad %298 
                                Uniform f32* %300 = OpAccessChain %16 %290 
                                         f32 %301 = OpLoad %300 
                                         f32 %302 = OpFMul %299 %301 
                                  Input f32* %303 = OpAccessChain %121 %19 
                                         f32 %304 = OpLoad %303 
                                         f32 %305 = OpFAdd %302 %304 
                                Private f32* %306 = OpAccessChain %287 %19 
                                                      OpStore %306 %305 
                  read_only Texture2DSampled %311 = OpLoad %310 
                                       f32_2 %312 = OpLoad %287 
                                       f32_4 %313 = OpImageSampleImplicitLod %311 %312 
                                       f32_2 %314 = OpVectorShuffle %313 %313 2 3 
                                       f32_4 %315 = OpLoad %9 
                                       f32_4 %316 = OpVectorShuffle %315 %314 4 5 2 3 
                                                      OpStore %9 %316 
                                       f32_4 %317 = OpLoad %146 
                                       f32_2 %318 = OpVectorShuffle %317 %317 2 3 
                                       f32_2 %319 = OpFAdd %318 %110 
                                                      OpStore %112 %319 
                                Private f32* %321 = OpAccessChain %146 %19 
                                         f32 %322 = OpLoad %321 
                                Uniform f32* %324 = OpAccessChain %16 %323 
                                         f32 %325 = OpLoad %324 
                                        bool %326 = OpFOrdLessThan %322 %325 
                                                      OpStore %320 %326 
                                      bool_2 %327 = OpLoad %255 
                                        bool %328 = OpCompositeExtract %327 1 
                                        bool %329 = OpLoad %320 
                                        bool %330 = OpLogicalAnd %328 %329 
                                                      OpStore %320 %330 
                                       f32_2 %332 = OpLoad %112 
                                Uniform f32* %333 = OpAccessChain %16 %290 
                                         f32 %334 = OpLoad %333 
                                       f32_2 %335 = OpCompositeConstruct %334 %334 
                                       f32_2 %336 = OpFMul %332 %335 
                                       f32_2 %337 = OpLoad %275 
                                       f32_2 %338 = OpVectorShuffle %337 %337 0 0 
                                       f32_2 %339 = OpFAdd %336 %338 
                                       f32_4 %340 = OpLoad %331 
                                       f32_4 %341 = OpVectorShuffle %340 %339 4 5 2 3 
                                                      OpStore %331 %341 
                                       f32_2 %342 = OpLoad %112 
                                Uniform f32* %343 = OpAccessChain %16 %290 
                                         f32 %344 = OpLoad %343 
                                       f32_2 %345 = OpCompositeConstruct %344 %344 
                                       f32_2 %346 = OpFMul %342 %345 
                                       f32_2 %347 = OpLoad %121 
                                       f32_2 %348 = OpVectorShuffle %347 %347 1 1 
                                       f32_2 %349 = OpFAdd %346 %348 
                                       f32_4 %350 = OpLoad %331 
                                       f32_4 %351 = OpVectorShuffle %350 %349 0 1 4 5 
                                                      OpStore %331 %351 
                  read_only Texture2DSampled %352 = OpLoad %310 
                                       f32_4 %353 = OpLoad %331 
                                       f32_2 %354 = OpVectorShuffle %353 %353 0 2 
                                       f32_4 %355 = OpImageSampleImplicitLod %352 %354 
                                       f32_2 %356 = OpVectorShuffle %355 %355 0 3 
                                       f32_4 %357 = OpLoad %9 
                                       f32_4 %358 = OpVectorShuffle %357 %356 0 1 4 5 
                                                      OpStore %9 %358 
                  read_only Texture2DSampled %360 = OpLoad %310 
                                       f32_4 %361 = OpLoad %331 
                                       f32_2 %362 = OpVectorShuffle %361 %361 1 3 
                                       f32_4 %363 = OpImageSampleImplicitLod %360 %362 
                                       f32_2 %364 = OpVectorShuffle %363 %363 1 3 
                                                      OpStore %359 %364 
                                Private f32* %367 = OpAccessChain %9 %366 
                                         f32 %368 = OpLoad %367 
                                Private f32* %369 = OpAccessChain %359 %19 
                                         f32 %370 = OpLoad %369 
                                         f32 %371 = OpFAdd %368 %370 
                                                      OpStore %365 %371 
                                Private f32* %372 = OpAccessChain %9 %19 
                                         f32 %373 = OpLoad %372 
                                         f32 %374 = OpLoad %365 
                                         f32 %375 = OpFAdd %373 %374 
                                                      OpStore %365 %375 
                                         f32 %376 = OpLoad %365 
                                         f32 %378 = OpFMul %376 %377 
                                                      OpStore %365 %378 
                                  Input f32* %379 = OpAccessChain %121 %19 
                                         f32 %380 = OpLoad %379 
                                Private f32* %381 = OpAccessChain %275 %19 
                                                      OpStore %381 %380 
                  read_only Texture2DSampled %382 = OpLoad %310 
                                       f32_2 %383 = OpLoad %275 
                                       f32_4 %384 = OpImageSampleImplicitLod %382 %383 
                                                      OpStore %331 %384 
                                        bool %386 = OpLoad %320 
                                                      OpSelectionMerge %388 None 
                                                      OpBranchConditional %386 %387 %390 
                                             %387 = OpLabel 
                                         f32 %389 = OpLoad %365 
                                                      OpStore %385 %389 
                                                      OpBranch %388 
                                             %390 = OpLabel 
                                Private f32* %391 = OpAccessChain %331 %366 
                                         f32 %392 = OpLoad %391 
                                                      OpStore %385 %392 
                                                      OpBranch %388 
                                             %388 = OpLabel 
                                         f32 %393 = OpLoad %385 
                                                      OpStore %365 %393 
                                         f32 %395 = OpLoad %365 
                                         f32 %397 = OpFAdd %395 %396 
                                                      OpStore %394 %397 
                                         f32 %400 = OpLoad %365 
                                 Output f32* %402 = OpAccessChain %399 %366 
                                                      OpStore %402 %400 
                                         f32 %404 = OpLoad %394 
                                        bool %405 = OpFOrdLessThan %404 %216 
                                                      OpStore %403 %405 
                                        bool %406 = OpLoad %403 
                                         i32 %407 = OpSelect %406 %37 %18 
                                         i32 %409 = OpIMul %407 %408 
                                        bool %410 = OpINotEqual %409 %18 
                                                      OpSelectionMerge %412 None 
                                                      OpBranchConditional %410 %411 %412 
                                             %411 = OpLabel 
                                                      OpKill
                                             %412 = OpLabel 
                                        bool %415 = OpLoad %320 
                                                      OpSelectionMerge %417 None 
                                                      OpBranchConditional %415 %416 %420 
                                             %416 = OpLabel 
                                Private f32* %418 = OpAccessChain %359 %27 
                                         f32 %419 = OpLoad %418 
                                                      OpStore %414 %419 
                                                      OpBranch %417 
                                             %420 = OpLabel 
                                Private f32* %421 = OpAccessChain %331 %19 
                                         f32 %422 = OpLoad %421 
                                                      OpStore %414 %422 
                                                      OpBranch %417 
                                             %417 = OpLabel 
                                         f32 %423 = OpLoad %414 
                                 Output f32* %424 = OpAccessChain %399 %19 
                                                      OpStore %424 %423 
                                        bool %427 = OpLoad %320 
                                                      OpSelectionMerge %429 None 
                                                      OpBranchConditional %427 %428 %432 
                                             %428 = OpLabel 
                                       f32_4 %430 = OpLoad %9 
                                       f32_2 %431 = OpVectorShuffle %430 %430 2 0 
                                                      OpStore %426 %431 
                                                      OpBranch %429 
                                             %432 = OpLabel 
                                       f32_4 %433 = OpLoad %331 
                                       f32_2 %434 = OpVectorShuffle %433 %433 0 2 
                                                      OpStore %426 %434 
                                                      OpBranch %429 
                                             %429 = OpLabel 
                                       f32_2 %435 = OpLoad %426 
                                       f32_4 %436 = OpLoad %399 
                                       f32_4 %437 = OpVectorShuffle %436 %435 4 1 5 3 
                                                      OpStore %399 %437 
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
Fallback "tk2d/CutoutVertexColor"
}