//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/FinalGunRoom_BG_02" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_Octaves ("Octaves", Float) = 8
_Frequency ("Frequency", Float) = 1
_Amplitude ("Amplitude", Float) = 1
_Lacunarity ("Lacunarity", Float) = 1.92
_Lacuna2 ("Lacuna 2", Float) = 1
_Persistence ("Persistence", Float) = 0.8
_SteppyStep ("Step", Float) = 0.1
_Offset ("Offset", Vector) = (0,0,0,0)
_ThunderProgress ("Thunder Progress", Range(0, 1)) = 0
}
SubShader {
 Pass {
  GpuProgramID 21448
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
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 _SinTime;
uniform 	float _Octaves;
uniform 	float _Frequency;
uniform 	float _Amplitude;
uniform 	vec2 _Offset;
uniform 	float _Lacunarity;
uniform 	float _Lacuna2;
uniform 	float _Persistence;
uniform 	float _SteppyStep;
uniform 	float _ThunderProgress;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
vec4 u_xlat10_1;
int u_xlati1;
float u_xlat2;
int u_xlati2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec2 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
vec2 u_xlat9;
int u_xlati9;
bool u_xlatb9;
float u_xlat14;
vec2 u_xlat16;
bool u_xlatb16;
vec2 u_xlat17;
vec2 u_xlat18;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
float u_xlat23;
void main()
{
    u_xlat0.xz = _SinTime.xx * vec2(0.25, 0.25) + _Offset.xx;
    u_xlat0.yw = _Time.xx * vec2(0.666666687, 0.666666687) + _Offset.yy;
    u_xlati1 = int(_Octaves);
    u_xlat0 = u_xlat0 + vs_TEXCOORD0.xyxy;
    u_xlat8.xy = vec2(_Frequency, _Amplitude);
    u_xlat22 = 0.0;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati1 ; u_xlati_loop_1++)
    {
        u_xlat9.xy = u_xlat0.zw * u_xlat8.xx;
        u_xlat3.xy = floor(u_xlat9.xy);
        u_xlat3.zw = u_xlat3.xy + vec2(1.0, 1.0);
        u_xlat4 = u_xlat0.zwzw * u_xlat8.xxxx + (-u_xlat3);
        u_xlat5 = u_xlat3 * vec4(0.0140845068, 0.0140845068, 0.0140845068, 0.0140845068);
        u_xlat5 = floor(u_xlat5);
        u_xlat3 = (-u_xlat5) * vec4(71.0, 71.0, 71.0, 71.0) + u_xlat3;
        u_xlat3 = u_xlat3 + vec4(26.0, 161.0, 26.0, 161.0);
        u_xlat3 = u_xlat3 * u_xlat3;
        u_xlat3 = u_xlat3.yyww * u_xlat3.xzxz;
        u_xlat5 = u_xlat3 * vec4(0.00105137471, 0.00105137471, 0.00105137471, 0.00105137471);
        u_xlat5 = fract(u_xlat5);
        u_xlat3 = u_xlat3 * vec4(0.00155533117, 0.00155533117, 0.00155533117, 0.00155533117);
        u_xlat3 = fract(u_xlat3);
        u_xlat5 = u_xlat5 + vec4(-0.499989986, -0.499989986, -0.499989986, -0.499989986);
        u_xlat3 = u_xlat3 + vec4(-0.499989986, -0.499989986, -0.499989986, -0.499989986);
        u_xlat6 = u_xlat3 * u_xlat3;
        u_xlat6 = u_xlat5 * u_xlat5 + u_xlat6;
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat3 = u_xlat4.yyww * u_xlat3;
        u_xlat3 = u_xlat5 * u_xlat4.xzxz + u_xlat3;
        u_xlat3 = u_xlat3 * u_xlat6;
        u_xlat9.xy = u_xlat3.xy * vec2(1.41421354, 1.41421354);
        u_xlat3.xy = u_xlat4.xy * u_xlat4.xy;
        u_xlat3.xy = u_xlat4.xy * u_xlat3.xy;
        u_xlat18.xy = u_xlat4.xy * vec2(6.0, 6.0) + vec2(-15.0, -15.0);
        u_xlat4.xy = u_xlat4.xy * u_xlat18.xy + vec2(10.0, 10.0);
        u_xlat3.xy = u_xlat3.xy * u_xlat4.xy;
        u_xlat17.xy = u_xlat3.zw * vec2(1.41421354, 1.41421354) + (-u_xlat9.xy);
        u_xlat9.xy = u_xlat3.yy * u_xlat17.xy + u_xlat9.xy;
        u_xlat16.x = (-u_xlat9.x) + u_xlat9.y;
        u_xlat9.x = u_xlat3.x * u_xlat16.x + u_xlat9.x;
        u_xlat22 = u_xlat9.x * u_xlat8.y + u_xlat22;
        u_xlat8.x = u_xlat8.x * _Lacunarity;
        u_xlat8.y = u_xlat8.y * _Persistence;
    }
    u_xlat8.xy = vec2(_Frequency, _Amplitude);
    u_xlat2 = float(0.0);
    for(int u_xlati_loop_2 = int(0) ; u_xlati_loop_2<u_xlati1 ; u_xlati_loop_2++)
    {
        u_xlat16.xy = u_xlat0.zw * u_xlat8.xx;
        u_xlat3.xy = floor(u_xlat16.xy);
        u_xlat3.zw = u_xlat3.xy + vec2(1.0, 1.0);
        u_xlat4 = u_xlat0 * u_xlat8.xxxx + (-u_xlat3);
        u_xlat5 = u_xlat3 * vec4(0.0140845068, 0.0140845068, 0.0140845068, 0.0140845068);
        u_xlat5 = floor(u_xlat5);
        u_xlat3 = (-u_xlat5) * vec4(71.0, 71.0, 71.0, 71.0) + u_xlat3;
        u_xlat3 = u_xlat3 + vec4(26.0, 161.0, 26.0, 161.0);
        u_xlat3 = u_xlat3 * u_xlat3;
        u_xlat3 = u_xlat3.yyww * u_xlat3.xzxz;
        u_xlat5 = u_xlat3 * vec4(0.00105137471, 0.00105137471, 0.00105137471, 0.00105137471);
        u_xlat5 = fract(u_xlat5);
        u_xlat3 = u_xlat3 * vec4(0.00155533117, 0.00155533117, 0.00155533117, 0.00155533117);
        u_xlat3 = fract(u_xlat3);
        u_xlat5 = u_xlat5 + vec4(-0.499989986, -0.499989986, -0.499989986, -0.499989986);
        u_xlat3 = u_xlat3 + vec4(-0.499989986, -0.499989986, -0.499989986, -0.499989986);
        u_xlat6 = u_xlat3 * u_xlat3;
        u_xlat6 = u_xlat5 * u_xlat5 + u_xlat6;
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat3 = u_xlat4.yyww * u_xlat3;
        u_xlat3 = u_xlat5 * u_xlat4.xzxz + u_xlat3;
        u_xlat3 = u_xlat3 * u_xlat6;
        u_xlat16.xy = u_xlat3.xy * vec2(1.41421354, 1.41421354);
        u_xlat3.xy = u_xlat4.xy * u_xlat4.xy;
        u_xlat3.xy = u_xlat4.xy * u_xlat3.xy;
        u_xlat18.xy = u_xlat4.xy * vec2(6.0, 6.0) + vec2(-15.0, -15.0);
        u_xlat4.xy = u_xlat4.xy * u_xlat18.xy + vec2(10.0, 10.0);
        u_xlat3.xy = u_xlat3.xy * u_xlat4.xy;
        u_xlat17.xy = u_xlat3.zw * vec2(1.41421354, 1.41421354) + (-u_xlat16.xy);
        u_xlat16.xy = u_xlat3.yy * u_xlat17.xy + u_xlat16.xy;
        u_xlat23 = (-u_xlat16.x) + u_xlat16.y;
        u_xlat16.x = u_xlat3.x * u_xlat23 + u_xlat16.x;
        u_xlat2 = u_xlat16.x * u_xlat8.y + u_xlat2;
        u_xlat8.x = u_xlat8.x * _Lacuna2;
        u_xlat8.y = u_xlat8.y * _Persistence;
    }
    u_xlat0.x = u_xlat22 + u_xlat2;
    u_xlat0.x = _Time.x * 4.0 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat7.x = u_xlat0.x + u_xlat0.x;
    u_xlatb7 = u_xlat7.x>=(-u_xlat7.x);
    u_xlat7.xy = (bool(u_xlatb7)) ? vec2(2.0, 0.5) : vec2(-2.0, -0.5);
    u_xlat0.x = u_xlat7.y * u_xlat0.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat7.x * u_xlat0.x + -1.0;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = abs(u_xlat0.x) / _SteppyStep;
    u_xlat0.x = roundEven(u_xlat0.x);
    u_xlat7.x = u_xlat0.x * _SteppyStep;
    u_xlat14 = _SteppyStep * u_xlat0.x + _ThunderProgress;
    u_xlatb21 = u_xlat14>=(-u_xlat14);
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat14 = u_xlat21 * u_xlat14;
    u_xlat14 = fract(u_xlat14);
    u_xlat14 = u_xlat21 * u_xlat14 + -0.899999976;
    u_xlat14 = max(u_xlat14, 0.0);
    u_xlat7.x = u_xlat7.x * u_xlat14;
    u_xlat1.x = (-_SteppyStep) * u_xlat0.x + 1.0;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.y = 0.0;
    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
    u_xlat0.xyz = u_xlat7.xxx * vec3(5.0, 3.0, 3.0);
    u_xlat0.w = 0.0;
    SV_Target0 = u_xlat10_1 * vec4(0.75, 0.75, 0.75, 0.75) + u_xlat0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 97
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %82 %83 %87 %89 
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
                                              OpDecorate %82 RelaxedPrecision 
                                              OpDecorate %82 Location 82 
                                              OpDecorate %83 Location 83 
                                              OpDecorate %87 Location 87 
                                              OpDecorate %89 Location 89 
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
                        Output f32_4* %82 = OpVariable Output 
                         Input f32_4* %83 = OpVariable Input 
                                      %85 = OpTypeVector %6 2 
                                      %86 = OpTypePointer Output %85 
                        Output f32_2* %87 = OpVariable Output 
                                      %88 = OpTypePointer Input %85 
                         Input f32_2* %89 = OpVariable Input 
                                      %91 = OpTypePointer Output %6 
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
                                f32_4 %84 = OpLoad %83 
                                              OpStore %82 %84 
                                f32_2 %90 = OpLoad %89 
                                              OpStore %87 %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                  f32 %93 = OpLoad %92 
                                  f32 %94 = OpFNegate %93 
                          Output f32* %95 = OpAccessChain %72 %22 %68 
                                              OpStore %95 %94 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 613
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %59 %601 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpMemberDecorate %11 0 Offset 11 
                                                      OpMemberDecorate %11 1 Offset 11 
                                                      OpMemberDecorate %11 2 RelaxedPrecision 
                                                      OpMemberDecorate %11 2 Offset 11 
                                                      OpMemberDecorate %11 3 Offset 11 
                                                      OpMemberDecorate %11 4 Offset 11 
                                                      OpMemberDecorate %11 5 Offset 11 
                                                      OpMemberDecorate %11 6 Offset 11 
                                                      OpMemberDecorate %11 7 Offset 11 
                                                      OpMemberDecorate %11 8 Offset 11 
                                                      OpMemberDecorate %11 9 Offset 11 
                                                      OpMemberDecorate %11 10 Offset 11 
                                                      OpDecorate %11 Block 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %59 Location 59 
                                                      OpDecorate %581 RelaxedPrecision 
                                                      OpDecorate %585 RelaxedPrecision 
                                                      OpDecorate %585 DescriptorSet 585 
                                                      OpDecorate %585 Binding 585 
                                                      OpDecorate %586 RelaxedPrecision 
                                                      OpDecorate %601 Location 601 
                                                      OpDecorate %602 RelaxedPrecision 
                                                      OpDecorate %605 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypeStruct %7 %7 %6 %6 %6 %10 %6 %6 %6 %6 %6 
                                              %12 = OpTypePointer Uniform %11 
Uniform struct {f32_4; f32_4; f32; f32; f32; f32_2; f32; f32; f32; f32; f32;}* %13 = OpVariable Uniform 
                                              %14 = OpTypeInt 32 1 
                                          i32 %15 = OpConstant 1 
                                              %16 = OpTypePointer Uniform %7 
                                          f32 %20 = OpConstant 3.67402E-40 
                                        f32_2 %21 = OpConstantComposite %20 %20 
                                          i32 %23 = OpConstant 5 
                                              %24 = OpTypeInt 32 0 
                                          u32 %25 = OpConstant 0 
                                              %26 = OpTypePointer Uniform %6 
                                          i32 %35 = OpConstant 0 
                                          f32 %39 = OpConstant 3.67402E-40 
                                        f32_2 %40 = OpConstantComposite %39 %39 
                                          u32 %42 = OpConstant 1 
                                              %51 = OpTypePointer Private %14 
                                 Private i32* %52 = OpVariable Private 
                                          i32 %53 = OpConstant 2 
                                              %58 = OpTypePointer Input %10 
                                 Input f32_2* %59 = OpVariable Input 
                                              %63 = OpTypePointer Private %10 
                               Private f32_2* %64 = OpVariable Private 
                                          i32 %65 = OpConstant 3 
                                          i32 %68 = OpConstant 4 
                                              %72 = OpTypePointer Private %6 
                                 Private f32* %73 = OpVariable Private 
                                          f32 %74 = OpConstant 3.67402E-40 
                                              %75 = OpTypePointer Function %14 
                                              %84 = OpTypeBool 
                               Private f32_2* %86 = OpVariable Private 
                               Private f32_4* %92 = OpVariable Private 
                                          f32 %99 = OpConstant 3.67402E-40 
                                       f32_2 %100 = OpConstantComposite %99 %99 
                              Private f32_4* %104 = OpVariable Private 
                              Private f32_4* %113 = OpVariable Private 
                                         f32 %115 = OpConstant 3.67402E-40 
                                       f32_4 %116 = OpConstantComposite %115 %115 %115 %115 
                                         f32 %122 = OpConstant 3.67402E-40 
                                       f32_4 %123 = OpConstantComposite %122 %122 %122 %122 
                                         f32 %128 = OpConstant 3.67402E-40 
                                         f32 %129 = OpConstant 3.67402E-40 
                                       f32_4 %130 = OpConstantComposite %128 %129 %128 %129 
                                         f32 %141 = OpConstant 3.67402E-40 
                                       f32_4 %142 = OpConstantComposite %141 %141 %141 %141 
                                         f32 %147 = OpConstant 3.67402E-40 
                                       f32_4 %148 = OpConstantComposite %147 %147 %147 %147 
                                         f32 %153 = OpConstant 3.67402E-40 
                                       f32_4 %154 = OpConstantComposite %153 %153 %153 %153 
                              Private f32_4* %158 = OpVariable Private 
                                         f32 %184 = OpConstant 3.67402E-40 
                                       f32_2 %185 = OpConstantComposite %184 %184 
                              Private f32_2* %201 = OpVariable Private 
                                         f32 %204 = OpConstant 3.67402E-40 
                                       f32_2 %205 = OpConstantComposite %204 %204 
                                         f32 %207 = OpConstant 3.67402E-40 
                                       f32_2 %208 = OpConstantComposite %207 %207 
                                         f32 %214 = OpConstant 3.67402E-40 
                                       f32_2 %215 = OpConstantComposite %214 %214 
                              Private f32_2* %226 = OpVariable Private 
                              Private f32_2* %239 = OpVariable Private 
                                         i32 %264 = OpConstant 6 
                                         i32 %267 = OpConstant 8 
                                Private f32* %279 = OpVariable Private 
                                Private f32* %411 = OpVariable Private 
                                         i32 %434 = OpConstant 7 
                                         f32 %449 = OpConstant 3.67402E-40 
                              Private f32_2* %459 = OpVariable Private 
                                             %466 = OpTypePointer Private %84 
                               Private bool* %467 = OpVariable Private 
                                             %474 = OpTypePointer Function %10 
                                         f32 %479 = OpConstant 3.67402E-40 
                                         f32 %480 = OpConstant 3.67402E-40 
                                       f32_2 %481 = OpConstantComposite %479 %480 
                                         f32 %483 = OpConstant 3.67402E-40 
                                         f32 %484 = OpConstant 3.67402E-40 
                                       f32_2 %485 = OpConstantComposite %483 %484 
                                         f32 %502 = OpConstant 3.67402E-40 
                                         i32 %512 = OpConstant 9 
                                Private f32* %527 = OpVariable Private 
                                         i32 %533 = OpConstant 10 
                               Private bool* %537 = OpVariable Private 
                                Private f32* %542 = OpVariable Private 
                                             %543 = OpTypePointer Function %6 
                                         f32 %558 = OpConstant 3.67402E-40 
                              Private f32_2* %567 = OpVariable Private 
                              Private f32_4* %581 = OpVariable Private 
                                             %582 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %583 = OpTypeSampledImage %582 
                                             %584 = OpTypePointer UniformConstant %583 
 UniformConstant read_only Texture2DSampled* %585 = OpVariable UniformConstant 
                                             %589 = OpTypeVector %6 3 
                                         f32 %592 = OpConstant 3.67402E-40 
                                         f32 %593 = OpConstant 3.67402E-40 
                                       f32_3 %594 = OpConstantComposite %592 %593 %593 
                                         u32 %598 = OpConstant 3 
                                             %600 = OpTypePointer Output %7 
                               Output f32_4* %601 = OpVariable Output 
                                         f32 %603 = OpConstant 3.67402E-40 
                                       f32_4 %604 = OpConstantComposite %603 %603 %603 %603 
                                Private i32* %609 = OpVariable Private 
                                Private i32* %610 = OpVariable Private 
                               Private bool* %611 = OpVariable Private 
                               Private bool* %612 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function i32* %76 = OpVariable Function 
                               Function i32* %280 = OpVariable Function 
                             Function f32_2* %475 = OpVariable Function 
                               Function f32* %544 = OpVariable Function 
                               Uniform f32_4* %17 = OpAccessChain %13 %15 
                                        f32_4 %18 = OpLoad %17 
                                        f32_2 %19 = OpVectorShuffle %18 %18 0 0 
                                        f32_2 %22 = OpFMul %19 %21 
                                 Uniform f32* %27 = OpAccessChain %13 %23 %25 
                                          f32 %28 = OpLoad %27 
                                 Uniform f32* %29 = OpAccessChain %13 %23 %25 
                                          f32 %30 = OpLoad %29 
                                        f32_2 %31 = OpCompositeConstruct %28 %30 
                                        f32_2 %32 = OpFAdd %22 %31 
                                        f32_4 %33 = OpLoad %9 
                                        f32_4 %34 = OpVectorShuffle %33 %32 4 1 5 3 
                                                      OpStore %9 %34 
                               Uniform f32_4* %36 = OpAccessChain %13 %35 
                                        f32_4 %37 = OpLoad %36 
                                        f32_2 %38 = OpVectorShuffle %37 %37 0 0 
                                        f32_2 %41 = OpFMul %38 %40 
                                 Uniform f32* %43 = OpAccessChain %13 %23 %42 
                                          f32 %44 = OpLoad %43 
                                 Uniform f32* %45 = OpAccessChain %13 %23 %42 
                                          f32 %46 = OpLoad %45 
                                        f32_2 %47 = OpCompositeConstruct %44 %46 
                                        f32_2 %48 = OpFAdd %41 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_4 %50 = OpVectorShuffle %49 %48 0 4 2 5 
                                                      OpStore %9 %50 
                                 Uniform f32* %54 = OpAccessChain %13 %53 
                                          f32 %55 = OpLoad %54 
                                          i32 %56 = OpConvertFToS %55 
                                                      OpStore %52 %56 
                                        f32_4 %57 = OpLoad %9 
                                        f32_2 %60 = OpLoad %59 
                                        f32_4 %61 = OpVectorShuffle %60 %60 0 1 0 1 
                                        f32_4 %62 = OpFAdd %57 %61 
                                                      OpStore %9 %62 
                                 Uniform f32* %66 = OpAccessChain %13 %65 
                                          f32 %67 = OpLoad %66 
                                 Uniform f32* %69 = OpAccessChain %13 %68 
                                          f32 %70 = OpLoad %69 
                                        f32_2 %71 = OpCompositeConstruct %67 %70 
                                                      OpStore %64 %71 
                                                      OpStore %73 %74 
                                                      OpStore %76 %35 
                                                      OpBranch %77 
                                              %77 = OpLabel 
                                                      OpLoopMerge %79 %80 None 
                                                      OpBranch %81 
                                              %81 = OpLabel 
                                          i32 %82 = OpLoad %76 
                                          i32 %83 = OpLoad %52 
                                         bool %85 = OpSLessThan %82 %83 
                                                      OpBranchConditional %85 %78 %79 
                                              %78 = OpLabel 
                                        f32_4 %87 = OpLoad %9 
                                        f32_2 %88 = OpVectorShuffle %87 %87 2 3 
                                        f32_2 %89 = OpLoad %64 
                                        f32_2 %90 = OpVectorShuffle %89 %89 0 0 
                                        f32_2 %91 = OpFMul %88 %90 
                                                      OpStore %86 %91 
                                        f32_2 %93 = OpLoad %86 
                                        f32_2 %94 = OpExtInst %1 8 %93 
                                        f32_4 %95 = OpLoad %92 
                                        f32_4 %96 = OpVectorShuffle %95 %94 4 5 2 3 
                                                      OpStore %92 %96 
                                        f32_4 %97 = OpLoad %92 
                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                                       f32_2 %101 = OpFAdd %98 %100 
                                       f32_4 %102 = OpLoad %92 
                                       f32_4 %103 = OpVectorShuffle %102 %101 0 1 4 5 
                                                      OpStore %92 %103 
                                       f32_4 %105 = OpLoad %9 
                                       f32_4 %106 = OpVectorShuffle %105 %105 2 3 2 3 
                                       f32_2 %107 = OpLoad %64 
                                       f32_4 %108 = OpVectorShuffle %107 %107 0 0 0 0 
                                       f32_4 %109 = OpFMul %106 %108 
                                       f32_4 %110 = OpLoad %92 
                                       f32_4 %111 = OpFNegate %110 
                                       f32_4 %112 = OpFAdd %109 %111 
                                                      OpStore %104 %112 
                                       f32_4 %114 = OpLoad %92 
                                       f32_4 %117 = OpFMul %114 %116 
                                                      OpStore %113 %117 
                                       f32_4 %118 = OpLoad %113 
                                       f32_4 %119 = OpExtInst %1 8 %118 
                                                      OpStore %113 %119 
                                       f32_4 %120 = OpLoad %113 
                                       f32_4 %121 = OpFNegate %120 
                                       f32_4 %124 = OpFMul %121 %123 
                                       f32_4 %125 = OpLoad %92 
                                       f32_4 %126 = OpFAdd %124 %125 
                                                      OpStore %92 %126 
                                       f32_4 %127 = OpLoad %92 
                                       f32_4 %131 = OpFAdd %127 %130 
                                                      OpStore %92 %131 
                                       f32_4 %132 = OpLoad %92 
                                       f32_4 %133 = OpLoad %92 
                                       f32_4 %134 = OpFMul %132 %133 
                                                      OpStore %92 %134 
                                       f32_4 %135 = OpLoad %92 
                                       f32_4 %136 = OpVectorShuffle %135 %135 1 1 3 3 
                                       f32_4 %137 = OpLoad %92 
                                       f32_4 %138 = OpVectorShuffle %137 %137 0 2 0 2 
                                       f32_4 %139 = OpFMul %136 %138 
                                                      OpStore %92 %139 
                                       f32_4 %140 = OpLoad %92 
                                       f32_4 %143 = OpFMul %140 %142 
                                                      OpStore %113 %143 
                                       f32_4 %144 = OpLoad %113 
                                       f32_4 %145 = OpExtInst %1 10 %144 
                                                      OpStore %113 %145 
                                       f32_4 %146 = OpLoad %92 
                                       f32_4 %149 = OpFMul %146 %148 
                                                      OpStore %92 %149 
                                       f32_4 %150 = OpLoad %92 
                                       f32_4 %151 = OpExtInst %1 10 %150 
                                                      OpStore %92 %151 
                                       f32_4 %152 = OpLoad %113 
                                       f32_4 %155 = OpFAdd %152 %154 
                                                      OpStore %113 %155 
                                       f32_4 %156 = OpLoad %92 
                                       f32_4 %157 = OpFAdd %156 %154 
                                                      OpStore %92 %157 
                                       f32_4 %159 = OpLoad %92 
                                       f32_4 %160 = OpLoad %92 
                                       f32_4 %161 = OpFMul %159 %160 
                                                      OpStore %158 %161 
                                       f32_4 %162 = OpLoad %113 
                                       f32_4 %163 = OpLoad %113 
                                       f32_4 %164 = OpFMul %162 %163 
                                       f32_4 %165 = OpLoad %158 
                                       f32_4 %166 = OpFAdd %164 %165 
                                                      OpStore %158 %166 
                                       f32_4 %167 = OpLoad %158 
                                       f32_4 %168 = OpExtInst %1 32 %167 
                                                      OpStore %158 %168 
                                       f32_4 %169 = OpLoad %104 
                                       f32_4 %170 = OpVectorShuffle %169 %169 1 1 3 3 
                                       f32_4 %171 = OpLoad %92 
                                       f32_4 %172 = OpFMul %170 %171 
                                                      OpStore %92 %172 
                                       f32_4 %173 = OpLoad %113 
                                       f32_4 %174 = OpLoad %104 
                                       f32_4 %175 = OpVectorShuffle %174 %174 0 2 0 2 
                                       f32_4 %176 = OpFMul %173 %175 
                                       f32_4 %177 = OpLoad %92 
                                       f32_4 %178 = OpFAdd %176 %177 
                                                      OpStore %92 %178 
                                       f32_4 %179 = OpLoad %92 
                                       f32_4 %180 = OpLoad %158 
                                       f32_4 %181 = OpFMul %179 %180 
                                                      OpStore %92 %181 
                                       f32_4 %182 = OpLoad %92 
                                       f32_2 %183 = OpVectorShuffle %182 %182 0 1 
                                       f32_2 %186 = OpFMul %183 %185 
                                                      OpStore %86 %186 
                                       f32_4 %187 = OpLoad %104 
                                       f32_2 %188 = OpVectorShuffle %187 %187 0 1 
                                       f32_4 %189 = OpLoad %104 
                                       f32_2 %190 = OpVectorShuffle %189 %189 0 1 
                                       f32_2 %191 = OpFMul %188 %190 
                                       f32_4 %192 = OpLoad %92 
                                       f32_4 %193 = OpVectorShuffle %192 %191 4 5 2 3 
                                                      OpStore %92 %193 
                                       f32_4 %194 = OpLoad %104 
                                       f32_2 %195 = OpVectorShuffle %194 %194 0 1 
                                       f32_4 %196 = OpLoad %92 
                                       f32_2 %197 = OpVectorShuffle %196 %196 0 1 
                                       f32_2 %198 = OpFMul %195 %197 
                                       f32_4 %199 = OpLoad %92 
                                       f32_4 %200 = OpVectorShuffle %199 %198 4 5 2 3 
                                                      OpStore %92 %200 
                                       f32_4 %202 = OpLoad %104 
                                       f32_2 %203 = OpVectorShuffle %202 %202 0 1 
                                       f32_2 %206 = OpFMul %203 %205 
                                       f32_2 %209 = OpFAdd %206 %208 
                                                      OpStore %201 %209 
                                       f32_4 %210 = OpLoad %104 
                                       f32_2 %211 = OpVectorShuffle %210 %210 0 1 
                                       f32_2 %212 = OpLoad %201 
                                       f32_2 %213 = OpFMul %211 %212 
                                       f32_2 %216 = OpFAdd %213 %215 
                                       f32_4 %217 = OpLoad %104 
                                       f32_4 %218 = OpVectorShuffle %217 %216 4 5 2 3 
                                                      OpStore %104 %218 
                                       f32_4 %219 = OpLoad %92 
                                       f32_2 %220 = OpVectorShuffle %219 %219 0 1 
                                       f32_4 %221 = OpLoad %104 
                                       f32_2 %222 = OpVectorShuffle %221 %221 0 1 
                                       f32_2 %223 = OpFMul %220 %222 
                                       f32_4 %224 = OpLoad %92 
                                       f32_4 %225 = OpVectorShuffle %224 %223 4 5 2 3 
                                                      OpStore %92 %225 
                                       f32_4 %227 = OpLoad %92 
                                       f32_2 %228 = OpVectorShuffle %227 %227 2 3 
                                       f32_2 %229 = OpFMul %228 %185 
                                       f32_2 %230 = OpLoad %86 
                                       f32_2 %231 = OpFNegate %230 
                                       f32_2 %232 = OpFAdd %229 %231 
                                                      OpStore %226 %232 
                                       f32_4 %233 = OpLoad %92 
                                       f32_2 %234 = OpVectorShuffle %233 %233 1 1 
                                       f32_2 %235 = OpLoad %226 
                                       f32_2 %236 = OpFMul %234 %235 
                                       f32_2 %237 = OpLoad %86 
                                       f32_2 %238 = OpFAdd %236 %237 
                                                      OpStore %86 %238 
                                Private f32* %240 = OpAccessChain %86 %25 
                                         f32 %241 = OpLoad %240 
                                         f32 %242 = OpFNegate %241 
                                Private f32* %243 = OpAccessChain %86 %42 
                                         f32 %244 = OpLoad %243 
                                         f32 %245 = OpFAdd %242 %244 
                                Private f32* %246 = OpAccessChain %239 %25 
                                                      OpStore %246 %245 
                                Private f32* %247 = OpAccessChain %92 %25 
                                         f32 %248 = OpLoad %247 
                                Private f32* %249 = OpAccessChain %239 %25 
                                         f32 %250 = OpLoad %249 
                                         f32 %251 = OpFMul %248 %250 
                                Private f32* %252 = OpAccessChain %86 %25 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpFAdd %251 %253 
                                Private f32* %255 = OpAccessChain %86 %25 
                                                      OpStore %255 %254 
                                Private f32* %256 = OpAccessChain %86 %25 
                                         f32 %257 = OpLoad %256 
                                Private f32* %258 = OpAccessChain %64 %42 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpFMul %257 %259 
                                         f32 %261 = OpLoad %73 
                                         f32 %262 = OpFAdd %260 %261 
                                                      OpStore %73 %262 
                                       f32_2 %263 = OpLoad %64 
                                Uniform f32* %265 = OpAccessChain %13 %264 
                                         f32 %266 = OpLoad %265 
                                Uniform f32* %268 = OpAccessChain %13 %267 
                                         f32 %269 = OpLoad %268 
                                       f32_2 %270 = OpCompositeConstruct %266 %269 
                                       f32_2 %271 = OpFMul %263 %270 
                                                      OpStore %64 %271 
                                                      OpBranch %80 
                                              %80 = OpLabel 
                                         i32 %272 = OpLoad %76 
                                         i32 %273 = OpIAdd %272 %15 
                                                      OpStore %76 %273 
                                                      OpBranch %77 
                                              %79 = OpLabel 
                                Uniform f32* %274 = OpAccessChain %13 %65 
                                         f32 %275 = OpLoad %274 
                                Uniform f32* %276 = OpAccessChain %13 %68 
                                         f32 %277 = OpLoad %276 
                                       f32_2 %278 = OpCompositeConstruct %275 %277 
                                                      OpStore %64 %278 
                                                      OpStore %279 %74 
                                                      OpStore %280 %35 
                                                      OpBranch %281 
                                             %281 = OpLabel 
                                                      OpLoopMerge %283 %284 None 
                                                      OpBranch %285 
                                             %285 = OpLabel 
                                         i32 %286 = OpLoad %280 
                                         i32 %287 = OpLoad %52 
                                        bool %288 = OpSLessThan %286 %287 
                                                      OpBranchConditional %288 %282 %283 
                                             %282 = OpLabel 
                                       f32_4 %289 = OpLoad %9 
                                       f32_2 %290 = OpVectorShuffle %289 %289 2 3 
                                       f32_2 %291 = OpLoad %64 
                                       f32_2 %292 = OpVectorShuffle %291 %291 0 0 
                                       f32_2 %293 = OpFMul %290 %292 
                                                      OpStore %239 %293 
                                       f32_2 %294 = OpLoad %239 
                                       f32_2 %295 = OpExtInst %1 8 %294 
                                       f32_4 %296 = OpLoad %92 
                                       f32_4 %297 = OpVectorShuffle %296 %295 4 5 2 3 
                                                      OpStore %92 %297 
                                       f32_4 %298 = OpLoad %92 
                                       f32_2 %299 = OpVectorShuffle %298 %298 0 1 
                                       f32_2 %300 = OpFAdd %299 %100 
                                       f32_4 %301 = OpLoad %92 
                                       f32_4 %302 = OpVectorShuffle %301 %300 0 1 4 5 
                                                      OpStore %92 %302 
                                       f32_4 %303 = OpLoad %9 
                                       f32_2 %304 = OpLoad %64 
                                       f32_4 %305 = OpVectorShuffle %304 %304 0 0 0 0 
                                       f32_4 %306 = OpFMul %303 %305 
                                       f32_4 %307 = OpLoad %92 
                                       f32_4 %308 = OpFNegate %307 
                                       f32_4 %309 = OpFAdd %306 %308 
                                                      OpStore %104 %309 
                                       f32_4 %310 = OpLoad %92 
                                       f32_4 %311 = OpFMul %310 %116 
                                                      OpStore %113 %311 
                                       f32_4 %312 = OpLoad %113 
                                       f32_4 %313 = OpExtInst %1 8 %312 
                                                      OpStore %113 %313 
                                       f32_4 %314 = OpLoad %113 
                                       f32_4 %315 = OpFNegate %314 
                                       f32_4 %316 = OpFMul %315 %123 
                                       f32_4 %317 = OpLoad %92 
                                       f32_4 %318 = OpFAdd %316 %317 
                                                      OpStore %92 %318 
                                       f32_4 %319 = OpLoad %92 
                                       f32_4 %320 = OpFAdd %319 %130 
                                                      OpStore %92 %320 
                                       f32_4 %321 = OpLoad %92 
                                       f32_4 %322 = OpLoad %92 
                                       f32_4 %323 = OpFMul %321 %322 
                                                      OpStore %92 %323 
                                       f32_4 %324 = OpLoad %92 
                                       f32_4 %325 = OpVectorShuffle %324 %324 1 1 3 3 
                                       f32_4 %326 = OpLoad %92 
                                       f32_4 %327 = OpVectorShuffle %326 %326 0 2 0 2 
                                       f32_4 %328 = OpFMul %325 %327 
                                                      OpStore %92 %328 
                                       f32_4 %329 = OpLoad %92 
                                       f32_4 %330 = OpFMul %329 %142 
                                                      OpStore %113 %330 
                                       f32_4 %331 = OpLoad %113 
                                       f32_4 %332 = OpExtInst %1 10 %331 
                                                      OpStore %113 %332 
                                       f32_4 %333 = OpLoad %92 
                                       f32_4 %334 = OpFMul %333 %148 
                                                      OpStore %92 %334 
                                       f32_4 %335 = OpLoad %92 
                                       f32_4 %336 = OpExtInst %1 10 %335 
                                                      OpStore %92 %336 
                                       f32_4 %337 = OpLoad %113 
                                       f32_4 %338 = OpFAdd %337 %154 
                                                      OpStore %113 %338 
                                       f32_4 %339 = OpLoad %92 
                                       f32_4 %340 = OpFAdd %339 %154 
                                                      OpStore %92 %340 
                                       f32_4 %341 = OpLoad %92 
                                       f32_4 %342 = OpLoad %92 
                                       f32_4 %343 = OpFMul %341 %342 
                                                      OpStore %158 %343 
                                       f32_4 %344 = OpLoad %113 
                                       f32_4 %345 = OpLoad %113 
                                       f32_4 %346 = OpFMul %344 %345 
                                       f32_4 %347 = OpLoad %158 
                                       f32_4 %348 = OpFAdd %346 %347 
                                                      OpStore %158 %348 
                                       f32_4 %349 = OpLoad %158 
                                       f32_4 %350 = OpExtInst %1 32 %349 
                                                      OpStore %158 %350 
                                       f32_4 %351 = OpLoad %104 
                                       f32_4 %352 = OpVectorShuffle %351 %351 1 1 3 3 
                                       f32_4 %353 = OpLoad %92 
                                       f32_4 %354 = OpFMul %352 %353 
                                                      OpStore %92 %354 
                                       f32_4 %355 = OpLoad %113 
                                       f32_4 %356 = OpLoad %104 
                                       f32_4 %357 = OpVectorShuffle %356 %356 0 2 0 2 
                                       f32_4 %358 = OpFMul %355 %357 
                                       f32_4 %359 = OpLoad %92 
                                       f32_4 %360 = OpFAdd %358 %359 
                                                      OpStore %92 %360 
                                       f32_4 %361 = OpLoad %92 
                                       f32_4 %362 = OpLoad %158 
                                       f32_4 %363 = OpFMul %361 %362 
                                                      OpStore %92 %363 
                                       f32_4 %364 = OpLoad %92 
                                       f32_2 %365 = OpVectorShuffle %364 %364 0 1 
                                       f32_2 %366 = OpFMul %365 %185 
                                                      OpStore %239 %366 
                                       f32_4 %367 = OpLoad %104 
                                       f32_2 %368 = OpVectorShuffle %367 %367 0 1 
                                       f32_4 %369 = OpLoad %104 
                                       f32_2 %370 = OpVectorShuffle %369 %369 0 1 
                                       f32_2 %371 = OpFMul %368 %370 
                                       f32_4 %372 = OpLoad %92 
                                       f32_4 %373 = OpVectorShuffle %372 %371 4 5 2 3 
                                                      OpStore %92 %373 
                                       f32_4 %374 = OpLoad %104 
                                       f32_2 %375 = OpVectorShuffle %374 %374 0 1 
                                       f32_4 %376 = OpLoad %92 
                                       f32_2 %377 = OpVectorShuffle %376 %376 0 1 
                                       f32_2 %378 = OpFMul %375 %377 
                                       f32_4 %379 = OpLoad %92 
                                       f32_4 %380 = OpVectorShuffle %379 %378 4 5 2 3 
                                                      OpStore %92 %380 
                                       f32_4 %381 = OpLoad %104 
                                       f32_2 %382 = OpVectorShuffle %381 %381 0 1 
                                       f32_2 %383 = OpFMul %382 %205 
                                       f32_2 %384 = OpFAdd %383 %208 
                                                      OpStore %201 %384 
                                       f32_4 %385 = OpLoad %104 
                                       f32_2 %386 = OpVectorShuffle %385 %385 0 1 
                                       f32_2 %387 = OpLoad %201 
                                       f32_2 %388 = OpFMul %386 %387 
                                       f32_2 %389 = OpFAdd %388 %215 
                                       f32_4 %390 = OpLoad %104 
                                       f32_4 %391 = OpVectorShuffle %390 %389 4 5 2 3 
                                                      OpStore %104 %391 
                                       f32_4 %392 = OpLoad %92 
                                       f32_2 %393 = OpVectorShuffle %392 %392 0 1 
                                       f32_4 %394 = OpLoad %104 
                                       f32_2 %395 = OpVectorShuffle %394 %394 0 1 
                                       f32_2 %396 = OpFMul %393 %395 
                                       f32_4 %397 = OpLoad %92 
                                       f32_4 %398 = OpVectorShuffle %397 %396 4 5 2 3 
                                                      OpStore %92 %398 
                                       f32_4 %399 = OpLoad %92 
                                       f32_2 %400 = OpVectorShuffle %399 %399 2 3 
                                       f32_2 %401 = OpFMul %400 %185 
                                       f32_2 %402 = OpLoad %239 
                                       f32_2 %403 = OpFNegate %402 
                                       f32_2 %404 = OpFAdd %401 %403 
                                                      OpStore %226 %404 
                                       f32_4 %405 = OpLoad %92 
                                       f32_2 %406 = OpVectorShuffle %405 %405 1 1 
                                       f32_2 %407 = OpLoad %226 
                                       f32_2 %408 = OpFMul %406 %407 
                                       f32_2 %409 = OpLoad %239 
                                       f32_2 %410 = OpFAdd %408 %409 
                                                      OpStore %239 %410 
                                Private f32* %412 = OpAccessChain %239 %25 
                                         f32 %413 = OpLoad %412 
                                         f32 %414 = OpFNegate %413 
                                Private f32* %415 = OpAccessChain %239 %42 
                                         f32 %416 = OpLoad %415 
                                         f32 %417 = OpFAdd %414 %416 
                                                      OpStore %411 %417 
                                Private f32* %418 = OpAccessChain %92 %25 
                                         f32 %419 = OpLoad %418 
                                         f32 %420 = OpLoad %411 
                                         f32 %421 = OpFMul %419 %420 
                                Private f32* %422 = OpAccessChain %239 %25 
                                         f32 %423 = OpLoad %422 
                                         f32 %424 = OpFAdd %421 %423 
                                Private f32* %425 = OpAccessChain %239 %25 
                                                      OpStore %425 %424 
                                Private f32* %426 = OpAccessChain %239 %25 
                                         f32 %427 = OpLoad %426 
                                Private f32* %428 = OpAccessChain %64 %42 
                                         f32 %429 = OpLoad %428 
                                         f32 %430 = OpFMul %427 %429 
                                         f32 %431 = OpLoad %279 
                                         f32 %432 = OpFAdd %430 %431 
                                                      OpStore %279 %432 
                                       f32_2 %433 = OpLoad %64 
                                Uniform f32* %435 = OpAccessChain %13 %434 
                                         f32 %436 = OpLoad %435 
                                Uniform f32* %437 = OpAccessChain %13 %267 
                                         f32 %438 = OpLoad %437 
                                       f32_2 %439 = OpCompositeConstruct %436 %438 
                                       f32_2 %440 = OpFMul %433 %439 
                                                      OpStore %64 %440 
                                                      OpBranch %284 
                                             %284 = OpLabel 
                                         i32 %441 = OpLoad %280 
                                         i32 %442 = OpIAdd %441 %15 
                                                      OpStore %280 %442 
                                                      OpBranch %281 
                                             %283 = OpLabel 
                                         f32 %443 = OpLoad %73 
                                         f32 %444 = OpLoad %279 
                                         f32 %445 = OpFAdd %443 %444 
                                Private f32* %446 = OpAccessChain %9 %25 
                                                      OpStore %446 %445 
                                Uniform f32* %447 = OpAccessChain %13 %35 %25 
                                         f32 %448 = OpLoad %447 
                                         f32 %450 = OpFMul %448 %449 
                                Private f32* %451 = OpAccessChain %9 %25 
                                         f32 %452 = OpLoad %451 
                                         f32 %453 = OpFAdd %450 %452 
                                Private f32* %454 = OpAccessChain %9 %25 
                                                      OpStore %454 %453 
                                Private f32* %455 = OpAccessChain %9 %25 
                                         f32 %456 = OpLoad %455 
                                         f32 %457 = OpFAdd %456 %99 
                                Private f32* %458 = OpAccessChain %9 %25 
                                                      OpStore %458 %457 
                                Private f32* %460 = OpAccessChain %9 %25 
                                         f32 %461 = OpLoad %460 
                                Private f32* %462 = OpAccessChain %9 %25 
                                         f32 %463 = OpLoad %462 
                                         f32 %464 = OpFAdd %461 %463 
                                Private f32* %465 = OpAccessChain %459 %25 
                                                      OpStore %465 %464 
                                Private f32* %468 = OpAccessChain %459 %25 
                                         f32 %469 = OpLoad %468 
                                Private f32* %470 = OpAccessChain %459 %25 
                                         f32 %471 = OpLoad %470 
                                         f32 %472 = OpFNegate %471 
                                        bool %473 = OpFOrdGreaterThanEqual %469 %472 
                                                      OpStore %467 %473 
                                        bool %476 = OpLoad %467 
                                                      OpSelectionMerge %478 None 
                                                      OpBranchConditional %476 %477 %482 
                                             %477 = OpLabel 
                                                      OpStore %475 %481 
                                                      OpBranch %478 
                                             %482 = OpLabel 
                                                      OpStore %475 %485 
                                                      OpBranch %478 
                                             %478 = OpLabel 
                                       f32_2 %486 = OpLoad %475 
                                                      OpStore %459 %486 
                                Private f32* %487 = OpAccessChain %459 %42 
                                         f32 %488 = OpLoad %487 
                                Private f32* %489 = OpAccessChain %9 %25 
                                         f32 %490 = OpLoad %489 
                                         f32 %491 = OpFMul %488 %490 
                                Private f32* %492 = OpAccessChain %9 %25 
                                                      OpStore %492 %491 
                                Private f32* %493 = OpAccessChain %9 %25 
                                         f32 %494 = OpLoad %493 
                                         f32 %495 = OpExtInst %1 10 %494 
                                Private f32* %496 = OpAccessChain %9 %25 
                                                      OpStore %496 %495 
                                Private f32* %497 = OpAccessChain %459 %25 
                                         f32 %498 = OpLoad %497 
                                Private f32* %499 = OpAccessChain %9 %25 
                                         f32 %500 = OpLoad %499 
                                         f32 %501 = OpFMul %498 %500 
                                         f32 %503 = OpFAdd %501 %502 
                                Private f32* %504 = OpAccessChain %9 %25 
                                                      OpStore %504 %503 
                                Private f32* %505 = OpAccessChain %9 %25 
                                         f32 %506 = OpLoad %505 
                                         f32 %507 = OpExtInst %1 13 %506 
                                Private f32* %508 = OpAccessChain %9 %25 
                                                      OpStore %508 %507 
                                Private f32* %509 = OpAccessChain %9 %25 
                                         f32 %510 = OpLoad %509 
                                         f32 %511 = OpExtInst %1 4 %510 
                                Uniform f32* %513 = OpAccessChain %13 %512 
                                         f32 %514 = OpLoad %513 
                                         f32 %515 = OpFDiv %511 %514 
                                Private f32* %516 = OpAccessChain %9 %25 
                                                      OpStore %516 %515 
                                Private f32* %517 = OpAccessChain %9 %25 
                                         f32 %518 = OpLoad %517 
                                         f32 %519 = OpExtInst %1 2 %518 
                                Private f32* %520 = OpAccessChain %9 %25 
                                                      OpStore %520 %519 
                                Private f32* %521 = OpAccessChain %9 %25 
                                         f32 %522 = OpLoad %521 
                                Uniform f32* %523 = OpAccessChain %13 %512 
                                         f32 %524 = OpLoad %523 
                                         f32 %525 = OpFMul %522 %524 
                                Private f32* %526 = OpAccessChain %459 %25 
                                                      OpStore %526 %525 
                                Uniform f32* %528 = OpAccessChain %13 %512 
                                         f32 %529 = OpLoad %528 
                                Private f32* %530 = OpAccessChain %9 %25 
                                         f32 %531 = OpLoad %530 
                                         f32 %532 = OpFMul %529 %531 
                                Uniform f32* %534 = OpAccessChain %13 %533 
                                         f32 %535 = OpLoad %534 
                                         f32 %536 = OpFAdd %532 %535 
                                                      OpStore %527 %536 
                                         f32 %538 = OpLoad %527 
                                         f32 %539 = OpLoad %527 
                                         f32 %540 = OpFNegate %539 
                                        bool %541 = OpFOrdGreaterThanEqual %538 %540 
                                                      OpStore %537 %541 
                                        bool %545 = OpLoad %537 
                                                      OpSelectionMerge %547 None 
                                                      OpBranchConditional %545 %546 %548 
                                             %546 = OpLabel 
                                                      OpStore %544 %99 
                                                      OpBranch %547 
                                             %548 = OpLabel 
                                                      OpStore %544 %502 
                                                      OpBranch %547 
                                             %547 = OpLabel 
                                         f32 %549 = OpLoad %544 
                                                      OpStore %542 %549 
                                         f32 %550 = OpLoad %542 
                                         f32 %551 = OpLoad %527 
                                         f32 %552 = OpFMul %550 %551 
                                                      OpStore %527 %552 
                                         f32 %553 = OpLoad %527 
                                         f32 %554 = OpExtInst %1 10 %553 
                                                      OpStore %527 %554 
                                         f32 %555 = OpLoad %542 
                                         f32 %556 = OpLoad %527 
                                         f32 %557 = OpFMul %555 %556 
                                         f32 %559 = OpFAdd %557 %558 
                                                      OpStore %527 %559 
                                         f32 %560 = OpLoad %527 
                                         f32 %561 = OpExtInst %1 40 %560 %74 
                                                      OpStore %527 %561 
                                Private f32* %562 = OpAccessChain %459 %25 
                                         f32 %563 = OpLoad %562 
                                         f32 %564 = OpLoad %527 
                                         f32 %565 = OpFMul %563 %564 
                                Private f32* %566 = OpAccessChain %459 %25 
                                                      OpStore %566 %565 
                                Uniform f32* %568 = OpAccessChain %13 %512 
                                         f32 %569 = OpLoad %568 
                                         f32 %570 = OpFNegate %569 
                                Private f32* %571 = OpAccessChain %9 %25 
                                         f32 %572 = OpLoad %571 
                                         f32 %573 = OpFMul %570 %572 
                                         f32 %574 = OpFAdd %573 %99 
                                Private f32* %575 = OpAccessChain %567 %25 
                                                      OpStore %575 %574 
                                Private f32* %576 = OpAccessChain %567 %25 
                                         f32 %577 = OpLoad %576 
                                         f32 %578 = OpExtInst %1 43 %577 %74 %99 
                                Private f32* %579 = OpAccessChain %567 %25 
                                                      OpStore %579 %578 
                                Private f32* %580 = OpAccessChain %567 %42 
                                                      OpStore %580 %74 
                  read_only Texture2DSampled %586 = OpLoad %585 
                                       f32_2 %587 = OpLoad %567 
                                       f32_4 %588 = OpImageSampleImplicitLod %586 %587 
                                                      OpStore %581 %588 
                                       f32_2 %590 = OpLoad %459 
                                       f32_3 %591 = OpVectorShuffle %590 %590 0 0 0 
                                       f32_3 %595 = OpFMul %591 %594 
                                       f32_4 %596 = OpLoad %9 
                                       f32_4 %597 = OpVectorShuffle %596 %595 4 5 6 3 
                                                      OpStore %9 %597 
                                Private f32* %599 = OpAccessChain %9 %598 
                                                      OpStore %599 %74 
                                       f32_4 %602 = OpLoad %581 
                                       f32_4 %605 = OpFMul %602 %604 
                                       f32_4 %606 = OpLoad %9 
                                       f32_4 %607 = OpFAdd %605 %606 
                                                      OpStore %601 %607 
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