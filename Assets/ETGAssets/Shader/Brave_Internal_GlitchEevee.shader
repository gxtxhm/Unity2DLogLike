//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/GlitchEevee" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_EeveeTex ("Cosmic", 2D) = "white" { }
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
_WaveIntensity ("Wave Intensity", Float) = 1
_AdditionalTime ("Additional time", Float) = 0
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
  GpuProgramID 58205
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
    vs_TEXCOORD1 = in_POSITION0;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _WaveIntensity;
uniform 	float _GlitchInterval;
uniform 	float _DispIntensity;
uniform 	float _DispProbability;
uniform 	float _ColorIntensity;
uniform 	float _ColorProbability;
uniform 	float _DispGlitchOn;
uniform 	float _ColorGlitchOn;
uniform 	float _WrapDispCoords;
uniform 	float _AdditionalTime;
uniform  sampler2D _MainTex;
uniform  sampler2D _EeveeTex;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat16_1;
vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec2 u_xlat3;
bvec2 u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec2 u_xlat7;
vec2 u_xlat12;
float u_xlat16_12;
bool u_xlatb12;
float u_xlat13;
bvec2 u_xlatb13;
bool u_xlatb14;
float u_xlat19;
bool u_xlatb19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / _MainTex_TexelSize.xy;
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _MainTex_TexelSize.xy;
    u_xlat12.xy = _Time.yx + vec2(vec2(_AdditionalTime, _AdditionalTime));
    u_xlat1.x = u_xlat12.y * 512.0;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 0.001953125;
    u_xlat0.xy = u_xlat0.xy * vec2(0.200000003, 0.200000003) + u_xlat1.xx;
    u_xlat10_1 = texture(_EeveeTex, u_xlat0.xy);
    u_xlat16_1.xyz = u_xlat10_1.xyz * vec3(11.0, 11.0, 11.0);
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.35000002, 1.35000002, 1.35000002);
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat0.x = sin(u_xlat12.y);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = u_xlat0.x * 0.375 + 1.0;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat1.x = dot(u_xlat0.xyw, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat0.xyw = u_xlat0.xyw * vec3(1.25, 1.25, 1.25);
    u_xlat1.x = u_xlat1.x + -0.200000003;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.x = u_xlat12.x / _GlitchInterval;
    u_xlat12.x = u_xlat12.x + vs_TEXCOORD1.y;
    u_xlat12.x = sin(u_xlat12.x);
    u_xlat12.x = u_xlat12.x * _WaveIntensity;
    u_xlat12.x = u_xlat12.x * 0.00588235306 + vs_TEXCOORD0.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat7.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat7.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].xx + u_xlat7.xy;
    u_xlat7.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].zz + u_xlat7.xy;
    u_xlat7.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * hlslcc_mtx4x4unity_ObjectToWorld[3].ww + u_xlat7.xy;
    u_xlat1.x = u_xlat1.x * _GlitchInterval + u_xlat7.x;
    u_xlat1.x = u_xlat7.y + u_xlat1.x;
    u_xlat7.x = u_xlat1.x + 2.79299998;
    u_xlat7.xy = u_xlat7.xx * vec2(-91.2228012, 91.2228012);
    u_xlat7.xy = sin(u_xlat7.xy);
    u_xlat7.xy = u_xlat7.xy * vec2(43758.5469, 43758.5469);
    u_xlat7.xy = fract(u_xlat7.xy);
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat13 = u_xlat7.y * 0.0199999996 + 0.200000003;
    u_xlat13 = vs_TEXCOORD0.y / u_xlat13;
    u_xlat13 = floor(u_xlat13);
    u_xlat19 = u_xlat1.x + u_xlat13;
    u_xlat13 = (-u_xlat1.x) + u_xlat13;
    u_xlat2 = u_xlat1.xxxx * vec4(-65.2432022, 91.2228012, 65.2432022, -91.2228012);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = u_xlat2 * vec4(43758.5469, 43758.5469, 43758.5469, 43758.5469);
    u_xlat2 = fract(u_xlat2);
    u_xlat1.x = u_xlat19 * 78.2330017;
    u_xlat1.x = u_xlat13 * 12.9898005 + u_xlat1.x;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 43758.5469;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + -0.5;
    u_xlat1.x = u_xlat1.x * _DispIntensity + u_xlat12.x;
    u_xlatb13.x = u_xlat1.x>=(-u_xlat1.x);
    u_xlat19 = fract(abs(u_xlat1.x));
    u_xlat1.x = u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat13 = (u_xlatb13.x) ? u_xlat19 : (-u_xlat19);
    u_xlatb3.xy = equal(vec4(_WrapDispCoords, _ColorGlitchOn, _WrapDispCoords, _WrapDispCoords), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat1.x = (u_xlatb3.x) ? u_xlat13 : u_xlat1.x;
    u_xlatb13.xy = lessThan(u_xlat2.xyxy, vec4(_DispProbability, _ColorProbability, _DispProbability, _ColorProbability)).xy;
    u_xlat2.xy = u_xlat2.zw + vec2(-0.5, -0.5);
    u_xlatb14 = _DispGlitchOn==1.0;
    u_xlatb13.x = u_xlatb13.x && u_xlatb14;
    u_xlatb19 = u_xlatb3.y && u_xlatb13.y;
    u_xlat3.x = (u_xlatb13.x) ? u_xlat1.x : u_xlat12.x;
    u_xlat4.x = u_xlat7.x * _ColorIntensity + u_xlat3.x;
    u_xlat4.y = u_xlat7.x * _ColorIntensity + vs_TEXCOORD0.y;
    u_xlat4 = texture(_MainTex, u_xlat4.xy);
    u_xlat5.xy = u_xlat2.xy * vec2(vec2(_ColorIntensity, _ColorIntensity)) + u_xlat3.xx;
    u_xlat5.zw = u_xlat2.xy * vec2(vec2(_ColorIntensity, _ColorIntensity)) + vs_TEXCOORD0.yy;
    u_xlat10_2 = texture(_MainTex, u_xlat5.xz);
    u_xlat10_5 = texture(_MainTex, u_xlat5.yw);
    u_xlat16_12 = u_xlat10_2.w + u_xlat10_5.w;
    u_xlat4.x = u_xlat10_2.x;
    u_xlat4.y = u_xlat10_5.y;
    u_xlat12.x = u_xlat4.w + u_xlat16_12;
    u_xlat4.w = u_xlat12.x * 0.333333343;
    u_xlat3.y = vs_TEXCOORD0.y;
    u_xlat2 = texture(_MainTex, u_xlat3.xy);
    u_xlat1 = (bool(u_xlatb19)) ? u_xlat4 : u_xlat2;
    u_xlat12.x = u_xlat1.w + -0.100000001;
    u_xlatb12 = u_xlat12.x<0.0;
    if((int(u_xlatb12) * int(0xffffffffu))!=0){discard;}
    u_xlat12.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat0.xyz = u_xlat0.xyw * u_xlat12.xxx + (-u_xlat1.xyz);
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 96
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %88 
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
                                              OpDecorate %88 Location 88 
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
                        Output f32_4* %88 = OpVariable Output 
                                      %90 = OpTypePointer Output %6 
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
                                f32_4 %89 = OpLoad %11 
                                              OpStore %88 %89 
                          Output f32* %91 = OpAccessChain %72 %22 %68 
                                  f32 %92 = OpLoad %91 
                                  f32 %93 = OpFNegate %92 
                          Output f32* %94 = OpAccessChain %72 %22 %68 
                                              OpStore %94 %93 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 635
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %190 %564 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpMemberDecorate %19 8 Offset 19 
                                                      OpMemberDecorate %19 9 Offset 19 
                                                      OpMemberDecorate %19 10 Offset 19 
                                                      OpMemberDecorate %19 11 Offset 19 
                                                      OpMemberDecorate %19 12 Offset 19 
                                                      OpMemberDecorate %19 13 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %89 DescriptorSet 89 
                                                      OpDecorate %89 Binding 89 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %94 RelaxedPrecision 
                                                      OpDecorate %95 RelaxedPrecision 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpDecorate %99 RelaxedPrecision 
                                                      OpDecorate %100 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %107 RelaxedPrecision 
                                                      OpDecorate %126 RelaxedPrecision 
                                                      OpDecorate %138 RelaxedPrecision 
                                                      OpDecorate %145 RelaxedPrecision 
                                                      OpDecorate %147 RelaxedPrecision 
                                                      OpDecorate %153 RelaxedPrecision 
                                                      OpDecorate %190 Location 190 
                                                      OpDecorate %469 RelaxedPrecision 
                                                      OpDecorate %470 RelaxedPrecision 
                                                      OpDecorate %470 DescriptorSet 470 
                                                      OpDecorate %470 Binding 470 
                                                      OpDecorate %471 RelaxedPrecision 
                                                      OpDecorate %475 RelaxedPrecision 
                                                      OpDecorate %508 RelaxedPrecision 
                                                      OpDecorate %509 RelaxedPrecision 
                                                      OpDecorate %513 RelaxedPrecision 
                                                      OpDecorate %514 RelaxedPrecision 
                                                      OpDecorate %515 RelaxedPrecision 
                                                      OpDecorate %519 RelaxedPrecision 
                                                      OpDecorate %521 RelaxedPrecision 
                                                      OpDecorate %523 RelaxedPrecision 
                                                      OpDecorate %524 RelaxedPrecision 
                                                      OpDecorate %527 RelaxedPrecision 
                                                      OpDecorate %529 RelaxedPrecision 
                                                      OpDecorate %530 RelaxedPrecision 
                                                      OpDecorate %533 RelaxedPrecision 
                                                      OpDecorate %535 RelaxedPrecision 
                                                      OpDecorate %540 RelaxedPrecision 
                                                      OpDecorate %550 RelaxedPrecision 
                                                      OpDecorate %557 RelaxedPrecision 
                                                      OpDecorate %559 RelaxedPrecision 
                                                      OpDecorate %561 RelaxedPrecision 
                                                      OpDecorate %564 RelaxedPrecision 
                                                      OpDecorate %564 Location 564 
                                                      OpDecorate %566 RelaxedPrecision 
                                                      OpDecorate %570 RelaxedPrecision 
                                                      OpDecorate %585 RelaxedPrecision 
                                                      OpDecorate %597 RelaxedPrecision 
                                                      OpDecorate %609 RelaxedPrecision 
                                                      OpDecorate %616 RelaxedPrecision 
                                                      OpDecorate %617 RelaxedPrecision 
                                                      OpDecorate %619 RelaxedPrecision 
                                                      OpDecorate %620 RelaxedPrecision 
                                                      OpDecorate %621 RelaxedPrecision 
                                                      OpDecorate %622 RelaxedPrecision 
                                                      OpDecorate %623 RelaxedPrecision 
                                                      OpDecorate %624 RelaxedPrecision 
                                                      OpDecorate %625 RelaxedPrecision 
                                                      OpDecorate %626 RelaxedPrecision 
                                                      OpDecorate %629 RelaxedPrecision 
                                                      OpDecorate %630 RelaxedPrecision 
                                                      OpDecorate %631 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeStruct %7 %17 %18 %7 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 3 
                                              %24 = OpTypePointer Uniform %7 
                                              %44 = OpTypePointer Private %12 
                               Private f32_2* %45 = OpVariable Private 
                                          i32 %46 = OpConstant 0 
                                          i32 %50 = OpConstant 13 
                                              %51 = OpTypePointer Uniform %6 
                                              %61 = OpTypePointer Private %6 
                                 Private f32* %62 = OpVariable Private 
                                          u32 %63 = OpConstant 1 
                                          f32 %66 = OpConstant 3.67402E-40 
                                          f32 %71 = OpConstant 3.67402E-40 
                                          f32 %75 = OpConstant 3.67402E-40 
                                        f32_2 %76 = OpConstantComposite %75 %75 
                                              %83 = OpTypeVector %6 3 
                                              %84 = OpTypePointer Private %83 
                               Private f32_3* %85 = OpVariable Private 
                                              %86 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %87 = OpTypeSampledImage %86 
                                              %88 = OpTypePointer UniformConstant %87 
  UniformConstant read_only Texture2DSampled* %89 = OpVariable UniformConstant 
                               Private f32_3* %95 = OpVariable Private 
                                          f32 %97 = OpConstant 3.67402E-40 
                                        f32_3 %98 = OpConstantComposite %97 %97 %97 
                                         f32 %103 = OpConstant 3.67402E-40 
                                       f32_3 %104 = OpConstantComposite %103 %103 %103 
                                         u32 %111 = OpConstant 0 
                                         f32 %115 = OpConstant 3.67402E-40 
                                         f32 %120 = OpConstant 3.67402E-40 
                                         f32 %132 = OpConstant 3.67402E-40 
                                         f32 %133 = OpConstant 3.67402E-40 
                                         f32 %134 = OpConstant 3.67402E-40 
                                       f32_3 %135 = OpConstantComposite %132 %133 %134 
                              Private f32_3* %138 = OpVariable Private 
                                         f32 %141 = OpConstant 3.67402E-40 
                                       f32_3 %142 = OpConstantComposite %141 %141 %141 
                                         f32 %146 = OpConstant 3.67402E-40 
                                             %149 = OpTypeBool 
                                             %150 = OpTypePointer Private %149 
                               Private bool* %151 = OpVariable Private 
                                         f32 %154 = OpConstant 3.67402E-40 
                                         i32 %157 = OpConstant 1 
                                         i32 %159 = OpConstant -1 
                                         i32 %167 = OpConstant 5 
                                Private f32* %172 = OpVariable Private 
                                             %175 = OpTypePointer Input %6 
                                         i32 %182 = OpConstant 4 
                                         f32 %187 = OpConstant 3.67402E-40 
                                             %189 = OpTypePointer Input %12 
                                Input f32_2* %190 = OpVariable Input 
                                         i32 %201 = OpConstant 2 
                                         f32 %250 = OpConstant 3.67402E-40 
                                         f32 %255 = OpConstant 3.67402E-40 
                                         f32 %256 = OpConstant 3.67402E-40 
                                       f32_2 %257 = OpConstantComposite %255 %256 
                                         f32 %262 = OpConstant 3.67402E-40 
                                       f32_2 %263 = OpConstantComposite %262 %262 
                                         f32 %268 = OpConstant 3.67402E-40 
                                       f32_2 %269 = OpConstantComposite %268 %268 
                                Private f32* %271 = OpVariable Private 
                                         f32 %274 = OpConstant 3.67402E-40 
                              Private f32_4* %292 = OpVariable Private 
                                         f32 %295 = OpConstant 3.67402E-40 
                                         f32 %296 = OpConstant 3.67402E-40 
                                       f32_4 %297 = OpConstantComposite %295 %256 %296 %255 
                                       f32_4 %302 = OpConstantComposite %262 %262 %262 %262 
                                         f32 %307 = OpConstant 3.67402E-40 
                                         f32 %311 = OpConstant 3.67402E-40 
                                         i32 %335 = OpConstant 6 
                               Private bool* %342 = OpVariable Private 
                                             %360 = OpTypePointer Function %6 
                                             %370 = OpTypeVector %149 3 
                                             %371 = OpTypePointer Private %370 
                             Private bool_3* %372 = OpVariable Private 
                                         i32 %373 = OpConstant 12 
                                         i32 %376 = OpConstant 11 
                                       f32_4 %384 = OpConstantComposite %115 %115 %154 %154 
                                             %385 = OpTypeVector %149 4 
                                             %387 = OpTypeVector %149 2 
                                         i32 %404 = OpConstant 7 
                                         i32 %409 = OpConstant 9 
                                         i32 %424 = OpConstant 10 
                              Private f32_4* %449 = OpVariable Private 
                                         i32 %452 = OpConstant 8 
                              Private f32_2* %469 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %470 = OpVariable UniformConstant 
                              Private f32_2* %508 = OpVariable Private 
                              Private f32_2* %514 = OpVariable Private 
                                         f32 %534 = OpConstant 3.67402E-40 
                                         u32 %552 = OpConstant 3 
                              Private f32_3* %557 = OpVariable Private 
                                         f32 %560 = OpConstant 3.67402E-40 
                                             %563 = OpTypePointer Output %7 
                               Output f32_4* %564 = OpVariable Output 
                                             %567 = OpTypePointer Output %6 
                                         u32 %611 = OpConstant 2 
                                         f32 %627 = OpConstant 3.67402E-40 
                                       f32_3 %628 = OpConstantComposite %627 %627 %627 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %361 = OpVariable Function 
                               Function f32* %391 = OpVariable Function 
                               Function f32* %439 = OpVariable Function 
                               Function f32* %544 = OpVariable Function 
                               Function f32* %579 = OpVariable Function 
                               Function f32* %591 = OpVariable Function 
                               Function f32* %603 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_2 %27 = OpVectorShuffle %26 %26 0 1 
                                        f32_2 %28 = OpFDiv %14 %27 
                                        f32_4 %29 = OpLoad %9 
                                        f32_4 %30 = OpVectorShuffle %29 %28 4 5 2 3 
                                                      OpStore %9 %30 
                                        f32_4 %31 = OpLoad %9 
                                        f32_2 %32 = OpVectorShuffle %31 %31 0 1 
                                        f32_2 %33 = OpExtInst %1 8 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpVectorShuffle %34 %33 4 5 2 3 
                                                      OpStore %9 %35 
                                        f32_4 %36 = OpLoad %9 
                                        f32_2 %37 = OpVectorShuffle %36 %36 0 1 
                               Uniform f32_4* %38 = OpAccessChain %21 %23 
                                        f32_4 %39 = OpLoad %38 
                                        f32_2 %40 = OpVectorShuffle %39 %39 0 1 
                                        f32_2 %41 = OpFMul %37 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpVectorShuffle %42 %41 4 5 2 3 
                                                      OpStore %9 %43 
                               Uniform f32_4* %47 = OpAccessChain %21 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_2 %49 = OpVectorShuffle %48 %48 1 0 
                                 Uniform f32* %52 = OpAccessChain %21 %50 
                                          f32 %53 = OpLoad %52 
                                 Uniform f32* %54 = OpAccessChain %21 %50 
                                          f32 %55 = OpLoad %54 
                                        f32_2 %56 = OpCompositeConstruct %53 %55 
                                          f32 %57 = OpCompositeExtract %56 0 
                                          f32 %58 = OpCompositeExtract %56 1 
                                        f32_2 %59 = OpCompositeConstruct %57 %58 
                                        f32_2 %60 = OpFAdd %49 %59 
                                                      OpStore %45 %60 
                                 Private f32* %64 = OpAccessChain %45 %63 
                                          f32 %65 = OpLoad %64 
                                          f32 %67 = OpFMul %65 %66 
                                                      OpStore %62 %67 
                                          f32 %68 = OpLoad %62 
                                          f32 %69 = OpExtInst %1 8 %68 
                                                      OpStore %62 %69 
                                          f32 %70 = OpLoad %62 
                                          f32 %72 = OpFMul %70 %71 
                                                      OpStore %62 %72 
                                        f32_4 %73 = OpLoad %9 
                                        f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                                        f32_2 %77 = OpFMul %74 %76 
                                          f32 %78 = OpLoad %62 
                                        f32_2 %79 = OpCompositeConstruct %78 %78 
                                        f32_2 %80 = OpFAdd %77 %79 
                                        f32_4 %81 = OpLoad %9 
                                        f32_4 %82 = OpVectorShuffle %81 %80 4 5 2 3 
                                                      OpStore %9 %82 
                   read_only Texture2DSampled %90 = OpLoad %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                        f32_4 %93 = OpImageSampleImplicitLod %90 %92 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                                      OpStore %85 %94 
                                        f32_3 %96 = OpLoad %85 
                                        f32_3 %99 = OpFMul %96 %98 
                                                      OpStore %95 %99 
                                       f32_3 %100 = OpLoad %95 
                                       f32_3 %101 = OpExtInst %1 30 %100 
                                                      OpStore %95 %101 
                                       f32_3 %102 = OpLoad %95 
                                       f32_3 %105 = OpFMul %102 %104 
                                                      OpStore %95 %105 
                                       f32_3 %106 = OpLoad %95 
                                       f32_3 %107 = OpExtInst %1 29 %106 
                                                      OpStore %95 %107 
                                Private f32* %108 = OpAccessChain %45 %63 
                                         f32 %109 = OpLoad %108 
                                         f32 %110 = OpExtInst %1 13 %109 
                                Private f32* %112 = OpAccessChain %9 %111 
                                                      OpStore %112 %110 
                                Private f32* %113 = OpAccessChain %9 %111 
                                         f32 %114 = OpLoad %113 
                                         f32 %116 = OpFAdd %114 %115 
                                Private f32* %117 = OpAccessChain %9 %111 
                                                      OpStore %117 %116 
                                Private f32* %118 = OpAccessChain %9 %111 
                                         f32 %119 = OpLoad %118 
                                         f32 %121 = OpFMul %119 %120 
                                         f32 %122 = OpFAdd %121 %115 
                                Private f32* %123 = OpAccessChain %9 %111 
                                                      OpStore %123 %122 
                                       f32_4 %124 = OpLoad %9 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 0 0 
                                       f32_3 %126 = OpLoad %95 
                                       f32_3 %127 = OpFMul %125 %126 
                                       f32_4 %128 = OpLoad %9 
                                       f32_4 %129 = OpVectorShuffle %128 %127 4 5 2 6 
                                                      OpStore %9 %129 
                                       f32_4 %130 = OpLoad %9 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 3 
                                         f32 %136 = OpDot %131 %135 
                                Private f32* %137 = OpAccessChain %95 %111 
                                                      OpStore %137 %136 
                                       f32_4 %139 = OpLoad %9 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 3 
                                       f32_3 %143 = OpFMul %140 %142 
                                                      OpStore %138 %143 
                                Private f32* %144 = OpAccessChain %95 %111 
                                         f32 %145 = OpLoad %144 
                                         f32 %147 = OpFAdd %145 %146 
                                Private f32* %148 = OpAccessChain %95 %111 
                                                      OpStore %148 %147 
                                Private f32* %152 = OpAccessChain %95 %111 
                                         f32 %153 = OpLoad %152 
                                        bool %155 = OpFOrdLessThan %153 %154 
                                                      OpStore %151 %155 
                                        bool %156 = OpLoad %151 
                                         i32 %158 = OpSelect %156 %157 %46 
                                         i32 %160 = OpIMul %158 %159 
                                        bool %161 = OpINotEqual %160 %46 
                                                      OpSelectionMerge %163 None 
                                                      OpBranchConditional %161 %162 %163 
                                             %162 = OpLabel 
                                                      OpKill
                                             %163 = OpLabel 
                                Private f32* %165 = OpAccessChain %45 %111 
                                         f32 %166 = OpLoad %165 
                                Uniform f32* %168 = OpAccessChain %21 %167 
                                         f32 %169 = OpLoad %168 
                                         f32 %170 = OpFDiv %166 %169 
                                Private f32* %171 = OpAccessChain %9 %111 
                                                      OpStore %171 %170 
                                Private f32* %173 = OpAccessChain %45 %111 
                                         f32 %174 = OpLoad %173 
                                  Input f32* %176 = OpAccessChain %11 %63 
                                         f32 %177 = OpLoad %176 
                                         f32 %178 = OpFAdd %174 %177 
                                                      OpStore %172 %178 
                                         f32 %179 = OpLoad %172 
                                         f32 %180 = OpExtInst %1 13 %179 
                                                      OpStore %172 %180 
                                         f32 %181 = OpLoad %172 
                                Uniform f32* %183 = OpAccessChain %21 %182 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFMul %181 %184 
                                                      OpStore %172 %185 
                                         f32 %186 = OpLoad %172 
                                         f32 %188 = OpFMul %186 %187 
                                  Input f32* %191 = OpAccessChain %190 %111 
                                         f32 %192 = OpLoad %191 
                                         f32 %193 = OpFAdd %188 %192 
                                                      OpStore %172 %193 
                                Private f32* %194 = OpAccessChain %9 %111 
                                         f32 %195 = OpLoad %194 
                                         f32 %196 = OpExtInst %1 8 %195 
                                Private f32* %197 = OpAccessChain %9 %111 
                                                      OpStore %197 %196 
                              Uniform f32_4* %198 = OpAccessChain %21 %157 %23 
                                       f32_4 %199 = OpLoad %198 
                                       f32_2 %200 = OpVectorShuffle %199 %199 1 1 
                              Uniform f32_4* %202 = OpAccessChain %21 %201 %157 
                                       f32_4 %203 = OpLoad %202 
                                       f32_2 %204 = OpVectorShuffle %203 %203 0 1 
                                       f32_2 %205 = OpFMul %200 %204 
                                                      OpStore %45 %205 
                              Uniform f32_4* %206 = OpAccessChain %21 %201 %46 
                                       f32_4 %207 = OpLoad %206 
                                       f32_2 %208 = OpVectorShuffle %207 %207 0 1 
                              Uniform f32_4* %209 = OpAccessChain %21 %157 %23 
                                       f32_4 %210 = OpLoad %209 
                                       f32_2 %211 = OpVectorShuffle %210 %210 0 0 
                                       f32_2 %212 = OpFMul %208 %211 
                                       f32_2 %213 = OpLoad %45 
                                       f32_2 %214 = OpFAdd %212 %213 
                                                      OpStore %45 %214 
                              Uniform f32_4* %215 = OpAccessChain %21 %201 %201 
                                       f32_4 %216 = OpLoad %215 
                                       f32_2 %217 = OpVectorShuffle %216 %216 0 1 
                              Uniform f32_4* %218 = OpAccessChain %21 %157 %23 
                                       f32_4 %219 = OpLoad %218 
                                       f32_2 %220 = OpVectorShuffle %219 %219 2 2 
                                       f32_2 %221 = OpFMul %217 %220 
                                       f32_2 %222 = OpLoad %45 
                                       f32_2 %223 = OpFAdd %221 %222 
                                                      OpStore %45 %223 
                              Uniform f32_4* %224 = OpAccessChain %21 %201 %23 
                                       f32_4 %225 = OpLoad %224 
                                       f32_2 %226 = OpVectorShuffle %225 %225 0 1 
                              Uniform f32_4* %227 = OpAccessChain %21 %157 %23 
                                       f32_4 %228 = OpLoad %227 
                                       f32_2 %229 = OpVectorShuffle %228 %228 3 3 
                                       f32_2 %230 = OpFMul %226 %229 
                                       f32_2 %231 = OpLoad %45 
                                       f32_2 %232 = OpFAdd %230 %231 
                                                      OpStore %45 %232 
                                Private f32* %233 = OpAccessChain %9 %111 
                                         f32 %234 = OpLoad %233 
                                Uniform f32* %235 = OpAccessChain %21 %167 
                                         f32 %236 = OpLoad %235 
                                         f32 %237 = OpFMul %234 %236 
                                Private f32* %238 = OpAccessChain %45 %111 
                                         f32 %239 = OpLoad %238 
                                         f32 %240 = OpFAdd %237 %239 
                                Private f32* %241 = OpAccessChain %9 %111 
                                                      OpStore %241 %240 
                                Private f32* %242 = OpAccessChain %45 %63 
                                         f32 %243 = OpLoad %242 
                                Private f32* %244 = OpAccessChain %9 %111 
                                         f32 %245 = OpLoad %244 
                                         f32 %246 = OpFAdd %243 %245 
                                Private f32* %247 = OpAccessChain %9 %111 
                                                      OpStore %247 %246 
                                Private f32* %248 = OpAccessChain %9 %111 
                                         f32 %249 = OpLoad %248 
                                         f32 %251 = OpFAdd %249 %250 
                                Private f32* %252 = OpAccessChain %45 %111 
                                                      OpStore %252 %251 
                                       f32_2 %253 = OpLoad %45 
                                       f32_2 %254 = OpVectorShuffle %253 %253 0 0 
                                       f32_2 %258 = OpFMul %254 %257 
                                                      OpStore %45 %258 
                                       f32_2 %259 = OpLoad %45 
                                       f32_2 %260 = OpExtInst %1 13 %259 
                                                      OpStore %45 %260 
                                       f32_2 %261 = OpLoad %45 
                                       f32_2 %264 = OpFMul %261 %263 
                                                      OpStore %45 %264 
                                       f32_2 %265 = OpLoad %45 
                                       f32_2 %266 = OpExtInst %1 10 %265 
                                                      OpStore %45 %266 
                                       f32_2 %267 = OpLoad %45 
                                       f32_2 %270 = OpFAdd %267 %269 
                                                      OpStore %45 %270 
                                Private f32* %272 = OpAccessChain %45 %63 
                                         f32 %273 = OpLoad %272 
                                         f32 %275 = OpFMul %273 %274 
                                         f32 %276 = OpFAdd %275 %75 
                                                      OpStore %271 %276 
                                  Input f32* %277 = OpAccessChain %190 %63 
                                         f32 %278 = OpLoad %277 
                                         f32 %279 = OpLoad %271 
                                         f32 %280 = OpFDiv %278 %279 
                                                      OpStore %271 %280 
                                         f32 %281 = OpLoad %271 
                                         f32 %282 = OpExtInst %1 8 %281 
                                                      OpStore %271 %282 
                                Private f32* %283 = OpAccessChain %9 %111 
                                         f32 %284 = OpLoad %283 
                                         f32 %285 = OpLoad %271 
                                         f32 %286 = OpFAdd %284 %285 
                                                      OpStore %62 %286 
                                Private f32* %287 = OpAccessChain %9 %111 
                                         f32 %288 = OpLoad %287 
                                         f32 %289 = OpFNegate %288 
                                         f32 %290 = OpLoad %271 
                                         f32 %291 = OpFAdd %289 %290 
                                                      OpStore %271 %291 
                                       f32_4 %293 = OpLoad %9 
                                       f32_4 %294 = OpVectorShuffle %293 %293 0 0 0 0 
                                       f32_4 %298 = OpFMul %294 %297 
                                                      OpStore %292 %298 
                                       f32_4 %299 = OpLoad %292 
                                       f32_4 %300 = OpExtInst %1 13 %299 
                                                      OpStore %292 %300 
                                       f32_4 %301 = OpLoad %292 
                                       f32_4 %303 = OpFMul %301 %302 
                                                      OpStore %292 %303 
                                       f32_4 %304 = OpLoad %292 
                                       f32_4 %305 = OpExtInst %1 10 %304 
                                                      OpStore %292 %305 
                                         f32 %306 = OpLoad %62 
                                         f32 %308 = OpFMul %306 %307 
                                Private f32* %309 = OpAccessChain %9 %111 
                                                      OpStore %309 %308 
                                         f32 %310 = OpLoad %271 
                                         f32 %312 = OpFMul %310 %311 
                                Private f32* %313 = OpAccessChain %9 %111 
                                         f32 %314 = OpLoad %313 
                                         f32 %315 = OpFAdd %312 %314 
                                Private f32* %316 = OpAccessChain %9 %111 
                                                      OpStore %316 %315 
                                Private f32* %317 = OpAccessChain %9 %111 
                                         f32 %318 = OpLoad %317 
                                         f32 %319 = OpExtInst %1 13 %318 
                                Private f32* %320 = OpAccessChain %9 %111 
                                                      OpStore %320 %319 
                                Private f32* %321 = OpAccessChain %9 %111 
                                         f32 %322 = OpLoad %321 
                                         f32 %323 = OpFMul %322 %262 
                                Private f32* %324 = OpAccessChain %9 %111 
                                                      OpStore %324 %323 
                                Private f32* %325 = OpAccessChain %9 %111 
                                         f32 %326 = OpLoad %325 
                                         f32 %327 = OpExtInst %1 10 %326 
                                Private f32* %328 = OpAccessChain %9 %111 
                                                      OpStore %328 %327 
                                Private f32* %329 = OpAccessChain %9 %111 
                                         f32 %330 = OpLoad %329 
                                         f32 %331 = OpFAdd %330 %268 
                                Private f32* %332 = OpAccessChain %9 %111 
                                                      OpStore %332 %331 
                                Private f32* %333 = OpAccessChain %9 %111 
                                         f32 %334 = OpLoad %333 
                                Uniform f32* %336 = OpAccessChain %21 %335 
                                         f32 %337 = OpLoad %336 
                                         f32 %338 = OpFMul %334 %337 
                                         f32 %339 = OpLoad %172 
                                         f32 %340 = OpFAdd %338 %339 
                                Private f32* %341 = OpAccessChain %9 %111 
                                                      OpStore %341 %340 
                                Private f32* %343 = OpAccessChain %9 %111 
                                         f32 %344 = OpLoad %343 
                                Private f32* %345 = OpAccessChain %9 %111 
                                         f32 %346 = OpLoad %345 
                                         f32 %347 = OpFNegate %346 
                                        bool %348 = OpFOrdGreaterThanEqual %344 %347 
                                                      OpStore %342 %348 
                                Private f32* %349 = OpAccessChain %9 %111 
                                         f32 %350 = OpLoad %349 
                                         f32 %351 = OpExtInst %1 4 %350 
                                         f32 %352 = OpExtInst %1 10 %351 
                                                      OpStore %62 %352 
                                Private f32* %353 = OpAccessChain %9 %111 
                                         f32 %354 = OpLoad %353 
                                Private f32* %355 = OpAccessChain %9 %111 
                                                      OpStore %355 %354 
                                Private f32* %356 = OpAccessChain %9 %111 
                                         f32 %357 = OpLoad %356 
                                         f32 %358 = OpExtInst %1 43 %357 %154 %115 
                                Private f32* %359 = OpAccessChain %9 %111 
                                                      OpStore %359 %358 
                                        bool %362 = OpLoad %342 
                                                      OpSelectionMerge %364 None 
                                                      OpBranchConditional %362 %363 %366 
                                             %363 = OpLabel 
                                         f32 %365 = OpLoad %62 
                                                      OpStore %361 %365 
                                                      OpBranch %364 
                                             %366 = OpLabel 
                                         f32 %367 = OpLoad %62 
                                         f32 %368 = OpFNegate %367 
                                                      OpStore %361 %368 
                                                      OpBranch %364 
                                             %364 = OpLabel 
                                         f32 %369 = OpLoad %361 
                                                      OpStore %271 %369 
                                Uniform f32* %374 = OpAccessChain %21 %373 
                                         f32 %375 = OpLoad %374 
                                Uniform f32* %377 = OpAccessChain %21 %376 
                                         f32 %378 = OpLoad %377 
                                Uniform f32* %379 = OpAccessChain %21 %373 
                                         f32 %380 = OpLoad %379 
                                Uniform f32* %381 = OpAccessChain %21 %373 
                                         f32 %382 = OpLoad %381 
                                       f32_4 %383 = OpCompositeConstruct %375 %378 %380 %382 
                                      bool_4 %386 = OpFOrdEqual %383 %384 
                                      bool_2 %388 = OpVectorShuffle %386 %386 0 1 
                                      bool_3 %389 = OpLoad %372 
                                      bool_3 %390 = OpVectorShuffle %389 %388 3 4 2 
                                                      OpStore %372 %390 
                                      bool_3 %392 = OpLoad %372 
                                        bool %393 = OpCompositeExtract %392 0 
                                                      OpSelectionMerge %395 None 
                                                      OpBranchConditional %393 %394 %397 
                                             %394 = OpLabel 
                                         f32 %396 = OpLoad %271 
                                                      OpStore %391 %396 
                                                      OpBranch %395 
                                             %397 = OpLabel 
                                Private f32* %398 = OpAccessChain %9 %111 
                                         f32 %399 = OpLoad %398 
                                                      OpStore %391 %399 
                                                      OpBranch %395 
                                             %395 = OpLabel 
                                         f32 %400 = OpLoad %391 
                                Private f32* %401 = OpAccessChain %9 %111 
                                                      OpStore %401 %400 
                                       f32_4 %402 = OpLoad %292 
                                       f32_4 %403 = OpVectorShuffle %402 %402 0 0 1 0 
                                Uniform f32* %405 = OpAccessChain %21 %404 
                                         f32 %406 = OpLoad %405 
                                Uniform f32* %407 = OpAccessChain %21 %404 
                                         f32 %408 = OpLoad %407 
                                Uniform f32* %410 = OpAccessChain %21 %409 
                                         f32 %411 = OpLoad %410 
                                Uniform f32* %412 = OpAccessChain %21 %404 
                                         f32 %413 = OpLoad %412 
                                       f32_4 %414 = OpCompositeConstruct %406 %408 %411 %413 
                                      bool_4 %415 = OpFOrdLessThan %403 %414 
                                      bool_2 %416 = OpVectorShuffle %415 %415 0 2 
                                      bool_3 %417 = OpLoad %372 
                                      bool_3 %418 = OpVectorShuffle %417 %416 3 1 4 
                                                      OpStore %372 %418 
                                       f32_4 %419 = OpLoad %292 
                                       f32_2 %420 = OpVectorShuffle %419 %419 2 3 
                                       f32_2 %421 = OpFAdd %420 %269 
                                       f32_4 %422 = OpLoad %292 
                                       f32_4 %423 = OpVectorShuffle %422 %421 4 5 2 3 
                                                      OpStore %292 %423 
                                Uniform f32* %425 = OpAccessChain %21 %424 
                                         f32 %426 = OpLoad %425 
                                        bool %427 = OpFOrdEqual %426 %115 
                                                      OpStore %342 %427 
                                        bool %428 = OpLoad %342 
                                      bool_3 %429 = OpLoad %372 
                                        bool %430 = OpCompositeExtract %429 0 
                                        bool %431 = OpLogicalAnd %428 %430 
                                                      OpStore %342 %431 
                                      bool_3 %432 = OpLoad %372 
                                        bool %433 = OpCompositeExtract %432 1 
                                      bool_3 %434 = OpLoad %372 
                                        bool %435 = OpCompositeExtract %434 2 
                                        bool %436 = OpLogicalAnd %433 %435 
                                      bool_3 %437 = OpLoad %372 
                                      bool_3 %438 = OpCompositeInsert %436 %437 0 
                                                      OpStore %372 %438 
                                        bool %440 = OpLoad %342 
                                                      OpSelectionMerge %442 None 
                                                      OpBranchConditional %440 %441 %445 
                                             %441 = OpLabel 
                                Private f32* %443 = OpAccessChain %9 %111 
                                         f32 %444 = OpLoad %443 
                                                      OpStore %439 %444 
                                                      OpBranch %442 
                                             %445 = OpLabel 
                                         f32 %446 = OpLoad %172 
                                                      OpStore %439 %446 
                                                      OpBranch %442 
                                             %442 = OpLabel 
                                         f32 %447 = OpLoad %439 
                                Private f32* %448 = OpAccessChain %9 %111 
                                                      OpStore %448 %447 
                                Private f32* %450 = OpAccessChain %45 %111 
                                         f32 %451 = OpLoad %450 
                                Uniform f32* %453 = OpAccessChain %21 %452 
                                         f32 %454 = OpLoad %453 
                                         f32 %455 = OpFMul %451 %454 
                                Private f32* %456 = OpAccessChain %9 %111 
                                         f32 %457 = OpLoad %456 
                                         f32 %458 = OpFAdd %455 %457 
                                Private f32* %459 = OpAccessChain %449 %111 
                                                      OpStore %459 %458 
                                Private f32* %460 = OpAccessChain %45 %111 
                                         f32 %461 = OpLoad %460 
                                Uniform f32* %462 = OpAccessChain %21 %452 
                                         f32 %463 = OpLoad %462 
                                         f32 %464 = OpFMul %461 %463 
                                  Input f32* %465 = OpAccessChain %190 %63 
                                         f32 %466 = OpLoad %465 
                                         f32 %467 = OpFAdd %464 %466 
                                Private f32* %468 = OpAccessChain %449 %63 
                                                      OpStore %468 %467 
                  read_only Texture2DSampled %471 = OpLoad %470 
                                       f32_4 %472 = OpLoad %449 
                                       f32_2 %473 = OpVectorShuffle %472 %472 0 1 
                                       f32_4 %474 = OpImageSampleImplicitLod %471 %473 
                                       f32_2 %475 = OpVectorShuffle %474 %474 2 3 
                                                      OpStore %469 %475 
                                       f32_4 %476 = OpLoad %292 
                                       f32_2 %477 = OpVectorShuffle %476 %476 0 1 
                                Uniform f32* %478 = OpAccessChain %21 %452 
                                         f32 %479 = OpLoad %478 
                                Uniform f32* %480 = OpAccessChain %21 %452 
                                         f32 %481 = OpLoad %480 
                                       f32_2 %482 = OpCompositeConstruct %479 %481 
                                         f32 %483 = OpCompositeExtract %482 0 
                                         f32 %484 = OpCompositeExtract %482 1 
                                       f32_2 %485 = OpCompositeConstruct %483 %484 
                                       f32_2 %486 = OpFMul %477 %485 
                                       f32_4 %487 = OpLoad %9 
                                       f32_2 %488 = OpVectorShuffle %487 %487 0 0 
                                       f32_2 %489 = OpFAdd %486 %488 
                                       f32_4 %490 = OpLoad %449 
                                       f32_4 %491 = OpVectorShuffle %490 %489 4 5 2 3 
                                                      OpStore %449 %491 
                                       f32_4 %492 = OpLoad %292 
                                       f32_2 %493 = OpVectorShuffle %492 %492 0 1 
                                Uniform f32* %494 = OpAccessChain %21 %452 
                                         f32 %495 = OpLoad %494 
                                Uniform f32* %496 = OpAccessChain %21 %452 
                                         f32 %497 = OpLoad %496 
                                       f32_2 %498 = OpCompositeConstruct %495 %497 
                                         f32 %499 = OpCompositeExtract %498 0 
                                         f32 %500 = OpCompositeExtract %498 1 
                                       f32_2 %501 = OpCompositeConstruct %499 %500 
                                       f32_2 %502 = OpFMul %493 %501 
                                       f32_2 %503 = OpLoad %190 
                                       f32_2 %504 = OpVectorShuffle %503 %503 1 1 
                                       f32_2 %505 = OpFAdd %502 %504 
                                       f32_4 %506 = OpLoad %449 
                                       f32_4 %507 = OpVectorShuffle %506 %505 0 1 4 5 
                                                      OpStore %449 %507 
                  read_only Texture2DSampled %509 = OpLoad %470 
                                       f32_4 %510 = OpLoad %449 
                                       f32_2 %511 = OpVectorShuffle %510 %510 0 2 
                                       f32_4 %512 = OpImageSampleImplicitLod %509 %511 
                                       f32_2 %513 = OpVectorShuffle %512 %512 0 3 
                                                      OpStore %508 %513 
                  read_only Texture2DSampled %515 = OpLoad %470 
                                       f32_4 %516 = OpLoad %449 
                                       f32_2 %517 = OpVectorShuffle %516 %516 1 3 
                                       f32_4 %518 = OpImageSampleImplicitLod %515 %517 
                                       f32_2 %519 = OpVectorShuffle %518 %518 1 3 
                                                      OpStore %514 %519 
                                Private f32* %520 = OpAccessChain %508 %63 
                                         f32 %521 = OpLoad %520 
                                Private f32* %522 = OpAccessChain %514 %63 
                                         f32 %523 = OpLoad %522 
                                         f32 %524 = OpFAdd %521 %523 
                                Private f32* %525 = OpAccessChain %95 %111 
                                                      OpStore %525 %524 
                                Private f32* %526 = OpAccessChain %469 %63 
                                         f32 %527 = OpLoad %526 
                                Private f32* %528 = OpAccessChain %95 %111 
                                         f32 %529 = OpLoad %528 
                                         f32 %530 = OpFAdd %527 %529 
                                Private f32* %531 = OpAccessChain %95 %111 
                                                      OpStore %531 %530 
                                Private f32* %532 = OpAccessChain %95 %111 
                                         f32 %533 = OpLoad %532 
                                         f32 %535 = OpFMul %533 %534 
                                Private f32* %536 = OpAccessChain %95 %111 
                                                      OpStore %536 %535 
                                  Input f32* %537 = OpAccessChain %190 %63 
                                         f32 %538 = OpLoad %537 
                                Private f32* %539 = OpAccessChain %9 %63 
                                                      OpStore %539 %538 
                  read_only Texture2DSampled %540 = OpLoad %470 
                                       f32_4 %541 = OpLoad %9 
                                       f32_2 %542 = OpVectorShuffle %541 %541 0 1 
                                       f32_4 %543 = OpImageSampleImplicitLod %540 %542 
                                                      OpStore %449 %543 
                                      bool_3 %545 = OpLoad %372 
                                        bool %546 = OpCompositeExtract %545 0 
                                                      OpSelectionMerge %548 None 
                                                      OpBranchConditional %546 %547 %551 
                                             %547 = OpLabel 
                                Private f32* %549 = OpAccessChain %95 %111 
                                         f32 %550 = OpLoad %549 
                                                      OpStore %544 %550 
                                                      OpBranch %548 
                                             %551 = OpLabel 
                                Private f32* %553 = OpAccessChain %449 %552 
                                         f32 %554 = OpLoad %553 
                                                      OpStore %544 %554 
                                                      OpBranch %548 
                                             %548 = OpLabel 
                                         f32 %555 = OpLoad %544 
                                Private f32* %556 = OpAccessChain %95 %111 
                                                      OpStore %556 %555 
                                Private f32* %558 = OpAccessChain %95 %111 
                                         f32 %559 = OpLoad %558 
                                         f32 %561 = OpFAdd %559 %560 
                                Private f32* %562 = OpAccessChain %557 %111 
                                                      OpStore %562 %561 
                                Private f32* %565 = OpAccessChain %95 %111 
                                         f32 %566 = OpLoad %565 
                                 Output f32* %568 = OpAccessChain %564 %552 
                                                      OpStore %568 %566 
                                Private f32* %569 = OpAccessChain %557 %111 
                                         f32 %570 = OpLoad %569 
                                        bool %571 = OpFOrdLessThan %570 %154 
                                                      OpStore %151 %571 
                                        bool %572 = OpLoad %151 
                                         i32 %573 = OpSelect %572 %157 %46 
                                         i32 %574 = OpIMul %573 %159 
                                        bool %575 = OpINotEqual %574 %46 
                                                      OpSelectionMerge %577 None 
                                                      OpBranchConditional %575 %576 %577 
                                             %576 = OpLabel 
                                                      OpKill
                                             %577 = OpLabel 
                                      bool_3 %580 = OpLoad %372 
                                        bool %581 = OpCompositeExtract %580 0 
                                                      OpSelectionMerge %583 None 
                                                      OpBranchConditional %581 %582 %586 
                                             %582 = OpLabel 
                                Private f32* %584 = OpAccessChain %508 %111 
                                         f32 %585 = OpLoad %584 
                                                      OpStore %579 %585 
                                                      OpBranch %583 
                                             %586 = OpLabel 
                                Private f32* %587 = OpAccessChain %449 %111 
                                         f32 %588 = OpLoad %587 
                                                      OpStore %579 %588 
                                                      OpBranch %583 
                                             %583 = OpLabel 
                                         f32 %589 = OpLoad %579 
                                Private f32* %590 = OpAccessChain %557 %111 
                                                      OpStore %590 %589 
                                      bool_3 %592 = OpLoad %372 
                                        bool %593 = OpCompositeExtract %592 0 
                                                      OpSelectionMerge %595 None 
                                                      OpBranchConditional %593 %594 %598 
                                             %594 = OpLabel 
                                Private f32* %596 = OpAccessChain %514 %111 
                                         f32 %597 = OpLoad %596 
                                                      OpStore %591 %597 
                                                      OpBranch %595 
                                             %598 = OpLabel 
                                Private f32* %599 = OpAccessChain %449 %63 
                                         f32 %600 = OpLoad %599 
                                                      OpStore %591 %600 
                                                      OpBranch %595 
                                             %595 = OpLabel 
                                         f32 %601 = OpLoad %591 
                                Private f32* %602 = OpAccessChain %557 %63 
                                                      OpStore %602 %601 
                                      bool_3 %604 = OpLoad %372 
                                        bool %605 = OpCompositeExtract %604 0 
                                                      OpSelectionMerge %607 None 
                                                      OpBranchConditional %605 %606 %610 
                                             %606 = OpLabel 
                                Private f32* %608 = OpAccessChain %469 %111 
                                         f32 %609 = OpLoad %608 
                                                      OpStore %603 %609 
                                                      OpBranch %607 
                                             %610 = OpLabel 
                                Private f32* %612 = OpAccessChain %449 %611 
                                         f32 %613 = OpLoad %612 
                                                      OpStore %603 %613 
                                                      OpBranch %607 
                                             %607 = OpLabel 
                                         f32 %614 = OpLoad %603 
                                Private f32* %615 = OpAccessChain %557 %611 
                                                      OpStore %615 %614 
                                       f32_3 %616 = OpLoad %557 
                                         f32 %617 = OpDot %616 %135 
                                Private f32* %618 = OpAccessChain %95 %111 
                                                      OpStore %618 %617 
                                       f32_3 %619 = OpLoad %138 
                                       f32_3 %620 = OpLoad %95 
                                       f32_3 %621 = OpVectorShuffle %620 %620 0 0 0 
                                       f32_3 %622 = OpFMul %619 %621 
                                       f32_3 %623 = OpLoad %557 
                                       f32_3 %624 = OpFNegate %623 
                                       f32_3 %625 = OpFAdd %622 %624 
                                                      OpStore %95 %625 
                                       f32_3 %626 = OpLoad %95 
                                       f32_3 %629 = OpFMul %626 %628 
                                       f32_3 %630 = OpLoad %557 
                                       f32_3 %631 = OpFAdd %629 %630 
                                       f32_4 %632 = OpLoad %564 
                                       f32_4 %633 = OpVectorShuffle %632 %631 4 5 6 3 
                                                      OpStore %564 %633 
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