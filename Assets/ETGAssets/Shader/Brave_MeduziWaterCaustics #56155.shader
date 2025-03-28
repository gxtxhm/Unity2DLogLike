//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/MeduziWaterCaustics" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_MaskTex ("Mask (RGB)", 2D) = "white" { }
_CausticTex ("Casutics", 2D) = "white" { }
_CausticScale ("Caustic Scale", Float) = 1
_NoiseTex ("Noise", 2D) = "white" { }
_CausticColor ("Caustic Color", Color) = (1,1,1,0)
_LightCausticPower ("LCP", Float) = 0.125
_LightCausticColor ("Light Color", Color) = (1,1,1,1)
_DarkCausticPower ("DCP", Float) = 0.08
_DarkCausticColor ("Dark Color", Color) = (0,0,0,1)
_ValueMinimum ("Value Min", Float) = 0.5
_ValueMaximum ("Value Max", Float) = 0.5
_EmissiveBoost ("Boost", Float) = 0
_TimeScale ("TimeScale", Float) = 1
_ReflPower ("Refl Power", Float) = 1
}
SubShader {
 LOD 110
 Tags { "IGNOREPROJECTOR" = "False" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" "UnlitTilted" = "UnlitTilted" }
 Pass {
  Name "FORWARD"
  LOD 110
  Tags { "IGNOREPROJECTOR" = "False" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" "UnlitTilted" = "UnlitTilted" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  Lighting On
  GpuProgramID 7125
Program "vp" {
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _CausticScale;
uniform 	vec4 _CausticColor;
uniform 	float _ReflPower;
uniform 	float _TimeScale;
uniform 	vec4 _LightCausticColor;
uniform 	float _LightCausticPower;
uniform 	float _ValueMinimum;
uniform 	float _ValueMaximum;
uniform 	float _GlobalReflectionsEnabled;
uniform  sampler2D _MaskTex;
uniform  sampler2D _CausticTex;
uniform  sampler2D _ReflMapFromPixelator;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec2 u_xlat3;
vec3 u_xlat4;
float u_xlat7;
bool u_xlatb7;
float u_xlat9;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat0.x = _Time.x * _TimeScale;
    u_xlat3.x = vs_TEXCOORD1.y + vs_TEXCOORD1.x;
    u_xlat3.x = _Time.y * _TimeScale + u_xlat3.x;
    u_xlat1.x = sin(u_xlat3.x);
    u_xlat2.x = cos(u_xlat3.x);
    u_xlat2.x = u_xlat2.x * 0.111111112;
    u_xlat2.y = u_xlat1.x * 0.166666672;
    u_xlat3.xy = u_xlat2.xy + vs_TEXCOORD1.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(_CausticScale);
    u_xlat3.xy = u_xlat3.xy * vec2(0.200000003, 0.200000003);
    u_xlat0.xy = u_xlat0.xx * vec2(0.5, 0.125) + u_xlat3.xy;
    u_xlat10_0 = texture(_CausticTex, u_xlat0.xy);
    u_xlat9 = vs_TEXCOORD2.y * 500.0;
    u_xlat9 = _Time.z * 5.0 + u_xlat9;
    u_xlat9 = sin(u_xlat9);
    u_xlat1.x = u_xlat9 * 0.00150000001;
    u_xlat1.y = 0.0;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD2.xy;
    u_xlat10_1 = texture(_ReflMapFromPixelator, u_xlat1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_LightCausticPower);
    u_xlat0.xyz = u_xlat0.xyz * _LightCausticColor.xyz + _CausticColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.0500000007, 0.0500000007, 0.0500000007);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.75, 0.75, 0.75) + u_xlat10_1.xyz;
    u_xlat9 = u_xlat10_1.w * _ReflPower;
    u_xlat9 = u_xlat9 * _GlobalReflectionsEnabled;
    u_xlat0.xyz = (-u_xlat2.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz + u_xlat2.xyz;
    u_xlatb9 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb9){
        u_xlatb9 = unity_ProbeVolumeParams.y==1.0;
        u_xlat1.xyz = vs_TEXCOORD1.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.xxx + u_xlat1.xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD1.zzz + u_xlat1.xyz;
        u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : vs_TEXCOORD1.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat9 = u_xlat1.y * 0.25 + 0.75;
        u_xlat4.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat9, u_xlat4.x);
        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
    } else {
        u_xlat1.x = float(1.0);
        u_xlat1.y = float(1.0);
        u_xlat1.z = float(1.0);
        u_xlat1.w = float(1.0);
    //ENDIF
    }
    u_xlat9 = dot(u_xlat1, unity_OcclusionMaskSelector);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlatb9 = u_xlat0.y>=u_xlat0.z;
    u_xlat9 = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat1.xy = u_xlat0.zy;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat2.xy = u_xlat0.yz + (-u_xlat1.xy);
    u_xlat2.z = float(1.0);
    u_xlat2.w = float(-1.0);
    u_xlat1 = vec4(u_xlat9) * u_xlat2 + u_xlat1;
    u_xlatb9 = u_xlat0.x>=u_xlat1.x;
    u_xlat9 = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat2.xyz = u_xlat1.xyw;
    u_xlat2.w = u_xlat0.x;
    u_xlat1.xyw = u_xlat2.wyx;
    u_xlat1 = (-u_xlat2) + u_xlat1;
    u_xlat1 = vec4(u_xlat9) * u_xlat1 + u_xlat2;
    u_xlat9 = min(u_xlat1.y, u_xlat1.w);
    u_xlat9 = (-u_xlat9) + u_xlat1.x;
    u_xlat4.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat10 = u_xlat9 * 6.0 + 1.00000001e-010;
    u_xlat4.x = u_xlat4.x / u_xlat10;
    u_xlat4.x = u_xlat4.x + u_xlat1.z;
    u_xlat7 = u_xlat1.x + 1.00000001e-010;
    u_xlat9 = u_xlat9 / u_xlat7;
    u_xlatb7 = _CausticColor.y>=_CausticColor.z;
    u_xlat7 = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat10 = (-_CausticColor.z) + _CausticColor.y;
    u_xlat7 = u_xlat7 * u_xlat10 + _CausticColor.z;
    u_xlatb10 = _CausticColor.x>=u_xlat7;
    u_xlat10 = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat2.x = (-u_xlat7) + _CausticColor.x;
    u_xlat7 = u_xlat10 * u_xlat2.x + u_xlat7;
    u_xlat10 = u_xlat7 * _ValueMinimum;
    u_xlat1.x = max(u_xlat10, u_xlat1.x);
    u_xlat7 = u_xlat7 * _ValueMaximum;
    u_xlat1.x = min(u_xlat7, u_xlat1.x);
    u_xlat4.xyz = abs(u_xlat4.xxx) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = vec3(u_xlat9) * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10_2 = texture(_MaskTex, vec2(1.0, 0.0));
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + (-u_xlat0.xyz);
    SV_Target0.xyz = u_xlat10_2.xxx * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = _CausticColor.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 171
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %92 %97 %127 %147 %160 %163 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %52 Location 52 
                                                      OpMemberDecorate %90 0 BuiltIn 90 
                                                      OpMemberDecorate %90 1 BuiltIn 90 
                                                      OpMemberDecorate %90 2 BuiltIn 90 
                                                      OpDecorate %90 Block 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate %127 Location 127 
                                                      OpDecorate %147 Location 147 
                                                      OpDecorate %160 RelaxedPrecision 
                                                      OpDecorate %160 Location 160 
                                                      OpDecorate %163 Location 163 
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
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %16 %17 %18 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4];}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                                              %50 = OpTypeVector %6 3 
                                              %51 = OpTypePointer Output %50 
                                Output f32_3* %52 = OpVariable Output 
                                          u32 %88 = OpConstant 1 
                                              %89 = OpTypeArray %6 %88 
                                              %90 = OpTypeStruct %7 %6 %89 
                                              %91 = OpTypePointer Output %90 
         Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                                              %94 = OpTypePointer Output %7 
                                              %96 = OpTypePointer Input %50 
                                 Input f32_3* %97 = OpVariable Input 
                                         u32 %103 = OpConstant 0 
                                             %104 = OpTypePointer Private %6 
                                         u32 %117 = OpConstant 2 
                                Private f32* %119 = OpVariable Private 
                               Output f32_3* %127 = OpVariable Output 
                                             %135 = OpTypePointer Uniform %6 
                                         f32 %142 = OpConstant 3.67402E-40 
                                       f32_3 %143 = OpConstantComposite %142 %142 %142 
                               Output f32_4* %147 = OpVariable Output 
                                             %148 = OpTypeVector %6 2 
                               Output f32_3* %160 = OpVariable Output 
                                         f32 %161 = OpConstant 3.67402E-40 
                                       f32_3 %162 = OpConstantComposite %161 %161 %161 
                               Output f32_4* %163 = OpVariable Output 
                                       f32_4 %164 = OpConstantComposite %161 %161 %161 %161 
                                             %165 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %53 = OpAccessChain %21 %23 %46 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %56 = OpLoad %11 
                                        f32_3 %57 = OpVectorShuffle %56 %56 3 3 3 
                                        f32_3 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                                      OpStore %52 %61 
                                        f32_4 %62 = OpLoad %44 
                                        f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %21 %46 %23 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %63 %65 
                                                      OpStore %9 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %46 %28 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %44 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %74 = OpAccessChain %21 %46 %36 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %44 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                               Uniform f32_4* %81 = OpAccessChain %21 %46 %46 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %44 
                                        f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %9 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %9 %87 
                                        f32_4 %93 = OpLoad %9 
                                Output f32_4* %95 = OpAccessChain %92 %28 
                                                      OpStore %95 %93 
                                        f32_3 %98 = OpLoad %97 
                               Uniform f32_4* %99 = OpAccessChain %21 %36 %28 
                                       f32_4 %100 = OpLoad %99 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                                         f32 %102 = OpDot %98 %101 
                                Private f32* %105 = OpAccessChain %44 %103 
                                                      OpStore %105 %102 
                                       f32_3 %106 = OpLoad %97 
                              Uniform f32_4* %107 = OpAccessChain %21 %36 %23 
                                       f32_4 %108 = OpLoad %107 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                         f32 %110 = OpDot %106 %109 
                                Private f32* %111 = OpAccessChain %44 %88 
                                                      OpStore %111 %110 
                                       f32_3 %112 = OpLoad %97 
                              Uniform f32_4* %113 = OpAccessChain %21 %36 %36 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                         f32 %116 = OpDot %112 %115 
                                Private f32* %118 = OpAccessChain %44 %117 
                                                      OpStore %118 %116 
                                       f32_4 %120 = OpLoad %44 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                                       f32_4 %122 = OpLoad %44 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                         f32 %124 = OpDot %121 %123 
                                                      OpStore %119 %124 
                                         f32 %125 = OpLoad %119 
                                         f32 %126 = OpExtInst %1 32 %125 
                                                      OpStore %119 %126 
                                         f32 %128 = OpLoad %119 
                                       f32_3 %129 = OpCompositeConstruct %128 %128 %128 
                                       f32_4 %130 = OpLoad %44 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_3 %132 = OpFMul %129 %131 
                                                      OpStore %127 %132 
                                Private f32* %133 = OpAccessChain %9 %88 
                                         f32 %134 = OpLoad %133 
                                Uniform f32* %136 = OpAccessChain %21 %28 %103 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFMul %134 %137 
                                Private f32* %139 = OpAccessChain %9 %88 
                                                      OpStore %139 %138 
                                       f32_4 %140 = OpLoad %9 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 3 1 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %44 
                                       f32_4 %146 = OpVectorShuffle %145 %144 4 1 5 6 
                                                      OpStore %44 %146 
                                       f32_4 %149 = OpLoad %9 
                                       f32_2 %150 = OpVectorShuffle %149 %149 2 3 
                                       f32_4 %151 = OpLoad %147 
                                       f32_4 %152 = OpVectorShuffle %151 %150 0 1 4 5 
                                                      OpStore %147 %152 
                                       f32_4 %153 = OpLoad %44 
                                       f32_2 %154 = OpVectorShuffle %153 %153 2 2 
                                       f32_4 %155 = OpLoad %44 
                                       f32_2 %156 = OpVectorShuffle %155 %155 0 3 
                                       f32_2 %157 = OpFAdd %154 %156 
                                       f32_4 %158 = OpLoad %147 
                                       f32_4 %159 = OpVectorShuffle %158 %157 4 5 2 3 
                                                      OpStore %147 %159 
                                                      OpStore %160 %162 
                                                      OpStore %163 %164 
                                 Output f32* %166 = OpAccessChain %92 %28 %88 
                                         f32 %167 = OpLoad %166 
                                         f32 %168 = OpFNegate %167 
                                 Output f32* %169 = OpAccessChain %92 %28 %88 
                                                      OpStore %169 %168 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 664
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %32 %117 %360 %366 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 RelaxedPrecision 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpMemberDecorate %14 4 Offset 14 
                                                      OpMemberDecorate %14 5 Offset 14 
                                                      OpMemberDecorate %14 6 RelaxedPrecision 
                                                      OpMemberDecorate %14 6 Offset 14 
                                                      OpMemberDecorate %14 7 Offset 14 
                                                      OpMemberDecorate %14 8 Offset 14 
                                                      OpMemberDecorate %14 9 Offset 14 
                                                      OpMemberDecorate %14 10 Offset 14 
                                                      OpMemberDecorate %14 11 Offset 14 
                                                      OpMemberDecorate %14 12 Offset 14 
                                                      OpMemberDecorate %14 13 Offset 14 
                                                      OpMemberDecorate %14 14 Offset 14 
                                                      OpMemberDecorate %14 15 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate %32 Location 32 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %109 RelaxedPrecision 
                                                      OpDecorate %109 DescriptorSet 109 
                                                      OpDecorate %109 Binding 109 
                                                      OpDecorate %110 RelaxedPrecision 
                                                      OpDecorate %114 RelaxedPrecision 
                                                      OpDecorate %117 Location 117 
                                                      OpDecorate %144 RelaxedPrecision 
                                                      OpDecorate %145 RelaxedPrecision 
                                                      OpDecorate %145 DescriptorSet 145 
                                                      OpDecorate %145 Binding 145 
                                                      OpDecorate %146 RelaxedPrecision 
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %154 RelaxedPrecision 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %232 SpecId 232 
                                                      OpDecorate %325 DescriptorSet 325 
                                                      OpDecorate %325 Binding 325 
                                                      OpDecorate %330 RelaxedPrecision 
                                                      OpDecorate %337 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %344 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %352 RelaxedPrecision 
                                                      OpDecorate %354 RelaxedPrecision 
                                                      OpDecorate %355 RelaxedPrecision 
                                                      OpDecorate %356 RelaxedPrecision 
                                                      OpDecorate %357 RelaxedPrecision 
                                                      OpDecorate %360 RelaxedPrecision 
                                                      OpDecorate %360 Location 360 
                                                      OpDecorate %361 RelaxedPrecision 
                                                      OpDecorate %363 RelaxedPrecision 
                                                      OpDecorate %366 RelaxedPrecision 
                                                      OpDecorate %366 Location 366 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %375 RelaxedPrecision 
                                                      OpDecorate %385 RelaxedPrecision 
                                                      OpDecorate %386 RelaxedPrecision 
                                                      OpDecorate %387 RelaxedPrecision 
                                                      OpDecorate %388 RelaxedPrecision 
                                                      OpDecorate %389 RelaxedPrecision 
                                                      OpDecorate %390 RelaxedPrecision 
                                                      OpDecorate %398 RelaxedPrecision 
                                                      OpDecorate %399 RelaxedPrecision 
                                                      OpDecorate %401 RelaxedPrecision 
                                                      OpDecorate %402 RelaxedPrecision 
                                                      OpDecorate %417 RelaxedPrecision 
                                                      OpDecorate %434 RelaxedPrecision 
                                                      OpDecorate %435 RelaxedPrecision 
                                                      OpDecorate %441 RelaxedPrecision 
                                                      OpDecorate %465 RelaxedPrecision 
                                                      OpDecorate %634 RelaxedPrecision 
                                                      OpDecorate %635 RelaxedPrecision 
                                                      OpDecorate %635 DescriptorSet 635 
                                                      OpDecorate %635 Binding 635 
                                                      OpDecorate %636 RelaxedPrecision 
                                                      OpDecorate %639 RelaxedPrecision 
                                                      OpDecorate %645 RelaxedPrecision 
                                                      OpDecorate %646 RelaxedPrecision 
                                                      OpDecorate %650 RelaxedPrecision 
                                                      OpDecorate %655 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeVector %6 3 
                                              %14 = OpTypeStruct %7 %7 %7 %12 %13 %13 %7 %6 %7 %6 %6 %7 %6 %6 %6 %6 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32_4; f32; f32; f32_4; f32; f32; f32; f32;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 0 
                                          u32 %19 = OpConstant 0 
                                              %20 = OpTypePointer Uniform %6 
                                          i32 %23 = OpConstant 10 
                                              %27 = OpTypePointer Private %6 
                                              %29 = OpTypePointer Private %13 
                               Private f32_3* %30 = OpVariable Private 
                                              %31 = OpTypePointer Input %13 
                                 Input f32_3* %32 = OpVariable Input 
                                          u32 %33 = OpConstant 1 
                                              %34 = OpTypePointer Input %6 
                               Private f32_4* %50 = OpVariable Private 
                               Private f32_4* %55 = OpVariable Private 
                                          f32 %62 = OpConstant 3.67402E-40 
                                          f32 %67 = OpConstant 3.67402E-40 
                                              %70 = OpTypeVector %6 2 
                                          i32 %80 = OpConstant 7 
                                          f32 %89 = OpConstant 3.67402E-40 
                                        f32_2 %90 = OpConstantComposite %89 %89 
                                          f32 %96 = OpConstant 3.67402E-40 
                                          f32 %97 = OpConstant 3.67402E-40 
                                        f32_2 %98 = OpConstantComposite %96 %97 
                              Private f32_3* %105 = OpVariable Private 
                                             %106 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %107 = OpTypeSampledImage %106 
                                             %108 = OpTypePointer UniformConstant %107 
 UniformConstant read_only Texture2DSampled* %109 = OpVariable UniformConstant 
                                Private f32* %115 = OpVariable Private 
                                             %116 = OpTypePointer Input %7 
                                Input f32_4* %117 = OpVariable Input 
                                         f32 %120 = OpConstant 3.67402E-40 
                                         u32 %122 = OpConstant 2 
                                         f32 %125 = OpConstant 3.67402E-40 
                                         f32 %132 = OpConstant 3.67402E-40 
                                         f32 %135 = OpConstant 3.67402E-40 
                              Private f32_4* %144 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %145 = OpVariable UniformConstant 
                                         i32 %151 = OpConstant 12 
                                         i32 %160 = OpConstant 11 
                                             %161 = OpTypePointer Uniform %7 
                                         i32 %166 = OpConstant 8 
                              Private f32_3* %173 = OpVariable Private 
                                       f32_3 %176 = OpConstantComposite %96 %96 %96 
                                         f32 %178 = OpConstant 3.67402E-40 
                                       f32_3 %179 = OpConstantComposite %178 %178 %178 
                              Private f32_3* %181 = OpVariable Private 
                                         f32 %184 = OpConstant 3.67402E-40 
                                       f32_3 %185 = OpConstantComposite %184 %184 %184 
                                         u32 %190 = OpConstant 3 
                                         i32 %193 = OpConstant 9 
                                         i32 %200 = OpConstant 15 
                              Private f32_3* %205 = OpVariable Private 
                                             %218 = OpTypeBool 
                                             %219 = OpTypePointer Private %218 
                               Private bool* %220 = OpVariable Private 
                                         i32 %221 = OpConstant 2 
                                         f32 %224 = OpConstant 3.67402E-40 
                                        bool %226 = OpConstantFalse 
                                        bool %232 = OpSpecConstantFalse 
                                         i32 %240 = OpConstant 3 
                                         i32 %241 = OpConstant 1 
                                             %278 = OpTypePointer Function %13 
                                         i32 %292 = OpConstant 5 
                                             %293 = OpTypePointer Uniform %13 
                                         i32 %302 = OpConstant 4 
                                         f32 %310 = OpConstant 3.67402E-40 
                                Private f32* %313 = OpVariable Private 
                                             %322 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %323 = OpTypeSampledImage %322 
                                             %324 = OpTypePointer UniformConstant %323 
 UniformConstant read_only Texture3DSampled* %325 = OpVariable UniformConstant 
                              Private f32_4* %330 = OpVariable Private 
                              Private f32_3* %346 = OpVariable Private 
                                         i32 %349 = OpConstant 6 
                                Input f32_3* %360 = OpVariable Input 
                                             %365 = OpTypePointer Output %7 
                               Output f32_4* %366 = OpVariable Output 
                                             %369 = OpTypePointer Output %6 
                               Private bool* %371 = OpVariable Private 
                                             %377 = OpTypePointer Function %6 
                                         f32 %394 = OpConstant 3.67402E-40 
                                         f32 %411 = OpConstant 3.67402E-40 
                                       f32_2 %412 = OpConstantComposite %394 %411 
                              Private f32_4* %437 = OpVariable Private 
                                Private f32* %488 = OpVariable Private 
                                         f32 %491 = OpConstant 3.67402E-40 
                                         f32 %493 = OpConstant 3.67402E-40 
                               Private bool* %538 = OpVariable Private 
                                Private f32* %550 = OpVariable Private 
                                         i32 %563 = OpConstant 13 
                                         i32 %575 = OpConstant 14 
                                         f32 %587 = OpConstant 3.67402E-40 
                                       f32_3 %588 = OpConstantComposite %224 %411 %587 
                                       f32_3 %599 = OpConstantComposite %491 %491 %491 
                                         f32 %601 = OpConstant 3.67402E-40 
                                       f32_3 %602 = OpConstantComposite %601 %601 %601 
                                       f32_3 %609 = OpConstantComposite %394 %394 %394 
                                       f32_3 %630 = OpConstantComposite %224 %224 %224 
                                Private f32* %634 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %635 = OpVariable UniformConstant 
                                       f32_2 %637 = OpConstantComposite %224 %135 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %279 = OpVariable Function 
                               Function f32* %378 = OpVariable Function 
                               Function f32* %421 = OpVariable Function 
                               Function f32* %518 = OpVariable Function 
                               Function f32* %543 = OpVariable Function 
                                 Uniform f32* %21 = OpAccessChain %16 %18 %19 
                                          f32 %22 = OpLoad %21 
                                 Uniform f32* %24 = OpAccessChain %16 %23 
                                          f32 %25 = OpLoad %24 
                                          f32 %26 = OpFMul %22 %25 
                                 Private f32* %28 = OpAccessChain %9 %19 
                                                      OpStore %28 %26 
                                   Input f32* %35 = OpAccessChain %32 %33 
                                          f32 %36 = OpLoad %35 
                                   Input f32* %37 = OpAccessChain %32 %19 
                                          f32 %38 = OpLoad %37 
                                          f32 %39 = OpFAdd %36 %38 
                                 Private f32* %40 = OpAccessChain %30 %19 
                                                      OpStore %40 %39 
                                 Uniform f32* %41 = OpAccessChain %16 %18 %33 
                                          f32 %42 = OpLoad %41 
                                 Uniform f32* %43 = OpAccessChain %16 %23 
                                          f32 %44 = OpLoad %43 
                                          f32 %45 = OpFMul %42 %44 
                                 Private f32* %46 = OpAccessChain %30 %19 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpFAdd %45 %47 
                                 Private f32* %49 = OpAccessChain %30 %19 
                                                      OpStore %49 %48 
                                 Private f32* %51 = OpAccessChain %30 %19 
                                          f32 %52 = OpLoad %51 
                                          f32 %53 = OpExtInst %1 13 %52 
                                 Private f32* %54 = OpAccessChain %50 %19 
                                                      OpStore %54 %53 
                                 Private f32* %56 = OpAccessChain %30 %19 
                                          f32 %57 = OpLoad %56 
                                          f32 %58 = OpExtInst %1 14 %57 
                                 Private f32* %59 = OpAccessChain %55 %19 
                                                      OpStore %59 %58 
                                 Private f32* %60 = OpAccessChain %55 %19 
                                          f32 %61 = OpLoad %60 
                                          f32 %63 = OpFMul %61 %62 
                                 Private f32* %64 = OpAccessChain %55 %19 
                                                      OpStore %64 %63 
                                 Private f32* %65 = OpAccessChain %50 %19 
                                          f32 %66 = OpLoad %65 
                                          f32 %68 = OpFMul %66 %67 
                                 Private f32* %69 = OpAccessChain %55 %33 
                                                      OpStore %69 %68 
                                        f32_4 %71 = OpLoad %55 
                                        f32_2 %72 = OpVectorShuffle %71 %71 0 1 
                                        f32_3 %73 = OpLoad %32 
                                        f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                                        f32_2 %75 = OpFAdd %72 %74 
                                        f32_3 %76 = OpLoad %30 
                                        f32_3 %77 = OpVectorShuffle %76 %75 3 4 2 
                                                      OpStore %30 %77 
                                        f32_3 %78 = OpLoad %30 
                                        f32_2 %79 = OpVectorShuffle %78 %78 0 1 
                                 Uniform f32* %81 = OpAccessChain %16 %80 
                                          f32 %82 = OpLoad %81 
                                        f32_2 %83 = OpCompositeConstruct %82 %82 
                                        f32_2 %84 = OpFMul %79 %83 
                                        f32_3 %85 = OpLoad %30 
                                        f32_3 %86 = OpVectorShuffle %85 %84 3 4 2 
                                                      OpStore %30 %86 
                                        f32_3 %87 = OpLoad %30 
                                        f32_2 %88 = OpVectorShuffle %87 %87 0 1 
                                        f32_2 %91 = OpFMul %88 %90 
                                        f32_3 %92 = OpLoad %30 
                                        f32_3 %93 = OpVectorShuffle %92 %91 3 4 2 
                                                      OpStore %30 %93 
                                        f32_4 %94 = OpLoad %9 
                                        f32_2 %95 = OpVectorShuffle %94 %94 0 0 
                                        f32_2 %99 = OpFMul %95 %98 
                                       f32_3 %100 = OpLoad %30 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                       f32_2 %102 = OpFAdd %99 %101 
                                       f32_4 %103 = OpLoad %9 
                                       f32_4 %104 = OpVectorShuffle %103 %102 4 5 2 3 
                                                      OpStore %9 %104 
                  read_only Texture2DSampled %110 = OpLoad %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_2 %112 = OpVectorShuffle %111 %111 0 1 
                                       f32_4 %113 = OpImageSampleImplicitLod %110 %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                                      OpStore %105 %114 
                                  Input f32* %118 = OpAccessChain %117 %33 
                                         f32 %119 = OpLoad %118 
                                         f32 %121 = OpFMul %119 %120 
                                                      OpStore %115 %121 
                                Uniform f32* %123 = OpAccessChain %16 %18 %122 
                                         f32 %124 = OpLoad %123 
                                         f32 %126 = OpFMul %124 %125 
                                         f32 %127 = OpLoad %115 
                                         f32 %128 = OpFAdd %126 %127 
                                                      OpStore %115 %128 
                                         f32 %129 = OpLoad %115 
                                         f32 %130 = OpExtInst %1 13 %129 
                                                      OpStore %115 %130 
                                         f32 %131 = OpLoad %115 
                                         f32 %133 = OpFMul %131 %132 
                                Private f32* %134 = OpAccessChain %50 %19 
                                                      OpStore %134 %133 
                                Private f32* %136 = OpAccessChain %50 %33 
                                                      OpStore %136 %135 
                                       f32_4 %137 = OpLoad %50 
                                       f32_2 %138 = OpVectorShuffle %137 %137 0 1 
                                       f32_4 %139 = OpLoad %117 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_2 %141 = OpFAdd %138 %140 
                                       f32_4 %142 = OpLoad %50 
                                       f32_4 %143 = OpVectorShuffle %142 %141 4 5 2 3 
                                                      OpStore %50 %143 
                  read_only Texture2DSampled %146 = OpLoad %145 
                                       f32_4 %147 = OpLoad %50 
                                       f32_2 %148 = OpVectorShuffle %147 %147 0 1 
                                       f32_4 %149 = OpImageSampleImplicitLod %146 %148 
                                                      OpStore %144 %149 
                                       f32_3 %150 = OpLoad %105 
                                Uniform f32* %152 = OpAccessChain %16 %151 
                                         f32 %153 = OpLoad %152 
                                       f32_3 %154 = OpCompositeConstruct %153 %153 %153 
                                       f32_3 %155 = OpFMul %150 %154 
                                       f32_4 %156 = OpLoad %9 
                                       f32_4 %157 = OpVectorShuffle %156 %155 4 5 6 3 
                                                      OpStore %9 %157 
                                       f32_4 %158 = OpLoad %9 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                              Uniform f32_4* %162 = OpAccessChain %16 %160 
                                       f32_4 %163 = OpLoad %162 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                                       f32_3 %165 = OpFMul %159 %164 
                              Uniform f32_4* %167 = OpAccessChain %16 %166 
                                       f32_4 %168 = OpLoad %167 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                       f32_3 %170 = OpFAdd %165 %169 
                                       f32_4 %171 = OpLoad %9 
                                       f32_4 %172 = OpVectorShuffle %171 %170 4 5 6 3 
                                                      OpStore %9 %172 
                                       f32_4 %174 = OpLoad %9 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                                       f32_3 %177 = OpFMul %175 %176 
                                       f32_3 %180 = OpFAdd %177 %179 
                                                      OpStore %173 %180 
                                       f32_4 %182 = OpLoad %9 
                                       f32_3 %183 = OpVectorShuffle %182 %182 0 1 2 
                                       f32_3 %186 = OpFMul %183 %185 
                                       f32_4 %187 = OpLoad %144 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                                       f32_3 %189 = OpFAdd %186 %188 
                                                      OpStore %181 %189 
                                Private f32* %191 = OpAccessChain %144 %190 
                                         f32 %192 = OpLoad %191 
                                Uniform f32* %194 = OpAccessChain %16 %193 
                                         f32 %195 = OpLoad %194 
                                         f32 %196 = OpFMul %192 %195 
                                Private f32* %197 = OpAccessChain %9 %19 
                                                      OpStore %197 %196 
                                Private f32* %198 = OpAccessChain %9 %19 
                                         f32 %199 = OpLoad %198 
                                Uniform f32* %201 = OpAccessChain %16 %200 
                                         f32 %202 = OpLoad %201 
                                         f32 %203 = OpFMul %199 %202 
                                Private f32* %204 = OpAccessChain %9 %19 
                                                      OpStore %204 %203 
                                       f32_3 %206 = OpLoad %173 
                                       f32_3 %207 = OpFNegate %206 
                                       f32_3 %208 = OpLoad %181 
                                       f32_3 %209 = OpFAdd %207 %208 
                                                      OpStore %205 %209 
                                       f32_4 %210 = OpLoad %9 
                                       f32_3 %211 = OpVectorShuffle %210 %210 0 0 0 
                                       f32_3 %212 = OpLoad %205 
                                       f32_3 %213 = OpFMul %211 %212 
                                       f32_3 %214 = OpLoad %173 
                                       f32_3 %215 = OpFAdd %213 %214 
                                       f32_4 %216 = OpLoad %9 
                                       f32_4 %217 = OpVectorShuffle %216 %215 4 5 6 3 
                                                      OpStore %9 %217 
                                Uniform f32* %222 = OpAccessChain %16 %221 %19 
                                         f32 %223 = OpLoad %222 
                                        bool %225 = OpFOrdEqual %223 %224 
                                                      OpStore %220 %225 
                                                      OpSelectionMerge %228 None 
                                                      OpBranchConditional %226 %227 %228 
                                             %227 = OpLabel 
                                        bool %229 = OpLoad %220 
                                                      OpSelectionMerge %231 None 
                                                      OpBranchConditional %229 %230 %231 
                                             %230 = OpLabel 
                                                      OpBranch %231 
                                             %231 = OpLabel 
                                                      OpBranch %228 
                                             %228 = OpLabel 
                                                      OpSelectionMerge %234 None 
                                                      OpBranchConditional %232 %233 %332 
                                             %233 = OpLabel 
                                Uniform f32* %235 = OpAccessChain %16 %221 %33 
                                         f32 %236 = OpLoad %235 
                                        bool %237 = OpFOrdEqual %236 %224 
                                                      OpStore %220 %237 
                                       f32_3 %238 = OpLoad %32 
                                       f32_3 %239 = OpVectorShuffle %238 %238 1 1 1 
                              Uniform f32_4* %242 = OpAccessChain %16 %240 %241 
                                       f32_4 %243 = OpLoad %242 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 1 2 
                                       f32_3 %245 = OpFMul %239 %244 
                                       f32_4 %246 = OpLoad %50 
                                       f32_4 %247 = OpVectorShuffle %246 %245 4 5 6 3 
                                                      OpStore %50 %247 
                              Uniform f32_4* %248 = OpAccessChain %16 %240 %18 
                                       f32_4 %249 = OpLoad %248 
                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
                                       f32_3 %251 = OpLoad %32 
                                       f32_3 %252 = OpVectorShuffle %251 %251 0 0 0 
                                       f32_3 %253 = OpFMul %250 %252 
                                       f32_4 %254 = OpLoad %50 
                                       f32_3 %255 = OpVectorShuffle %254 %254 0 1 2 
                                       f32_3 %256 = OpFAdd %253 %255 
                                       f32_4 %257 = OpLoad %50 
                                       f32_4 %258 = OpVectorShuffle %257 %256 4 5 6 3 
                                                      OpStore %50 %258 
                              Uniform f32_4* %259 = OpAccessChain %16 %240 %221 
                                       f32_4 %260 = OpLoad %259 
                                       f32_3 %261 = OpVectorShuffle %260 %260 0 1 2 
                                       f32_3 %262 = OpLoad %32 
                                       f32_3 %263 = OpVectorShuffle %262 %262 2 2 2 
                                       f32_3 %264 = OpFMul %261 %263 
                                       f32_4 %265 = OpLoad %50 
                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
                                       f32_3 %267 = OpFAdd %264 %266 
                                       f32_4 %268 = OpLoad %50 
                                       f32_4 %269 = OpVectorShuffle %268 %267 4 5 6 3 
                                                      OpStore %50 %269 
                                       f32_4 %270 = OpLoad %50 
                                       f32_3 %271 = OpVectorShuffle %270 %270 0 1 2 
                              Uniform f32_4* %272 = OpAccessChain %16 %240 %240 
                                       f32_4 %273 = OpLoad %272 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                                       f32_3 %275 = OpFAdd %271 %274 
                                       f32_4 %276 = OpLoad %50 
                                       f32_4 %277 = OpVectorShuffle %276 %275 4 5 6 3 
                                                      OpStore %50 %277 
                                        bool %280 = OpLoad %220 
                                                      OpSelectionMerge %282 None 
                                                      OpBranchConditional %280 %281 %285 
                                             %281 = OpLabel 
                                       f32_4 %283 = OpLoad %50 
                                       f32_3 %284 = OpVectorShuffle %283 %283 0 1 2 
                                                      OpStore %279 %284 
                                                      OpBranch %282 
                                             %285 = OpLabel 
                                       f32_3 %286 = OpLoad %32 
                                                      OpStore %279 %286 
                                                      OpBranch %282 
                                             %282 = OpLabel 
                                       f32_3 %287 = OpLoad %279 
                                       f32_4 %288 = OpLoad %50 
                                       f32_4 %289 = OpVectorShuffle %288 %287 4 5 6 3 
                                                      OpStore %50 %289 
                                       f32_4 %290 = OpLoad %50 
                                       f32_3 %291 = OpVectorShuffle %290 %290 0 1 2 
                              Uniform f32_3* %294 = OpAccessChain %16 %292 
                                       f32_3 %295 = OpLoad %294 
                                       f32_3 %296 = OpFNegate %295 
                                       f32_3 %297 = OpFAdd %291 %296 
                                       f32_4 %298 = OpLoad %50 
                                       f32_4 %299 = OpVectorShuffle %298 %297 4 5 6 3 
                                                      OpStore %50 %299 
                                       f32_4 %300 = OpLoad %50 
                                       f32_3 %301 = OpVectorShuffle %300 %300 0 1 2 
                              Uniform f32_3* %303 = OpAccessChain %16 %302 
                                       f32_3 %304 = OpLoad %303 
                                       f32_3 %305 = OpFMul %301 %304 
                                       f32_4 %306 = OpLoad %50 
                                       f32_4 %307 = OpVectorShuffle %306 %305 0 4 5 6 
                                                      OpStore %50 %307 
                                Private f32* %308 = OpAccessChain %50 %33 
                                         f32 %309 = OpLoad %308 
                                         f32 %311 = OpFMul %309 %310 
                                         f32 %312 = OpFAdd %311 %184 
                                                      OpStore %115 %312 
                                Uniform f32* %314 = OpAccessChain %16 %221 %122 
                                         f32 %315 = OpLoad %314 
                                         f32 %316 = OpFMul %315 %96 
                                         f32 %317 = OpFAdd %316 %184 
                                                      OpStore %313 %317 
                                         f32 %318 = OpLoad %115 
                                         f32 %319 = OpLoad %313 
                                         f32 %320 = OpExtInst %1 40 %318 %319 
                                Private f32* %321 = OpAccessChain %50 %19 
                                                      OpStore %321 %320 
                  read_only Texture3DSampled %326 = OpLoad %325 
                                       f32_4 %327 = OpLoad %50 
                                       f32_3 %328 = OpVectorShuffle %327 %327 0 2 3 
                                       f32_4 %329 = OpImageSampleImplicitLod %326 %328 
                                                      OpStore %50 %329 
                                       f32_4 %331 = OpLoad %50 
                                                      OpStore %330 %331 
                                                      OpBranch %234 
                                             %332 = OpLabel 
                                Private f32* %333 = OpAccessChain %330 %19 
                                                      OpStore %333 %224 
                                Private f32* %334 = OpAccessChain %330 %33 
                                                      OpStore %334 %224 
                                Private f32* %335 = OpAccessChain %330 %122 
                                                      OpStore %335 %224 
                                Private f32* %336 = OpAccessChain %330 %190 
                                                      OpStore %336 %224 
                                                      OpBranch %234 
                                             %234 = OpLabel 
                                       f32_4 %337 = OpLoad %330 
                              Uniform f32_4* %338 = OpAccessChain %16 %241 
                                       f32_4 %339 = OpLoad %338 
                                         f32 %340 = OpDot %337 %339 
                                Private f32* %341 = OpAccessChain %173 %19 
                                                      OpStore %341 %340 
                                Private f32* %342 = OpAccessChain %173 %19 
                                         f32 %343 = OpLoad %342 
                                         f32 %344 = OpExtInst %1 43 %343 %135 %224 
                                Private f32* %345 = OpAccessChain %173 %19 
                                                      OpStore %345 %344 
                                       f32_4 %347 = OpLoad %9 
                                       f32_3 %348 = OpVectorShuffle %347 %347 0 1 2 
                              Uniform f32_4* %350 = OpAccessChain %16 %349 
                                       f32_4 %351 = OpLoad %350 
                                       f32_3 %352 = OpVectorShuffle %351 %351 0 1 2 
                                       f32_3 %353 = OpFMul %348 %352 
                                                      OpStore %346 %353 
                                       f32_3 %354 = OpLoad %173 
                                       f32_3 %355 = OpVectorShuffle %354 %354 0 0 0 
                                       f32_3 %356 = OpLoad %346 
                                       f32_3 %357 = OpFMul %355 %356 
                                                      OpStore %173 %357 
                                       f32_4 %358 = OpLoad %9 
                                       f32_3 %359 = OpVectorShuffle %358 %358 0 1 2 
                                       f32_3 %361 = OpLoad %360 
                                       f32_3 %362 = OpFMul %359 %361 
                                       f32_3 %363 = OpLoad %173 
                                       f32_3 %364 = OpFAdd %362 %363 
                                                      OpStore %173 %364 
                                Uniform f32* %367 = OpAccessChain %16 %166 %190 
                                         f32 %368 = OpLoad %367 
                                 Output f32* %370 = OpAccessChain %366 %190 
                                                      OpStore %370 %368 
                                Private f32* %372 = OpAccessChain %173 %33 
                                         f32 %373 = OpLoad %372 
                                Private f32* %374 = OpAccessChain %173 %122 
                                         f32 %375 = OpLoad %374 
                                        bool %376 = OpFOrdGreaterThanEqual %373 %375 
                                                      OpStore %371 %376 
                                        bool %379 = OpLoad %371 
                                                      OpSelectionMerge %381 None 
                                                      OpBranchConditional %379 %380 %382 
                                             %380 = OpLabel 
                                                      OpStore %378 %224 
                                                      OpBranch %381 
                                             %382 = OpLabel 
                                                      OpStore %378 %135 
                                                      OpBranch %381 
                                             %381 = OpLabel 
                                         f32 %383 = OpLoad %378 
                                Private f32* %384 = OpAccessChain %9 %19 
                                                      OpStore %384 %383 
                                       f32_3 %385 = OpLoad %173 
                                       f32_2 %386 = OpVectorShuffle %385 %385 2 1 
                                       f32_2 %387 = OpFNegate %386 
                                       f32_3 %388 = OpLoad %173 
                                       f32_2 %389 = OpVectorShuffle %388 %388 1 2 
                                       f32_2 %390 = OpFAdd %387 %389 
                                       f32_3 %391 = OpLoad %205 
                                       f32_3 %392 = OpVectorShuffle %391 %390 3 4 2 
                                                      OpStore %205 %392 
                                Private f32* %393 = OpAccessChain %55 %19 
                                                      OpStore %393 %224 
                                Private f32* %395 = OpAccessChain %55 %33 
                                                      OpStore %395 %394 
                                       f32_4 %396 = OpLoad %9 
                                       f32_2 %397 = OpVectorShuffle %396 %396 0 0 
                                       f32_3 %398 = OpLoad %205 
                                       f32_2 %399 = OpVectorShuffle %398 %398 0 1 
                                       f32_2 %400 = OpFMul %397 %399 
                                       f32_3 %401 = OpLoad %173 
                                       f32_2 %402 = OpVectorShuffle %401 %401 2 1 
                                       f32_2 %403 = OpFAdd %400 %402 
                                       f32_4 %404 = OpLoad %50 
                                       f32_4 %405 = OpVectorShuffle %404 %403 4 5 2 3 
                                                      OpStore %50 %405 
                                       f32_4 %406 = OpLoad %9 
                                       f32_2 %407 = OpVectorShuffle %406 %406 0 0 
                                       f32_4 %408 = OpLoad %55 
                                       f32_2 %409 = OpVectorShuffle %408 %408 0 1 
                                       f32_2 %410 = OpFMul %407 %409 
                                       f32_2 %413 = OpFAdd %410 %412 
                                       f32_4 %414 = OpLoad %50 
                                       f32_4 %415 = OpVectorShuffle %414 %413 0 1 4 5 
                                                      OpStore %50 %415 
                                Private f32* %416 = OpAccessChain %173 %19 
                                         f32 %417 = OpLoad %416 
                                Private f32* %418 = OpAccessChain %50 %19 
                                         f32 %419 = OpLoad %418 
                                        bool %420 = OpFOrdGreaterThanEqual %417 %419 
                                                      OpStore %371 %420 
                                        bool %422 = OpLoad %371 
                                                      OpSelectionMerge %424 None 
                                                      OpBranchConditional %422 %423 %425 
                                             %423 = OpLabel 
                                                      OpStore %421 %224 
                                                      OpBranch %424 
                                             %425 = OpLabel 
                                                      OpStore %421 %135 
                                                      OpBranch %424 
                                             %424 = OpLabel 
                                         f32 %426 = OpLoad %421 
                                Private f32* %427 = OpAccessChain %9 %19 
                                                      OpStore %427 %426 
                                       f32_4 %428 = OpLoad %50 
                                       f32_3 %429 = OpVectorShuffle %428 %428 0 1 3 
                                       f32_3 %430 = OpFNegate %429 
                                       f32_4 %431 = OpLoad %55 
                                       f32_4 %432 = OpVectorShuffle %431 %430 4 5 6 3 
                                                      OpStore %55 %432 
                                Private f32* %433 = OpAccessChain %173 %19 
                                         f32 %434 = OpLoad %433 
                                         f32 %435 = OpFNegate %434 
                                Private f32* %436 = OpAccessChain %55 %190 
                                                      OpStore %436 %435 
                                Private f32* %438 = OpAccessChain %55 %19 
                                         f32 %439 = OpLoad %438 
                                Private f32* %440 = OpAccessChain %173 %19 
                                         f32 %441 = OpLoad %440 
                                         f32 %442 = OpFAdd %439 %441 
                                Private f32* %443 = OpAccessChain %437 %19 
                                                      OpStore %443 %442 
                                       f32_4 %444 = OpLoad %50 
                                       f32_3 %445 = OpVectorShuffle %444 %444 1 2 0 
                                       f32_4 %446 = OpLoad %55 
                                       f32_3 %447 = OpVectorShuffle %446 %446 1 2 3 
                                       f32_3 %448 = OpFAdd %445 %447 
                                       f32_4 %449 = OpLoad %437 
                                       f32_4 %450 = OpVectorShuffle %449 %448 0 4 5 6 
                                                      OpStore %437 %450 
                                       f32_4 %451 = OpLoad %9 
                                       f32_3 %452 = OpVectorShuffle %451 %451 0 0 0 
                                       f32_4 %453 = OpLoad %437 
                                       f32_3 %454 = OpVectorShuffle %453 %453 0 1 2 
                                       f32_3 %455 = OpFMul %452 %454 
                                       f32_4 %456 = OpLoad %50 
                                       f32_3 %457 = OpVectorShuffle %456 %456 0 1 3 
                                       f32_3 %458 = OpFAdd %455 %457 
                                                      OpStore %30 %458 
                                Private f32* %459 = OpAccessChain %9 %19 
                                         f32 %460 = OpLoad %459 
                                Private f32* %461 = OpAccessChain %437 %190 
                                         f32 %462 = OpLoad %461 
                                         f32 %463 = OpFMul %460 %462 
                                Private f32* %464 = OpAccessChain %173 %19 
                                         f32 %465 = OpLoad %464 
                                         f32 %466 = OpFAdd %463 %465 
                                Private f32* %467 = OpAccessChain %9 %19 
                                                      OpStore %467 %466 
                                Private f32* %468 = OpAccessChain %30 %33 
                                         f32 %469 = OpLoad %468 
                                Private f32* %470 = OpAccessChain %9 %19 
                                         f32 %471 = OpLoad %470 
                                         f32 %472 = OpExtInst %1 37 %469 %471 
                                Private f32* %473 = OpAccessChain %55 %19 
                                                      OpStore %473 %472 
                                Private f32* %474 = OpAccessChain %30 %19 
                                         f32 %475 = OpLoad %474 
                                Private f32* %476 = OpAccessChain %55 %19 
                                         f32 %477 = OpLoad %476 
                                         f32 %478 = OpFNegate %477 
                                         f32 %479 = OpFAdd %475 %478 
                                Private f32* %480 = OpAccessChain %55 %19 
                                                      OpStore %480 %479 
                                Private f32* %481 = OpAccessChain %30 %33 
                                         f32 %482 = OpLoad %481 
                                         f32 %483 = OpFNegate %482 
                                Private f32* %484 = OpAccessChain %9 %19 
                                         f32 %485 = OpLoad %484 
                                         f32 %486 = OpFAdd %483 %485 
                                Private f32* %487 = OpAccessChain %9 %19 
                                                      OpStore %487 %486 
                                Private f32* %489 = OpAccessChain %55 %19 
                                         f32 %490 = OpLoad %489 
                                         f32 %492 = OpFMul %490 %491 
                                         f32 %494 = OpFAdd %492 %493 
                                                      OpStore %488 %494 
                                Private f32* %495 = OpAccessChain %9 %19 
                                         f32 %496 = OpLoad %495 
                                         f32 %497 = OpLoad %488 
                                         f32 %498 = OpFDiv %496 %497 
                                Private f32* %499 = OpAccessChain %9 %19 
                                                      OpStore %499 %498 
                                Private f32* %500 = OpAccessChain %9 %19 
                                         f32 %501 = OpLoad %500 
                                Private f32* %502 = OpAccessChain %30 %122 
                                         f32 %503 = OpLoad %502 
                                         f32 %504 = OpFAdd %501 %503 
                                Private f32* %505 = OpAccessChain %9 %19 
                                                      OpStore %505 %504 
                                Private f32* %506 = OpAccessChain %30 %19 
                                         f32 %507 = OpLoad %506 
                                         f32 %508 = OpFAdd %507 %493 
                                                      OpStore %488 %508 
                                Private f32* %509 = OpAccessChain %55 %19 
                                         f32 %510 = OpLoad %509 
                                         f32 %511 = OpLoad %488 
                                         f32 %512 = OpFDiv %510 %511 
                                                      OpStore %488 %512 
                                Uniform f32* %513 = OpAccessChain %16 %166 %33 
                                         f32 %514 = OpLoad %513 
                                Uniform f32* %515 = OpAccessChain %16 %166 %122 
                                         f32 %516 = OpLoad %515 
                                        bool %517 = OpFOrdGreaterThanEqual %514 %516 
                                                      OpStore %220 %517 
                                        bool %519 = OpLoad %220 
                                                      OpSelectionMerge %521 None 
                                                      OpBranchConditional %519 %520 %522 
                                             %520 = OpLabel 
                                                      OpStore %518 %224 
                                                      OpBranch %521 
                                             %522 = OpLabel 
                                                      OpStore %518 %135 
                                                      OpBranch %521 
                                             %521 = OpLabel 
                                         f32 %523 = OpLoad %518 
                                                      OpStore %115 %523 
                                Uniform f32* %524 = OpAccessChain %16 %166 %122 
                                         f32 %525 = OpLoad %524 
                                         f32 %526 = OpFNegate %525 
                                Uniform f32* %527 = OpAccessChain %16 %166 %33 
                                         f32 %528 = OpLoad %527 
                                         f32 %529 = OpFAdd %526 %528 
                                Private f32* %530 = OpAccessChain %55 %19 
                                                      OpStore %530 %529 
                                         f32 %531 = OpLoad %115 
                                Private f32* %532 = OpAccessChain %55 %19 
                                         f32 %533 = OpLoad %532 
                                         f32 %534 = OpFMul %531 %533 
                                Uniform f32* %535 = OpAccessChain %16 %166 %122 
                                         f32 %536 = OpLoad %535 
                                         f32 %537 = OpFAdd %534 %536 
                                                      OpStore %115 %537 
                                Uniform f32* %539 = OpAccessChain %16 %166 %19 
                                         f32 %540 = OpLoad %539 
                                         f32 %541 = OpLoad %115 
                                        bool %542 = OpFOrdGreaterThanEqual %540 %541 
                                                      OpStore %538 %542 
                                        bool %544 = OpLoad %538 
                                                      OpSelectionMerge %546 None 
                                                      OpBranchConditional %544 %545 %547 
                                             %545 = OpLabel 
                                                      OpStore %543 %224 
                                                      OpBranch %546 
                                             %547 = OpLabel 
                                                      OpStore %543 %135 
                                                      OpBranch %546 
                                             %546 = OpLabel 
                                         f32 %548 = OpLoad %543 
                                Private f32* %549 = OpAccessChain %55 %19 
                                                      OpStore %549 %548 
                                         f32 %551 = OpLoad %115 
                                         f32 %552 = OpFNegate %551 
                                Uniform f32* %553 = OpAccessChain %16 %166 %19 
                                         f32 %554 = OpLoad %553 
                                         f32 %555 = OpFAdd %552 %554 
                                                      OpStore %550 %555 
                                Private f32* %556 = OpAccessChain %55 %19 
                                         f32 %557 = OpLoad %556 
                                         f32 %558 = OpLoad %550 
                                         f32 %559 = OpFMul %557 %558 
                                         f32 %560 = OpLoad %115 
                                         f32 %561 = OpFAdd %559 %560 
                                                      OpStore %115 %561 
                                         f32 %562 = OpLoad %115 
                                Uniform f32* %564 = OpAccessChain %16 %563 
                                         f32 %565 = OpLoad %564 
                                         f32 %566 = OpFMul %562 %565 
                                Private f32* %567 = OpAccessChain %55 %19 
                                                      OpStore %567 %566 
                                Private f32* %568 = OpAccessChain %30 %19 
                                         f32 %569 = OpLoad %568 
                                Private f32* %570 = OpAccessChain %55 %19 
                                         f32 %571 = OpLoad %570 
                                         f32 %572 = OpExtInst %1 40 %569 %571 
                                Private f32* %573 = OpAccessChain %30 %19 
                                                      OpStore %573 %572 
                                         f32 %574 = OpLoad %115 
                                Uniform f32* %576 = OpAccessChain %16 %575 
                                         f32 %577 = OpLoad %576 
                                         f32 %578 = OpFMul %574 %577 
                                                      OpStore %115 %578 
                                         f32 %579 = OpLoad %115 
                                Private f32* %580 = OpAccessChain %30 %19 
                                         f32 %581 = OpLoad %580 
                                         f32 %582 = OpExtInst %1 37 %579 %581 
                                Private f32* %583 = OpAccessChain %30 %19 
                                                      OpStore %583 %582 
                                       f32_4 %584 = OpLoad %9 
                                       f32_3 %585 = OpVectorShuffle %584 %584 0 0 0 
                                       f32_3 %586 = OpExtInst %1 4 %585 
                                       f32_3 %589 = OpFAdd %586 %588 
                                       f32_4 %590 = OpLoad %55 
                                       f32_4 %591 = OpVectorShuffle %590 %589 4 5 6 3 
                                                      OpStore %55 %591 
                                       f32_4 %592 = OpLoad %55 
                                       f32_3 %593 = OpVectorShuffle %592 %592 0 1 2 
                                       f32_3 %594 = OpExtInst %1 10 %593 
                                       f32_4 %595 = OpLoad %55 
                                       f32_4 %596 = OpVectorShuffle %595 %594 4 5 6 3 
                                                      OpStore %55 %596 
                                       f32_4 %597 = OpLoad %55 
                                       f32_3 %598 = OpVectorShuffle %597 %597 0 1 2 
                                       f32_3 %600 = OpFMul %598 %599 
                                       f32_3 %603 = OpFAdd %600 %602 
                                       f32_4 %604 = OpLoad %55 
                                       f32_4 %605 = OpVectorShuffle %604 %603 4 5 6 3 
                                                      OpStore %55 %605 
                                       f32_4 %606 = OpLoad %55 
                                       f32_3 %607 = OpVectorShuffle %606 %606 0 1 2 
                                       f32_3 %608 = OpExtInst %1 4 %607 
                                       f32_3 %610 = OpFAdd %608 %609 
                                       f32_4 %611 = OpLoad %55 
                                       f32_4 %612 = OpVectorShuffle %611 %610 4 5 6 3 
                                                      OpStore %55 %612 
                                       f32_4 %613 = OpLoad %55 
                                       f32_3 %614 = OpVectorShuffle %613 %613 0 1 2 
                                       f32_3 %615 = OpCompositeConstruct %135 %135 %135 
                                       f32_3 %616 = OpCompositeConstruct %224 %224 %224 
                                       f32_3 %617 = OpExtInst %1 43 %614 %615 %616 
                                       f32_4 %618 = OpLoad %55 
                                       f32_4 %619 = OpVectorShuffle %618 %617 4 5 6 3 
                                                      OpStore %55 %619 
                                       f32_4 %620 = OpLoad %55 
                                       f32_3 %621 = OpVectorShuffle %620 %620 0 1 2 
                                       f32_3 %622 = OpFAdd %621 %609 
                                       f32_4 %623 = OpLoad %55 
                                       f32_4 %624 = OpVectorShuffle %623 %622 4 5 6 3 
                                                      OpStore %55 %624 
                                         f32 %625 = OpLoad %488 
                                       f32_3 %626 = OpCompositeConstruct %625 %625 %625 
                                       f32_4 %627 = OpLoad %55 
                                       f32_3 %628 = OpVectorShuffle %627 %627 0 1 2 
                                       f32_3 %629 = OpFMul %626 %628 
                                       f32_3 %631 = OpFAdd %629 %630 
                                       f32_4 %632 = OpLoad %9 
                                       f32_4 %633 = OpVectorShuffle %632 %631 4 1 5 6 
                                                      OpStore %9 %633 
                  read_only Texture2DSampled %636 = OpLoad %635 
                                       f32_4 %638 = OpImageSampleImplicitLod %636 %637 
                                         f32 %639 = OpCompositeExtract %638 0 
                                                      OpStore %634 %639 
                                       f32_3 %640 = OpLoad %30 
                                       f32_3 %641 = OpVectorShuffle %640 %640 0 0 0 
                                       f32_4 %642 = OpLoad %9 
                                       f32_3 %643 = OpVectorShuffle %642 %642 0 2 3 
                                       f32_3 %644 = OpFMul %641 %643 
                                       f32_3 %645 = OpLoad %173 
                                       f32_3 %646 = OpFNegate %645 
                                       f32_3 %647 = OpFAdd %644 %646 
                                       f32_4 %648 = OpLoad %9 
                                       f32_4 %649 = OpVectorShuffle %648 %647 4 5 6 3 
                                                      OpStore %9 %649 
                                         f32 %650 = OpLoad %634 
                                       f32_3 %651 = OpCompositeConstruct %650 %650 %650 
                                       f32_4 %652 = OpLoad %9 
                                       f32_3 %653 = OpVectorShuffle %652 %652 0 1 2 
                                       f32_3 %654 = OpFMul %651 %653 
                                       f32_3 %655 = OpLoad %173 
                                       f32_3 %656 = OpFAdd %654 %655 
                                       f32_4 %657 = OpLoad %9 
                                       f32_4 %658 = OpVectorShuffle %657 %656 4 5 6 3 
                                                      OpStore %9 %658 
                                       f32_4 %659 = OpLoad %9 
                                       f32_3 %660 = OpVectorShuffle %659 %659 0 1 2 
                                       f32_4 %661 = OpLoad %366 
                                       f32_4 %662 = OpVectorShuffle %661 %660 4 5 6 3 
                                                      OpStore %366 %662 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat0.x = u_xlat1.y * u_xlat1.y;
    u_xlat0.x = u_xlat1.x * u_xlat1.x + (-u_xlat0.x);
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat1.w = 1.0;
    u_xlat2.x = dot(unity_SHAr, u_xlat1);
    u_xlat2.y = dot(unity_SHAg, u_xlat1);
    u_xlat2.z = dot(unity_SHAb, u_xlat1);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD3.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _CausticScale;
uniform 	vec4 _CausticColor;
uniform 	float _ReflPower;
uniform 	float _TimeScale;
uniform 	vec4 _LightCausticColor;
uniform 	float _LightCausticPower;
uniform 	float _ValueMinimum;
uniform 	float _ValueMaximum;
uniform 	float _GlobalReflectionsEnabled;
uniform  sampler2D _MaskTex;
uniform  sampler2D _CausticTex;
uniform  sampler2D _ReflMapFromPixelator;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec2 u_xlat3;
vec3 u_xlat4;
float u_xlat7;
bool u_xlatb7;
float u_xlat9;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat0.x = _Time.x * _TimeScale;
    u_xlat3.x = vs_TEXCOORD1.y + vs_TEXCOORD1.x;
    u_xlat3.x = _Time.y * _TimeScale + u_xlat3.x;
    u_xlat1.x = sin(u_xlat3.x);
    u_xlat2.x = cos(u_xlat3.x);
    u_xlat2.x = u_xlat2.x * 0.111111112;
    u_xlat2.y = u_xlat1.x * 0.166666672;
    u_xlat3.xy = u_xlat2.xy + vs_TEXCOORD1.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(_CausticScale);
    u_xlat3.xy = u_xlat3.xy * vec2(0.200000003, 0.200000003);
    u_xlat0.xy = u_xlat0.xx * vec2(0.5, 0.125) + u_xlat3.xy;
    u_xlat10_0 = texture(_CausticTex, u_xlat0.xy);
    u_xlat9 = vs_TEXCOORD2.y * 500.0;
    u_xlat9 = _Time.z * 5.0 + u_xlat9;
    u_xlat9 = sin(u_xlat9);
    u_xlat1.x = u_xlat9 * 0.00150000001;
    u_xlat1.y = 0.0;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD2.xy;
    u_xlat10_1 = texture(_ReflMapFromPixelator, u_xlat1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_LightCausticPower);
    u_xlat0.xyz = u_xlat0.xyz * _LightCausticColor.xyz + _CausticColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.0500000007, 0.0500000007, 0.0500000007);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.75, 0.75, 0.75) + u_xlat10_1.xyz;
    u_xlat9 = u_xlat10_1.w * _ReflPower;
    u_xlat9 = u_xlat9 * _GlobalReflectionsEnabled;
    u_xlat0.xyz = (-u_xlat2.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz + u_xlat2.xyz;
    u_xlatb9 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb9){
        u_xlatb9 = unity_ProbeVolumeParams.y==1.0;
        u_xlat1.xyz = vs_TEXCOORD1.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.xxx + u_xlat1.xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD1.zzz + u_xlat1.xyz;
        u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : vs_TEXCOORD1.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat9 = u_xlat1.y * 0.25 + 0.75;
        u_xlat4.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat9, u_xlat4.x);
        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
    } else {
        u_xlat1.x = float(1.0);
        u_xlat1.y = float(1.0);
        u_xlat1.z = float(1.0);
        u_xlat1.w = float(1.0);
    //ENDIF
    }
    u_xlat9 = dot(u_xlat1, unity_OcclusionMaskSelector);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlatb9 = u_xlat0.y>=u_xlat0.z;
    u_xlat9 = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat1.xy = u_xlat0.zy;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat2.xy = u_xlat0.yz + (-u_xlat1.xy);
    u_xlat2.z = float(1.0);
    u_xlat2.w = float(-1.0);
    u_xlat1 = vec4(u_xlat9) * u_xlat2 + u_xlat1;
    u_xlatb9 = u_xlat0.x>=u_xlat1.x;
    u_xlat9 = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat2.xyz = u_xlat1.xyw;
    u_xlat2.w = u_xlat0.x;
    u_xlat1.xyw = u_xlat2.wyx;
    u_xlat1 = (-u_xlat2) + u_xlat1;
    u_xlat1 = vec4(u_xlat9) * u_xlat1 + u_xlat2;
    u_xlat9 = min(u_xlat1.y, u_xlat1.w);
    u_xlat9 = (-u_xlat9) + u_xlat1.x;
    u_xlat4.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat10 = u_xlat9 * 6.0 + 1.00000001e-010;
    u_xlat4.x = u_xlat4.x / u_xlat10;
    u_xlat4.x = u_xlat4.x + u_xlat1.z;
    u_xlat7 = u_xlat1.x + 1.00000001e-010;
    u_xlat9 = u_xlat9 / u_xlat7;
    u_xlatb7 = _CausticColor.y>=_CausticColor.z;
    u_xlat7 = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat10 = (-_CausticColor.z) + _CausticColor.y;
    u_xlat7 = u_xlat7 * u_xlat10 + _CausticColor.z;
    u_xlatb10 = _CausticColor.x>=u_xlat7;
    u_xlat10 = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat2.x = (-u_xlat7) + _CausticColor.x;
    u_xlat7 = u_xlat10 * u_xlat2.x + u_xlat7;
    u_xlat10 = u_xlat7 * _ValueMinimum;
    u_xlat1.x = max(u_xlat10, u_xlat1.x);
    u_xlat7 = u_xlat7 * _ValueMaximum;
    u_xlat1.x = min(u_xlat7, u_xlat1.x);
    u_xlat4.xyz = abs(u_xlat4.xxx) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = vec3(u_xlat9) * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10_2 = texture(_MaskTex, vec2(1.0, 0.0));
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + (-u_xlat0.xyz);
    SV_Target0.xyz = u_xlat10_2.xxx * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = _CausticColor.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 287
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %53 %94 %99 %137 %155 %276 %279 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 RelaxedPrecision 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 RelaxedPrecision 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 RelaxedPrecision 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 RelaxedPrecision 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 RelaxedPrecision 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 RelaxedPrecision 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpMemberDecorate %19 8 Offset 19 
                                                      OpMemberDecorate %19 9 Offset 19 
                                                      OpMemberDecorate %19 10 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %53 Location 53 
                                                      OpMemberDecorate %92 0 BuiltIn 92 
                                                      OpMemberDecorate %92 1 BuiltIn 92 
                                                      OpMemberDecorate %92 2 BuiltIn 92 
                                                      OpDecorate %92 Block 
                                                      OpDecorate %99 Location 99 
                                                      OpDecorate %137 Location 137 
                                                      OpDecorate %155 Location 155 
                                                      OpDecorate %169 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %276 Location 276 
                                                      OpDecorate %279 Location 279 
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
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %7 %7 %7 %7 %7 %7 %7 %16 %17 %18 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4];}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 8 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %29 = OpConstant 0 
                                          i32 %37 = OpConstant 2 
                               Private f32_4* %45 = OpVariable Private 
                                          i32 %47 = OpConstant 3 
                                              %51 = OpTypeVector %6 3 
                                              %52 = OpTypePointer Output %51 
                                Output f32_3* %53 = OpVariable Output 
                                          i32 %65 = OpConstant 10 
                                          u32 %90 = OpConstant 1 
                                              %91 = OpTypeArray %6 %90 
                                              %92 = OpTypeStruct %7 %6 %91 
                                              %93 = OpTypePointer Output %92 
         Output struct {f32_4; f32; f32[1];}* %94 = OpVariable Output 
                                              %96 = OpTypePointer Output %7 
                                              %98 = OpTypePointer Input %51 
                                 Input f32_3* %99 = OpVariable Input 
                                         i32 %101 = OpConstant 9 
                                         u32 %106 = OpConstant 0 
                                             %107 = OpTypePointer Private %6 
                                         u32 %120 = OpConstant 2 
                                Private f32* %122 = OpVariable Private 
                               Output f32_3* %137 = OpVariable Output 
                                             %142 = OpTypePointer Uniform %6 
                              Private f32_4* %147 = OpVariable Private 
                                         f32 %150 = OpConstant 3.67402E-40 
                                       f32_3 %151 = OpConstantComposite %150 %150 %150 
                               Output f32_4* %155 = OpVariable Output 
                                             %156 = OpTypeVector %6 2 
                                             %168 = OpTypePointer Private %51 
                              Private f32_3* %169 = OpVariable Private 
                              Private f32_4* %186 = OpVariable Private 
                              Private f32_3* %192 = OpVariable Private 
                                         i32 %193 = OpConstant 4 
                                         i32 %199 = OpConstant 5 
                                         i32 %205 = OpConstant 6 
                                         i32 %211 = OpConstant 7 
                                         f32 %220 = OpConstant 3.67402E-40 
                                         u32 %221 = OpConstant 3 
                                         f32 %242 = OpConstant 3.67402E-40 
                                       f32_3 %243 = OpConstantComposite %242 %242 %242 
                                         f32 %251 = OpConstant 3.67402E-40 
                                       f32_3 %252 = OpConstantComposite %251 %251 %251 
                                         f32 %263 = OpConstant 3.67402E-40 
                                       f32_3 %264 = OpConstantComposite %263 %263 %263 
                                         f32 %266 = OpConstant 3.67402E-40 
                                       f32_3 %267 = OpConstantComposite %266 %266 %266 
                               Output f32_3* %276 = OpVariable Output 
                               Output f32_4* %279 = OpVariable Output 
                                       f32_4 %280 = OpConstantComposite %242 %242 %242 %242 
                                             %281 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %30 = OpAccessChain %21 %23 %29 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpLoad %11 
                                        f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                                        f32_4 %34 = OpFMul %31 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpFAdd %34 %35 
                                                      OpStore %9 %36 
                               Uniform f32_4* %38 = OpAccessChain %21 %23 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                                        f32_4 %46 = OpLoad %9 
                               Uniform f32_4* %48 = OpAccessChain %21 %23 %47 
                                        f32_4 %49 = OpLoad %48 
                                        f32_4 %50 = OpFAdd %46 %49 
                                                      OpStore %45 %50 
                               Uniform f32_4* %54 = OpAccessChain %21 %23 %47 
                                        f32_4 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                                        f32_4 %57 = OpLoad %11 
                                        f32_3 %58 = OpVectorShuffle %57 %57 3 3 3 
                                        f32_3 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %9 
                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                                        f32_3 %62 = OpFAdd %59 %61 
                                                      OpStore %53 %62 
                                        f32_4 %63 = OpLoad %45 
                                        f32_4 %64 = OpVectorShuffle %63 %63 1 1 1 1 
                               Uniform f32_4* %66 = OpAccessChain %21 %65 %24 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpFMul %64 %67 
                                                      OpStore %9 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %65 %29 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %45 
                                        f32_4 %72 = OpVectorShuffle %71 %71 0 0 0 0 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                               Uniform f32_4* %76 = OpAccessChain %21 %65 %37 
                                        f32_4 %77 = OpLoad %76 
                                        f32_4 %78 = OpLoad %45 
                                        f32_4 %79 = OpVectorShuffle %78 %78 2 2 2 2 
                                        f32_4 %80 = OpFMul %77 %79 
                                        f32_4 %81 = OpLoad %9 
                                        f32_4 %82 = OpFAdd %80 %81 
                                                      OpStore %9 %82 
                               Uniform f32_4* %83 = OpAccessChain %21 %65 %47 
                                        f32_4 %84 = OpLoad %83 
                                        f32_4 %85 = OpLoad %45 
                                        f32_4 %86 = OpVectorShuffle %85 %85 3 3 3 3 
                                        f32_4 %87 = OpFMul %84 %86 
                                        f32_4 %88 = OpLoad %9 
                                        f32_4 %89 = OpFAdd %87 %88 
                                                      OpStore %9 %89 
                                        f32_4 %95 = OpLoad %9 
                                Output f32_4* %97 = OpAccessChain %94 %29 
                                                      OpStore %97 %95 
                                       f32_3 %100 = OpLoad %99 
                              Uniform f32_4* %102 = OpAccessChain %21 %101 %29 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                         f32 %105 = OpDot %100 %104 
                                Private f32* %108 = OpAccessChain %45 %106 
                                                      OpStore %108 %105 
                                       f32_3 %109 = OpLoad %99 
                              Uniform f32_4* %110 = OpAccessChain %21 %101 %24 
                                       f32_4 %111 = OpLoad %110 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                         f32 %113 = OpDot %109 %112 
                                Private f32* %114 = OpAccessChain %45 %90 
                                                      OpStore %114 %113 
                                       f32_3 %115 = OpLoad %99 
                              Uniform f32_4* %116 = OpAccessChain %21 %101 %37 
                                       f32_4 %117 = OpLoad %116 
                                       f32_3 %118 = OpVectorShuffle %117 %117 0 1 2 
                                         f32 %119 = OpDot %115 %118 
                                Private f32* %121 = OpAccessChain %45 %120 
                                                      OpStore %121 %119 
                                       f32_4 %123 = OpLoad %45 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                       f32_4 %125 = OpLoad %45 
                                       f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
                                         f32 %127 = OpDot %124 %126 
                                                      OpStore %122 %127 
                                         f32 %128 = OpLoad %122 
                                         f32 %129 = OpExtInst %1 32 %128 
                                                      OpStore %122 %129 
                                         f32 %130 = OpLoad %122 
                                       f32_3 %131 = OpCompositeConstruct %130 %130 %130 
                                       f32_4 %132 = OpLoad %45 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                       f32_3 %134 = OpFMul %131 %133 
                                       f32_4 %135 = OpLoad %45 
                                       f32_4 %136 = OpVectorShuffle %135 %134 4 5 6 3 
                                                      OpStore %45 %136 
                                       f32_4 %138 = OpLoad %45 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                                                      OpStore %137 %139 
                                Private f32* %140 = OpAccessChain %9 %90 
                                         f32 %141 = OpLoad %140 
                                Uniform f32* %143 = OpAccessChain %21 %29 %106 
                                         f32 %144 = OpLoad %143 
                                         f32 %145 = OpFMul %141 %144 
                                Private f32* %146 = OpAccessChain %9 %90 
                                                      OpStore %146 %145 
                                       f32_4 %148 = OpLoad %9 
                                       f32_3 %149 = OpVectorShuffle %148 %148 0 3 1 
                                       f32_3 %152 = OpFMul %149 %151 
                                       f32_4 %153 = OpLoad %147 
                                       f32_4 %154 = OpVectorShuffle %153 %152 4 1 5 6 
                                                      OpStore %147 %154 
                                       f32_4 %157 = OpLoad %9 
                                       f32_2 %158 = OpVectorShuffle %157 %157 2 3 
                                       f32_4 %159 = OpLoad %155 
                                       f32_4 %160 = OpVectorShuffle %159 %158 0 1 4 5 
                                                      OpStore %155 %160 
                                       f32_4 %161 = OpLoad %147 
                                       f32_2 %162 = OpVectorShuffle %161 %161 2 2 
                                       f32_4 %163 = OpLoad %147 
                                       f32_2 %164 = OpVectorShuffle %163 %163 0 3 
                                       f32_2 %165 = OpFAdd %162 %164 
                                       f32_4 %166 = OpLoad %155 
                                       f32_4 %167 = OpVectorShuffle %166 %165 4 5 2 3 
                                                      OpStore %155 %167 
                                Private f32* %170 = OpAccessChain %45 %90 
                                         f32 %171 = OpLoad %170 
                                Private f32* %172 = OpAccessChain %45 %90 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFMul %171 %173 
                                Private f32* %175 = OpAccessChain %169 %106 
                                                      OpStore %175 %174 
                                Private f32* %176 = OpAccessChain %45 %106 
                                         f32 %177 = OpLoad %176 
                                Private f32* %178 = OpAccessChain %45 %106 
                                         f32 %179 = OpLoad %178 
                                         f32 %180 = OpFMul %177 %179 
                                Private f32* %181 = OpAccessChain %169 %106 
                                         f32 %182 = OpLoad %181 
                                         f32 %183 = OpFNegate %182 
                                         f32 %184 = OpFAdd %180 %183 
                                Private f32* %185 = OpAccessChain %169 %106 
                                                      OpStore %185 %184 
                                       f32_4 %187 = OpLoad %45 
                                       f32_4 %188 = OpVectorShuffle %187 %187 1 2 2 0 
                                       f32_4 %189 = OpLoad %45 
                                       f32_4 %190 = OpVectorShuffle %189 %189 0 1 2 2 
                                       f32_4 %191 = OpFMul %188 %190 
                                                      OpStore %186 %191 
                              Uniform f32_4* %194 = OpAccessChain %21 %193 
                                       f32_4 %195 = OpLoad %194 
                                       f32_4 %196 = OpLoad %186 
                                         f32 %197 = OpDot %195 %196 
                                Private f32* %198 = OpAccessChain %192 %106 
                                                      OpStore %198 %197 
                              Uniform f32_4* %200 = OpAccessChain %21 %199 
                                       f32_4 %201 = OpLoad %200 
                                       f32_4 %202 = OpLoad %186 
                                         f32 %203 = OpDot %201 %202 
                                Private f32* %204 = OpAccessChain %192 %90 
                                                      OpStore %204 %203 
                              Uniform f32_4* %206 = OpAccessChain %21 %205 
                                       f32_4 %207 = OpLoad %206 
                                       f32_4 %208 = OpLoad %186 
                                         f32 %209 = OpDot %207 %208 
                                Private f32* %210 = OpAccessChain %192 %120 
                                                      OpStore %210 %209 
                              Uniform f32_4* %212 = OpAccessChain %21 %211 
                                       f32_4 %213 = OpLoad %212 
                                       f32_3 %214 = OpVectorShuffle %213 %213 0 1 2 
                                       f32_3 %215 = OpLoad %169 
                                       f32_3 %216 = OpVectorShuffle %215 %215 0 0 0 
                                       f32_3 %217 = OpFMul %214 %216 
                                       f32_3 %218 = OpLoad %192 
                                       f32_3 %219 = OpFAdd %217 %218 
                                                      OpStore %169 %219 
                                Private f32* %222 = OpAccessChain %45 %221 
                                                      OpStore %222 %220 
                              Uniform f32_4* %223 = OpAccessChain %21 %24 
                                       f32_4 %224 = OpLoad %223 
                                       f32_4 %225 = OpLoad %45 
                                         f32 %226 = OpDot %224 %225 
                                Private f32* %227 = OpAccessChain %192 %106 
                                                      OpStore %227 %226 
                              Uniform f32_4* %228 = OpAccessChain %21 %37 
                                       f32_4 %229 = OpLoad %228 
                                       f32_4 %230 = OpLoad %45 
                                         f32 %231 = OpDot %229 %230 
                                Private f32* %232 = OpAccessChain %192 %90 
                                                      OpStore %232 %231 
                              Uniform f32_4* %233 = OpAccessChain %21 %47 
                                       f32_4 %234 = OpLoad %233 
                                       f32_4 %235 = OpLoad %45 
                                         f32 %236 = OpDot %234 %235 
                                Private f32* %237 = OpAccessChain %192 %120 
                                                      OpStore %237 %236 
                                       f32_3 %238 = OpLoad %169 
                                       f32_3 %239 = OpLoad %192 
                                       f32_3 %240 = OpFAdd %238 %239 
                                                      OpStore %169 %240 
                                       f32_3 %241 = OpLoad %169 
                                       f32_3 %244 = OpExtInst %1 40 %241 %243 
                                                      OpStore %169 %244 
                                       f32_3 %245 = OpLoad %169 
                                       f32_3 %246 = OpExtInst %1 30 %245 
                                       f32_4 %247 = OpLoad %45 
                                       f32_4 %248 = OpVectorShuffle %247 %246 4 5 6 3 
                                                      OpStore %45 %248 
                                       f32_4 %249 = OpLoad %45 
                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
                                       f32_3 %253 = OpFMul %250 %252 
                                       f32_4 %254 = OpLoad %45 
                                       f32_4 %255 = OpVectorShuffle %254 %253 4 5 6 3 
                                                      OpStore %45 %255 
                                       f32_4 %256 = OpLoad %45 
                                       f32_3 %257 = OpVectorShuffle %256 %256 0 1 2 
                                       f32_3 %258 = OpExtInst %1 29 %257 
                                       f32_4 %259 = OpLoad %45 
                                       f32_4 %260 = OpVectorShuffle %259 %258 4 5 6 3 
                                                      OpStore %45 %260 
                                       f32_4 %261 = OpLoad %45 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                                       f32_3 %265 = OpFMul %262 %264 
                                       f32_3 %268 = OpFAdd %265 %267 
                                       f32_4 %269 = OpLoad %45 
                                       f32_4 %270 = OpVectorShuffle %269 %268 4 5 6 3 
                                                      OpStore %45 %270 
                                       f32_4 %271 = OpLoad %45 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                                       f32_3 %273 = OpExtInst %1 40 %272 %243 
                                       f32_4 %274 = OpLoad %45 
                                       f32_4 %275 = OpVectorShuffle %274 %273 4 5 6 3 
                                                      OpStore %45 %275 
                                       f32_4 %277 = OpLoad %45 
                                       f32_3 %278 = OpVectorShuffle %277 %277 0 1 2 
                                                      OpStore %276 %278 
                                                      OpStore %279 %280 
                                 Output f32* %282 = OpAccessChain %94 %29 %90 
                                         f32 %283 = OpLoad %282 
                                         f32 %284 = OpFNegate %283 
                                 Output f32* %285 = OpAccessChain %94 %29 %90 
                                                      OpStore %285 %284 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 664
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %32 %117 %360 %366 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 RelaxedPrecision 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpMemberDecorate %14 4 Offset 14 
                                                      OpMemberDecorate %14 5 Offset 14 
                                                      OpMemberDecorate %14 6 RelaxedPrecision 
                                                      OpMemberDecorate %14 6 Offset 14 
                                                      OpMemberDecorate %14 7 Offset 14 
                                                      OpMemberDecorate %14 8 Offset 14 
                                                      OpMemberDecorate %14 9 Offset 14 
                                                      OpMemberDecorate %14 10 Offset 14 
                                                      OpMemberDecorate %14 11 Offset 14 
                                                      OpMemberDecorate %14 12 Offset 14 
                                                      OpMemberDecorate %14 13 Offset 14 
                                                      OpMemberDecorate %14 14 Offset 14 
                                                      OpMemberDecorate %14 15 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate %32 Location 32 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %109 RelaxedPrecision 
                                                      OpDecorate %109 DescriptorSet 109 
                                                      OpDecorate %109 Binding 109 
                                                      OpDecorate %110 RelaxedPrecision 
                                                      OpDecorate %114 RelaxedPrecision 
                                                      OpDecorate %117 Location 117 
                                                      OpDecorate %144 RelaxedPrecision 
                                                      OpDecorate %145 RelaxedPrecision 
                                                      OpDecorate %145 DescriptorSet 145 
                                                      OpDecorate %145 Binding 145 
                                                      OpDecorate %146 RelaxedPrecision 
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %154 RelaxedPrecision 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %232 SpecId 232 
                                                      OpDecorate %325 DescriptorSet 325 
                                                      OpDecorate %325 Binding 325 
                                                      OpDecorate %330 RelaxedPrecision 
                                                      OpDecorate %337 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %344 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %352 RelaxedPrecision 
                                                      OpDecorate %354 RelaxedPrecision 
                                                      OpDecorate %355 RelaxedPrecision 
                                                      OpDecorate %356 RelaxedPrecision 
                                                      OpDecorate %357 RelaxedPrecision 
                                                      OpDecorate %360 RelaxedPrecision 
                                                      OpDecorate %360 Location 360 
                                                      OpDecorate %361 RelaxedPrecision 
                                                      OpDecorate %363 RelaxedPrecision 
                                                      OpDecorate %366 RelaxedPrecision 
                                                      OpDecorate %366 Location 366 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %375 RelaxedPrecision 
                                                      OpDecorate %385 RelaxedPrecision 
                                                      OpDecorate %386 RelaxedPrecision 
                                                      OpDecorate %387 RelaxedPrecision 
                                                      OpDecorate %388 RelaxedPrecision 
                                                      OpDecorate %389 RelaxedPrecision 
                                                      OpDecorate %390 RelaxedPrecision 
                                                      OpDecorate %398 RelaxedPrecision 
                                                      OpDecorate %399 RelaxedPrecision 
                                                      OpDecorate %401 RelaxedPrecision 
                                                      OpDecorate %402 RelaxedPrecision 
                                                      OpDecorate %417 RelaxedPrecision 
                                                      OpDecorate %434 RelaxedPrecision 
                                                      OpDecorate %435 RelaxedPrecision 
                                                      OpDecorate %441 RelaxedPrecision 
                                                      OpDecorate %465 RelaxedPrecision 
                                                      OpDecorate %634 RelaxedPrecision 
                                                      OpDecorate %635 RelaxedPrecision 
                                                      OpDecorate %635 DescriptorSet 635 
                                                      OpDecorate %635 Binding 635 
                                                      OpDecorate %636 RelaxedPrecision 
                                                      OpDecorate %639 RelaxedPrecision 
                                                      OpDecorate %645 RelaxedPrecision 
                                                      OpDecorate %646 RelaxedPrecision 
                                                      OpDecorate %650 RelaxedPrecision 
                                                      OpDecorate %655 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeVector %6 3 
                                              %14 = OpTypeStruct %7 %7 %7 %12 %13 %13 %7 %6 %7 %6 %6 %7 %6 %6 %6 %6 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32_4; f32; f32; f32_4; f32; f32; f32; f32;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 0 
                                          u32 %19 = OpConstant 0 
                                              %20 = OpTypePointer Uniform %6 
                                          i32 %23 = OpConstant 10 
                                              %27 = OpTypePointer Private %6 
                                              %29 = OpTypePointer Private %13 
                               Private f32_3* %30 = OpVariable Private 
                                              %31 = OpTypePointer Input %13 
                                 Input f32_3* %32 = OpVariable Input 
                                          u32 %33 = OpConstant 1 
                                              %34 = OpTypePointer Input %6 
                               Private f32_4* %50 = OpVariable Private 
                               Private f32_4* %55 = OpVariable Private 
                                          f32 %62 = OpConstant 3.67402E-40 
                                          f32 %67 = OpConstant 3.67402E-40 
                                              %70 = OpTypeVector %6 2 
                                          i32 %80 = OpConstant 7 
                                          f32 %89 = OpConstant 3.67402E-40 
                                        f32_2 %90 = OpConstantComposite %89 %89 
                                          f32 %96 = OpConstant 3.67402E-40 
                                          f32 %97 = OpConstant 3.67402E-40 
                                        f32_2 %98 = OpConstantComposite %96 %97 
                              Private f32_3* %105 = OpVariable Private 
                                             %106 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %107 = OpTypeSampledImage %106 
                                             %108 = OpTypePointer UniformConstant %107 
 UniformConstant read_only Texture2DSampled* %109 = OpVariable UniformConstant 
                                Private f32* %115 = OpVariable Private 
                                             %116 = OpTypePointer Input %7 
                                Input f32_4* %117 = OpVariable Input 
                                         f32 %120 = OpConstant 3.67402E-40 
                                         u32 %122 = OpConstant 2 
                                         f32 %125 = OpConstant 3.67402E-40 
                                         f32 %132 = OpConstant 3.67402E-40 
                                         f32 %135 = OpConstant 3.67402E-40 
                              Private f32_4* %144 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %145 = OpVariable UniformConstant 
                                         i32 %151 = OpConstant 12 
                                         i32 %160 = OpConstant 11 
                                             %161 = OpTypePointer Uniform %7 
                                         i32 %166 = OpConstant 8 
                              Private f32_3* %173 = OpVariable Private 
                                       f32_3 %176 = OpConstantComposite %96 %96 %96 
                                         f32 %178 = OpConstant 3.67402E-40 
                                       f32_3 %179 = OpConstantComposite %178 %178 %178 
                              Private f32_3* %181 = OpVariable Private 
                                         f32 %184 = OpConstant 3.67402E-40 
                                       f32_3 %185 = OpConstantComposite %184 %184 %184 
                                         u32 %190 = OpConstant 3 
                                         i32 %193 = OpConstant 9 
                                         i32 %200 = OpConstant 15 
                              Private f32_3* %205 = OpVariable Private 
                                             %218 = OpTypeBool 
                                             %219 = OpTypePointer Private %218 
                               Private bool* %220 = OpVariable Private 
                                         i32 %221 = OpConstant 2 
                                         f32 %224 = OpConstant 3.67402E-40 
                                        bool %226 = OpConstantFalse 
                                        bool %232 = OpSpecConstantFalse 
                                         i32 %240 = OpConstant 3 
                                         i32 %241 = OpConstant 1 
                                             %278 = OpTypePointer Function %13 
                                         i32 %292 = OpConstant 5 
                                             %293 = OpTypePointer Uniform %13 
                                         i32 %302 = OpConstant 4 
                                         f32 %310 = OpConstant 3.67402E-40 
                                Private f32* %313 = OpVariable Private 
                                             %322 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %323 = OpTypeSampledImage %322 
                                             %324 = OpTypePointer UniformConstant %323 
 UniformConstant read_only Texture3DSampled* %325 = OpVariable UniformConstant 
                              Private f32_4* %330 = OpVariable Private 
                              Private f32_3* %346 = OpVariable Private 
                                         i32 %349 = OpConstant 6 
                                Input f32_3* %360 = OpVariable Input 
                                             %365 = OpTypePointer Output %7 
                               Output f32_4* %366 = OpVariable Output 
                                             %369 = OpTypePointer Output %6 
                               Private bool* %371 = OpVariable Private 
                                             %377 = OpTypePointer Function %6 
                                         f32 %394 = OpConstant 3.67402E-40 
                                         f32 %411 = OpConstant 3.67402E-40 
                                       f32_2 %412 = OpConstantComposite %394 %411 
                              Private f32_4* %437 = OpVariable Private 
                                Private f32* %488 = OpVariable Private 
                                         f32 %491 = OpConstant 3.67402E-40 
                                         f32 %493 = OpConstant 3.67402E-40 
                               Private bool* %538 = OpVariable Private 
                                Private f32* %550 = OpVariable Private 
                                         i32 %563 = OpConstant 13 
                                         i32 %575 = OpConstant 14 
                                         f32 %587 = OpConstant 3.67402E-40 
                                       f32_3 %588 = OpConstantComposite %224 %411 %587 
                                       f32_3 %599 = OpConstantComposite %491 %491 %491 
                                         f32 %601 = OpConstant 3.67402E-40 
                                       f32_3 %602 = OpConstantComposite %601 %601 %601 
                                       f32_3 %609 = OpConstantComposite %394 %394 %394 
                                       f32_3 %630 = OpConstantComposite %224 %224 %224 
                                Private f32* %634 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %635 = OpVariable UniformConstant 
                                       f32_2 %637 = OpConstantComposite %224 %135 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %279 = OpVariable Function 
                               Function f32* %378 = OpVariable Function 
                               Function f32* %421 = OpVariable Function 
                               Function f32* %518 = OpVariable Function 
                               Function f32* %543 = OpVariable Function 
                                 Uniform f32* %21 = OpAccessChain %16 %18 %19 
                                          f32 %22 = OpLoad %21 
                                 Uniform f32* %24 = OpAccessChain %16 %23 
                                          f32 %25 = OpLoad %24 
                                          f32 %26 = OpFMul %22 %25 
                                 Private f32* %28 = OpAccessChain %9 %19 
                                                      OpStore %28 %26 
                                   Input f32* %35 = OpAccessChain %32 %33 
                                          f32 %36 = OpLoad %35 
                                   Input f32* %37 = OpAccessChain %32 %19 
                                          f32 %38 = OpLoad %37 
                                          f32 %39 = OpFAdd %36 %38 
                                 Private f32* %40 = OpAccessChain %30 %19 
                                                      OpStore %40 %39 
                                 Uniform f32* %41 = OpAccessChain %16 %18 %33 
                                          f32 %42 = OpLoad %41 
                                 Uniform f32* %43 = OpAccessChain %16 %23 
                                          f32 %44 = OpLoad %43 
                                          f32 %45 = OpFMul %42 %44 
                                 Private f32* %46 = OpAccessChain %30 %19 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpFAdd %45 %47 
                                 Private f32* %49 = OpAccessChain %30 %19 
                                                      OpStore %49 %48 
                                 Private f32* %51 = OpAccessChain %30 %19 
                                          f32 %52 = OpLoad %51 
                                          f32 %53 = OpExtInst %1 13 %52 
                                 Private f32* %54 = OpAccessChain %50 %19 
                                                      OpStore %54 %53 
                                 Private f32* %56 = OpAccessChain %30 %19 
                                          f32 %57 = OpLoad %56 
                                          f32 %58 = OpExtInst %1 14 %57 
                                 Private f32* %59 = OpAccessChain %55 %19 
                                                      OpStore %59 %58 
                                 Private f32* %60 = OpAccessChain %55 %19 
                                          f32 %61 = OpLoad %60 
                                          f32 %63 = OpFMul %61 %62 
                                 Private f32* %64 = OpAccessChain %55 %19 
                                                      OpStore %64 %63 
                                 Private f32* %65 = OpAccessChain %50 %19 
                                          f32 %66 = OpLoad %65 
                                          f32 %68 = OpFMul %66 %67 
                                 Private f32* %69 = OpAccessChain %55 %33 
                                                      OpStore %69 %68 
                                        f32_4 %71 = OpLoad %55 
                                        f32_2 %72 = OpVectorShuffle %71 %71 0 1 
                                        f32_3 %73 = OpLoad %32 
                                        f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                                        f32_2 %75 = OpFAdd %72 %74 
                                        f32_3 %76 = OpLoad %30 
                                        f32_3 %77 = OpVectorShuffle %76 %75 3 4 2 
                                                      OpStore %30 %77 
                                        f32_3 %78 = OpLoad %30 
                                        f32_2 %79 = OpVectorShuffle %78 %78 0 1 
                                 Uniform f32* %81 = OpAccessChain %16 %80 
                                          f32 %82 = OpLoad %81 
                                        f32_2 %83 = OpCompositeConstruct %82 %82 
                                        f32_2 %84 = OpFMul %79 %83 
                                        f32_3 %85 = OpLoad %30 
                                        f32_3 %86 = OpVectorShuffle %85 %84 3 4 2 
                                                      OpStore %30 %86 
                                        f32_3 %87 = OpLoad %30 
                                        f32_2 %88 = OpVectorShuffle %87 %87 0 1 
                                        f32_2 %91 = OpFMul %88 %90 
                                        f32_3 %92 = OpLoad %30 
                                        f32_3 %93 = OpVectorShuffle %92 %91 3 4 2 
                                                      OpStore %30 %93 
                                        f32_4 %94 = OpLoad %9 
                                        f32_2 %95 = OpVectorShuffle %94 %94 0 0 
                                        f32_2 %99 = OpFMul %95 %98 
                                       f32_3 %100 = OpLoad %30 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                       f32_2 %102 = OpFAdd %99 %101 
                                       f32_4 %103 = OpLoad %9 
                                       f32_4 %104 = OpVectorShuffle %103 %102 4 5 2 3 
                                                      OpStore %9 %104 
                  read_only Texture2DSampled %110 = OpLoad %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_2 %112 = OpVectorShuffle %111 %111 0 1 
                                       f32_4 %113 = OpImageSampleImplicitLod %110 %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                                      OpStore %105 %114 
                                  Input f32* %118 = OpAccessChain %117 %33 
                                         f32 %119 = OpLoad %118 
                                         f32 %121 = OpFMul %119 %120 
                                                      OpStore %115 %121 
                                Uniform f32* %123 = OpAccessChain %16 %18 %122 
                                         f32 %124 = OpLoad %123 
                                         f32 %126 = OpFMul %124 %125 
                                         f32 %127 = OpLoad %115 
                                         f32 %128 = OpFAdd %126 %127 
                                                      OpStore %115 %128 
                                         f32 %129 = OpLoad %115 
                                         f32 %130 = OpExtInst %1 13 %129 
                                                      OpStore %115 %130 
                                         f32 %131 = OpLoad %115 
                                         f32 %133 = OpFMul %131 %132 
                                Private f32* %134 = OpAccessChain %50 %19 
                                                      OpStore %134 %133 
                                Private f32* %136 = OpAccessChain %50 %33 
                                                      OpStore %136 %135 
                                       f32_4 %137 = OpLoad %50 
                                       f32_2 %138 = OpVectorShuffle %137 %137 0 1 
                                       f32_4 %139 = OpLoad %117 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_2 %141 = OpFAdd %138 %140 
                                       f32_4 %142 = OpLoad %50 
                                       f32_4 %143 = OpVectorShuffle %142 %141 4 5 2 3 
                                                      OpStore %50 %143 
                  read_only Texture2DSampled %146 = OpLoad %145 
                                       f32_4 %147 = OpLoad %50 
                                       f32_2 %148 = OpVectorShuffle %147 %147 0 1 
                                       f32_4 %149 = OpImageSampleImplicitLod %146 %148 
                                                      OpStore %144 %149 
                                       f32_3 %150 = OpLoad %105 
                                Uniform f32* %152 = OpAccessChain %16 %151 
                                         f32 %153 = OpLoad %152 
                                       f32_3 %154 = OpCompositeConstruct %153 %153 %153 
                                       f32_3 %155 = OpFMul %150 %154 
                                       f32_4 %156 = OpLoad %9 
                                       f32_4 %157 = OpVectorShuffle %156 %155 4 5 6 3 
                                                      OpStore %9 %157 
                                       f32_4 %158 = OpLoad %9 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                              Uniform f32_4* %162 = OpAccessChain %16 %160 
                                       f32_4 %163 = OpLoad %162 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                                       f32_3 %165 = OpFMul %159 %164 
                              Uniform f32_4* %167 = OpAccessChain %16 %166 
                                       f32_4 %168 = OpLoad %167 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                       f32_3 %170 = OpFAdd %165 %169 
                                       f32_4 %171 = OpLoad %9 
                                       f32_4 %172 = OpVectorShuffle %171 %170 4 5 6 3 
                                                      OpStore %9 %172 
                                       f32_4 %174 = OpLoad %9 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                                       f32_3 %177 = OpFMul %175 %176 
                                       f32_3 %180 = OpFAdd %177 %179 
                                                      OpStore %173 %180 
                                       f32_4 %182 = OpLoad %9 
                                       f32_3 %183 = OpVectorShuffle %182 %182 0 1 2 
                                       f32_3 %186 = OpFMul %183 %185 
                                       f32_4 %187 = OpLoad %144 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                                       f32_3 %189 = OpFAdd %186 %188 
                                                      OpStore %181 %189 
                                Private f32* %191 = OpAccessChain %144 %190 
                                         f32 %192 = OpLoad %191 
                                Uniform f32* %194 = OpAccessChain %16 %193 
                                         f32 %195 = OpLoad %194 
                                         f32 %196 = OpFMul %192 %195 
                                Private f32* %197 = OpAccessChain %9 %19 
                                                      OpStore %197 %196 
                                Private f32* %198 = OpAccessChain %9 %19 
                                         f32 %199 = OpLoad %198 
                                Uniform f32* %201 = OpAccessChain %16 %200 
                                         f32 %202 = OpLoad %201 
                                         f32 %203 = OpFMul %199 %202 
                                Private f32* %204 = OpAccessChain %9 %19 
                                                      OpStore %204 %203 
                                       f32_3 %206 = OpLoad %173 
                                       f32_3 %207 = OpFNegate %206 
                                       f32_3 %208 = OpLoad %181 
                                       f32_3 %209 = OpFAdd %207 %208 
                                                      OpStore %205 %209 
                                       f32_4 %210 = OpLoad %9 
                                       f32_3 %211 = OpVectorShuffle %210 %210 0 0 0 
                                       f32_3 %212 = OpLoad %205 
                                       f32_3 %213 = OpFMul %211 %212 
                                       f32_3 %214 = OpLoad %173 
                                       f32_3 %215 = OpFAdd %213 %214 
                                       f32_4 %216 = OpLoad %9 
                                       f32_4 %217 = OpVectorShuffle %216 %215 4 5 6 3 
                                                      OpStore %9 %217 
                                Uniform f32* %222 = OpAccessChain %16 %221 %19 
                                         f32 %223 = OpLoad %222 
                                        bool %225 = OpFOrdEqual %223 %224 
                                                      OpStore %220 %225 
                                                      OpSelectionMerge %228 None 
                                                      OpBranchConditional %226 %227 %228 
                                             %227 = OpLabel 
                                        bool %229 = OpLoad %220 
                                                      OpSelectionMerge %231 None 
                                                      OpBranchConditional %229 %230 %231 
                                             %230 = OpLabel 
                                                      OpBranch %231 
                                             %231 = OpLabel 
                                                      OpBranch %228 
                                             %228 = OpLabel 
                                                      OpSelectionMerge %234 None 
                                                      OpBranchConditional %232 %233 %332 
                                             %233 = OpLabel 
                                Uniform f32* %235 = OpAccessChain %16 %221 %33 
                                         f32 %236 = OpLoad %235 
                                        bool %237 = OpFOrdEqual %236 %224 
                                                      OpStore %220 %237 
                                       f32_3 %238 = OpLoad %32 
                                       f32_3 %239 = OpVectorShuffle %238 %238 1 1 1 
                              Uniform f32_4* %242 = OpAccessChain %16 %240 %241 
                                       f32_4 %243 = OpLoad %242 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 1 2 
                                       f32_3 %245 = OpFMul %239 %244 
                                       f32_4 %246 = OpLoad %50 
                                       f32_4 %247 = OpVectorShuffle %246 %245 4 5 6 3 
                                                      OpStore %50 %247 
                              Uniform f32_4* %248 = OpAccessChain %16 %240 %18 
                                       f32_4 %249 = OpLoad %248 
                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
                                       f32_3 %251 = OpLoad %32 
                                       f32_3 %252 = OpVectorShuffle %251 %251 0 0 0 
                                       f32_3 %253 = OpFMul %250 %252 
                                       f32_4 %254 = OpLoad %50 
                                       f32_3 %255 = OpVectorShuffle %254 %254 0 1 2 
                                       f32_3 %256 = OpFAdd %253 %255 
                                       f32_4 %257 = OpLoad %50 
                                       f32_4 %258 = OpVectorShuffle %257 %256 4 5 6 3 
                                                      OpStore %50 %258 
                              Uniform f32_4* %259 = OpAccessChain %16 %240 %221 
                                       f32_4 %260 = OpLoad %259 
                                       f32_3 %261 = OpVectorShuffle %260 %260 0 1 2 
                                       f32_3 %262 = OpLoad %32 
                                       f32_3 %263 = OpVectorShuffle %262 %262 2 2 2 
                                       f32_3 %264 = OpFMul %261 %263 
                                       f32_4 %265 = OpLoad %50 
                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
                                       f32_3 %267 = OpFAdd %264 %266 
                                       f32_4 %268 = OpLoad %50 
                                       f32_4 %269 = OpVectorShuffle %268 %267 4 5 6 3 
                                                      OpStore %50 %269 
                                       f32_4 %270 = OpLoad %50 
                                       f32_3 %271 = OpVectorShuffle %270 %270 0 1 2 
                              Uniform f32_4* %272 = OpAccessChain %16 %240 %240 
                                       f32_4 %273 = OpLoad %272 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                                       f32_3 %275 = OpFAdd %271 %274 
                                       f32_4 %276 = OpLoad %50 
                                       f32_4 %277 = OpVectorShuffle %276 %275 4 5 6 3 
                                                      OpStore %50 %277 
                                        bool %280 = OpLoad %220 
                                                      OpSelectionMerge %282 None 
                                                      OpBranchConditional %280 %281 %285 
                                             %281 = OpLabel 
                                       f32_4 %283 = OpLoad %50 
                                       f32_3 %284 = OpVectorShuffle %283 %283 0 1 2 
                                                      OpStore %279 %284 
                                                      OpBranch %282 
                                             %285 = OpLabel 
                                       f32_3 %286 = OpLoad %32 
                                                      OpStore %279 %286 
                                                      OpBranch %282 
                                             %282 = OpLabel 
                                       f32_3 %287 = OpLoad %279 
                                       f32_4 %288 = OpLoad %50 
                                       f32_4 %289 = OpVectorShuffle %288 %287 4 5 6 3 
                                                      OpStore %50 %289 
                                       f32_4 %290 = OpLoad %50 
                                       f32_3 %291 = OpVectorShuffle %290 %290 0 1 2 
                              Uniform f32_3* %294 = OpAccessChain %16 %292 
                                       f32_3 %295 = OpLoad %294 
                                       f32_3 %296 = OpFNegate %295 
                                       f32_3 %297 = OpFAdd %291 %296 
                                       f32_4 %298 = OpLoad %50 
                                       f32_4 %299 = OpVectorShuffle %298 %297 4 5 6 3 
                                                      OpStore %50 %299 
                                       f32_4 %300 = OpLoad %50 
                                       f32_3 %301 = OpVectorShuffle %300 %300 0 1 2 
                              Uniform f32_3* %303 = OpAccessChain %16 %302 
                                       f32_3 %304 = OpLoad %303 
                                       f32_3 %305 = OpFMul %301 %304 
                                       f32_4 %306 = OpLoad %50 
                                       f32_4 %307 = OpVectorShuffle %306 %305 0 4 5 6 
                                                      OpStore %50 %307 
                                Private f32* %308 = OpAccessChain %50 %33 
                                         f32 %309 = OpLoad %308 
                                         f32 %311 = OpFMul %309 %310 
                                         f32 %312 = OpFAdd %311 %184 
                                                      OpStore %115 %312 
                                Uniform f32* %314 = OpAccessChain %16 %221 %122 
                                         f32 %315 = OpLoad %314 
                                         f32 %316 = OpFMul %315 %96 
                                         f32 %317 = OpFAdd %316 %184 
                                                      OpStore %313 %317 
                                         f32 %318 = OpLoad %115 
                                         f32 %319 = OpLoad %313 
                                         f32 %320 = OpExtInst %1 40 %318 %319 
                                Private f32* %321 = OpAccessChain %50 %19 
                                                      OpStore %321 %320 
                  read_only Texture3DSampled %326 = OpLoad %325 
                                       f32_4 %327 = OpLoad %50 
                                       f32_3 %328 = OpVectorShuffle %327 %327 0 2 3 
                                       f32_4 %329 = OpImageSampleImplicitLod %326 %328 
                                                      OpStore %50 %329 
                                       f32_4 %331 = OpLoad %50 
                                                      OpStore %330 %331 
                                                      OpBranch %234 
                                             %332 = OpLabel 
                                Private f32* %333 = OpAccessChain %330 %19 
                                                      OpStore %333 %224 
                                Private f32* %334 = OpAccessChain %330 %33 
                                                      OpStore %334 %224 
                                Private f32* %335 = OpAccessChain %330 %122 
                                                      OpStore %335 %224 
                                Private f32* %336 = OpAccessChain %330 %190 
                                                      OpStore %336 %224 
                                                      OpBranch %234 
                                             %234 = OpLabel 
                                       f32_4 %337 = OpLoad %330 
                              Uniform f32_4* %338 = OpAccessChain %16 %241 
                                       f32_4 %339 = OpLoad %338 
                                         f32 %340 = OpDot %337 %339 
                                Private f32* %341 = OpAccessChain %173 %19 
                                                      OpStore %341 %340 
                                Private f32* %342 = OpAccessChain %173 %19 
                                         f32 %343 = OpLoad %342 
                                         f32 %344 = OpExtInst %1 43 %343 %135 %224 
                                Private f32* %345 = OpAccessChain %173 %19 
                                                      OpStore %345 %344 
                                       f32_4 %347 = OpLoad %9 
                                       f32_3 %348 = OpVectorShuffle %347 %347 0 1 2 
                              Uniform f32_4* %350 = OpAccessChain %16 %349 
                                       f32_4 %351 = OpLoad %350 
                                       f32_3 %352 = OpVectorShuffle %351 %351 0 1 2 
                                       f32_3 %353 = OpFMul %348 %352 
                                                      OpStore %346 %353 
                                       f32_3 %354 = OpLoad %173 
                                       f32_3 %355 = OpVectorShuffle %354 %354 0 0 0 
                                       f32_3 %356 = OpLoad %346 
                                       f32_3 %357 = OpFMul %355 %356 
                                                      OpStore %173 %357 
                                       f32_4 %358 = OpLoad %9 
                                       f32_3 %359 = OpVectorShuffle %358 %358 0 1 2 
                                       f32_3 %361 = OpLoad %360 
                                       f32_3 %362 = OpFMul %359 %361 
                                       f32_3 %363 = OpLoad %173 
                                       f32_3 %364 = OpFAdd %362 %363 
                                                      OpStore %173 %364 
                                Uniform f32* %367 = OpAccessChain %16 %166 %190 
                                         f32 %368 = OpLoad %367 
                                 Output f32* %370 = OpAccessChain %366 %190 
                                                      OpStore %370 %368 
                                Private f32* %372 = OpAccessChain %173 %33 
                                         f32 %373 = OpLoad %372 
                                Private f32* %374 = OpAccessChain %173 %122 
                                         f32 %375 = OpLoad %374 
                                        bool %376 = OpFOrdGreaterThanEqual %373 %375 
                                                      OpStore %371 %376 
                                        bool %379 = OpLoad %371 
                                                      OpSelectionMerge %381 None 
                                                      OpBranchConditional %379 %380 %382 
                                             %380 = OpLabel 
                                                      OpStore %378 %224 
                                                      OpBranch %381 
                                             %382 = OpLabel 
                                                      OpStore %378 %135 
                                                      OpBranch %381 
                                             %381 = OpLabel 
                                         f32 %383 = OpLoad %378 
                                Private f32* %384 = OpAccessChain %9 %19 
                                                      OpStore %384 %383 
                                       f32_3 %385 = OpLoad %173 
                                       f32_2 %386 = OpVectorShuffle %385 %385 2 1 
                                       f32_2 %387 = OpFNegate %386 
                                       f32_3 %388 = OpLoad %173 
                                       f32_2 %389 = OpVectorShuffle %388 %388 1 2 
                                       f32_2 %390 = OpFAdd %387 %389 
                                       f32_3 %391 = OpLoad %205 
                                       f32_3 %392 = OpVectorShuffle %391 %390 3 4 2 
                                                      OpStore %205 %392 
                                Private f32* %393 = OpAccessChain %55 %19 
                                                      OpStore %393 %224 
                                Private f32* %395 = OpAccessChain %55 %33 
                                                      OpStore %395 %394 
                                       f32_4 %396 = OpLoad %9 
                                       f32_2 %397 = OpVectorShuffle %396 %396 0 0 
                                       f32_3 %398 = OpLoad %205 
                                       f32_2 %399 = OpVectorShuffle %398 %398 0 1 
                                       f32_2 %400 = OpFMul %397 %399 
                                       f32_3 %401 = OpLoad %173 
                                       f32_2 %402 = OpVectorShuffle %401 %401 2 1 
                                       f32_2 %403 = OpFAdd %400 %402 
                                       f32_4 %404 = OpLoad %50 
                                       f32_4 %405 = OpVectorShuffle %404 %403 4 5 2 3 
                                                      OpStore %50 %405 
                                       f32_4 %406 = OpLoad %9 
                                       f32_2 %407 = OpVectorShuffle %406 %406 0 0 
                                       f32_4 %408 = OpLoad %55 
                                       f32_2 %409 = OpVectorShuffle %408 %408 0 1 
                                       f32_2 %410 = OpFMul %407 %409 
                                       f32_2 %413 = OpFAdd %410 %412 
                                       f32_4 %414 = OpLoad %50 
                                       f32_4 %415 = OpVectorShuffle %414 %413 0 1 4 5 
                                                      OpStore %50 %415 
                                Private f32* %416 = OpAccessChain %173 %19 
                                         f32 %417 = OpLoad %416 
                                Private f32* %418 = OpAccessChain %50 %19 
                                         f32 %419 = OpLoad %418 
                                        bool %420 = OpFOrdGreaterThanEqual %417 %419 
                                                      OpStore %371 %420 
                                        bool %422 = OpLoad %371 
                                                      OpSelectionMerge %424 None 
                                                      OpBranchConditional %422 %423 %425 
                                             %423 = OpLabel 
                                                      OpStore %421 %224 
                                                      OpBranch %424 
                                             %425 = OpLabel 
                                                      OpStore %421 %135 
                                                      OpBranch %424 
                                             %424 = OpLabel 
                                         f32 %426 = OpLoad %421 
                                Private f32* %427 = OpAccessChain %9 %19 
                                                      OpStore %427 %426 
                                       f32_4 %428 = OpLoad %50 
                                       f32_3 %429 = OpVectorShuffle %428 %428 0 1 3 
                                       f32_3 %430 = OpFNegate %429 
                                       f32_4 %431 = OpLoad %55 
                                       f32_4 %432 = OpVectorShuffle %431 %430 4 5 6 3 
                                                      OpStore %55 %432 
                                Private f32* %433 = OpAccessChain %173 %19 
                                         f32 %434 = OpLoad %433 
                                         f32 %435 = OpFNegate %434 
                                Private f32* %436 = OpAccessChain %55 %190 
                                                      OpStore %436 %435 
                                Private f32* %438 = OpAccessChain %55 %19 
                                         f32 %439 = OpLoad %438 
                                Private f32* %440 = OpAccessChain %173 %19 
                                         f32 %441 = OpLoad %440 
                                         f32 %442 = OpFAdd %439 %441 
                                Private f32* %443 = OpAccessChain %437 %19 
                                                      OpStore %443 %442 
                                       f32_4 %444 = OpLoad %50 
                                       f32_3 %445 = OpVectorShuffle %444 %444 1 2 0 
                                       f32_4 %446 = OpLoad %55 
                                       f32_3 %447 = OpVectorShuffle %446 %446 1 2 3 
                                       f32_3 %448 = OpFAdd %445 %447 
                                       f32_4 %449 = OpLoad %437 
                                       f32_4 %450 = OpVectorShuffle %449 %448 0 4 5 6 
                                                      OpStore %437 %450 
                                       f32_4 %451 = OpLoad %9 
                                       f32_3 %452 = OpVectorShuffle %451 %451 0 0 0 
                                       f32_4 %453 = OpLoad %437 
                                       f32_3 %454 = OpVectorShuffle %453 %453 0 1 2 
                                       f32_3 %455 = OpFMul %452 %454 
                                       f32_4 %456 = OpLoad %50 
                                       f32_3 %457 = OpVectorShuffle %456 %456 0 1 3 
                                       f32_3 %458 = OpFAdd %455 %457 
                                                      OpStore %30 %458 
                                Private f32* %459 = OpAccessChain %9 %19 
                                         f32 %460 = OpLoad %459 
                                Private f32* %461 = OpAccessChain %437 %190 
                                         f32 %462 = OpLoad %461 
                                         f32 %463 = OpFMul %460 %462 
                                Private f32* %464 = OpAccessChain %173 %19 
                                         f32 %465 = OpLoad %464 
                                         f32 %466 = OpFAdd %463 %465 
                                Private f32* %467 = OpAccessChain %9 %19 
                                                      OpStore %467 %466 
                                Private f32* %468 = OpAccessChain %30 %33 
                                         f32 %469 = OpLoad %468 
                                Private f32* %470 = OpAccessChain %9 %19 
                                         f32 %471 = OpLoad %470 
                                         f32 %472 = OpExtInst %1 37 %469 %471 
                                Private f32* %473 = OpAccessChain %55 %19 
                                                      OpStore %473 %472 
                                Private f32* %474 = OpAccessChain %30 %19 
                                         f32 %475 = OpLoad %474 
                                Private f32* %476 = OpAccessChain %55 %19 
                                         f32 %477 = OpLoad %476 
                                         f32 %478 = OpFNegate %477 
                                         f32 %479 = OpFAdd %475 %478 
                                Private f32* %480 = OpAccessChain %55 %19 
                                                      OpStore %480 %479 
                                Private f32* %481 = OpAccessChain %30 %33 
                                         f32 %482 = OpLoad %481 
                                         f32 %483 = OpFNegate %482 
                                Private f32* %484 = OpAccessChain %9 %19 
                                         f32 %485 = OpLoad %484 
                                         f32 %486 = OpFAdd %483 %485 
                                Private f32* %487 = OpAccessChain %9 %19 
                                                      OpStore %487 %486 
                                Private f32* %489 = OpAccessChain %55 %19 
                                         f32 %490 = OpLoad %489 
                                         f32 %492 = OpFMul %490 %491 
                                         f32 %494 = OpFAdd %492 %493 
                                                      OpStore %488 %494 
                                Private f32* %495 = OpAccessChain %9 %19 
                                         f32 %496 = OpLoad %495 
                                         f32 %497 = OpLoad %488 
                                         f32 %498 = OpFDiv %496 %497 
                                Private f32* %499 = OpAccessChain %9 %19 
                                                      OpStore %499 %498 
                                Private f32* %500 = OpAccessChain %9 %19 
                                         f32 %501 = OpLoad %500 
                                Private f32* %502 = OpAccessChain %30 %122 
                                         f32 %503 = OpLoad %502 
                                         f32 %504 = OpFAdd %501 %503 
                                Private f32* %505 = OpAccessChain %9 %19 
                                                      OpStore %505 %504 
                                Private f32* %506 = OpAccessChain %30 %19 
                                         f32 %507 = OpLoad %506 
                                         f32 %508 = OpFAdd %507 %493 
                                                      OpStore %488 %508 
                                Private f32* %509 = OpAccessChain %55 %19 
                                         f32 %510 = OpLoad %509 
                                         f32 %511 = OpLoad %488 
                                         f32 %512 = OpFDiv %510 %511 
                                                      OpStore %488 %512 
                                Uniform f32* %513 = OpAccessChain %16 %166 %33 
                                         f32 %514 = OpLoad %513 
                                Uniform f32* %515 = OpAccessChain %16 %166 %122 
                                         f32 %516 = OpLoad %515 
                                        bool %517 = OpFOrdGreaterThanEqual %514 %516 
                                                      OpStore %220 %517 
                                        bool %519 = OpLoad %220 
                                                      OpSelectionMerge %521 None 
                                                      OpBranchConditional %519 %520 %522 
                                             %520 = OpLabel 
                                                      OpStore %518 %224 
                                                      OpBranch %521 
                                             %522 = OpLabel 
                                                      OpStore %518 %135 
                                                      OpBranch %521 
                                             %521 = OpLabel 
                                         f32 %523 = OpLoad %518 
                                                      OpStore %115 %523 
                                Uniform f32* %524 = OpAccessChain %16 %166 %122 
                                         f32 %525 = OpLoad %524 
                                         f32 %526 = OpFNegate %525 
                                Uniform f32* %527 = OpAccessChain %16 %166 %33 
                                         f32 %528 = OpLoad %527 
                                         f32 %529 = OpFAdd %526 %528 
                                Private f32* %530 = OpAccessChain %55 %19 
                                                      OpStore %530 %529 
                                         f32 %531 = OpLoad %115 
                                Private f32* %532 = OpAccessChain %55 %19 
                                         f32 %533 = OpLoad %532 
                                         f32 %534 = OpFMul %531 %533 
                                Uniform f32* %535 = OpAccessChain %16 %166 %122 
                                         f32 %536 = OpLoad %535 
                                         f32 %537 = OpFAdd %534 %536 
                                                      OpStore %115 %537 
                                Uniform f32* %539 = OpAccessChain %16 %166 %19 
                                         f32 %540 = OpLoad %539 
                                         f32 %541 = OpLoad %115 
                                        bool %542 = OpFOrdGreaterThanEqual %540 %541 
                                                      OpStore %538 %542 
                                        bool %544 = OpLoad %538 
                                                      OpSelectionMerge %546 None 
                                                      OpBranchConditional %544 %545 %547 
                                             %545 = OpLabel 
                                                      OpStore %543 %224 
                                                      OpBranch %546 
                                             %547 = OpLabel 
                                                      OpStore %543 %135 
                                                      OpBranch %546 
                                             %546 = OpLabel 
                                         f32 %548 = OpLoad %543 
                                Private f32* %549 = OpAccessChain %55 %19 
                                                      OpStore %549 %548 
                                         f32 %551 = OpLoad %115 
                                         f32 %552 = OpFNegate %551 
                                Uniform f32* %553 = OpAccessChain %16 %166 %19 
                                         f32 %554 = OpLoad %553 
                                         f32 %555 = OpFAdd %552 %554 
                                                      OpStore %550 %555 
                                Private f32* %556 = OpAccessChain %55 %19 
                                         f32 %557 = OpLoad %556 
                                         f32 %558 = OpLoad %550 
                                         f32 %559 = OpFMul %557 %558 
                                         f32 %560 = OpLoad %115 
                                         f32 %561 = OpFAdd %559 %560 
                                                      OpStore %115 %561 
                                         f32 %562 = OpLoad %115 
                                Uniform f32* %564 = OpAccessChain %16 %563 
                                         f32 %565 = OpLoad %564 
                                         f32 %566 = OpFMul %562 %565 
                                Private f32* %567 = OpAccessChain %55 %19 
                                                      OpStore %567 %566 
                                Private f32* %568 = OpAccessChain %30 %19 
                                         f32 %569 = OpLoad %568 
                                Private f32* %570 = OpAccessChain %55 %19 
                                         f32 %571 = OpLoad %570 
                                         f32 %572 = OpExtInst %1 40 %569 %571 
                                Private f32* %573 = OpAccessChain %30 %19 
                                                      OpStore %573 %572 
                                         f32 %574 = OpLoad %115 
                                Uniform f32* %576 = OpAccessChain %16 %575 
                                         f32 %577 = OpLoad %576 
                                         f32 %578 = OpFMul %574 %577 
                                                      OpStore %115 %578 
                                         f32 %579 = OpLoad %115 
                                Private f32* %580 = OpAccessChain %30 %19 
                                         f32 %581 = OpLoad %580 
                                         f32 %582 = OpExtInst %1 37 %579 %581 
                                Private f32* %583 = OpAccessChain %30 %19 
                                                      OpStore %583 %582 
                                       f32_4 %584 = OpLoad %9 
                                       f32_3 %585 = OpVectorShuffle %584 %584 0 0 0 
                                       f32_3 %586 = OpExtInst %1 4 %585 
                                       f32_3 %589 = OpFAdd %586 %588 
                                       f32_4 %590 = OpLoad %55 
                                       f32_4 %591 = OpVectorShuffle %590 %589 4 5 6 3 
                                                      OpStore %55 %591 
                                       f32_4 %592 = OpLoad %55 
                                       f32_3 %593 = OpVectorShuffle %592 %592 0 1 2 
                                       f32_3 %594 = OpExtInst %1 10 %593 
                                       f32_4 %595 = OpLoad %55 
                                       f32_4 %596 = OpVectorShuffle %595 %594 4 5 6 3 
                                                      OpStore %55 %596 
                                       f32_4 %597 = OpLoad %55 
                                       f32_3 %598 = OpVectorShuffle %597 %597 0 1 2 
                                       f32_3 %600 = OpFMul %598 %599 
                                       f32_3 %603 = OpFAdd %600 %602 
                                       f32_4 %604 = OpLoad %55 
                                       f32_4 %605 = OpVectorShuffle %604 %603 4 5 6 3 
                                                      OpStore %55 %605 
                                       f32_4 %606 = OpLoad %55 
                                       f32_3 %607 = OpVectorShuffle %606 %606 0 1 2 
                                       f32_3 %608 = OpExtInst %1 4 %607 
                                       f32_3 %610 = OpFAdd %608 %609 
                                       f32_4 %611 = OpLoad %55 
                                       f32_4 %612 = OpVectorShuffle %611 %610 4 5 6 3 
                                                      OpStore %55 %612 
                                       f32_4 %613 = OpLoad %55 
                                       f32_3 %614 = OpVectorShuffle %613 %613 0 1 2 
                                       f32_3 %615 = OpCompositeConstruct %135 %135 %135 
                                       f32_3 %616 = OpCompositeConstruct %224 %224 %224 
                                       f32_3 %617 = OpExtInst %1 43 %614 %615 %616 
                                       f32_4 %618 = OpLoad %55 
                                       f32_4 %619 = OpVectorShuffle %618 %617 4 5 6 3 
                                                      OpStore %55 %619 
                                       f32_4 %620 = OpLoad %55 
                                       f32_3 %621 = OpVectorShuffle %620 %620 0 1 2 
                                       f32_3 %622 = OpFAdd %621 %609 
                                       f32_4 %623 = OpLoad %55 
                                       f32_4 %624 = OpVectorShuffle %623 %622 4 5 6 3 
                                                      OpStore %55 %624 
                                         f32 %625 = OpLoad %488 
                                       f32_3 %626 = OpCompositeConstruct %625 %625 %625 
                                       f32_4 %627 = OpLoad %55 
                                       f32_3 %628 = OpVectorShuffle %627 %627 0 1 2 
                                       f32_3 %629 = OpFMul %626 %628 
                                       f32_3 %631 = OpFAdd %629 %630 
                                       f32_4 %632 = OpLoad %9 
                                       f32_4 %633 = OpVectorShuffle %632 %631 4 1 5 6 
                                                      OpStore %9 %633 
                  read_only Texture2DSampled %636 = OpLoad %635 
                                       f32_4 %638 = OpImageSampleImplicitLod %636 %637 
                                         f32 %639 = OpCompositeExtract %638 0 
                                                      OpStore %634 %639 
                                       f32_3 %640 = OpLoad %30 
                                       f32_3 %641 = OpVectorShuffle %640 %640 0 0 0 
                                       f32_4 %642 = OpLoad %9 
                                       f32_3 %643 = OpVectorShuffle %642 %642 0 2 3 
                                       f32_3 %644 = OpFMul %641 %643 
                                       f32_3 %645 = OpLoad %173 
                                       f32_3 %646 = OpFNegate %645 
                                       f32_3 %647 = OpFAdd %644 %646 
                                       f32_4 %648 = OpLoad %9 
                                       f32_4 %649 = OpVectorShuffle %648 %647 4 5 6 3 
                                                      OpStore %9 %649 
                                         f32 %650 = OpLoad %634 
                                       f32_3 %651 = OpCompositeConstruct %650 %650 %650 
                                       f32_4 %652 = OpLoad %9 
                                       f32_3 %653 = OpVectorShuffle %652 %652 0 1 2 
                                       f32_3 %654 = OpFMul %651 %653 
                                       f32_3 %655 = OpLoad %173 
                                       f32_3 %656 = OpFAdd %654 %655 
                                       f32_4 %657 = OpLoad %9 
                                       f32_4 %658 = OpVectorShuffle %657 %656 4 5 6 3 
                                                      OpStore %9 %658 
                                       f32_4 %659 = OpLoad %9 
                                       f32_3 %660 = OpVectorShuffle %659 %659 0 1 2 
                                       f32_4 %661 = OpLoad %366 
                                       f32_4 %662 = OpVectorShuffle %661 %660 4 5 6 3 
                                                      OpStore %366 %662 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    vs_TEXCOORD0.xyz = u_xlat2.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat18 = u_xlat1.y * _ProjectionParams.x;
    u_xlat3.w = u_xlat18 * 0.5;
    u_xlat3.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat1.zw;
    vs_TEXCOORD2.xy = u_xlat3.zz + u_xlat3.xw;
    u_xlat18 = u_xlat2.y * u_xlat2.y;
    u_xlat18 = u_xlat2.x * u_xlat2.x + (-u_xlat18);
    u_xlat1 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat1);
    u_xlat3.y = dot(unity_SHBg, u_xlat1);
    u_xlat3.z = dot(unity_SHBb, u_xlat1);
    u_xlat1.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat3.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat2.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat2.zzzz + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz + u_xlat1.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _CausticScale;
uniform 	vec4 _CausticColor;
uniform 	float _ReflPower;
uniform 	float _TimeScale;
uniform 	vec4 _LightCausticColor;
uniform 	float _LightCausticPower;
uniform 	float _ValueMinimum;
uniform 	float _ValueMaximum;
uniform 	float _GlobalReflectionsEnabled;
uniform  sampler2D _MaskTex;
uniform  sampler2D _CausticTex;
uniform  sampler2D _ReflMapFromPixelator;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec2 u_xlat3;
vec3 u_xlat4;
float u_xlat7;
bool u_xlatb7;
float u_xlat9;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat0.x = _Time.x * _TimeScale;
    u_xlat3.x = vs_TEXCOORD1.y + vs_TEXCOORD1.x;
    u_xlat3.x = _Time.y * _TimeScale + u_xlat3.x;
    u_xlat1.x = sin(u_xlat3.x);
    u_xlat2.x = cos(u_xlat3.x);
    u_xlat2.x = u_xlat2.x * 0.111111112;
    u_xlat2.y = u_xlat1.x * 0.166666672;
    u_xlat3.xy = u_xlat2.xy + vs_TEXCOORD1.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(_CausticScale);
    u_xlat3.xy = u_xlat3.xy * vec2(0.200000003, 0.200000003);
    u_xlat0.xy = u_xlat0.xx * vec2(0.5, 0.125) + u_xlat3.xy;
    u_xlat10_0 = texture(_CausticTex, u_xlat0.xy);
    u_xlat9 = vs_TEXCOORD2.y * 500.0;
    u_xlat9 = _Time.z * 5.0 + u_xlat9;
    u_xlat9 = sin(u_xlat9);
    u_xlat1.x = u_xlat9 * 0.00150000001;
    u_xlat1.y = 0.0;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD2.xy;
    u_xlat10_1 = texture(_ReflMapFromPixelator, u_xlat1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_LightCausticPower);
    u_xlat0.xyz = u_xlat0.xyz * _LightCausticColor.xyz + _CausticColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.0500000007, 0.0500000007, 0.0500000007);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.75, 0.75, 0.75) + u_xlat10_1.xyz;
    u_xlat9 = u_xlat10_1.w * _ReflPower;
    u_xlat9 = u_xlat9 * _GlobalReflectionsEnabled;
    u_xlat0.xyz = (-u_xlat2.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz + u_xlat2.xyz;
    u_xlatb9 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb9){
        u_xlatb9 = unity_ProbeVolumeParams.y==1.0;
        u_xlat1.xyz = vs_TEXCOORD1.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.xxx + u_xlat1.xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD1.zzz + u_xlat1.xyz;
        u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : vs_TEXCOORD1.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat9 = u_xlat1.y * 0.25 + 0.75;
        u_xlat4.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat9, u_xlat4.x);
        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
    } else {
        u_xlat1.x = float(1.0);
        u_xlat1.y = float(1.0);
        u_xlat1.z = float(1.0);
        u_xlat1.w = float(1.0);
    //ENDIF
    }
    u_xlat9 = dot(u_xlat1, unity_OcclusionMaskSelector);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlatb9 = u_xlat0.y>=u_xlat0.z;
    u_xlat9 = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat1.xy = u_xlat0.zy;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat2.xy = u_xlat0.yz + (-u_xlat1.xy);
    u_xlat2.z = float(1.0);
    u_xlat2.w = float(-1.0);
    u_xlat1 = vec4(u_xlat9) * u_xlat2 + u_xlat1;
    u_xlatb9 = u_xlat0.x>=u_xlat1.x;
    u_xlat9 = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat2.xyz = u_xlat1.xyw;
    u_xlat2.w = u_xlat0.x;
    u_xlat1.xyw = u_xlat2.wyx;
    u_xlat1 = (-u_xlat2) + u_xlat1;
    u_xlat1 = vec4(u_xlat9) * u_xlat1 + u_xlat2;
    u_xlat9 = min(u_xlat1.y, u_xlat1.w);
    u_xlat9 = (-u_xlat9) + u_xlat1.x;
    u_xlat4.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat10 = u_xlat9 * 6.0 + 1.00000001e-010;
    u_xlat4.x = u_xlat4.x / u_xlat10;
    u_xlat4.x = u_xlat4.x + u_xlat1.z;
    u_xlat7 = u_xlat1.x + 1.00000001e-010;
    u_xlat9 = u_xlat9 / u_xlat7;
    u_xlatb7 = _CausticColor.y>=_CausticColor.z;
    u_xlat7 = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat10 = (-_CausticColor.z) + _CausticColor.y;
    u_xlat7 = u_xlat7 * u_xlat10 + _CausticColor.z;
    u_xlatb10 = _CausticColor.x>=u_xlat7;
    u_xlat10 = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat2.x = (-u_xlat7) + _CausticColor.x;
    u_xlat7 = u_xlat10 * u_xlat2.x + u_xlat7;
    u_xlat10 = u_xlat7 * _ValueMinimum;
    u_xlat1.x = max(u_xlat10, u_xlat1.x);
    u_xlat7 = u_xlat7 * _ValueMaximum;
    u_xlat1.x = min(u_xlat7, u_xlat1.x);
    u_xlat4.xyz = abs(u_xlat4.xxx) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = vec3(u_xlat9) * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10_2 = texture(_MaskTex, vec2(1.0, 0.0));
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + (-u_xlat0.xyz);
    SV_Target0.xyz = u_xlat10_2.xxx * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = _CausticColor.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 420
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %97 %102 %141 %144 %166 %410 %413 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpMemberDecorate %21 0 Offset 21 
                                                      OpMemberDecorate %21 1 Offset 21 
                                                      OpMemberDecorate %21 2 Offset 21 
                                                      OpMemberDecorate %21 3 Offset 21 
                                                      OpMemberDecorate %21 4 RelaxedPrecision 
                                                      OpMemberDecorate %21 4 Offset 21 
                                                      OpMemberDecorate %21 5 RelaxedPrecision 
                                                      OpMemberDecorate %21 5 Offset 21 
                                                      OpMemberDecorate %21 6 RelaxedPrecision 
                                                      OpMemberDecorate %21 6 Offset 21 
                                                      OpMemberDecorate %21 7 RelaxedPrecision 
                                                      OpMemberDecorate %21 7 Offset 21 
                                                      OpMemberDecorate %21 8 RelaxedPrecision 
                                                      OpMemberDecorate %21 8 Offset 21 
                                                      OpMemberDecorate %21 9 RelaxedPrecision 
                                                      OpMemberDecorate %21 9 Offset 21 
                                                      OpMemberDecorate %21 10 RelaxedPrecision 
                                                      OpMemberDecorate %21 10 Offset 21 
                                                      OpMemberDecorate %21 11 RelaxedPrecision 
                                                      OpMemberDecorate %21 11 Offset 21 
                                                      OpMemberDecorate %21 12 RelaxedPrecision 
                                                      OpMemberDecorate %21 12 Offset 21 
                                                      OpMemberDecorate %21 13 Offset 21 
                                                      OpMemberDecorate %21 14 Offset 21 
                                                      OpMemberDecorate %21 15 Offset 21 
                                                      OpDecorate %21 Block 
                                                      OpDecorate %23 DescriptorSet 23 
                                                      OpDecorate %23 Binding 23 
                                                      OpMemberDecorate %95 0 BuiltIn 95 
                                                      OpMemberDecorate %95 1 BuiltIn 95 
                                                      OpMemberDecorate %95 2 BuiltIn 95 
                                                      OpDecorate %95 Block 
                                                      OpDecorate %102 Location 102 
                                                      OpDecorate %141 Location 141 
                                                      OpDecorate %144 Location 144 
                                                      OpDecorate %166 Location 166 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %365 RelaxedPrecision 
                                                      OpDecorate %366 RelaxedPrecision 
                                                      OpDecorate %371 RelaxedPrecision 
                                                      OpDecorate %372 RelaxedPrecision 
                                                      OpDecorate %382 RelaxedPrecision 
                                                      OpDecorate %383 RelaxedPrecision 
                                                      OpDecorate %393 RelaxedPrecision 
                                                      OpDecorate %394 RelaxedPrecision 
                                                      OpDecorate %410 RelaxedPrecision 
                                                      OpDecorate %410 Location 410 
                                                      OpDecorate %413 Location 413 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 8 
                                              %16 = OpTypeArray %7 %15 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeArray %7 %17 
                                              %20 = OpTypeArray %7 %17 
                                              %21 = OpTypeStruct %7 %7 %7 %7 %7 %16 %7 %7 %7 %7 %7 %7 %7 %18 %19 %20 
                                              %22 = OpTypePointer Uniform %21 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[8]; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4];}* %23 = OpVariable Uniform 
                                              %24 = OpTypeInt 32 1 
                                          i32 %25 = OpConstant 13 
                                          i32 %26 = OpConstant 1 
                                              %27 = OpTypePointer Uniform %7 
                                          i32 %31 = OpConstant 0 
                                          i32 %39 = OpConstant 2 
                               Private f32_4* %47 = OpVariable Private 
                                          i32 %49 = OpConstant 3 
                                              %53 = OpTypeVector %6 3 
                               Private f32_4* %65 = OpVariable Private 
                                          i32 %68 = OpConstant 15 
                                          u32 %93 = OpConstant 1 
                                              %94 = OpTypeArray %6 %93 
                                              %95 = OpTypeStruct %7 %6 %94 
                                              %96 = OpTypePointer Output %95 
         Output struct {f32_4; f32; f32[1];}* %97 = OpVariable Output 
                                              %99 = OpTypePointer Output %7 
                                             %101 = OpTypePointer Input %53 
                                Input f32_3* %102 = OpVariable Input 
                                         i32 %104 = OpConstant 14 
                                         u32 %109 = OpConstant 0 
                                             %110 = OpTypePointer Private %6 
                                         u32 %123 = OpConstant 2 
                                Private f32* %125 = OpVariable Private 
                                             %140 = OpTypePointer Output %53 
                               Output f32_3* %141 = OpVariable Output 
                               Output f32_3* %144 = OpVariable Output 
                                             %149 = OpTypePointer Uniform %6 
                              Private f32_4* %153 = OpVariable Private 
                                         f32 %155 = OpConstant 3.67402E-40 
                                         u32 %157 = OpConstant 3 
                                             %159 = OpTypeVector %6 2 
                                       f32_2 %162 = OpConstantComposite %155 %155 
                               Output f32_4* %166 = OpVariable Output 
                                             %178 = OpTypePointer Private %53 
                              Private f32_3* %179 = OpVariable Private 
                              Private f32_4* %196 = OpVariable Private 
                              Private f32_3* %202 = OpVariable Private 
                                         i32 %203 = OpConstant 9 
                                         i32 %209 = OpConstant 10 
                                         i32 %215 = OpConstant 11 
                                         i32 %221 = OpConstant 12 
                                         f32 %230 = OpConstant 3.67402E-40 
                                         i32 %232 = OpConstant 6 
                                         i32 %238 = OpConstant 7 
                                         i32 %244 = OpConstant 8 
                                         f32 %254 = OpConstant 3.67402E-40 
                                       f32_3 %255 = OpConstantComposite %254 %254 %254 
                                         f32 %263 = OpConstant 3.67402E-40 
                                       f32_3 %264 = OpConstantComposite %263 %263 %263 
                                         f32 %275 = OpConstant 3.67402E-40 
                                       f32_3 %276 = OpConstantComposite %275 %275 %275 
                                         f32 %278 = OpConstant 3.67402E-40 
                                       f32_3 %279 = OpConstantComposite %278 %278 %278 
                              Private f32_4* %294 = OpVariable Private 
                              Private f32_4* %302 = OpVariable Private 
                                         f32 %338 = OpConstant 3.67402E-40 
                                       f32_4 %339 = OpConstantComposite %338 %338 %338 %338 
                                         i32 %344 = OpConstant 4 
                                       f32_4 %348 = OpConstantComposite %230 %230 %230 %230 
                                       f32_4 %356 = OpConstantComposite %254 %254 %254 %254 
                                         i32 %363 = OpConstant 5 
                               Output f32_3* %410 = OpVariable Output 
                               Output f32_4* %413 = OpVariable Output 
                                             %414 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %28 = OpAccessChain %23 %25 %26 
                                        f32_4 %29 = OpLoad %28 
                                        f32_4 %30 = OpFMul %13 %29 
                                                      OpStore %9 %30 
                               Uniform f32_4* %32 = OpAccessChain %23 %25 %31 
                                        f32_4 %33 = OpLoad %32 
                                        f32_4 %34 = OpLoad %11 
                                        f32_4 %35 = OpVectorShuffle %34 %34 0 0 0 0 
                                        f32_4 %36 = OpFMul %33 %35 
                                        f32_4 %37 = OpLoad %9 
                                        f32_4 %38 = OpFAdd %36 %37 
                                                      OpStore %9 %38 
                               Uniform f32_4* %40 = OpAccessChain %23 %25 %39 
                                        f32_4 %41 = OpLoad %40 
                                        f32_4 %42 = OpLoad %11 
                                        f32_4 %43 = OpVectorShuffle %42 %42 2 2 2 2 
                                        f32_4 %44 = OpFMul %41 %43 
                                        f32_4 %45 = OpLoad %9 
                                        f32_4 %46 = OpFAdd %44 %45 
                                                      OpStore %9 %46 
                                        f32_4 %48 = OpLoad %9 
                               Uniform f32_4* %50 = OpAccessChain %23 %25 %49 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpFAdd %48 %51 
                                                      OpStore %47 %52 
                               Uniform f32_4* %54 = OpAccessChain %23 %25 %49 
                                        f32_4 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                                        f32_4 %57 = OpLoad %11 
                                        f32_3 %58 = OpVectorShuffle %57 %57 3 3 3 
                                        f32_3 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %9 
                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                                        f32_3 %62 = OpFAdd %59 %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpVectorShuffle %63 %62 4 5 6 3 
                                                      OpStore %9 %64 
                                        f32_4 %66 = OpLoad %47 
                                        f32_4 %67 = OpVectorShuffle %66 %66 1 1 1 1 
                               Uniform f32_4* %69 = OpAccessChain %23 %68 %26 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpFMul %67 %70 
                                                      OpStore %65 %71 
                               Uniform f32_4* %72 = OpAccessChain %23 %68 %31 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %47 
                                        f32_4 %75 = OpVectorShuffle %74 %74 0 0 0 0 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %65 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %65 %78 
                               Uniform f32_4* %79 = OpAccessChain %23 %68 %39 
                                        f32_4 %80 = OpLoad %79 
                                        f32_4 %81 = OpLoad %47 
                                        f32_4 %82 = OpVectorShuffle %81 %81 2 2 2 2 
                                        f32_4 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %65 
                                        f32_4 %85 = OpFAdd %83 %84 
                                                      OpStore %65 %85 
                               Uniform f32_4* %86 = OpAccessChain %23 %68 %49 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %47 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %65 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %47 %92 
                                        f32_4 %98 = OpLoad %47 
                               Output f32_4* %100 = OpAccessChain %97 %31 
                                                      OpStore %100 %98 
                                       f32_3 %103 = OpLoad %102 
                              Uniform f32_4* %105 = OpAccessChain %23 %104 %31 
                                       f32_4 %106 = OpLoad %105 
                                       f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                                         f32 %108 = OpDot %103 %107 
                                Private f32* %111 = OpAccessChain %65 %109 
                                                      OpStore %111 %108 
                                       f32_3 %112 = OpLoad %102 
                              Uniform f32_4* %113 = OpAccessChain %23 %104 %26 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                         f32 %116 = OpDot %112 %115 
                                Private f32* %117 = OpAccessChain %65 %93 
                                                      OpStore %117 %116 
                                       f32_3 %118 = OpLoad %102 
                              Uniform f32_4* %119 = OpAccessChain %23 %104 %39 
                                       f32_4 %120 = OpLoad %119 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                                         f32 %122 = OpDot %118 %121 
                                Private f32* %124 = OpAccessChain %65 %123 
                                                      OpStore %124 %122 
                                       f32_4 %126 = OpLoad %65 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                       f32_4 %128 = OpLoad %65 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                         f32 %130 = OpDot %127 %129 
                                                      OpStore %125 %130 
                                         f32 %131 = OpLoad %125 
                                         f32 %132 = OpExtInst %1 32 %131 
                                                      OpStore %125 %132 
                                         f32 %133 = OpLoad %125 
                                       f32_3 %134 = OpCompositeConstruct %133 %133 %133 
                                       f32_4 %135 = OpLoad %65 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_3 %137 = OpFMul %134 %136 
                                       f32_4 %138 = OpLoad %65 
                                       f32_4 %139 = OpVectorShuffle %138 %137 4 5 6 3 
                                                      OpStore %65 %139 
                                       f32_4 %142 = OpLoad %65 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
                                                      OpStore %141 %143 
                                       f32_4 %145 = OpLoad %9 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                                      OpStore %144 %146 
                                Private f32* %147 = OpAccessChain %47 %93 
                                         f32 %148 = OpLoad %147 
                                Uniform f32* %150 = OpAccessChain %23 %31 %109 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFMul %148 %151 
                                                      OpStore %125 %152 
                                         f32 %154 = OpLoad %125 
                                         f32 %156 = OpFMul %154 %155 
                                Private f32* %158 = OpAccessChain %153 %157 
                                                      OpStore %158 %156 
                                       f32_4 %160 = OpLoad %47 
                                       f32_2 %161 = OpVectorShuffle %160 %160 0 3 
                                       f32_2 %163 = OpFMul %161 %162 
                                       f32_4 %164 = OpLoad %153 
                                       f32_4 %165 = OpVectorShuffle %164 %163 4 1 5 3 
                                                      OpStore %153 %165 
                                       f32_4 %167 = OpLoad %47 
                                       f32_2 %168 = OpVectorShuffle %167 %167 2 3 
                                       f32_4 %169 = OpLoad %166 
                                       f32_4 %170 = OpVectorShuffle %169 %168 0 1 4 5 
                                                      OpStore %166 %170 
                                       f32_4 %171 = OpLoad %153 
                                       f32_2 %172 = OpVectorShuffle %171 %171 2 2 
                                       f32_4 %173 = OpLoad %153 
                                       f32_2 %174 = OpVectorShuffle %173 %173 0 3 
                                       f32_2 %175 = OpFAdd %172 %174 
                                       f32_4 %176 = OpLoad %166 
                                       f32_4 %177 = OpVectorShuffle %176 %175 4 5 2 3 
                                                      OpStore %166 %177 
                                Private f32* %180 = OpAccessChain %65 %93 
                                         f32 %181 = OpLoad %180 
                                Private f32* %182 = OpAccessChain %65 %93 
                                         f32 %183 = OpLoad %182 
                                         f32 %184 = OpFMul %181 %183 
                                Private f32* %185 = OpAccessChain %179 %109 
                                                      OpStore %185 %184 
                                Private f32* %186 = OpAccessChain %65 %109 
                                         f32 %187 = OpLoad %186 
                                Private f32* %188 = OpAccessChain %65 %109 
                                         f32 %189 = OpLoad %188 
                                         f32 %190 = OpFMul %187 %189 
                                Private f32* %191 = OpAccessChain %179 %109 
                                         f32 %192 = OpLoad %191 
                                         f32 %193 = OpFNegate %192 
                                         f32 %194 = OpFAdd %190 %193 
                                Private f32* %195 = OpAccessChain %179 %109 
                                                      OpStore %195 %194 
                                       f32_4 %197 = OpLoad %65 
                                       f32_4 %198 = OpVectorShuffle %197 %197 1 2 2 0 
                                       f32_4 %199 = OpLoad %65 
                                       f32_4 %200 = OpVectorShuffle %199 %199 0 1 2 2 
                                       f32_4 %201 = OpFMul %198 %200 
                                                      OpStore %196 %201 
                              Uniform f32_4* %204 = OpAccessChain %23 %203 
                                       f32_4 %205 = OpLoad %204 
                                       f32_4 %206 = OpLoad %196 
                                         f32 %207 = OpDot %205 %206 
                                Private f32* %208 = OpAccessChain %202 %109 
                                                      OpStore %208 %207 
                              Uniform f32_4* %210 = OpAccessChain %23 %209 
                                       f32_4 %211 = OpLoad %210 
                                       f32_4 %212 = OpLoad %196 
                                         f32 %213 = OpDot %211 %212 
                                Private f32* %214 = OpAccessChain %202 %93 
                                                      OpStore %214 %213 
                              Uniform f32_4* %216 = OpAccessChain %23 %215 
                                       f32_4 %217 = OpLoad %216 
                                       f32_4 %218 = OpLoad %196 
                                         f32 %219 = OpDot %217 %218 
                                Private f32* %220 = OpAccessChain %202 %123 
                                                      OpStore %220 %219 
                              Uniform f32_4* %222 = OpAccessChain %23 %221 
                                       f32_4 %223 = OpLoad %222 
                                       f32_3 %224 = OpVectorShuffle %223 %223 0 1 2 
                                       f32_3 %225 = OpLoad %179 
                                       f32_3 %226 = OpVectorShuffle %225 %225 0 0 0 
                                       f32_3 %227 = OpFMul %224 %226 
                                       f32_3 %228 = OpLoad %202 
                                       f32_3 %229 = OpFAdd %227 %228 
                                                      OpStore %179 %229 
                                Private f32* %231 = OpAccessChain %65 %157 
                                                      OpStore %231 %230 
                              Uniform f32_4* %233 = OpAccessChain %23 %232 
                                       f32_4 %234 = OpLoad %233 
                                       f32_4 %235 = OpLoad %65 
                                         f32 %236 = OpDot %234 %235 
                                Private f32* %237 = OpAccessChain %202 %109 
                                                      OpStore %237 %236 
                              Uniform f32_4* %239 = OpAccessChain %23 %238 
                                       f32_4 %240 = OpLoad %239 
                                       f32_4 %241 = OpLoad %65 
                                         f32 %242 = OpDot %240 %241 
                                Private f32* %243 = OpAccessChain %202 %93 
                                                      OpStore %243 %242 
                              Uniform f32_4* %245 = OpAccessChain %23 %244 
                                       f32_4 %246 = OpLoad %245 
                                       f32_4 %247 = OpLoad %65 
                                         f32 %248 = OpDot %246 %247 
                                Private f32* %249 = OpAccessChain %202 %123 
                                                      OpStore %249 %248 
                                       f32_3 %250 = OpLoad %179 
                                       f32_3 %251 = OpLoad %202 
                                       f32_3 %252 = OpFAdd %250 %251 
                                                      OpStore %179 %252 
                                       f32_3 %253 = OpLoad %179 
                                       f32_3 %256 = OpExtInst %1 40 %253 %255 
                                                      OpStore %179 %256 
                                       f32_3 %257 = OpLoad %179 
                                       f32_3 %258 = OpExtInst %1 30 %257 
                                       f32_4 %259 = OpLoad %153 
                                       f32_4 %260 = OpVectorShuffle %259 %258 4 5 6 3 
                                                      OpStore %153 %260 
                                       f32_4 %261 = OpLoad %153 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                                       f32_3 %265 = OpFMul %262 %264 
                                       f32_4 %266 = OpLoad %153 
                                       f32_4 %267 = OpVectorShuffle %266 %265 4 5 6 3 
                                                      OpStore %153 %267 
                                       f32_4 %268 = OpLoad %153 
                                       f32_3 %269 = OpVectorShuffle %268 %268 0 1 2 
                                       f32_3 %270 = OpExtInst %1 29 %269 
                                       f32_4 %271 = OpLoad %153 
                                       f32_4 %272 = OpVectorShuffle %271 %270 4 5 6 3 
                                                      OpStore %153 %272 
                                       f32_4 %273 = OpLoad %153 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                                       f32_3 %277 = OpFMul %274 %276 
                                       f32_3 %280 = OpFAdd %277 %279 
                                       f32_4 %281 = OpLoad %153 
                                       f32_4 %282 = OpVectorShuffle %281 %280 4 5 6 3 
                                                      OpStore %153 %282 
                                       f32_4 %283 = OpLoad %153 
                                       f32_3 %284 = OpVectorShuffle %283 %283 0 1 2 
                                       f32_3 %285 = OpExtInst %1 40 %284 %255 
                                       f32_4 %286 = OpLoad %153 
                                       f32_4 %287 = OpVectorShuffle %286 %285 4 5 6 3 
                                                      OpStore %153 %287 
                                       f32_4 %288 = OpLoad %9 
                                       f32_4 %289 = OpVectorShuffle %288 %288 1 1 1 1 
                                       f32_4 %290 = OpFNegate %289 
                              Uniform f32_4* %291 = OpAccessChain %23 %39 
                                       f32_4 %292 = OpLoad %291 
                                       f32_4 %293 = OpFAdd %290 %292 
                                                      OpStore %47 %293 
                                       f32_4 %295 = OpLoad %65 
                                       f32_4 %296 = OpVectorShuffle %295 %295 1 1 1 1 
                                       f32_4 %297 = OpLoad %47 
                                       f32_4 %298 = OpFMul %296 %297 
                                                      OpStore %294 %298 
                                       f32_4 %299 = OpLoad %47 
                                       f32_4 %300 = OpLoad %47 
                                       f32_4 %301 = OpFMul %299 %300 
                                                      OpStore %47 %301 
                                       f32_4 %303 = OpLoad %9 
                                       f32_4 %304 = OpVectorShuffle %303 %303 0 0 0 0 
                                       f32_4 %305 = OpFNegate %304 
                              Uniform f32_4* %306 = OpAccessChain %23 %26 
                                       f32_4 %307 = OpLoad %306 
                                       f32_4 %308 = OpFAdd %305 %307 
                                                      OpStore %302 %308 
                                       f32_4 %309 = OpLoad %9 
                                       f32_4 %310 = OpVectorShuffle %309 %309 2 2 2 2 
                                       f32_4 %311 = OpFNegate %310 
                              Uniform f32_4* %312 = OpAccessChain %23 %49 
                                       f32_4 %313 = OpLoad %312 
                                       f32_4 %314 = OpFAdd %311 %313 
                                                      OpStore %9 %314 
                                       f32_4 %315 = OpLoad %302 
                                       f32_4 %316 = OpLoad %65 
                                       f32_4 %317 = OpVectorShuffle %316 %316 0 0 0 0 
                                       f32_4 %318 = OpFMul %315 %317 
                                       f32_4 %319 = OpLoad %294 
                                       f32_4 %320 = OpFAdd %318 %319 
                                                      OpStore %294 %320 
                                       f32_4 %321 = OpLoad %9 
                                       f32_4 %322 = OpLoad %65 
                                       f32_4 %323 = OpVectorShuffle %322 %322 2 2 2 2 
                                       f32_4 %324 = OpFMul %321 %323 
                                       f32_4 %325 = OpLoad %294 
                                       f32_4 %326 = OpFAdd %324 %325 
                                                      OpStore %65 %326 
                                       f32_4 %327 = OpLoad %302 
                                       f32_4 %328 = OpLoad %302 
                                       f32_4 %329 = OpFMul %327 %328 
                                       f32_4 %330 = OpLoad %47 
                                       f32_4 %331 = OpFAdd %329 %330 
                                                      OpStore %47 %331 
                                       f32_4 %332 = OpLoad %9 
                                       f32_4 %333 = OpLoad %9 
                                       f32_4 %334 = OpFMul %332 %333 
                                       f32_4 %335 = OpLoad %47 
                                       f32_4 %336 = OpFAdd %334 %335 
                                                      OpStore %9 %336 
                                       f32_4 %337 = OpLoad %9 
                                       f32_4 %340 = OpExtInst %1 40 %337 %339 
                                                      OpStore %9 %340 
                                       f32_4 %341 = OpLoad %9 
                                       f32_4 %342 = OpExtInst %1 32 %341 
                                                      OpStore %47 %342 
                                       f32_4 %343 = OpLoad %9 
                              Uniform f32_4* %345 = OpAccessChain %23 %344 
                                       f32_4 %346 = OpLoad %345 
                                       f32_4 %347 = OpFMul %343 %346 
                                       f32_4 %349 = OpFAdd %347 %348 
                                                      OpStore %9 %349 
                                       f32_4 %350 = OpLoad %9 
                                       f32_4 %351 = OpFDiv %348 %350 
                                                      OpStore %9 %351 
                                       f32_4 %352 = OpLoad %47 
                                       f32_4 %353 = OpLoad %65 
                                       f32_4 %354 = OpFMul %352 %353 
                                                      OpStore %47 %354 
                                       f32_4 %355 = OpLoad %47 
                                       f32_4 %357 = OpExtInst %1 40 %355 %356 
                                                      OpStore %47 %357 
                                       f32_4 %358 = OpLoad %9 
                                       f32_4 %359 = OpLoad %47 
                                       f32_4 %360 = OpFMul %358 %359 
                                                      OpStore %9 %360 
                                       f32_4 %361 = OpLoad %9 
                                       f32_3 %362 = OpVectorShuffle %361 %361 1 1 1 
                              Uniform f32_4* %364 = OpAccessChain %23 %363 %26 
                                       f32_4 %365 = OpLoad %364 
                                       f32_3 %366 = OpVectorShuffle %365 %365 0 1 2 
                                       f32_3 %367 = OpFMul %362 %366 
                                       f32_4 %368 = OpLoad %65 
                                       f32_4 %369 = OpVectorShuffle %368 %367 4 5 6 3 
                                                      OpStore %65 %369 
                              Uniform f32_4* %370 = OpAccessChain %23 %363 %31 
                                       f32_4 %371 = OpLoad %370 
                                       f32_3 %372 = OpVectorShuffle %371 %371 0 1 2 
                                       f32_4 %373 = OpLoad %9 
                                       f32_3 %374 = OpVectorShuffle %373 %373 0 0 0 
                                       f32_3 %375 = OpFMul %372 %374 
                                       f32_4 %376 = OpLoad %65 
                                       f32_3 %377 = OpVectorShuffle %376 %376 0 1 2 
                                       f32_3 %378 = OpFAdd %375 %377 
                                       f32_4 %379 = OpLoad %65 
                                       f32_4 %380 = OpVectorShuffle %379 %378 4 5 6 3 
                                                      OpStore %65 %380 
                              Uniform f32_4* %381 = OpAccessChain %23 %363 %39 
                                       f32_4 %382 = OpLoad %381 
                                       f32_3 %383 = OpVectorShuffle %382 %382 0 1 2 
                                       f32_4 %384 = OpLoad %9 
                                       f32_3 %385 = OpVectorShuffle %384 %384 2 2 2 
                                       f32_3 %386 = OpFMul %383 %385 
                                       f32_4 %387 = OpLoad %65 
                                       f32_3 %388 = OpVectorShuffle %387 %387 0 1 2 
                                       f32_3 %389 = OpFAdd %386 %388 
                                       f32_4 %390 = OpLoad %9 
                                       f32_4 %391 = OpVectorShuffle %390 %389 4 5 6 3 
                                                      OpStore %9 %391 
                              Uniform f32_4* %392 = OpAccessChain %23 %363 %49 
                                       f32_4 %393 = OpLoad %392 
                                       f32_3 %394 = OpVectorShuffle %393 %393 0 1 2 
                                       f32_4 %395 = OpLoad %9 
                                       f32_3 %396 = OpVectorShuffle %395 %395 3 3 3 
                                       f32_3 %397 = OpFMul %394 %396 
                                       f32_4 %398 = OpLoad %9 
                                       f32_3 %399 = OpVectorShuffle %398 %398 0 1 2 
                                       f32_3 %400 = OpFAdd %397 %399 
                                       f32_4 %401 = OpLoad %9 
                                       f32_4 %402 = OpVectorShuffle %401 %400 4 5 6 3 
                                                      OpStore %9 %402 
                                       f32_4 %403 = OpLoad %9 
                                       f32_3 %404 = OpVectorShuffle %403 %403 0 1 2 
                                       f32_4 %405 = OpLoad %153 
                                       f32_3 %406 = OpVectorShuffle %405 %405 0 1 2 
                                       f32_3 %407 = OpFAdd %404 %406 
                                       f32_4 %408 = OpLoad %9 
                                       f32_4 %409 = OpVectorShuffle %408 %407 4 5 6 3 
                                                      OpStore %9 %409 
                                       f32_4 %411 = OpLoad %9 
                                       f32_3 %412 = OpVectorShuffle %411 %411 0 1 2 
                                                      OpStore %410 %412 
                                                      OpStore %413 %356 
                                 Output f32* %415 = OpAccessChain %97 %31 %93 
                                         f32 %416 = OpLoad %415 
                                         f32 %417 = OpFNegate %416 
                                 Output f32* %418 = OpAccessChain %97 %31 %93 
                                                      OpStore %418 %417 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 664
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %32 %117 %360 %366 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 RelaxedPrecision 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpMemberDecorate %14 4 Offset 14 
                                                      OpMemberDecorate %14 5 Offset 14 
                                                      OpMemberDecorate %14 6 RelaxedPrecision 
                                                      OpMemberDecorate %14 6 Offset 14 
                                                      OpMemberDecorate %14 7 Offset 14 
                                                      OpMemberDecorate %14 8 Offset 14 
                                                      OpMemberDecorate %14 9 Offset 14 
                                                      OpMemberDecorate %14 10 Offset 14 
                                                      OpMemberDecorate %14 11 Offset 14 
                                                      OpMemberDecorate %14 12 Offset 14 
                                                      OpMemberDecorate %14 13 Offset 14 
                                                      OpMemberDecorate %14 14 Offset 14 
                                                      OpMemberDecorate %14 15 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate %32 Location 32 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %109 RelaxedPrecision 
                                                      OpDecorate %109 DescriptorSet 109 
                                                      OpDecorate %109 Binding 109 
                                                      OpDecorate %110 RelaxedPrecision 
                                                      OpDecorate %114 RelaxedPrecision 
                                                      OpDecorate %117 Location 117 
                                                      OpDecorate %144 RelaxedPrecision 
                                                      OpDecorate %145 RelaxedPrecision 
                                                      OpDecorate %145 DescriptorSet 145 
                                                      OpDecorate %145 Binding 145 
                                                      OpDecorate %146 RelaxedPrecision 
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %154 RelaxedPrecision 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %232 SpecId 232 
                                                      OpDecorate %325 DescriptorSet 325 
                                                      OpDecorate %325 Binding 325 
                                                      OpDecorate %330 RelaxedPrecision 
                                                      OpDecorate %337 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %344 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %352 RelaxedPrecision 
                                                      OpDecorate %354 RelaxedPrecision 
                                                      OpDecorate %355 RelaxedPrecision 
                                                      OpDecorate %356 RelaxedPrecision 
                                                      OpDecorate %357 RelaxedPrecision 
                                                      OpDecorate %360 RelaxedPrecision 
                                                      OpDecorate %360 Location 360 
                                                      OpDecorate %361 RelaxedPrecision 
                                                      OpDecorate %363 RelaxedPrecision 
                                                      OpDecorate %366 RelaxedPrecision 
                                                      OpDecorate %366 Location 366 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %375 RelaxedPrecision 
                                                      OpDecorate %385 RelaxedPrecision 
                                                      OpDecorate %386 RelaxedPrecision 
                                                      OpDecorate %387 RelaxedPrecision 
                                                      OpDecorate %388 RelaxedPrecision 
                                                      OpDecorate %389 RelaxedPrecision 
                                                      OpDecorate %390 RelaxedPrecision 
                                                      OpDecorate %398 RelaxedPrecision 
                                                      OpDecorate %399 RelaxedPrecision 
                                                      OpDecorate %401 RelaxedPrecision 
                                                      OpDecorate %402 RelaxedPrecision 
                                                      OpDecorate %417 RelaxedPrecision 
                                                      OpDecorate %434 RelaxedPrecision 
                                                      OpDecorate %435 RelaxedPrecision 
                                                      OpDecorate %441 RelaxedPrecision 
                                                      OpDecorate %465 RelaxedPrecision 
                                                      OpDecorate %634 RelaxedPrecision 
                                                      OpDecorate %635 RelaxedPrecision 
                                                      OpDecorate %635 DescriptorSet 635 
                                                      OpDecorate %635 Binding 635 
                                                      OpDecorate %636 RelaxedPrecision 
                                                      OpDecorate %639 RelaxedPrecision 
                                                      OpDecorate %645 RelaxedPrecision 
                                                      OpDecorate %646 RelaxedPrecision 
                                                      OpDecorate %650 RelaxedPrecision 
                                                      OpDecorate %655 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeVector %6 3 
                                              %14 = OpTypeStruct %7 %7 %7 %12 %13 %13 %7 %6 %7 %6 %6 %7 %6 %6 %6 %6 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32_4; f32; f32; f32_4; f32; f32; f32; f32;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 0 
                                          u32 %19 = OpConstant 0 
                                              %20 = OpTypePointer Uniform %6 
                                          i32 %23 = OpConstant 10 
                                              %27 = OpTypePointer Private %6 
                                              %29 = OpTypePointer Private %13 
                               Private f32_3* %30 = OpVariable Private 
                                              %31 = OpTypePointer Input %13 
                                 Input f32_3* %32 = OpVariable Input 
                                          u32 %33 = OpConstant 1 
                                              %34 = OpTypePointer Input %6 
                               Private f32_4* %50 = OpVariable Private 
                               Private f32_4* %55 = OpVariable Private 
                                          f32 %62 = OpConstant 3.67402E-40 
                                          f32 %67 = OpConstant 3.67402E-40 
                                              %70 = OpTypeVector %6 2 
                                          i32 %80 = OpConstant 7 
                                          f32 %89 = OpConstant 3.67402E-40 
                                        f32_2 %90 = OpConstantComposite %89 %89 
                                          f32 %96 = OpConstant 3.67402E-40 
                                          f32 %97 = OpConstant 3.67402E-40 
                                        f32_2 %98 = OpConstantComposite %96 %97 
                              Private f32_3* %105 = OpVariable Private 
                                             %106 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %107 = OpTypeSampledImage %106 
                                             %108 = OpTypePointer UniformConstant %107 
 UniformConstant read_only Texture2DSampled* %109 = OpVariable UniformConstant 
                                Private f32* %115 = OpVariable Private 
                                             %116 = OpTypePointer Input %7 
                                Input f32_4* %117 = OpVariable Input 
                                         f32 %120 = OpConstant 3.67402E-40 
                                         u32 %122 = OpConstant 2 
                                         f32 %125 = OpConstant 3.67402E-40 
                                         f32 %132 = OpConstant 3.67402E-40 
                                         f32 %135 = OpConstant 3.67402E-40 
                              Private f32_4* %144 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %145 = OpVariable UniformConstant 
                                         i32 %151 = OpConstant 12 
                                         i32 %160 = OpConstant 11 
                                             %161 = OpTypePointer Uniform %7 
                                         i32 %166 = OpConstant 8 
                              Private f32_3* %173 = OpVariable Private 
                                       f32_3 %176 = OpConstantComposite %96 %96 %96 
                                         f32 %178 = OpConstant 3.67402E-40 
                                       f32_3 %179 = OpConstantComposite %178 %178 %178 
                              Private f32_3* %181 = OpVariable Private 
                                         f32 %184 = OpConstant 3.67402E-40 
                                       f32_3 %185 = OpConstantComposite %184 %184 %184 
                                         u32 %190 = OpConstant 3 
                                         i32 %193 = OpConstant 9 
                                         i32 %200 = OpConstant 15 
                              Private f32_3* %205 = OpVariable Private 
                                             %218 = OpTypeBool 
                                             %219 = OpTypePointer Private %218 
                               Private bool* %220 = OpVariable Private 
                                         i32 %221 = OpConstant 2 
                                         f32 %224 = OpConstant 3.67402E-40 
                                        bool %226 = OpConstantFalse 
                                        bool %232 = OpSpecConstantFalse 
                                         i32 %240 = OpConstant 3 
                                         i32 %241 = OpConstant 1 
                                             %278 = OpTypePointer Function %13 
                                         i32 %292 = OpConstant 5 
                                             %293 = OpTypePointer Uniform %13 
                                         i32 %302 = OpConstant 4 
                                         f32 %310 = OpConstant 3.67402E-40 
                                Private f32* %313 = OpVariable Private 
                                             %322 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %323 = OpTypeSampledImage %322 
                                             %324 = OpTypePointer UniformConstant %323 
 UniformConstant read_only Texture3DSampled* %325 = OpVariable UniformConstant 
                              Private f32_4* %330 = OpVariable Private 
                              Private f32_3* %346 = OpVariable Private 
                                         i32 %349 = OpConstant 6 
                                Input f32_3* %360 = OpVariable Input 
                                             %365 = OpTypePointer Output %7 
                               Output f32_4* %366 = OpVariable Output 
                                             %369 = OpTypePointer Output %6 
                               Private bool* %371 = OpVariable Private 
                                             %377 = OpTypePointer Function %6 
                                         f32 %394 = OpConstant 3.67402E-40 
                                         f32 %411 = OpConstant 3.67402E-40 
                                       f32_2 %412 = OpConstantComposite %394 %411 
                              Private f32_4* %437 = OpVariable Private 
                                Private f32* %488 = OpVariable Private 
                                         f32 %491 = OpConstant 3.67402E-40 
                                         f32 %493 = OpConstant 3.67402E-40 
                               Private bool* %538 = OpVariable Private 
                                Private f32* %550 = OpVariable Private 
                                         i32 %563 = OpConstant 13 
                                         i32 %575 = OpConstant 14 
                                         f32 %587 = OpConstant 3.67402E-40 
                                       f32_3 %588 = OpConstantComposite %224 %411 %587 
                                       f32_3 %599 = OpConstantComposite %491 %491 %491 
                                         f32 %601 = OpConstant 3.67402E-40 
                                       f32_3 %602 = OpConstantComposite %601 %601 %601 
                                       f32_3 %609 = OpConstantComposite %394 %394 %394 
                                       f32_3 %630 = OpConstantComposite %224 %224 %224 
                                Private f32* %634 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %635 = OpVariable UniformConstant 
                                       f32_2 %637 = OpConstantComposite %224 %135 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %279 = OpVariable Function 
                               Function f32* %378 = OpVariable Function 
                               Function f32* %421 = OpVariable Function 
                               Function f32* %518 = OpVariable Function 
                               Function f32* %543 = OpVariable Function 
                                 Uniform f32* %21 = OpAccessChain %16 %18 %19 
                                          f32 %22 = OpLoad %21 
                                 Uniform f32* %24 = OpAccessChain %16 %23 
                                          f32 %25 = OpLoad %24 
                                          f32 %26 = OpFMul %22 %25 
                                 Private f32* %28 = OpAccessChain %9 %19 
                                                      OpStore %28 %26 
                                   Input f32* %35 = OpAccessChain %32 %33 
                                          f32 %36 = OpLoad %35 
                                   Input f32* %37 = OpAccessChain %32 %19 
                                          f32 %38 = OpLoad %37 
                                          f32 %39 = OpFAdd %36 %38 
                                 Private f32* %40 = OpAccessChain %30 %19 
                                                      OpStore %40 %39 
                                 Uniform f32* %41 = OpAccessChain %16 %18 %33 
                                          f32 %42 = OpLoad %41 
                                 Uniform f32* %43 = OpAccessChain %16 %23 
                                          f32 %44 = OpLoad %43 
                                          f32 %45 = OpFMul %42 %44 
                                 Private f32* %46 = OpAccessChain %30 %19 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpFAdd %45 %47 
                                 Private f32* %49 = OpAccessChain %30 %19 
                                                      OpStore %49 %48 
                                 Private f32* %51 = OpAccessChain %30 %19 
                                          f32 %52 = OpLoad %51 
                                          f32 %53 = OpExtInst %1 13 %52 
                                 Private f32* %54 = OpAccessChain %50 %19 
                                                      OpStore %54 %53 
                                 Private f32* %56 = OpAccessChain %30 %19 
                                          f32 %57 = OpLoad %56 
                                          f32 %58 = OpExtInst %1 14 %57 
                                 Private f32* %59 = OpAccessChain %55 %19 
                                                      OpStore %59 %58 
                                 Private f32* %60 = OpAccessChain %55 %19 
                                          f32 %61 = OpLoad %60 
                                          f32 %63 = OpFMul %61 %62 
                                 Private f32* %64 = OpAccessChain %55 %19 
                                                      OpStore %64 %63 
                                 Private f32* %65 = OpAccessChain %50 %19 
                                          f32 %66 = OpLoad %65 
                                          f32 %68 = OpFMul %66 %67 
                                 Private f32* %69 = OpAccessChain %55 %33 
                                                      OpStore %69 %68 
                                        f32_4 %71 = OpLoad %55 
                                        f32_2 %72 = OpVectorShuffle %71 %71 0 1 
                                        f32_3 %73 = OpLoad %32 
                                        f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                                        f32_2 %75 = OpFAdd %72 %74 
                                        f32_3 %76 = OpLoad %30 
                                        f32_3 %77 = OpVectorShuffle %76 %75 3 4 2 
                                                      OpStore %30 %77 
                                        f32_3 %78 = OpLoad %30 
                                        f32_2 %79 = OpVectorShuffle %78 %78 0 1 
                                 Uniform f32* %81 = OpAccessChain %16 %80 
                                          f32 %82 = OpLoad %81 
                                        f32_2 %83 = OpCompositeConstruct %82 %82 
                                        f32_2 %84 = OpFMul %79 %83 
                                        f32_3 %85 = OpLoad %30 
                                        f32_3 %86 = OpVectorShuffle %85 %84 3 4 2 
                                                      OpStore %30 %86 
                                        f32_3 %87 = OpLoad %30 
                                        f32_2 %88 = OpVectorShuffle %87 %87 0 1 
                                        f32_2 %91 = OpFMul %88 %90 
                                        f32_3 %92 = OpLoad %30 
                                        f32_3 %93 = OpVectorShuffle %92 %91 3 4 2 
                                                      OpStore %30 %93 
                                        f32_4 %94 = OpLoad %9 
                                        f32_2 %95 = OpVectorShuffle %94 %94 0 0 
                                        f32_2 %99 = OpFMul %95 %98 
                                       f32_3 %100 = OpLoad %30 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                       f32_2 %102 = OpFAdd %99 %101 
                                       f32_4 %103 = OpLoad %9 
                                       f32_4 %104 = OpVectorShuffle %103 %102 4 5 2 3 
                                                      OpStore %9 %104 
                  read_only Texture2DSampled %110 = OpLoad %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_2 %112 = OpVectorShuffle %111 %111 0 1 
                                       f32_4 %113 = OpImageSampleImplicitLod %110 %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                                      OpStore %105 %114 
                                  Input f32* %118 = OpAccessChain %117 %33 
                                         f32 %119 = OpLoad %118 
                                         f32 %121 = OpFMul %119 %120 
                                                      OpStore %115 %121 
                                Uniform f32* %123 = OpAccessChain %16 %18 %122 
                                         f32 %124 = OpLoad %123 
                                         f32 %126 = OpFMul %124 %125 
                                         f32 %127 = OpLoad %115 
                                         f32 %128 = OpFAdd %126 %127 
                                                      OpStore %115 %128 
                                         f32 %129 = OpLoad %115 
                                         f32 %130 = OpExtInst %1 13 %129 
                                                      OpStore %115 %130 
                                         f32 %131 = OpLoad %115 
                                         f32 %133 = OpFMul %131 %132 
                                Private f32* %134 = OpAccessChain %50 %19 
                                                      OpStore %134 %133 
                                Private f32* %136 = OpAccessChain %50 %33 
                                                      OpStore %136 %135 
                                       f32_4 %137 = OpLoad %50 
                                       f32_2 %138 = OpVectorShuffle %137 %137 0 1 
                                       f32_4 %139 = OpLoad %117 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_2 %141 = OpFAdd %138 %140 
                                       f32_4 %142 = OpLoad %50 
                                       f32_4 %143 = OpVectorShuffle %142 %141 4 5 2 3 
                                                      OpStore %50 %143 
                  read_only Texture2DSampled %146 = OpLoad %145 
                                       f32_4 %147 = OpLoad %50 
                                       f32_2 %148 = OpVectorShuffle %147 %147 0 1 
                                       f32_4 %149 = OpImageSampleImplicitLod %146 %148 
                                                      OpStore %144 %149 
                                       f32_3 %150 = OpLoad %105 
                                Uniform f32* %152 = OpAccessChain %16 %151 
                                         f32 %153 = OpLoad %152 
                                       f32_3 %154 = OpCompositeConstruct %153 %153 %153 
                                       f32_3 %155 = OpFMul %150 %154 
                                       f32_4 %156 = OpLoad %9 
                                       f32_4 %157 = OpVectorShuffle %156 %155 4 5 6 3 
                                                      OpStore %9 %157 
                                       f32_4 %158 = OpLoad %9 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                              Uniform f32_4* %162 = OpAccessChain %16 %160 
                                       f32_4 %163 = OpLoad %162 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                                       f32_3 %165 = OpFMul %159 %164 
                              Uniform f32_4* %167 = OpAccessChain %16 %166 
                                       f32_4 %168 = OpLoad %167 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                       f32_3 %170 = OpFAdd %165 %169 
                                       f32_4 %171 = OpLoad %9 
                                       f32_4 %172 = OpVectorShuffle %171 %170 4 5 6 3 
                                                      OpStore %9 %172 
                                       f32_4 %174 = OpLoad %9 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                                       f32_3 %177 = OpFMul %175 %176 
                                       f32_3 %180 = OpFAdd %177 %179 
                                                      OpStore %173 %180 
                                       f32_4 %182 = OpLoad %9 
                                       f32_3 %183 = OpVectorShuffle %182 %182 0 1 2 
                                       f32_3 %186 = OpFMul %183 %185 
                                       f32_4 %187 = OpLoad %144 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                                       f32_3 %189 = OpFAdd %186 %188 
                                                      OpStore %181 %189 
                                Private f32* %191 = OpAccessChain %144 %190 
                                         f32 %192 = OpLoad %191 
                                Uniform f32* %194 = OpAccessChain %16 %193 
                                         f32 %195 = OpLoad %194 
                                         f32 %196 = OpFMul %192 %195 
                                Private f32* %197 = OpAccessChain %9 %19 
                                                      OpStore %197 %196 
                                Private f32* %198 = OpAccessChain %9 %19 
                                         f32 %199 = OpLoad %198 
                                Uniform f32* %201 = OpAccessChain %16 %200 
                                         f32 %202 = OpLoad %201 
                                         f32 %203 = OpFMul %199 %202 
                                Private f32* %204 = OpAccessChain %9 %19 
                                                      OpStore %204 %203 
                                       f32_3 %206 = OpLoad %173 
                                       f32_3 %207 = OpFNegate %206 
                                       f32_3 %208 = OpLoad %181 
                                       f32_3 %209 = OpFAdd %207 %208 
                                                      OpStore %205 %209 
                                       f32_4 %210 = OpLoad %9 
                                       f32_3 %211 = OpVectorShuffle %210 %210 0 0 0 
                                       f32_3 %212 = OpLoad %205 
                                       f32_3 %213 = OpFMul %211 %212 
                                       f32_3 %214 = OpLoad %173 
                                       f32_3 %215 = OpFAdd %213 %214 
                                       f32_4 %216 = OpLoad %9 
                                       f32_4 %217 = OpVectorShuffle %216 %215 4 5 6 3 
                                                      OpStore %9 %217 
                                Uniform f32* %222 = OpAccessChain %16 %221 %19 
                                         f32 %223 = OpLoad %222 
                                        bool %225 = OpFOrdEqual %223 %224 
                                                      OpStore %220 %225 
                                                      OpSelectionMerge %228 None 
                                                      OpBranchConditional %226 %227 %228 
                                             %227 = OpLabel 
                                        bool %229 = OpLoad %220 
                                                      OpSelectionMerge %231 None 
                                                      OpBranchConditional %229 %230 %231 
                                             %230 = OpLabel 
                                                      OpBranch %231 
                                             %231 = OpLabel 
                                                      OpBranch %228 
                                             %228 = OpLabel 
                                                      OpSelectionMerge %234 None 
                                                      OpBranchConditional %232 %233 %332 
                                             %233 = OpLabel 
                                Uniform f32* %235 = OpAccessChain %16 %221 %33 
                                         f32 %236 = OpLoad %235 
                                        bool %237 = OpFOrdEqual %236 %224 
                                                      OpStore %220 %237 
                                       f32_3 %238 = OpLoad %32 
                                       f32_3 %239 = OpVectorShuffle %238 %238 1 1 1 
                              Uniform f32_4* %242 = OpAccessChain %16 %240 %241 
                                       f32_4 %243 = OpLoad %242 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 1 2 
                                       f32_3 %245 = OpFMul %239 %244 
                                       f32_4 %246 = OpLoad %50 
                                       f32_4 %247 = OpVectorShuffle %246 %245 4 5 6 3 
                                                      OpStore %50 %247 
                              Uniform f32_4* %248 = OpAccessChain %16 %240 %18 
                                       f32_4 %249 = OpLoad %248 
                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
                                       f32_3 %251 = OpLoad %32 
                                       f32_3 %252 = OpVectorShuffle %251 %251 0 0 0 
                                       f32_3 %253 = OpFMul %250 %252 
                                       f32_4 %254 = OpLoad %50 
                                       f32_3 %255 = OpVectorShuffle %254 %254 0 1 2 
                                       f32_3 %256 = OpFAdd %253 %255 
                                       f32_4 %257 = OpLoad %50 
                                       f32_4 %258 = OpVectorShuffle %257 %256 4 5 6 3 
                                                      OpStore %50 %258 
                              Uniform f32_4* %259 = OpAccessChain %16 %240 %221 
                                       f32_4 %260 = OpLoad %259 
                                       f32_3 %261 = OpVectorShuffle %260 %260 0 1 2 
                                       f32_3 %262 = OpLoad %32 
                                       f32_3 %263 = OpVectorShuffle %262 %262 2 2 2 
                                       f32_3 %264 = OpFMul %261 %263 
                                       f32_4 %265 = OpLoad %50 
                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
                                       f32_3 %267 = OpFAdd %264 %266 
                                       f32_4 %268 = OpLoad %50 
                                       f32_4 %269 = OpVectorShuffle %268 %267 4 5 6 3 
                                                      OpStore %50 %269 
                                       f32_4 %270 = OpLoad %50 
                                       f32_3 %271 = OpVectorShuffle %270 %270 0 1 2 
                              Uniform f32_4* %272 = OpAccessChain %16 %240 %240 
                                       f32_4 %273 = OpLoad %272 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                                       f32_3 %275 = OpFAdd %271 %274 
                                       f32_4 %276 = OpLoad %50 
                                       f32_4 %277 = OpVectorShuffle %276 %275 4 5 6 3 
                                                      OpStore %50 %277 
                                        bool %280 = OpLoad %220 
                                                      OpSelectionMerge %282 None 
                                                      OpBranchConditional %280 %281 %285 
                                             %281 = OpLabel 
                                       f32_4 %283 = OpLoad %50 
                                       f32_3 %284 = OpVectorShuffle %283 %283 0 1 2 
                                                      OpStore %279 %284 
                                                      OpBranch %282 
                                             %285 = OpLabel 
                                       f32_3 %286 = OpLoad %32 
                                                      OpStore %279 %286 
                                                      OpBranch %282 
                                             %282 = OpLabel 
                                       f32_3 %287 = OpLoad %279 
                                       f32_4 %288 = OpLoad %50 
                                       f32_4 %289 = OpVectorShuffle %288 %287 4 5 6 3 
                                                      OpStore %50 %289 
                                       f32_4 %290 = OpLoad %50 
                                       f32_3 %291 = OpVectorShuffle %290 %290 0 1 2 
                              Uniform f32_3* %294 = OpAccessChain %16 %292 
                                       f32_3 %295 = OpLoad %294 
                                       f32_3 %296 = OpFNegate %295 
                                       f32_3 %297 = OpFAdd %291 %296 
                                       f32_4 %298 = OpLoad %50 
                                       f32_4 %299 = OpVectorShuffle %298 %297 4 5 6 3 
                                                      OpStore %50 %299 
                                       f32_4 %300 = OpLoad %50 
                                       f32_3 %301 = OpVectorShuffle %300 %300 0 1 2 
                              Uniform f32_3* %303 = OpAccessChain %16 %302 
                                       f32_3 %304 = OpLoad %303 
                                       f32_3 %305 = OpFMul %301 %304 
                                       f32_4 %306 = OpLoad %50 
                                       f32_4 %307 = OpVectorShuffle %306 %305 0 4 5 6 
                                                      OpStore %50 %307 
                                Private f32* %308 = OpAccessChain %50 %33 
                                         f32 %309 = OpLoad %308 
                                         f32 %311 = OpFMul %309 %310 
                                         f32 %312 = OpFAdd %311 %184 
                                                      OpStore %115 %312 
                                Uniform f32* %314 = OpAccessChain %16 %221 %122 
                                         f32 %315 = OpLoad %314 
                                         f32 %316 = OpFMul %315 %96 
                                         f32 %317 = OpFAdd %316 %184 
                                                      OpStore %313 %317 
                                         f32 %318 = OpLoad %115 
                                         f32 %319 = OpLoad %313 
                                         f32 %320 = OpExtInst %1 40 %318 %319 
                                Private f32* %321 = OpAccessChain %50 %19 
                                                      OpStore %321 %320 
                  read_only Texture3DSampled %326 = OpLoad %325 
                                       f32_4 %327 = OpLoad %50 
                                       f32_3 %328 = OpVectorShuffle %327 %327 0 2 3 
                                       f32_4 %329 = OpImageSampleImplicitLod %326 %328 
                                                      OpStore %50 %329 
                                       f32_4 %331 = OpLoad %50 
                                                      OpStore %330 %331 
                                                      OpBranch %234 
                                             %332 = OpLabel 
                                Private f32* %333 = OpAccessChain %330 %19 
                                                      OpStore %333 %224 
                                Private f32* %334 = OpAccessChain %330 %33 
                                                      OpStore %334 %224 
                                Private f32* %335 = OpAccessChain %330 %122 
                                                      OpStore %335 %224 
                                Private f32* %336 = OpAccessChain %330 %190 
                                                      OpStore %336 %224 
                                                      OpBranch %234 
                                             %234 = OpLabel 
                                       f32_4 %337 = OpLoad %330 
                              Uniform f32_4* %338 = OpAccessChain %16 %241 
                                       f32_4 %339 = OpLoad %338 
                                         f32 %340 = OpDot %337 %339 
                                Private f32* %341 = OpAccessChain %173 %19 
                                                      OpStore %341 %340 
                                Private f32* %342 = OpAccessChain %173 %19 
                                         f32 %343 = OpLoad %342 
                                         f32 %344 = OpExtInst %1 43 %343 %135 %224 
                                Private f32* %345 = OpAccessChain %173 %19 
                                                      OpStore %345 %344 
                                       f32_4 %347 = OpLoad %9 
                                       f32_3 %348 = OpVectorShuffle %347 %347 0 1 2 
                              Uniform f32_4* %350 = OpAccessChain %16 %349 
                                       f32_4 %351 = OpLoad %350 
                                       f32_3 %352 = OpVectorShuffle %351 %351 0 1 2 
                                       f32_3 %353 = OpFMul %348 %352 
                                                      OpStore %346 %353 
                                       f32_3 %354 = OpLoad %173 
                                       f32_3 %355 = OpVectorShuffle %354 %354 0 0 0 
                                       f32_3 %356 = OpLoad %346 
                                       f32_3 %357 = OpFMul %355 %356 
                                                      OpStore %173 %357 
                                       f32_4 %358 = OpLoad %9 
                                       f32_3 %359 = OpVectorShuffle %358 %358 0 1 2 
                                       f32_3 %361 = OpLoad %360 
                                       f32_3 %362 = OpFMul %359 %361 
                                       f32_3 %363 = OpLoad %173 
                                       f32_3 %364 = OpFAdd %362 %363 
                                                      OpStore %173 %364 
                                Uniform f32* %367 = OpAccessChain %16 %166 %190 
                                         f32 %368 = OpLoad %367 
                                 Output f32* %370 = OpAccessChain %366 %190 
                                                      OpStore %370 %368 
                                Private f32* %372 = OpAccessChain %173 %33 
                                         f32 %373 = OpLoad %372 
                                Private f32* %374 = OpAccessChain %173 %122 
                                         f32 %375 = OpLoad %374 
                                        bool %376 = OpFOrdGreaterThanEqual %373 %375 
                                                      OpStore %371 %376 
                                        bool %379 = OpLoad %371 
                                                      OpSelectionMerge %381 None 
                                                      OpBranchConditional %379 %380 %382 
                                             %380 = OpLabel 
                                                      OpStore %378 %224 
                                                      OpBranch %381 
                                             %382 = OpLabel 
                                                      OpStore %378 %135 
                                                      OpBranch %381 
                                             %381 = OpLabel 
                                         f32 %383 = OpLoad %378 
                                Private f32* %384 = OpAccessChain %9 %19 
                                                      OpStore %384 %383 
                                       f32_3 %385 = OpLoad %173 
                                       f32_2 %386 = OpVectorShuffle %385 %385 2 1 
                                       f32_2 %387 = OpFNegate %386 
                                       f32_3 %388 = OpLoad %173 
                                       f32_2 %389 = OpVectorShuffle %388 %388 1 2 
                                       f32_2 %390 = OpFAdd %387 %389 
                                       f32_3 %391 = OpLoad %205 
                                       f32_3 %392 = OpVectorShuffle %391 %390 3 4 2 
                                                      OpStore %205 %392 
                                Private f32* %393 = OpAccessChain %55 %19 
                                                      OpStore %393 %224 
                                Private f32* %395 = OpAccessChain %55 %33 
                                                      OpStore %395 %394 
                                       f32_4 %396 = OpLoad %9 
                                       f32_2 %397 = OpVectorShuffle %396 %396 0 0 
                                       f32_3 %398 = OpLoad %205 
                                       f32_2 %399 = OpVectorShuffle %398 %398 0 1 
                                       f32_2 %400 = OpFMul %397 %399 
                                       f32_3 %401 = OpLoad %173 
                                       f32_2 %402 = OpVectorShuffle %401 %401 2 1 
                                       f32_2 %403 = OpFAdd %400 %402 
                                       f32_4 %404 = OpLoad %50 
                                       f32_4 %405 = OpVectorShuffle %404 %403 4 5 2 3 
                                                      OpStore %50 %405 
                                       f32_4 %406 = OpLoad %9 
                                       f32_2 %407 = OpVectorShuffle %406 %406 0 0 
                                       f32_4 %408 = OpLoad %55 
                                       f32_2 %409 = OpVectorShuffle %408 %408 0 1 
                                       f32_2 %410 = OpFMul %407 %409 
                                       f32_2 %413 = OpFAdd %410 %412 
                                       f32_4 %414 = OpLoad %50 
                                       f32_4 %415 = OpVectorShuffle %414 %413 0 1 4 5 
                                                      OpStore %50 %415 
                                Private f32* %416 = OpAccessChain %173 %19 
                                         f32 %417 = OpLoad %416 
                                Private f32* %418 = OpAccessChain %50 %19 
                                         f32 %419 = OpLoad %418 
                                        bool %420 = OpFOrdGreaterThanEqual %417 %419 
                                                      OpStore %371 %420 
                                        bool %422 = OpLoad %371 
                                                      OpSelectionMerge %424 None 
                                                      OpBranchConditional %422 %423 %425 
                                             %423 = OpLabel 
                                                      OpStore %421 %224 
                                                      OpBranch %424 
                                             %425 = OpLabel 
                                                      OpStore %421 %135 
                                                      OpBranch %424 
                                             %424 = OpLabel 
                                         f32 %426 = OpLoad %421 
                                Private f32* %427 = OpAccessChain %9 %19 
                                                      OpStore %427 %426 
                                       f32_4 %428 = OpLoad %50 
                                       f32_3 %429 = OpVectorShuffle %428 %428 0 1 3 
                                       f32_3 %430 = OpFNegate %429 
                                       f32_4 %431 = OpLoad %55 
                                       f32_4 %432 = OpVectorShuffle %431 %430 4 5 6 3 
                                                      OpStore %55 %432 
                                Private f32* %433 = OpAccessChain %173 %19 
                                         f32 %434 = OpLoad %433 
                                         f32 %435 = OpFNegate %434 
                                Private f32* %436 = OpAccessChain %55 %190 
                                                      OpStore %436 %435 
                                Private f32* %438 = OpAccessChain %55 %19 
                                         f32 %439 = OpLoad %438 
                                Private f32* %440 = OpAccessChain %173 %19 
                                         f32 %441 = OpLoad %440 
                                         f32 %442 = OpFAdd %439 %441 
                                Private f32* %443 = OpAccessChain %437 %19 
                                                      OpStore %443 %442 
                                       f32_4 %444 = OpLoad %50 
                                       f32_3 %445 = OpVectorShuffle %444 %444 1 2 0 
                                       f32_4 %446 = OpLoad %55 
                                       f32_3 %447 = OpVectorShuffle %446 %446 1 2 3 
                                       f32_3 %448 = OpFAdd %445 %447 
                                       f32_4 %449 = OpLoad %437 
                                       f32_4 %450 = OpVectorShuffle %449 %448 0 4 5 6 
                                                      OpStore %437 %450 
                                       f32_4 %451 = OpLoad %9 
                                       f32_3 %452 = OpVectorShuffle %451 %451 0 0 0 
                                       f32_4 %453 = OpLoad %437 
                                       f32_3 %454 = OpVectorShuffle %453 %453 0 1 2 
                                       f32_3 %455 = OpFMul %452 %454 
                                       f32_4 %456 = OpLoad %50 
                                       f32_3 %457 = OpVectorShuffle %456 %456 0 1 3 
                                       f32_3 %458 = OpFAdd %455 %457 
                                                      OpStore %30 %458 
                                Private f32* %459 = OpAccessChain %9 %19 
                                         f32 %460 = OpLoad %459 
                                Private f32* %461 = OpAccessChain %437 %190 
                                         f32 %462 = OpLoad %461 
                                         f32 %463 = OpFMul %460 %462 
                                Private f32* %464 = OpAccessChain %173 %19 
                                         f32 %465 = OpLoad %464 
                                         f32 %466 = OpFAdd %463 %465 
                                Private f32* %467 = OpAccessChain %9 %19 
                                                      OpStore %467 %466 
                                Private f32* %468 = OpAccessChain %30 %33 
                                         f32 %469 = OpLoad %468 
                                Private f32* %470 = OpAccessChain %9 %19 
                                         f32 %471 = OpLoad %470 
                                         f32 %472 = OpExtInst %1 37 %469 %471 
                                Private f32* %473 = OpAccessChain %55 %19 
                                                      OpStore %473 %472 
                                Private f32* %474 = OpAccessChain %30 %19 
                                         f32 %475 = OpLoad %474 
                                Private f32* %476 = OpAccessChain %55 %19 
                                         f32 %477 = OpLoad %476 
                                         f32 %478 = OpFNegate %477 
                                         f32 %479 = OpFAdd %475 %478 
                                Private f32* %480 = OpAccessChain %55 %19 
                                                      OpStore %480 %479 
                                Private f32* %481 = OpAccessChain %30 %33 
                                         f32 %482 = OpLoad %481 
                                         f32 %483 = OpFNegate %482 
                                Private f32* %484 = OpAccessChain %9 %19 
                                         f32 %485 = OpLoad %484 
                                         f32 %486 = OpFAdd %483 %485 
                                Private f32* %487 = OpAccessChain %9 %19 
                                                      OpStore %487 %486 
                                Private f32* %489 = OpAccessChain %55 %19 
                                         f32 %490 = OpLoad %489 
                                         f32 %492 = OpFMul %490 %491 
                                         f32 %494 = OpFAdd %492 %493 
                                                      OpStore %488 %494 
                                Private f32* %495 = OpAccessChain %9 %19 
                                         f32 %496 = OpLoad %495 
                                         f32 %497 = OpLoad %488 
                                         f32 %498 = OpFDiv %496 %497 
                                Private f32* %499 = OpAccessChain %9 %19 
                                                      OpStore %499 %498 
                                Private f32* %500 = OpAccessChain %9 %19 
                                         f32 %501 = OpLoad %500 
                                Private f32* %502 = OpAccessChain %30 %122 
                                         f32 %503 = OpLoad %502 
                                         f32 %504 = OpFAdd %501 %503 
                                Private f32* %505 = OpAccessChain %9 %19 
                                                      OpStore %505 %504 
                                Private f32* %506 = OpAccessChain %30 %19 
                                         f32 %507 = OpLoad %506 
                                         f32 %508 = OpFAdd %507 %493 
                                                      OpStore %488 %508 
                                Private f32* %509 = OpAccessChain %55 %19 
                                         f32 %510 = OpLoad %509 
                                         f32 %511 = OpLoad %488 
                                         f32 %512 = OpFDiv %510 %511 
                                                      OpStore %488 %512 
                                Uniform f32* %513 = OpAccessChain %16 %166 %33 
                                         f32 %514 = OpLoad %513 
                                Uniform f32* %515 = OpAccessChain %16 %166 %122 
                                         f32 %516 = OpLoad %515 
                                        bool %517 = OpFOrdGreaterThanEqual %514 %516 
                                                      OpStore %220 %517 
                                        bool %519 = OpLoad %220 
                                                      OpSelectionMerge %521 None 
                                                      OpBranchConditional %519 %520 %522 
                                             %520 = OpLabel 
                                                      OpStore %518 %224 
                                                      OpBranch %521 
                                             %522 = OpLabel 
                                                      OpStore %518 %135 
                                                      OpBranch %521 
                                             %521 = OpLabel 
                                         f32 %523 = OpLoad %518 
                                                      OpStore %115 %523 
                                Uniform f32* %524 = OpAccessChain %16 %166 %122 
                                         f32 %525 = OpLoad %524 
                                         f32 %526 = OpFNegate %525 
                                Uniform f32* %527 = OpAccessChain %16 %166 %33 
                                         f32 %528 = OpLoad %527 
                                         f32 %529 = OpFAdd %526 %528 
                                Private f32* %530 = OpAccessChain %55 %19 
                                                      OpStore %530 %529 
                                         f32 %531 = OpLoad %115 
                                Private f32* %532 = OpAccessChain %55 %19 
                                         f32 %533 = OpLoad %532 
                                         f32 %534 = OpFMul %531 %533 
                                Uniform f32* %535 = OpAccessChain %16 %166 %122 
                                         f32 %536 = OpLoad %535 
                                         f32 %537 = OpFAdd %534 %536 
                                                      OpStore %115 %537 
                                Uniform f32* %539 = OpAccessChain %16 %166 %19 
                                         f32 %540 = OpLoad %539 
                                         f32 %541 = OpLoad %115 
                                        bool %542 = OpFOrdGreaterThanEqual %540 %541 
                                                      OpStore %538 %542 
                                        bool %544 = OpLoad %538 
                                                      OpSelectionMerge %546 None 
                                                      OpBranchConditional %544 %545 %547 
                                             %545 = OpLabel 
                                                      OpStore %543 %224 
                                                      OpBranch %546 
                                             %547 = OpLabel 
                                                      OpStore %543 %135 
                                                      OpBranch %546 
                                             %546 = OpLabel 
                                         f32 %548 = OpLoad %543 
                                Private f32* %549 = OpAccessChain %55 %19 
                                                      OpStore %549 %548 
                                         f32 %551 = OpLoad %115 
                                         f32 %552 = OpFNegate %551 
                                Uniform f32* %553 = OpAccessChain %16 %166 %19 
                                         f32 %554 = OpLoad %553 
                                         f32 %555 = OpFAdd %552 %554 
                                                      OpStore %550 %555 
                                Private f32* %556 = OpAccessChain %55 %19 
                                         f32 %557 = OpLoad %556 
                                         f32 %558 = OpLoad %550 
                                         f32 %559 = OpFMul %557 %558 
                                         f32 %560 = OpLoad %115 
                                         f32 %561 = OpFAdd %559 %560 
                                                      OpStore %115 %561 
                                         f32 %562 = OpLoad %115 
                                Uniform f32* %564 = OpAccessChain %16 %563 
                                         f32 %565 = OpLoad %564 
                                         f32 %566 = OpFMul %562 %565 
                                Private f32* %567 = OpAccessChain %55 %19 
                                                      OpStore %567 %566 
                                Private f32* %568 = OpAccessChain %30 %19 
                                         f32 %569 = OpLoad %568 
                                Private f32* %570 = OpAccessChain %55 %19 
                                         f32 %571 = OpLoad %570 
                                         f32 %572 = OpExtInst %1 40 %569 %571 
                                Private f32* %573 = OpAccessChain %30 %19 
                                                      OpStore %573 %572 
                                         f32 %574 = OpLoad %115 
                                Uniform f32* %576 = OpAccessChain %16 %575 
                                         f32 %577 = OpLoad %576 
                                         f32 %578 = OpFMul %574 %577 
                                                      OpStore %115 %578 
                                         f32 %579 = OpLoad %115 
                                Private f32* %580 = OpAccessChain %30 %19 
                                         f32 %581 = OpLoad %580 
                                         f32 %582 = OpExtInst %1 37 %579 %581 
                                Private f32* %583 = OpAccessChain %30 %19 
                                                      OpStore %583 %582 
                                       f32_4 %584 = OpLoad %9 
                                       f32_3 %585 = OpVectorShuffle %584 %584 0 0 0 
                                       f32_3 %586 = OpExtInst %1 4 %585 
                                       f32_3 %589 = OpFAdd %586 %588 
                                       f32_4 %590 = OpLoad %55 
                                       f32_4 %591 = OpVectorShuffle %590 %589 4 5 6 3 
                                                      OpStore %55 %591 
                                       f32_4 %592 = OpLoad %55 
                                       f32_3 %593 = OpVectorShuffle %592 %592 0 1 2 
                                       f32_3 %594 = OpExtInst %1 10 %593 
                                       f32_4 %595 = OpLoad %55 
                                       f32_4 %596 = OpVectorShuffle %595 %594 4 5 6 3 
                                                      OpStore %55 %596 
                                       f32_4 %597 = OpLoad %55 
                                       f32_3 %598 = OpVectorShuffle %597 %597 0 1 2 
                                       f32_3 %600 = OpFMul %598 %599 
                                       f32_3 %603 = OpFAdd %600 %602 
                                       f32_4 %604 = OpLoad %55 
                                       f32_4 %605 = OpVectorShuffle %604 %603 4 5 6 3 
                                                      OpStore %55 %605 
                                       f32_4 %606 = OpLoad %55 
                                       f32_3 %607 = OpVectorShuffle %606 %606 0 1 2 
                                       f32_3 %608 = OpExtInst %1 4 %607 
                                       f32_3 %610 = OpFAdd %608 %609 
                                       f32_4 %611 = OpLoad %55 
                                       f32_4 %612 = OpVectorShuffle %611 %610 4 5 6 3 
                                                      OpStore %55 %612 
                                       f32_4 %613 = OpLoad %55 
                                       f32_3 %614 = OpVectorShuffle %613 %613 0 1 2 
                                       f32_3 %615 = OpCompositeConstruct %135 %135 %135 
                                       f32_3 %616 = OpCompositeConstruct %224 %224 %224 
                                       f32_3 %617 = OpExtInst %1 43 %614 %615 %616 
                                       f32_4 %618 = OpLoad %55 
                                       f32_4 %619 = OpVectorShuffle %618 %617 4 5 6 3 
                                                      OpStore %55 %619 
                                       f32_4 %620 = OpLoad %55 
                                       f32_3 %621 = OpVectorShuffle %620 %620 0 1 2 
                                       f32_3 %622 = OpFAdd %621 %609 
                                       f32_4 %623 = OpLoad %55 
                                       f32_4 %624 = OpVectorShuffle %623 %622 4 5 6 3 
                                                      OpStore %55 %624 
                                         f32 %625 = OpLoad %488 
                                       f32_3 %626 = OpCompositeConstruct %625 %625 %625 
                                       f32_4 %627 = OpLoad %55 
                                       f32_3 %628 = OpVectorShuffle %627 %627 0 1 2 
                                       f32_3 %629 = OpFMul %626 %628 
                                       f32_3 %631 = OpFAdd %629 %630 
                                       f32_4 %632 = OpLoad %9 
                                       f32_4 %633 = OpVectorShuffle %632 %631 4 1 5 6 
                                                      OpStore %9 %633 
                  read_only Texture2DSampled %636 = OpLoad %635 
                                       f32_4 %638 = OpImageSampleImplicitLod %636 %637 
                                         f32 %639 = OpCompositeExtract %638 0 
                                                      OpStore %634 %639 
                                       f32_3 %640 = OpLoad %30 
                                       f32_3 %641 = OpVectorShuffle %640 %640 0 0 0 
                                       f32_4 %642 = OpLoad %9 
                                       f32_3 %643 = OpVectorShuffle %642 %642 0 2 3 
                                       f32_3 %644 = OpFMul %641 %643 
                                       f32_3 %645 = OpLoad %173 
                                       f32_3 %646 = OpFNegate %645 
                                       f32_3 %647 = OpFAdd %644 %646 
                                       f32_4 %648 = OpLoad %9 
                                       f32_4 %649 = OpVectorShuffle %648 %647 4 5 6 3 
                                                      OpStore %9 %649 
                                         f32 %650 = OpLoad %634 
                                       f32_3 %651 = OpCompositeConstruct %650 %650 %650 
                                       f32_4 %652 = OpLoad %9 
                                       f32_3 %653 = OpVectorShuffle %652 %652 0 1 2 
                                       f32_3 %654 = OpFMul %651 %653 
                                       f32_3 %655 = OpLoad %173 
                                       f32_3 %656 = OpFAdd %654 %655 
                                       f32_4 %657 = OpLoad %9 
                                       f32_4 %658 = OpVectorShuffle %657 %656 4 5 6 3 
                                                      OpStore %9 %658 
                                       f32_4 %659 = OpLoad %9 
                                       f32_3 %660 = OpVectorShuffle %659 %659 0 1 2 
                                       f32_4 %661 = OpLoad %366 
                                       f32_4 %662 = OpVectorShuffle %661 %660 4 5 6 3 
                                                      OpStore %366 %662 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
}
}
 Pass {
  Name "FORWARD"
  LOD 110
  Tags { "IGNOREPROJECTOR" = "False" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" "UnlitTilted" = "UnlitTilted" }
  Blend SrcAlpha One, SrcAlpha One
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  Lighting On
  GpuProgramID 79253
Program "vp" {
SubProgram "d3d11 " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _CausticScale;
uniform 	vec4 _CausticColor;
uniform 	float _ReflPower;
uniform 	float _TimeScale;
uniform 	vec4 _LightCausticColor;
uniform 	float _LightCausticPower;
uniform 	float _GlobalReflectionsEnabled;
uniform  sampler2D _CausticTex;
uniform  sampler2D _ReflMapFromPixelator;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec2 u_xlat3;
float u_xlat9;
bool u_xlatb9;
float u_xlat10;
void main()
{
    u_xlat0.x = _Time.x * _TimeScale;
    u_xlat3.x = vs_TEXCOORD1.y + vs_TEXCOORD1.x;
    u_xlat3.x = _Time.y * _TimeScale + u_xlat3.x;
    u_xlat1.x = sin(u_xlat3.x);
    u_xlat2.x = cos(u_xlat3.x);
    u_xlat2.x = u_xlat2.x * 0.111111112;
    u_xlat2.y = u_xlat1.x * 0.166666672;
    u_xlat3.xy = u_xlat2.xy + vs_TEXCOORD1.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(_CausticScale);
    u_xlat3.xy = u_xlat3.xy * vec2(0.200000003, 0.200000003);
    u_xlat0.xy = u_xlat0.xx * vec2(0.5, 0.125) + u_xlat3.xy;
    u_xlat10_0 = texture(_CausticTex, u_xlat0.xy);
    u_xlat9 = vs_TEXCOORD2.y * 500.0;
    u_xlat9 = _Time.z * 5.0 + u_xlat9;
    u_xlat9 = sin(u_xlat9);
    u_xlat1.x = u_xlat9 * 0.00150000001;
    u_xlat1.y = 0.0;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD2.xy;
    u_xlat10_1 = texture(_ReflMapFromPixelator, u_xlat1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_LightCausticPower);
    u_xlat0.xyz = u_xlat0.xyz * _LightCausticColor.xyz + _CausticColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.0500000007, 0.0500000007, 0.0500000007);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.75, 0.75, 0.75) + u_xlat10_1.xyz;
    u_xlat9 = u_xlat10_1.w * _ReflPower;
    u_xlat9 = u_xlat9 * _GlobalReflectionsEnabled;
    u_xlat0.xyz = (-u_xlat2.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1.xyz = vs_TEXCOORD1.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD1.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD1.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb9 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb9){
        u_xlatb9 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD1.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD1.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb9)) ? u_xlat2.xyz : vs_TEXCOORD1.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat9 = u_xlat2.y * 0.25 + 0.75;
        u_xlat10 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat9, u_xlat10);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat9 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xx);
    u_xlat9 = u_xlat9 * u_xlat10_1.w;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    SV_Target0.w = _CausticColor.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "POINT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 166
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %92 %97 %127 %147 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %52 Location 52 
                                                      OpMemberDecorate %90 0 BuiltIn 90 
                                                      OpMemberDecorate %90 1 BuiltIn 90 
                                                      OpMemberDecorate %90 2 BuiltIn 90 
                                                      OpDecorate %90 Block 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate %127 Location 127 
                                                      OpDecorate %147 Location 147 
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
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %16 %17 %18 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4];}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                                              %50 = OpTypeVector %6 3 
                                              %51 = OpTypePointer Output %50 
                                Output f32_3* %52 = OpVariable Output 
                                          u32 %88 = OpConstant 1 
                                              %89 = OpTypeArray %6 %88 
                                              %90 = OpTypeStruct %7 %6 %89 
                                              %91 = OpTypePointer Output %90 
         Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                                              %94 = OpTypePointer Output %7 
                                              %96 = OpTypePointer Input %50 
                                 Input f32_3* %97 = OpVariable Input 
                                         u32 %103 = OpConstant 0 
                                             %104 = OpTypePointer Private %6 
                                         u32 %117 = OpConstant 2 
                                Private f32* %119 = OpVariable Private 
                               Output f32_3* %127 = OpVariable Output 
                                             %135 = OpTypePointer Uniform %6 
                                         f32 %142 = OpConstant 3.67402E-40 
                                       f32_3 %143 = OpConstantComposite %142 %142 %142 
                               Output f32_4* %147 = OpVariable Output 
                                             %148 = OpTypeVector %6 2 
                                             %160 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %53 = OpAccessChain %21 %23 %46 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %56 = OpLoad %11 
                                        f32_3 %57 = OpVectorShuffle %56 %56 3 3 3 
                                        f32_3 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                                      OpStore %52 %61 
                                        f32_4 %62 = OpLoad %44 
                                        f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %21 %46 %23 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %63 %65 
                                                      OpStore %9 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %46 %28 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %44 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %74 = OpAccessChain %21 %46 %36 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %44 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                               Uniform f32_4* %81 = OpAccessChain %21 %46 %46 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %44 
                                        f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %9 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %9 %87 
                                        f32_4 %93 = OpLoad %9 
                                Output f32_4* %95 = OpAccessChain %92 %28 
                                                      OpStore %95 %93 
                                        f32_3 %98 = OpLoad %97 
                               Uniform f32_4* %99 = OpAccessChain %21 %36 %28 
                                       f32_4 %100 = OpLoad %99 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                                         f32 %102 = OpDot %98 %101 
                                Private f32* %105 = OpAccessChain %44 %103 
                                                      OpStore %105 %102 
                                       f32_3 %106 = OpLoad %97 
                              Uniform f32_4* %107 = OpAccessChain %21 %36 %23 
                                       f32_4 %108 = OpLoad %107 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                         f32 %110 = OpDot %106 %109 
                                Private f32* %111 = OpAccessChain %44 %88 
                                                      OpStore %111 %110 
                                       f32_3 %112 = OpLoad %97 
                              Uniform f32_4* %113 = OpAccessChain %21 %36 %36 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                         f32 %116 = OpDot %112 %115 
                                Private f32* %118 = OpAccessChain %44 %117 
                                                      OpStore %118 %116 
                                       f32_4 %120 = OpLoad %44 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                                       f32_4 %122 = OpLoad %44 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                         f32 %124 = OpDot %121 %123 
                                                      OpStore %119 %124 
                                         f32 %125 = OpLoad %119 
                                         f32 %126 = OpExtInst %1 32 %125 
                                                      OpStore %119 %126 
                                         f32 %128 = OpLoad %119 
                                       f32_3 %129 = OpCompositeConstruct %128 %128 %128 
                                       f32_4 %130 = OpLoad %44 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_3 %132 = OpFMul %129 %131 
                                                      OpStore %127 %132 
                                Private f32* %133 = OpAccessChain %9 %88 
                                         f32 %134 = OpLoad %133 
                                Uniform f32* %136 = OpAccessChain %21 %28 %103 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFMul %134 %137 
                                Private f32* %139 = OpAccessChain %9 %88 
                                                      OpStore %139 %138 
                                       f32_4 %140 = OpLoad %9 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 3 1 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %44 
                                       f32_4 %146 = OpVectorShuffle %145 %144 4 1 5 6 
                                                      OpStore %44 %146 
                                       f32_4 %149 = OpLoad %9 
                                       f32_2 %150 = OpVectorShuffle %149 %149 2 3 
                                       f32_4 %151 = OpLoad %147 
                                       f32_4 %152 = OpVectorShuffle %151 %150 0 1 4 5 
                                                      OpStore %147 %152 
                                       f32_4 %153 = OpLoad %44 
                                       f32_2 %154 = OpVectorShuffle %153 %153 2 2 
                                       f32_4 %155 = OpLoad %44 
                                       f32_2 %156 = OpVectorShuffle %155 %155 0 3 
                                       f32_2 %157 = OpFAdd %154 %156 
                                       f32_4 %158 = OpLoad %147 
                                       f32_4 %159 = OpVectorShuffle %158 %157 4 5 2 3 
                                                      OpStore %147 %159 
                                 Output f32* %161 = OpAccessChain %92 %28 %88 
                                         f32 %162 = OpLoad %161 
                                         f32 %163 = OpFNegate %162 
                                 Output f32* %164 = OpAccessChain %92 %28 %88 
                                                      OpStore %164 %163 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 390
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %34 %110 %378 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 RelaxedPrecision 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpMemberDecorate %15 6 RelaxedPrecision 
                                                      OpMemberDecorate %15 6 Offset 15 
                                                      OpMemberDecorate %15 7 Offset 15 
                                                      OpMemberDecorate %15 8 Offset 15 
                                                      OpMemberDecorate %15 9 Offset 15 
                                                      OpMemberDecorate %15 10 Offset 15 
                                                      OpMemberDecorate %15 11 Offset 15 
                                                      OpMemberDecorate %15 12 Offset 15 
                                                      OpMemberDecorate %15 13 Offset 15 
                                                      OpMemberDecorate %15 14 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %34 Location 34 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %102 DescriptorSet 102 
                                                      OpDecorate %102 Binding 102 
                                                      OpDecorate %103 RelaxedPrecision 
                                                      OpDecorate %107 RelaxedPrecision 
                                                      OpDecorate %110 Location 110 
                                                      OpDecorate %137 RelaxedPrecision 
                                                      OpDecorate %138 RelaxedPrecision 
                                                      OpDecorate %138 DescriptorSet 138 
                                                      OpDecorate %138 Binding 138 
                                                      OpDecorate %139 RelaxedPrecision 
                                                      OpDecorate %143 RelaxedPrecision 
                                                      OpDecorate %147 RelaxedPrecision 
                                                      OpDecorate %148 RelaxedPrecision 
                                                      OpDecorate %161 RelaxedPrecision 
                                                      OpDecorate %168 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %246 SpecId 246 
                                                      OpDecorate %337 DescriptorSet 337 
                                                      OpDecorate %337 Binding 337 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %349 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %352 RelaxedPrecision 
                                                      OpDecorate %355 RelaxedPrecision 
                                                      OpDecorate %356 RelaxedPrecision 
                                                      OpDecorate %361 DescriptorSet 361 
                                                      OpDecorate %361 Binding 361 
                                                      OpDecorate %368 RelaxedPrecision 
                                                      OpDecorate %374 RelaxedPrecision 
                                                      OpDecorate %375 RelaxedPrecision 
                                                      OpDecorate %378 RelaxedPrecision 
                                                      OpDecorate %378 Location 378 
                                                      OpDecorate %380 RelaxedPrecision 
                                                      OpDecorate %381 RelaxedPrecision 
                                                      OpDecorate %382 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 4 
                                              %11 = OpTypeInt 32 0 
                                          u32 %12 = OpConstant 4 
                                              %13 = OpTypeArray %10 %12 
                                              %14 = OpTypeArray %10 %12 
                                              %15 = OpTypeStruct %10 %10 %10 %13 %7 %7 %10 %14 %6 %10 %6 %6 %10 %6 %6 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32_4; f32; f32; f32_4; f32; f32;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 0 
                                          u32 %20 = OpConstant 0 
                                              %21 = OpTypePointer Uniform %6 
                                          i32 %24 = OpConstant 11 
                                              %28 = OpTypePointer Private %6 
                                              %30 = OpTypeVector %6 2 
                                              %31 = OpTypePointer Private %30 
                               Private f32_2* %32 = OpVariable Private 
                                              %33 = OpTypePointer Input %7 
                                 Input f32_3* %34 = OpVariable Input 
                                          u32 %35 = OpConstant 1 
                                              %36 = OpTypePointer Input %6 
                               Private f32_3* %52 = OpVariable Private 
                                              %57 = OpTypePointer Private %10 
                               Private f32_4* %58 = OpVariable Private 
                                          f32 %65 = OpConstant 3.67402E-40 
                                          f32 %70 = OpConstant 3.67402E-40 
                                          i32 %79 = OpConstant 8 
                                          f32 %85 = OpConstant 3.67402E-40 
                                        f32_2 %86 = OpConstantComposite %85 %85 
                                          f32 %90 = OpConstant 3.67402E-40 
                                          f32 %91 = OpConstant 3.67402E-40 
                                        f32_2 %92 = OpConstantComposite %90 %91 
                               Private f32_3* %98 = OpVariable Private 
                                              %99 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %100 = OpTypeSampledImage %99 
                                             %101 = OpTypePointer UniformConstant %100 
 UniformConstant read_only Texture2DSampled* %102 = OpVariable UniformConstant 
                                Private f32* %108 = OpVariable Private 
                                             %109 = OpTypePointer Input %10 
                                Input f32_4* %110 = OpVariable Input 
                                         f32 %113 = OpConstant 3.67402E-40 
                                         u32 %115 = OpConstant 2 
                                         f32 %118 = OpConstant 3.67402E-40 
                                         f32 %125 = OpConstant 3.67402E-40 
                                         f32 %128 = OpConstant 3.67402E-40 
                              Private f32_4* %137 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %138 = OpVariable UniformConstant 
                                         i32 %144 = OpConstant 13 
                                         i32 %150 = OpConstant 12 
                                             %151 = OpTypePointer Uniform %10 
                                         i32 %156 = OpConstant 9 
                              Private f32_3* %161 = OpVariable Private 
                                       f32_3 %163 = OpConstantComposite %90 %90 %90 
                                         f32 %165 = OpConstant 3.67402E-40 
                                       f32_3 %166 = OpConstantComposite %165 %165 %165 
                              Private f32_3* %168 = OpVariable Private 
                                         f32 %170 = OpConstant 3.67402E-40 
                                       f32_3 %171 = OpConstantComposite %170 %170 %170 
                                         u32 %176 = OpConstant 3 
                                         i32 %179 = OpConstant 10 
                                         i32 %186 = OpConstant 14 
                              Private f32_3* %191 = OpVariable Private 
                                         i32 %204 = OpConstant 7 
                                         i32 %205 = OpConstant 1 
                                         i32 %218 = OpConstant 2 
                                         i32 %228 = OpConstant 3 
                                             %233 = OpTypeBool 
                                             %234 = OpTypePointer Private %233 
                               Private bool* %235 = OpVariable Private 
                                         f32 %238 = OpConstant 3.67402E-40 
                                        bool %240 = OpConstantFalse 
                                        bool %246 = OpSpecConstantFalse 
                                             %290 = OpTypePointer Function %7 
                                         i32 %304 = OpConstant 5 
                                             %305 = OpTypePointer Uniform %7 
                                         i32 %314 = OpConstant 4 
                                         f32 %322 = OpConstant 3.67402E-40 
                                Private f32* %325 = OpVariable Private 
                                             %334 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %335 = OpTypeSampledImage %334 
                                             %336 = OpTypePointer UniformConstant %335 
 UniformConstant read_only Texture3DSampled* %337 = OpVariable UniformConstant 
                              Private f32_4* %342 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %361 = OpVariable UniformConstant 
                                         i32 %372 = OpConstant 6 
                                             %377 = OpTypePointer Output %10 
                               Output f32_4* %378 = OpVariable Output 
                                             %387 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %291 = OpVariable Function 
                                 Uniform f32* %22 = OpAccessChain %17 %19 %20 
                                          f32 %23 = OpLoad %22 
                                 Uniform f32* %25 = OpAccessChain %17 %24 
                                          f32 %26 = OpLoad %25 
                                          f32 %27 = OpFMul %23 %26 
                                 Private f32* %29 = OpAccessChain %9 %20 
                                                      OpStore %29 %27 
                                   Input f32* %37 = OpAccessChain %34 %35 
                                          f32 %38 = OpLoad %37 
                                   Input f32* %39 = OpAccessChain %34 %20 
                                          f32 %40 = OpLoad %39 
                                          f32 %41 = OpFAdd %38 %40 
                                 Private f32* %42 = OpAccessChain %32 %20 
                                                      OpStore %42 %41 
                                 Uniform f32* %43 = OpAccessChain %17 %19 %35 
                                          f32 %44 = OpLoad %43 
                                 Uniform f32* %45 = OpAccessChain %17 %24 
                                          f32 %46 = OpLoad %45 
                                          f32 %47 = OpFMul %44 %46 
                                 Private f32* %48 = OpAccessChain %32 %20 
                                          f32 %49 = OpLoad %48 
                                          f32 %50 = OpFAdd %47 %49 
                                 Private f32* %51 = OpAccessChain %32 %20 
                                                      OpStore %51 %50 
                                 Private f32* %53 = OpAccessChain %32 %20 
                                          f32 %54 = OpLoad %53 
                                          f32 %55 = OpExtInst %1 13 %54 
                                 Private f32* %56 = OpAccessChain %52 %20 
                                                      OpStore %56 %55 
                                 Private f32* %59 = OpAccessChain %32 %20 
                                          f32 %60 = OpLoad %59 
                                          f32 %61 = OpExtInst %1 14 %60 
                                 Private f32* %62 = OpAccessChain %58 %20 
                                                      OpStore %62 %61 
                                 Private f32* %63 = OpAccessChain %58 %20 
                                          f32 %64 = OpLoad %63 
                                          f32 %66 = OpFMul %64 %65 
                                 Private f32* %67 = OpAccessChain %58 %20 
                                                      OpStore %67 %66 
                                 Private f32* %68 = OpAccessChain %52 %20 
                                          f32 %69 = OpLoad %68 
                                          f32 %71 = OpFMul %69 %70 
                                 Private f32* %72 = OpAccessChain %58 %35 
                                                      OpStore %72 %71 
                                        f32_4 %73 = OpLoad %58 
                                        f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                                        f32_3 %75 = OpLoad %34 
                                        f32_2 %76 = OpVectorShuffle %75 %75 0 1 
                                        f32_2 %77 = OpFAdd %74 %76 
                                                      OpStore %32 %77 
                                        f32_2 %78 = OpLoad %32 
                                 Uniform f32* %80 = OpAccessChain %17 %79 
                                          f32 %81 = OpLoad %80 
                                        f32_2 %82 = OpCompositeConstruct %81 %81 
                                        f32_2 %83 = OpFMul %78 %82 
                                                      OpStore %32 %83 
                                        f32_2 %84 = OpLoad %32 
                                        f32_2 %87 = OpFMul %84 %86 
                                                      OpStore %32 %87 
                                        f32_3 %88 = OpLoad %9 
                                        f32_2 %89 = OpVectorShuffle %88 %88 0 0 
                                        f32_2 %93 = OpFMul %89 %92 
                                        f32_2 %94 = OpLoad %32 
                                        f32_2 %95 = OpFAdd %93 %94 
                                        f32_3 %96 = OpLoad %9 
                                        f32_3 %97 = OpVectorShuffle %96 %95 3 4 2 
                                                      OpStore %9 %97 
                  read_only Texture2DSampled %103 = OpLoad %102 
                                       f32_3 %104 = OpLoad %9 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_4 %106 = OpImageSampleImplicitLod %103 %105 
                                       f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                                                      OpStore %98 %107 
                                  Input f32* %111 = OpAccessChain %110 %35 
                                         f32 %112 = OpLoad %111 
                                         f32 %114 = OpFMul %112 %113 
                                                      OpStore %108 %114 
                                Uniform f32* %116 = OpAccessChain %17 %19 %115 
                                         f32 %117 = OpLoad %116 
                                         f32 %119 = OpFMul %117 %118 
                                         f32 %120 = OpLoad %108 
                                         f32 %121 = OpFAdd %119 %120 
                                                      OpStore %108 %121 
                                         f32 %122 = OpLoad %108 
                                         f32 %123 = OpExtInst %1 13 %122 
                                                      OpStore %108 %123 
                                         f32 %124 = OpLoad %108 
                                         f32 %126 = OpFMul %124 %125 
                                Private f32* %127 = OpAccessChain %52 %20 
                                                      OpStore %127 %126 
                                Private f32* %129 = OpAccessChain %52 %35 
                                                      OpStore %129 %128 
                                       f32_3 %130 = OpLoad %52 
                                       f32_2 %131 = OpVectorShuffle %130 %130 0 1 
                                       f32_4 %132 = OpLoad %110 
                                       f32_2 %133 = OpVectorShuffle %132 %132 0 1 
                                       f32_2 %134 = OpFAdd %131 %133 
                                       f32_3 %135 = OpLoad %52 
                                       f32_3 %136 = OpVectorShuffle %135 %134 3 4 2 
                                                      OpStore %52 %136 
                  read_only Texture2DSampled %139 = OpLoad %138 
                                       f32_3 %140 = OpLoad %52 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                                       f32_4 %142 = OpImageSampleImplicitLod %139 %141 
                                                      OpStore %137 %142 
                                       f32_3 %143 = OpLoad %98 
                                Uniform f32* %145 = OpAccessChain %17 %144 
                                         f32 %146 = OpLoad %145 
                                       f32_3 %147 = OpCompositeConstruct %146 %146 %146 
                                       f32_3 %148 = OpFMul %143 %147 
                                                      OpStore %9 %148 
                                       f32_3 %149 = OpLoad %9 
                              Uniform f32_4* %152 = OpAccessChain %17 %150 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                       f32_3 %155 = OpFMul %149 %154 
                              Uniform f32_4* %157 = OpAccessChain %17 %156 
                                       f32_4 %158 = OpLoad %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                       f32_3 %160 = OpFAdd %155 %159 
                                                      OpStore %9 %160 
                                       f32_3 %162 = OpLoad %9 
                                       f32_3 %164 = OpFMul %162 %163 
                                       f32_3 %167 = OpFAdd %164 %166 
                                                      OpStore %161 %167 
                                       f32_3 %169 = OpLoad %9 
                                       f32_3 %172 = OpFMul %169 %171 
                                       f32_4 %173 = OpLoad %137 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                                       f32_3 %175 = OpFAdd %172 %174 
                                                      OpStore %168 %175 
                                Private f32* %177 = OpAccessChain %137 %176 
                                         f32 %178 = OpLoad %177 
                                Uniform f32* %180 = OpAccessChain %17 %179 
                                         f32 %181 = OpLoad %180 
                                         f32 %182 = OpFMul %178 %181 
                                Private f32* %183 = OpAccessChain %9 %20 
                                                      OpStore %183 %182 
                                Private f32* %184 = OpAccessChain %9 %20 
                                         f32 %185 = OpLoad %184 
                                Uniform f32* %187 = OpAccessChain %17 %186 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpFMul %185 %188 
                                Private f32* %190 = OpAccessChain %9 %20 
                                                      OpStore %190 %189 
                                       f32_3 %192 = OpLoad %161 
                                       f32_3 %193 = OpFNegate %192 
                                       f32_3 %194 = OpLoad %168 
                                       f32_3 %195 = OpFAdd %193 %194 
                                                      OpStore %191 %195 
                                       f32_3 %196 = OpLoad %9 
                                       f32_3 %197 = OpVectorShuffle %196 %196 0 0 0 
                                       f32_3 %198 = OpLoad %191 
                                       f32_3 %199 = OpFMul %197 %198 
                                       f32_3 %200 = OpLoad %161 
                                       f32_3 %201 = OpFAdd %199 %200 
                                                      OpStore %9 %201 
                                       f32_3 %202 = OpLoad %34 
                                       f32_3 %203 = OpVectorShuffle %202 %202 1 1 1 
                              Uniform f32_4* %206 = OpAccessChain %17 %204 %205 
                                       f32_4 %207 = OpLoad %206 
                                       f32_3 %208 = OpVectorShuffle %207 %207 0 1 2 
                                       f32_3 %209 = OpFMul %203 %208 
                                                      OpStore %52 %209 
                              Uniform f32_4* %210 = OpAccessChain %17 %204 %19 
                                       f32_4 %211 = OpLoad %210 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 1 2 
                                       f32_3 %213 = OpLoad %34 
                                       f32_3 %214 = OpVectorShuffle %213 %213 0 0 0 
                                       f32_3 %215 = OpFMul %212 %214 
                                       f32_3 %216 = OpLoad %52 
                                       f32_3 %217 = OpFAdd %215 %216 
                                                      OpStore %52 %217 
                              Uniform f32_4* %219 = OpAccessChain %17 %204 %218 
                                       f32_4 %220 = OpLoad %219 
                                       f32_3 %221 = OpVectorShuffle %220 %220 0 1 2 
                                       f32_3 %222 = OpLoad %34 
                                       f32_3 %223 = OpVectorShuffle %222 %222 2 2 2 
                                       f32_3 %224 = OpFMul %221 %223 
                                       f32_3 %225 = OpLoad %52 
                                       f32_3 %226 = OpFAdd %224 %225 
                                                      OpStore %52 %226 
                                       f32_3 %227 = OpLoad %52 
                              Uniform f32_4* %229 = OpAccessChain %17 %204 %228 
                                       f32_4 %230 = OpLoad %229 
                                       f32_3 %231 = OpVectorShuffle %230 %230 0 1 2 
                                       f32_3 %232 = OpFAdd %227 %231 
                                                      OpStore %52 %232 
                                Uniform f32* %236 = OpAccessChain %17 %218 %20 
                                         f32 %237 = OpLoad %236 
                                        bool %239 = OpFOrdEqual %237 %238 
                                                      OpStore %235 %239 
                                                      OpSelectionMerge %242 None 
                                                      OpBranchConditional %240 %241 %242 
                                             %241 = OpLabel 
                                        bool %243 = OpLoad %235 
                                                      OpSelectionMerge %245 None 
                                                      OpBranchConditional %243 %244 %245 
                                             %244 = OpLabel 
                                                      OpBranch %245 
                                             %245 = OpLabel 
                                                      OpBranch %242 
                                             %242 = OpLabel 
                                                      OpSelectionMerge %248 None 
                                                      OpBranchConditional %246 %247 %344 
                                             %247 = OpLabel 
                                Uniform f32* %249 = OpAccessChain %17 %218 %35 
                                         f32 %250 = OpLoad %249 
                                        bool %251 = OpFOrdEqual %250 %238 
                                                      OpStore %235 %251 
                                       f32_3 %252 = OpLoad %34 
                                       f32_3 %253 = OpVectorShuffle %252 %252 1 1 1 
                              Uniform f32_4* %254 = OpAccessChain %17 %228 %205 
                                       f32_4 %255 = OpLoad %254 
                                       f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
                                       f32_3 %257 = OpFMul %253 %256 
                                       f32_4 %258 = OpLoad %58 
                                       f32_4 %259 = OpVectorShuffle %258 %257 4 5 6 3 
                                                      OpStore %58 %259 
                              Uniform f32_4* %260 = OpAccessChain %17 %228 %19 
                                       f32_4 %261 = OpLoad %260 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                                       f32_3 %263 = OpLoad %34 
                                       f32_3 %264 = OpVectorShuffle %263 %263 0 0 0 
                                       f32_3 %265 = OpFMul %262 %264 
                                       f32_4 %266 = OpLoad %58 
                                       f32_3 %267 = OpVectorShuffle %266 %266 0 1 2 
                                       f32_3 %268 = OpFAdd %265 %267 
                                       f32_4 %269 = OpLoad %58 
                                       f32_4 %270 = OpVectorShuffle %269 %268 4 5 6 3 
                                                      OpStore %58 %270 
                              Uniform f32_4* %271 = OpAccessChain %17 %228 %218 
                                       f32_4 %272 = OpLoad %271 
                                       f32_3 %273 = OpVectorShuffle %272 %272 0 1 2 
                                       f32_3 %274 = OpLoad %34 
                                       f32_3 %275 = OpVectorShuffle %274 %274 2 2 2 
                                       f32_3 %276 = OpFMul %273 %275 
                                       f32_4 %277 = OpLoad %58 
                                       f32_3 %278 = OpVectorShuffle %277 %277 0 1 2 
                                       f32_3 %279 = OpFAdd %276 %278 
                                       f32_4 %280 = OpLoad %58 
                                       f32_4 %281 = OpVectorShuffle %280 %279 4 5 6 3 
                                                      OpStore %58 %281 
                                       f32_4 %282 = OpLoad %58 
                                       f32_3 %283 = OpVectorShuffle %282 %282 0 1 2 
                              Uniform f32_4* %284 = OpAccessChain %17 %228 %228 
                                       f32_4 %285 = OpLoad %284 
                                       f32_3 %286 = OpVectorShuffle %285 %285 0 1 2 
                                       f32_3 %287 = OpFAdd %283 %286 
                                       f32_4 %288 = OpLoad %58 
                                       f32_4 %289 = OpVectorShuffle %288 %287 4 5 6 3 
                                                      OpStore %58 %289 
                                        bool %292 = OpLoad %235 
                                                      OpSelectionMerge %294 None 
                                                      OpBranchConditional %292 %293 %297 
                                             %293 = OpLabel 
                                       f32_4 %295 = OpLoad %58 
                                       f32_3 %296 = OpVectorShuffle %295 %295 0 1 2 
                                                      OpStore %291 %296 
                                                      OpBranch %294 
                                             %297 = OpLabel 
                                       f32_3 %298 = OpLoad %34 
                                                      OpStore %291 %298 
                                                      OpBranch %294 
                                             %294 = OpLabel 
                                       f32_3 %299 = OpLoad %291 
                                       f32_4 %300 = OpLoad %58 
                                       f32_4 %301 = OpVectorShuffle %300 %299 4 5 6 3 
                                                      OpStore %58 %301 
                                       f32_4 %302 = OpLoad %58 
                                       f32_3 %303 = OpVectorShuffle %302 %302 0 1 2 
                              Uniform f32_3* %306 = OpAccessChain %17 %304 
                                       f32_3 %307 = OpLoad %306 
                                       f32_3 %308 = OpFNegate %307 
                                       f32_3 %309 = OpFAdd %303 %308 
                                       f32_4 %310 = OpLoad %58 
                                       f32_4 %311 = OpVectorShuffle %310 %309 4 5 6 3 
                                                      OpStore %58 %311 
                                       f32_4 %312 = OpLoad %58 
                                       f32_3 %313 = OpVectorShuffle %312 %312 0 1 2 
                              Uniform f32_3* %315 = OpAccessChain %17 %314 
                                       f32_3 %316 = OpLoad %315 
                                       f32_3 %317 = OpFMul %313 %316 
                                       f32_4 %318 = OpLoad %58 
                                       f32_4 %319 = OpVectorShuffle %318 %317 0 4 5 6 
                                                      OpStore %58 %319 
                                Private f32* %320 = OpAccessChain %58 %35 
                                         f32 %321 = OpLoad %320 
                                         f32 %323 = OpFMul %321 %322 
                                         f32 %324 = OpFAdd %323 %170 
                                                      OpStore %108 %324 
                                Uniform f32* %326 = OpAccessChain %17 %218 %115 
                                         f32 %327 = OpLoad %326 
                                         f32 %328 = OpFMul %327 %90 
                                         f32 %329 = OpFAdd %328 %170 
                                                      OpStore %325 %329 
                                         f32 %330 = OpLoad %108 
                                         f32 %331 = OpLoad %325 
                                         f32 %332 = OpExtInst %1 40 %330 %331 
                                Private f32* %333 = OpAccessChain %58 %20 
                                                      OpStore %333 %332 
                  read_only Texture3DSampled %338 = OpLoad %337 
                                       f32_4 %339 = OpLoad %58 
                                       f32_3 %340 = OpVectorShuffle %339 %339 0 2 3 
                                       f32_4 %341 = OpImageSampleImplicitLod %338 %340 
                                                      OpStore %58 %341 
                                       f32_4 %343 = OpLoad %58 
                                                      OpStore %342 %343 
                                                      OpBranch %248 
                                             %344 = OpLabel 
                                Private f32* %345 = OpAccessChain %342 %20 
                                                      OpStore %345 %238 
                                Private f32* %346 = OpAccessChain %342 %35 
                                                      OpStore %346 %238 
                                Private f32* %347 = OpAccessChain %342 %115 
                                                      OpStore %347 %238 
                                Private f32* %348 = OpAccessChain %342 %176 
                                                      OpStore %348 %238 
                                                      OpBranch %248 
                                             %248 = OpLabel 
                                       f32_4 %349 = OpLoad %342 
                              Uniform f32_4* %350 = OpAccessChain %17 %205 
                                       f32_4 %351 = OpLoad %350 
                                         f32 %352 = OpDot %349 %351 
                                Private f32* %353 = OpAccessChain %161 %20 
                                                      OpStore %353 %352 
                                Private f32* %354 = OpAccessChain %161 %20 
                                         f32 %355 = OpLoad %354 
                                         f32 %356 = OpExtInst %1 43 %355 %128 %238 
                                Private f32* %357 = OpAccessChain %161 %20 
                                                      OpStore %357 %356 
                                       f32_3 %358 = OpLoad %52 
                                       f32_3 %359 = OpLoad %52 
                                         f32 %360 = OpDot %358 %359 
                                                      OpStore %108 %360 
                  read_only Texture2DSampled %362 = OpLoad %361 
                                         f32 %363 = OpLoad %108 
                                       f32_2 %364 = OpCompositeConstruct %363 %363 
                                       f32_4 %365 = OpImageSampleImplicitLod %362 %364 
                                         f32 %366 = OpCompositeExtract %365 3 
                                                      OpStore %108 %366 
                                Private f32* %367 = OpAccessChain %161 %20 
                                         f32 %368 = OpLoad %367 
                                         f32 %369 = OpLoad %108 
                                         f32 %370 = OpFMul %368 %369 
                                                      OpStore %108 %370 
                                       f32_3 %371 = OpLoad %9 
                              Uniform f32_4* %373 = OpAccessChain %17 %372 
                                       f32_4 %374 = OpLoad %373 
                                       f32_3 %375 = OpVectorShuffle %374 %374 0 1 2 
                                       f32_3 %376 = OpFMul %371 %375 
                                                      OpStore %161 %376 
                                         f32 %379 = OpLoad %108 
                                       f32_3 %380 = OpCompositeConstruct %379 %379 %379 
                                       f32_3 %381 = OpLoad %161 
                                       f32_3 %382 = OpFMul %380 %381 
                                       f32_4 %383 = OpLoad %378 
                                       f32_4 %384 = OpVectorShuffle %383 %382 4 5 6 3 
                                                      OpStore %378 %384 
                                Uniform f32* %385 = OpAccessChain %17 %156 %176 
                                         f32 %386 = OpLoad %385 
                                 Output f32* %388 = OpAccessChain %378 %176 
                                                      OpStore %388 %386 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _CausticScale;
uniform 	vec4 _CausticColor;
uniform 	float _ReflPower;
uniform 	float _TimeScale;
uniform 	vec4 _LightCausticColor;
uniform 	float _LightCausticPower;
uniform 	float _GlobalReflectionsEnabled;
uniform  sampler2D _CausticTex;
uniform  sampler2D _ReflMapFromPixelator;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
vec2 u_xlat3;
float u_xlat4;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = _Time.x * _TimeScale;
    u_xlat3.x = vs_TEXCOORD1.y + vs_TEXCOORD1.x;
    u_xlat3.x = _Time.y * _TimeScale + u_xlat3.x;
    u_xlat1.x = sin(u_xlat3.x);
    u_xlat2.x = cos(u_xlat3.x);
    u_xlat2.x = u_xlat2.x * 0.111111112;
    u_xlat2.y = u_xlat1.x * 0.166666672;
    u_xlat3.xy = u_xlat2.xy + vs_TEXCOORD1.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(_CausticScale);
    u_xlat3.xy = u_xlat3.xy * vec2(0.200000003, 0.200000003);
    u_xlat0.xy = u_xlat0.xx * vec2(0.5, 0.125) + u_xlat3.xy;
    u_xlat10_0 = texture(_CausticTex, u_xlat0.xy);
    u_xlat9 = vs_TEXCOORD2.y * 500.0;
    u_xlat9 = _Time.z * 5.0 + u_xlat9;
    u_xlat9 = sin(u_xlat9);
    u_xlat1.x = u_xlat9 * 0.00150000001;
    u_xlat1.y = 0.0;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD2.xy;
    u_xlat10_1 = texture(_ReflMapFromPixelator, u_xlat1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_LightCausticPower);
    u_xlat0.xyz = u_xlat0.xyz * _LightCausticColor.xyz + _CausticColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.0500000007, 0.0500000007, 0.0500000007);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.75, 0.75, 0.75) + u_xlat10_1.xyz;
    u_xlat9 = u_xlat10_1.w * _ReflPower;
    u_xlat9 = u_xlat9 * _GlobalReflectionsEnabled;
    u_xlat0.xyz = (-u_xlat2.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz + u_xlat2.xyz;
    u_xlatb9 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb9){
        u_xlatb9 = unity_ProbeVolumeParams.y==1.0;
        u_xlat1.xyz = vs_TEXCOORD1.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.xxx + u_xlat1.xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD1.zzz + u_xlat1.xyz;
        u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : vs_TEXCOORD1.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat9 = u_xlat1.y * 0.25 + 0.75;
        u_xlat4 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat9, u_xlat4);
        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
    } else {
        u_xlat1.x = float(1.0);
        u_xlat1.y = float(1.0);
        u_xlat1.z = float(1.0);
        u_xlat1.w = float(1.0);
    //ENDIF
    }
    u_xlat9 = dot(u_xlat1, unity_OcclusionMaskSelector);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    SV_Target0.w = _CausticColor.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 166
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %92 %97 %127 %147 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %52 Location 52 
                                                      OpMemberDecorate %90 0 BuiltIn 90 
                                                      OpMemberDecorate %90 1 BuiltIn 90 
                                                      OpMemberDecorate %90 2 BuiltIn 90 
                                                      OpDecorate %90 Block 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate %127 Location 127 
                                                      OpDecorate %147 Location 147 
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
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %16 %17 %18 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4];}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                                              %50 = OpTypeVector %6 3 
                                              %51 = OpTypePointer Output %50 
                                Output f32_3* %52 = OpVariable Output 
                                          u32 %88 = OpConstant 1 
                                              %89 = OpTypeArray %6 %88 
                                              %90 = OpTypeStruct %7 %6 %89 
                                              %91 = OpTypePointer Output %90 
         Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                                              %94 = OpTypePointer Output %7 
                                              %96 = OpTypePointer Input %50 
                                 Input f32_3* %97 = OpVariable Input 
                                         u32 %103 = OpConstant 0 
                                             %104 = OpTypePointer Private %6 
                                         u32 %117 = OpConstant 2 
                                Private f32* %119 = OpVariable Private 
                               Output f32_3* %127 = OpVariable Output 
                                             %135 = OpTypePointer Uniform %6 
                                         f32 %142 = OpConstant 3.67402E-40 
                                       f32_3 %143 = OpConstantComposite %142 %142 %142 
                               Output f32_4* %147 = OpVariable Output 
                                             %148 = OpTypeVector %6 2 
                                             %160 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %53 = OpAccessChain %21 %23 %46 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %56 = OpLoad %11 
                                        f32_3 %57 = OpVectorShuffle %56 %56 3 3 3 
                                        f32_3 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                                      OpStore %52 %61 
                                        f32_4 %62 = OpLoad %44 
                                        f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %21 %46 %23 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %63 %65 
                                                      OpStore %9 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %46 %28 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %44 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %74 = OpAccessChain %21 %46 %36 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %44 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                               Uniform f32_4* %81 = OpAccessChain %21 %46 %46 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %44 
                                        f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %9 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %9 %87 
                                        f32_4 %93 = OpLoad %9 
                                Output f32_4* %95 = OpAccessChain %92 %28 
                                                      OpStore %95 %93 
                                        f32_3 %98 = OpLoad %97 
                               Uniform f32_4* %99 = OpAccessChain %21 %36 %28 
                                       f32_4 %100 = OpLoad %99 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                                         f32 %102 = OpDot %98 %101 
                                Private f32* %105 = OpAccessChain %44 %103 
                                                      OpStore %105 %102 
                                       f32_3 %106 = OpLoad %97 
                              Uniform f32_4* %107 = OpAccessChain %21 %36 %23 
                                       f32_4 %108 = OpLoad %107 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                         f32 %110 = OpDot %106 %109 
                                Private f32* %111 = OpAccessChain %44 %88 
                                                      OpStore %111 %110 
                                       f32_3 %112 = OpLoad %97 
                              Uniform f32_4* %113 = OpAccessChain %21 %36 %36 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                         f32 %116 = OpDot %112 %115 
                                Private f32* %118 = OpAccessChain %44 %117 
                                                      OpStore %118 %116 
                                       f32_4 %120 = OpLoad %44 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                                       f32_4 %122 = OpLoad %44 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                         f32 %124 = OpDot %121 %123 
                                                      OpStore %119 %124 
                                         f32 %125 = OpLoad %119 
                                         f32 %126 = OpExtInst %1 32 %125 
                                                      OpStore %119 %126 
                                         f32 %128 = OpLoad %119 
                                       f32_3 %129 = OpCompositeConstruct %128 %128 %128 
                                       f32_4 %130 = OpLoad %44 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_3 %132 = OpFMul %129 %131 
                                                      OpStore %127 %132 
                                Private f32* %133 = OpAccessChain %9 %88 
                                         f32 %134 = OpLoad %133 
                                Uniform f32* %136 = OpAccessChain %21 %28 %103 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFMul %134 %137 
                                Private f32* %139 = OpAccessChain %9 %88 
                                                      OpStore %139 %138 
                                       f32_4 %140 = OpLoad %9 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 3 1 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %44 
                                       f32_4 %146 = OpVectorShuffle %145 %144 4 1 5 6 
                                                      OpStore %44 %146 
                                       f32_4 %149 = OpLoad %9 
                                       f32_2 %150 = OpVectorShuffle %149 %149 2 3 
                                       f32_4 %151 = OpLoad %147 
                                       f32_4 %152 = OpVectorShuffle %151 %150 0 1 4 5 
                                                      OpStore %147 %152 
                                       f32_4 %153 = OpLoad %44 
                                       f32_2 %154 = OpVectorShuffle %153 %153 2 2 
                                       f32_4 %155 = OpLoad %44 
                                       f32_2 %156 = OpVectorShuffle %155 %155 0 3 
                                       f32_2 %157 = OpFAdd %154 %156 
                                       f32_4 %158 = OpLoad %147 
                                       f32_4 %159 = OpVectorShuffle %158 %157 4 5 2 3 
                                                      OpStore %147 %159 
                                 Output f32* %161 = OpAccessChain %92 %28 %88 
                                         f32 %162 = OpLoad %161 
                                         f32 %163 = OpFNegate %162 
                                 Output f32* %164 = OpAccessChain %92 %28 %88 
                                                      OpStore %164 %163 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 348
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %33 %108 %336 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 RelaxedPrecision 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpMemberDecorate %14 4 Offset 14 
                                                      OpMemberDecorate %14 5 Offset 14 
                                                      OpMemberDecorate %14 6 RelaxedPrecision 
                                                      OpMemberDecorate %14 6 Offset 14 
                                                      OpMemberDecorate %14 7 Offset 14 
                                                      OpMemberDecorate %14 8 Offset 14 
                                                      OpMemberDecorate %14 9 Offset 14 
                                                      OpMemberDecorate %14 10 Offset 14 
                                                      OpMemberDecorate %14 11 Offset 14 
                                                      OpMemberDecorate %14 12 Offset 14 
                                                      OpMemberDecorate %14 13 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate %33 Location 33 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpDecorate %100 RelaxedPrecision 
                                                      OpDecorate %100 DescriptorSet 100 
                                                      OpDecorate %100 Binding 100 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %108 Location 108 
                                                      OpDecorate %135 RelaxedPrecision 
                                                      OpDecorate %136 RelaxedPrecision 
                                                      OpDecorate %136 DescriptorSet 136 
                                                      OpDecorate %136 Binding 136 
                                                      OpDecorate %137 RelaxedPrecision 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %145 RelaxedPrecision 
                                                      OpDecorate %146 RelaxedPrecision 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %166 RelaxedPrecision 
                                                      OpDecorate %171 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %214 SpecId 214 
                                                      OpDecorate %307 DescriptorSet 307 
                                                      OpDecorate %307 Binding 307 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %321 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %325 RelaxedPrecision 
                                                      OpDecorate %326 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %332 RelaxedPrecision 
                                                      OpDecorate %333 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %336 Location 336 
                                                      OpDecorate %337 RelaxedPrecision 
                                                      OpDecorate %338 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 4 
                                              %11 = OpTypeInt 32 0 
                                          u32 %12 = OpConstant 4 
                                              %13 = OpTypeArray %10 %12 
                                              %14 = OpTypeStruct %10 %10 %10 %13 %7 %7 %10 %6 %10 %6 %6 %10 %6 %6 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32_4; f32; f32; f32_4; f32; f32;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 0 
                                          u32 %19 = OpConstant 0 
                                              %20 = OpTypePointer Uniform %6 
                                          i32 %23 = OpConstant 10 
                                              %27 = OpTypePointer Private %6 
                                              %29 = OpTypeVector %6 2 
                                              %30 = OpTypePointer Private %29 
                               Private f32_2* %31 = OpVariable Private 
                                              %32 = OpTypePointer Input %7 
                                 Input f32_3* %33 = OpVariable Input 
                                          u32 %34 = OpConstant 1 
                                              %35 = OpTypePointer Input %6 
                                              %51 = OpTypePointer Private %10 
                               Private f32_4* %52 = OpVariable Private 
                               Private f32_2* %57 = OpVariable Private 
                                          f32 %64 = OpConstant 3.67402E-40 
                                          f32 %69 = OpConstant 3.67402E-40 
                                          i32 %77 = OpConstant 7 
                                          f32 %83 = OpConstant 3.67402E-40 
                                        f32_2 %84 = OpConstantComposite %83 %83 
                                          f32 %88 = OpConstant 3.67402E-40 
                                          f32 %89 = OpConstant 3.67402E-40 
                                        f32_2 %90 = OpConstantComposite %88 %89 
                               Private f32_3* %96 = OpVariable Private 
                                              %97 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %98 = OpTypeSampledImage %97 
                                              %99 = OpTypePointer UniformConstant %98 
 UniformConstant read_only Texture2DSampled* %100 = OpVariable UniformConstant 
                                Private f32* %106 = OpVariable Private 
                                             %107 = OpTypePointer Input %10 
                                Input f32_4* %108 = OpVariable Input 
                                         f32 %111 = OpConstant 3.67402E-40 
                                         u32 %113 = OpConstant 2 
                                         f32 %116 = OpConstant 3.67402E-40 
                                         f32 %123 = OpConstant 3.67402E-40 
                                         f32 %126 = OpConstant 3.67402E-40 
                              Private f32_4* %135 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %136 = OpVariable UniformConstant 
                                         i32 %142 = OpConstant 12 
                                         i32 %148 = OpConstant 11 
                                             %149 = OpTypePointer Uniform %10 
                                         i32 %154 = OpConstant 8 
                              Private f32_3* %159 = OpVariable Private 
                                       f32_3 %161 = OpConstantComposite %88 %88 %88 
                                         f32 %163 = OpConstant 3.67402E-40 
                                       f32_3 %164 = OpConstantComposite %163 %163 %163 
                              Private f32_3* %166 = OpVariable Private 
                                         f32 %168 = OpConstant 3.67402E-40 
                                       f32_3 %169 = OpConstantComposite %168 %168 %168 
                                         u32 %174 = OpConstant 3 
                                         i32 %177 = OpConstant 9 
                                         i32 %184 = OpConstant 13 
                              Private f32_3* %189 = OpVariable Private 
                                             %200 = OpTypeBool 
                                             %201 = OpTypePointer Private %200 
                               Private bool* %202 = OpVariable Private 
                                         i32 %203 = OpConstant 2 
                                         f32 %206 = OpConstant 3.67402E-40 
                                        bool %208 = OpConstantFalse 
                                        bool %214 = OpSpecConstantFalse 
                                         i32 %222 = OpConstant 3 
                                         i32 %223 = OpConstant 1 
                                             %260 = OpTypePointer Function %7 
                                         i32 %274 = OpConstant 5 
                                             %275 = OpTypePointer Uniform %7 
                                         i32 %284 = OpConstant 4 
                                         f32 %292 = OpConstant 3.67402E-40 
                                Private f32* %295 = OpVariable Private 
                                             %304 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %305 = OpTypeSampledImage %304 
                                             %306 = OpTypePointer UniformConstant %305 
 UniformConstant read_only Texture3DSampled* %307 = OpVariable UniformConstant 
                              Private f32_4* %312 = OpVariable Private 
                              Private f32_3* %328 = OpVariable Private 
                                         i32 %330 = OpConstant 6 
                                             %335 = OpTypePointer Output %10 
                               Output f32_4* %336 = OpVariable Output 
                                             %345 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %261 = OpVariable Function 
                                 Uniform f32* %21 = OpAccessChain %16 %18 %19 
                                          f32 %22 = OpLoad %21 
                                 Uniform f32* %24 = OpAccessChain %16 %23 
                                          f32 %25 = OpLoad %24 
                                          f32 %26 = OpFMul %22 %25 
                                 Private f32* %28 = OpAccessChain %9 %19 
                                                      OpStore %28 %26 
                                   Input f32* %36 = OpAccessChain %33 %34 
                                          f32 %37 = OpLoad %36 
                                   Input f32* %38 = OpAccessChain %33 %19 
                                          f32 %39 = OpLoad %38 
                                          f32 %40 = OpFAdd %37 %39 
                                 Private f32* %41 = OpAccessChain %31 %19 
                                                      OpStore %41 %40 
                                 Uniform f32* %42 = OpAccessChain %16 %18 %34 
                                          f32 %43 = OpLoad %42 
                                 Uniform f32* %44 = OpAccessChain %16 %23 
                                          f32 %45 = OpLoad %44 
                                          f32 %46 = OpFMul %43 %45 
                                 Private f32* %47 = OpAccessChain %31 %19 
                                          f32 %48 = OpLoad %47 
                                          f32 %49 = OpFAdd %46 %48 
                                 Private f32* %50 = OpAccessChain %31 %19 
                                                      OpStore %50 %49 
                                 Private f32* %53 = OpAccessChain %31 %19 
                                          f32 %54 = OpLoad %53 
                                          f32 %55 = OpExtInst %1 13 %54 
                                 Private f32* %56 = OpAccessChain %52 %19 
                                                      OpStore %56 %55 
                                 Private f32* %58 = OpAccessChain %31 %19 
                                          f32 %59 = OpLoad %58 
                                          f32 %60 = OpExtInst %1 14 %59 
                                 Private f32* %61 = OpAccessChain %57 %19 
                                                      OpStore %61 %60 
                                 Private f32* %62 = OpAccessChain %57 %19 
                                          f32 %63 = OpLoad %62 
                                          f32 %65 = OpFMul %63 %64 
                                 Private f32* %66 = OpAccessChain %57 %19 
                                                      OpStore %66 %65 
                                 Private f32* %67 = OpAccessChain %52 %19 
                                          f32 %68 = OpLoad %67 
                                          f32 %70 = OpFMul %68 %69 
                                 Private f32* %71 = OpAccessChain %57 %34 
                                                      OpStore %71 %70 
                                        f32_2 %72 = OpLoad %57 
                                        f32_3 %73 = OpLoad %33 
                                        f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                                        f32_2 %75 = OpFAdd %72 %74 
                                                      OpStore %31 %75 
                                        f32_2 %76 = OpLoad %31 
                                 Uniform f32* %78 = OpAccessChain %16 %77 
                                          f32 %79 = OpLoad %78 
                                        f32_2 %80 = OpCompositeConstruct %79 %79 
                                        f32_2 %81 = OpFMul %76 %80 
                                                      OpStore %31 %81 
                                        f32_2 %82 = OpLoad %31 
                                        f32_2 %85 = OpFMul %82 %84 
                                                      OpStore %31 %85 
                                        f32_3 %86 = OpLoad %9 
                                        f32_2 %87 = OpVectorShuffle %86 %86 0 0 
                                        f32_2 %91 = OpFMul %87 %90 
                                        f32_2 %92 = OpLoad %31 
                                        f32_2 %93 = OpFAdd %91 %92 
                                        f32_3 %94 = OpLoad %9 
                                        f32_3 %95 = OpVectorShuffle %94 %93 3 4 2 
                                                      OpStore %9 %95 
                  read_only Texture2DSampled %101 = OpLoad %100 
                                       f32_3 %102 = OpLoad %9 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_4 %104 = OpImageSampleImplicitLod %101 %103 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                                                      OpStore %96 %105 
                                  Input f32* %109 = OpAccessChain %108 %34 
                                         f32 %110 = OpLoad %109 
                                         f32 %112 = OpFMul %110 %111 
                                                      OpStore %106 %112 
                                Uniform f32* %114 = OpAccessChain %16 %18 %113 
                                         f32 %115 = OpLoad %114 
                                         f32 %117 = OpFMul %115 %116 
                                         f32 %118 = OpLoad %106 
                                         f32 %119 = OpFAdd %117 %118 
                                                      OpStore %106 %119 
                                         f32 %120 = OpLoad %106 
                                         f32 %121 = OpExtInst %1 13 %120 
                                                      OpStore %106 %121 
                                         f32 %122 = OpLoad %106 
                                         f32 %124 = OpFMul %122 %123 
                                Private f32* %125 = OpAccessChain %52 %19 
                                                      OpStore %125 %124 
                                Private f32* %127 = OpAccessChain %52 %34 
                                                      OpStore %127 %126 
                                       f32_4 %128 = OpLoad %52 
                                       f32_2 %129 = OpVectorShuffle %128 %128 0 1 
                                       f32_4 %130 = OpLoad %108 
                                       f32_2 %131 = OpVectorShuffle %130 %130 0 1 
                                       f32_2 %132 = OpFAdd %129 %131 
                                       f32_4 %133 = OpLoad %52 
                                       f32_4 %134 = OpVectorShuffle %133 %132 4 5 2 3 
                                                      OpStore %52 %134 
                  read_only Texture2DSampled %137 = OpLoad %136 
                                       f32_4 %138 = OpLoad %52 
                                       f32_2 %139 = OpVectorShuffle %138 %138 0 1 
                                       f32_4 %140 = OpImageSampleImplicitLod %137 %139 
                                                      OpStore %135 %140 
                                       f32_3 %141 = OpLoad %96 
                                Uniform f32* %143 = OpAccessChain %16 %142 
                                         f32 %144 = OpLoad %143 
                                       f32_3 %145 = OpCompositeConstruct %144 %144 %144 
                                       f32_3 %146 = OpFMul %141 %145 
                                                      OpStore %9 %146 
                                       f32_3 %147 = OpLoad %9 
                              Uniform f32_4* %150 = OpAccessChain %16 %148 
                                       f32_4 %151 = OpLoad %150 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                                       f32_3 %153 = OpFMul %147 %152 
                              Uniform f32_4* %155 = OpAccessChain %16 %154 
                                       f32_4 %156 = OpLoad %155 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                       f32_3 %158 = OpFAdd %153 %157 
                                                      OpStore %9 %158 
                                       f32_3 %160 = OpLoad %9 
                                       f32_3 %162 = OpFMul %160 %161 
                                       f32_3 %165 = OpFAdd %162 %164 
                                                      OpStore %159 %165 
                                       f32_3 %167 = OpLoad %9 
                                       f32_3 %170 = OpFMul %167 %169 
                                       f32_4 %171 = OpLoad %135 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                                       f32_3 %173 = OpFAdd %170 %172 
                                                      OpStore %166 %173 
                                Private f32* %175 = OpAccessChain %135 %174 
                                         f32 %176 = OpLoad %175 
                                Uniform f32* %178 = OpAccessChain %16 %177 
                                         f32 %179 = OpLoad %178 
                                         f32 %180 = OpFMul %176 %179 
                                Private f32* %181 = OpAccessChain %9 %19 
                                                      OpStore %181 %180 
                                Private f32* %182 = OpAccessChain %9 %19 
                                         f32 %183 = OpLoad %182 
                                Uniform f32* %185 = OpAccessChain %16 %184 
                                         f32 %186 = OpLoad %185 
                                         f32 %187 = OpFMul %183 %186 
                                Private f32* %188 = OpAccessChain %9 %19 
                                                      OpStore %188 %187 
                                       f32_3 %190 = OpLoad %159 
                                       f32_3 %191 = OpFNegate %190 
                                       f32_3 %192 = OpLoad %166 
                                       f32_3 %193 = OpFAdd %191 %192 
                                                      OpStore %189 %193 
                                       f32_3 %194 = OpLoad %9 
                                       f32_3 %195 = OpVectorShuffle %194 %194 0 0 0 
                                       f32_3 %196 = OpLoad %189 
                                       f32_3 %197 = OpFMul %195 %196 
                                       f32_3 %198 = OpLoad %159 
                                       f32_3 %199 = OpFAdd %197 %198 
                                                      OpStore %9 %199 
                                Uniform f32* %204 = OpAccessChain %16 %203 %19 
                                         f32 %205 = OpLoad %204 
                                        bool %207 = OpFOrdEqual %205 %206 
                                                      OpStore %202 %207 
                                                      OpSelectionMerge %210 None 
                                                      OpBranchConditional %208 %209 %210 
                                             %209 = OpLabel 
                                        bool %211 = OpLoad %202 
                                                      OpSelectionMerge %213 None 
                                                      OpBranchConditional %211 %212 %213 
                                             %212 = OpLabel 
                                                      OpBranch %213 
                                             %213 = OpLabel 
                                                      OpBranch %210 
                                             %210 = OpLabel 
                                                      OpSelectionMerge %216 None 
                                                      OpBranchConditional %214 %215 %314 
                                             %215 = OpLabel 
                                Uniform f32* %217 = OpAccessChain %16 %203 %34 
                                         f32 %218 = OpLoad %217 
                                        bool %219 = OpFOrdEqual %218 %206 
                                                      OpStore %202 %219 
                                       f32_3 %220 = OpLoad %33 
                                       f32_3 %221 = OpVectorShuffle %220 %220 1 1 1 
                              Uniform f32_4* %224 = OpAccessChain %16 %222 %223 
                                       f32_4 %225 = OpLoad %224 
                                       f32_3 %226 = OpVectorShuffle %225 %225 0 1 2 
                                       f32_3 %227 = OpFMul %221 %226 
                                       f32_4 %228 = OpLoad %52 
                                       f32_4 %229 = OpVectorShuffle %228 %227 4 5 6 3 
                                                      OpStore %52 %229 
                              Uniform f32_4* %230 = OpAccessChain %16 %222 %18 
                                       f32_4 %231 = OpLoad %230 
                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
                                       f32_3 %233 = OpLoad %33 
                                       f32_3 %234 = OpVectorShuffle %233 %233 0 0 0 
                                       f32_3 %235 = OpFMul %232 %234 
                                       f32_4 %236 = OpLoad %52 
                                       f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
                                       f32_3 %238 = OpFAdd %235 %237 
                                       f32_4 %239 = OpLoad %52 
                                       f32_4 %240 = OpVectorShuffle %239 %238 4 5 6 3 
                                                      OpStore %52 %240 
                              Uniform f32_4* %241 = OpAccessChain %16 %222 %203 
                                       f32_4 %242 = OpLoad %241 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 1 2 
                                       f32_3 %244 = OpLoad %33 
                                       f32_3 %245 = OpVectorShuffle %244 %244 2 2 2 
                                       f32_3 %246 = OpFMul %243 %245 
                                       f32_4 %247 = OpLoad %52 
                                       f32_3 %248 = OpVectorShuffle %247 %247 0 1 2 
                                       f32_3 %249 = OpFAdd %246 %248 
                                       f32_4 %250 = OpLoad %52 
                                       f32_4 %251 = OpVectorShuffle %250 %249 4 5 6 3 
                                                      OpStore %52 %251 
                                       f32_4 %252 = OpLoad %52 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                              Uniform f32_4* %254 = OpAccessChain %16 %222 %222 
                                       f32_4 %255 = OpLoad %254 
                                       f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
                                       f32_3 %257 = OpFAdd %253 %256 
                                       f32_4 %258 = OpLoad %52 
                                       f32_4 %259 = OpVectorShuffle %258 %257 4 5 6 3 
                                                      OpStore %52 %259 
                                        bool %262 = OpLoad %202 
                                                      OpSelectionMerge %264 None 
                                                      OpBranchConditional %262 %263 %267 
                                             %263 = OpLabel 
                                       f32_4 %265 = OpLoad %52 
                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
                                                      OpStore %261 %266 
                                                      OpBranch %264 
                                             %267 = OpLabel 
                                       f32_3 %268 = OpLoad %33 
                                                      OpStore %261 %268 
                                                      OpBranch %264 
                                             %264 = OpLabel 
                                       f32_3 %269 = OpLoad %261 
                                       f32_4 %270 = OpLoad %52 
                                       f32_4 %271 = OpVectorShuffle %270 %269 4 5 6 3 
                                                      OpStore %52 %271 
                                       f32_4 %272 = OpLoad %52 
                                       f32_3 %273 = OpVectorShuffle %272 %272 0 1 2 
                              Uniform f32_3* %276 = OpAccessChain %16 %274 
                                       f32_3 %277 = OpLoad %276 
                                       f32_3 %278 = OpFNegate %277 
                                       f32_3 %279 = OpFAdd %273 %278 
                                       f32_4 %280 = OpLoad %52 
                                       f32_4 %281 = OpVectorShuffle %280 %279 4 5 6 3 
                                                      OpStore %52 %281 
                                       f32_4 %282 = OpLoad %52 
                                       f32_3 %283 = OpVectorShuffle %282 %282 0 1 2 
                              Uniform f32_3* %285 = OpAccessChain %16 %284 
                                       f32_3 %286 = OpLoad %285 
                                       f32_3 %287 = OpFMul %283 %286 
                                       f32_4 %288 = OpLoad %52 
                                       f32_4 %289 = OpVectorShuffle %288 %287 0 4 5 6 
                                                      OpStore %52 %289 
                                Private f32* %290 = OpAccessChain %52 %34 
                                         f32 %291 = OpLoad %290 
                                         f32 %293 = OpFMul %291 %292 
                                         f32 %294 = OpFAdd %293 %168 
                                                      OpStore %106 %294 
                                Uniform f32* %296 = OpAccessChain %16 %203 %113 
                                         f32 %297 = OpLoad %296 
                                         f32 %298 = OpFMul %297 %88 
                                         f32 %299 = OpFAdd %298 %168 
                                                      OpStore %295 %299 
                                         f32 %300 = OpLoad %106 
                                         f32 %301 = OpLoad %295 
                                         f32 %302 = OpExtInst %1 40 %300 %301 
                                Private f32* %303 = OpAccessChain %52 %19 
                                                      OpStore %303 %302 
                  read_only Texture3DSampled %308 = OpLoad %307 
                                       f32_4 %309 = OpLoad %52 
                                       f32_3 %310 = OpVectorShuffle %309 %309 0 2 3 
                                       f32_4 %311 = OpImageSampleImplicitLod %308 %310 
                                                      OpStore %52 %311 
                                       f32_4 %313 = OpLoad %52 
                                                      OpStore %312 %313 
                                                      OpBranch %216 
                                             %314 = OpLabel 
                                Private f32* %315 = OpAccessChain %312 %19 
                                                      OpStore %315 %206 
                                Private f32* %316 = OpAccessChain %312 %34 
                                                      OpStore %316 %206 
                                Private f32* %317 = OpAccessChain %312 %113 
                                                      OpStore %317 %206 
                                Private f32* %318 = OpAccessChain %312 %174 
                                                      OpStore %318 %206 
                                                      OpBranch %216 
                                             %216 = OpLabel 
                                       f32_4 %319 = OpLoad %312 
                              Uniform f32_4* %320 = OpAccessChain %16 %223 
                                       f32_4 %321 = OpLoad %320 
                                         f32 %322 = OpDot %319 %321 
                                Private f32* %323 = OpAccessChain %159 %19 
                                                      OpStore %323 %322 
                                Private f32* %324 = OpAccessChain %159 %19 
                                         f32 %325 = OpLoad %324 
                                         f32 %326 = OpExtInst %1 43 %325 %126 %206 
                                Private f32* %327 = OpAccessChain %159 %19 
                                                      OpStore %327 %326 
                                       f32_3 %329 = OpLoad %9 
                              Uniform f32_4* %331 = OpAccessChain %16 %330 
                                       f32_4 %332 = OpLoad %331 
                                       f32_3 %333 = OpVectorShuffle %332 %332 0 1 2 
                                       f32_3 %334 = OpFMul %329 %333 
                                                      OpStore %328 %334 
                                       f32_3 %337 = OpLoad %159 
                                       f32_3 %338 = OpVectorShuffle %337 %337 0 0 0 
                                       f32_3 %339 = OpLoad %328 
                                       f32_3 %340 = OpFMul %338 %339 
                                       f32_4 %341 = OpLoad %336 
                                       f32_4 %342 = OpVectorShuffle %341 %340 4 5 6 3 
                                                      OpStore %336 %342 
                                Uniform f32* %343 = OpAccessChain %16 %154 %174 
                                         f32 %344 = OpLoad %343 
                                 Output f32* %346 = OpAccessChain %336 %174 
                                                      OpStore %346 %344 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _CausticScale;
uniform 	vec4 _CausticColor;
uniform 	float _ReflPower;
uniform 	float _TimeScale;
uniform 	vec4 _LightCausticColor;
uniform 	float _LightCausticPower;
uniform 	float _GlobalReflectionsEnabled;
uniform  sampler2D _CausticTex;
uniform  sampler2D _ReflMapFromPixelator;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat10_2;
bool u_xlatb2;
vec4 u_xlat10_3;
vec2 u_xlat4;
vec2 u_xlat6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.x = _Time.x * _TimeScale;
    u_xlat4.x = vs_TEXCOORD1.y + vs_TEXCOORD1.x;
    u_xlat4.x = _Time.y * _TimeScale + u_xlat4.x;
    u_xlat1.x = sin(u_xlat4.x);
    u_xlat2.x = cos(u_xlat4.x);
    u_xlat2.x = u_xlat2.x * 0.111111112;
    u_xlat2.y = u_xlat1.x * 0.166666672;
    u_xlat4.xy = u_xlat2.xy + vs_TEXCOORD1.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(_CausticScale);
    u_xlat4.xy = u_xlat4.xy * vec2(0.200000003, 0.200000003);
    u_xlat0.xy = u_xlat0.xx * vec2(0.5, 0.125) + u_xlat4.xy;
    u_xlat10_0 = texture(_CausticTex, u_xlat0.xy);
    u_xlat12 = vs_TEXCOORD2.y * 500.0;
    u_xlat12 = _Time.z * 5.0 + u_xlat12;
    u_xlat12 = sin(u_xlat12);
    u_xlat1.x = u_xlat12 * 0.00150000001;
    u_xlat1.y = 0.0;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD2.xy;
    u_xlat10_1 = texture(_ReflMapFromPixelator, u_xlat1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_LightCausticPower);
    u_xlat0.xyz = u_xlat0.xyz * _LightCausticColor.xyz + _CausticColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.0500000007, 0.0500000007, 0.0500000007);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.75, 0.75, 0.75) + u_xlat10_1.xyz;
    u_xlat12 = u_xlat10_1.w * _ReflPower;
    u_xlat12 = u_xlat12 * _GlobalReflectionsEnabled;
    u_xlat0.xyz = (-u_xlat2.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD1.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD1.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlatb12 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb12){
        u_xlatb12 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD1.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD1.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb12)) ? u_xlat2.xyz : vs_TEXCOORD1.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat12 = u_xlat2.y * 0.25 + 0.75;
        u_xlat6.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat12, u_xlat6.x);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat12 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlatb2 = 0.0<u_xlat1.z;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat6.xy = u_xlat1.xy / u_xlat1.ww;
    u_xlat6.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat10_3 = texture(_LightTexture0, u_xlat6.xy);
    u_xlat13 = u_xlat2.x * u_xlat10_3.w;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10_2 = texture(_LightTextureB0, u_xlat1.xx);
    u_xlat1.x = u_xlat13 * u_xlat10_2.w;
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    SV_Target0.w = _CausticColor.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "SPOT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 166
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %92 %97 %127 %147 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %52 Location 52 
                                                      OpMemberDecorate %90 0 BuiltIn 90 
                                                      OpMemberDecorate %90 1 BuiltIn 90 
                                                      OpMemberDecorate %90 2 BuiltIn 90 
                                                      OpDecorate %90 Block 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate %127 Location 127 
                                                      OpDecorate %147 Location 147 
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
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %16 %17 %18 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4];}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                                              %50 = OpTypeVector %6 3 
                                              %51 = OpTypePointer Output %50 
                                Output f32_3* %52 = OpVariable Output 
                                          u32 %88 = OpConstant 1 
                                              %89 = OpTypeArray %6 %88 
                                              %90 = OpTypeStruct %7 %6 %89 
                                              %91 = OpTypePointer Output %90 
         Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                                              %94 = OpTypePointer Output %7 
                                              %96 = OpTypePointer Input %50 
                                 Input f32_3* %97 = OpVariable Input 
                                         u32 %103 = OpConstant 0 
                                             %104 = OpTypePointer Private %6 
                                         u32 %117 = OpConstant 2 
                                Private f32* %119 = OpVariable Private 
                               Output f32_3* %127 = OpVariable Output 
                                             %135 = OpTypePointer Uniform %6 
                                         f32 %142 = OpConstant 3.67402E-40 
                                       f32_3 %143 = OpConstantComposite %142 %142 %142 
                               Output f32_4* %147 = OpVariable Output 
                                             %148 = OpTypeVector %6 2 
                                             %160 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %53 = OpAccessChain %21 %23 %46 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %56 = OpLoad %11 
                                        f32_3 %57 = OpVectorShuffle %56 %56 3 3 3 
                                        f32_3 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                                      OpStore %52 %61 
                                        f32_4 %62 = OpLoad %44 
                                        f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %21 %46 %23 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %63 %65 
                                                      OpStore %9 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %46 %28 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %44 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %74 = OpAccessChain %21 %46 %36 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %44 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                               Uniform f32_4* %81 = OpAccessChain %21 %46 %46 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %44 
                                        f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %9 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %9 %87 
                                        f32_4 %93 = OpLoad %9 
                                Output f32_4* %95 = OpAccessChain %92 %28 
                                                      OpStore %95 %93 
                                        f32_3 %98 = OpLoad %97 
                               Uniform f32_4* %99 = OpAccessChain %21 %36 %28 
                                       f32_4 %100 = OpLoad %99 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                                         f32 %102 = OpDot %98 %101 
                                Private f32* %105 = OpAccessChain %44 %103 
                                                      OpStore %105 %102 
                                       f32_3 %106 = OpLoad %97 
                              Uniform f32_4* %107 = OpAccessChain %21 %36 %23 
                                       f32_4 %108 = OpLoad %107 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                         f32 %110 = OpDot %106 %109 
                                Private f32* %111 = OpAccessChain %44 %88 
                                                      OpStore %111 %110 
                                       f32_3 %112 = OpLoad %97 
                              Uniform f32_4* %113 = OpAccessChain %21 %36 %36 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                         f32 %116 = OpDot %112 %115 
                                Private f32* %118 = OpAccessChain %44 %117 
                                                      OpStore %118 %116 
                                       f32_4 %120 = OpLoad %44 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                                       f32_4 %122 = OpLoad %44 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                         f32 %124 = OpDot %121 %123 
                                                      OpStore %119 %124 
                                         f32 %125 = OpLoad %119 
                                         f32 %126 = OpExtInst %1 32 %125 
                                                      OpStore %119 %126 
                                         f32 %128 = OpLoad %119 
                                       f32_3 %129 = OpCompositeConstruct %128 %128 %128 
                                       f32_4 %130 = OpLoad %44 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_3 %132 = OpFMul %129 %131 
                                                      OpStore %127 %132 
                                Private f32* %133 = OpAccessChain %9 %88 
                                         f32 %134 = OpLoad %133 
                                Uniform f32* %136 = OpAccessChain %21 %28 %103 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFMul %134 %137 
                                Private f32* %139 = OpAccessChain %9 %88 
                                                      OpStore %139 %138 
                                       f32_4 %140 = OpLoad %9 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 3 1 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %44 
                                       f32_4 %146 = OpVectorShuffle %145 %144 4 1 5 6 
                                                      OpStore %44 %146 
                                       f32_4 %149 = OpLoad %9 
                                       f32_2 %150 = OpVectorShuffle %149 %149 2 3 
                                       f32_4 %151 = OpLoad %147 
                                       f32_4 %152 = OpVectorShuffle %151 %150 0 1 4 5 
                                                      OpStore %147 %152 
                                       f32_4 %153 = OpLoad %44 
                                       f32_2 %154 = OpVectorShuffle %153 %153 2 2 
                                       f32_4 %155 = OpLoad %44 
                                       f32_2 %156 = OpVectorShuffle %155 %155 0 3 
                                       f32_2 %157 = OpFAdd %154 %156 
                                       f32_4 %158 = OpLoad %147 
                                       f32_4 %159 = OpVectorShuffle %158 %157 4 5 2 3 
                                                      OpStore %147 %159 
                                 Output f32* %161 = OpAccessChain %92 %28 %88 
                                         f32 %162 = OpLoad %161 
                                         f32 %163 = OpFNegate %162 
                                 Output f32* %164 = OpAccessChain %92 %28 %88 
                                                      OpStore %164 %163 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 426
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %34 %110 %414 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 RelaxedPrecision 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpMemberDecorate %15 6 RelaxedPrecision 
                                                      OpMemberDecorate %15 6 Offset 15 
                                                      OpMemberDecorate %15 7 Offset 15 
                                                      OpMemberDecorate %15 8 Offset 15 
                                                      OpMemberDecorate %15 9 Offset 15 
                                                      OpMemberDecorate %15 10 Offset 15 
                                                      OpMemberDecorate %15 11 Offset 15 
                                                      OpMemberDecorate %15 12 Offset 15 
                                                      OpMemberDecorate %15 13 Offset 15 
                                                      OpMemberDecorate %15 14 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %34 Location 34 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %102 DescriptorSet 102 
                                                      OpDecorate %102 Binding 102 
                                                      OpDecorate %103 RelaxedPrecision 
                                                      OpDecorate %107 RelaxedPrecision 
                                                      OpDecorate %110 Location 110 
                                                      OpDecorate %137 RelaxedPrecision 
                                                      OpDecorate %138 RelaxedPrecision 
                                                      OpDecorate %138 DescriptorSet 138 
                                                      OpDecorate %138 Binding 138 
                                                      OpDecorate %139 RelaxedPrecision 
                                                      OpDecorate %143 RelaxedPrecision 
                                                      OpDecorate %147 RelaxedPrecision 
                                                      OpDecorate %148 RelaxedPrecision 
                                                      OpDecorate %161 RelaxedPrecision 
                                                      OpDecorate %168 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %242 SpecId 242 
                                                      OpDecorate %333 DescriptorSet 333 
                                                      OpDecorate %333 Binding 333 
                                                      OpDecorate %338 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %348 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %352 RelaxedPrecision 
                                                      OpDecorate %357 RelaxedPrecision 
                                                      OpDecorate %364 RelaxedPrecision 
                                                      OpDecorate %375 DescriptorSet 375 
                                                      OpDecorate %375 Binding 375 
                                                      OpDecorate %382 RelaxedPrecision 
                                                      OpDecorate %390 DescriptorSet 390 
                                                      OpDecorate %390 Binding 390 
                                                      OpDecorate %398 RelaxedPrecision 
                                                      OpDecorate %402 RelaxedPrecision 
                                                      OpDecorate %404 RelaxedPrecision 
                                                      OpDecorate %405 RelaxedPrecision 
                                                      OpDecorate %410 RelaxedPrecision 
                                                      OpDecorate %411 RelaxedPrecision 
                                                      OpDecorate %414 RelaxedPrecision 
                                                      OpDecorate %414 Location 414 
                                                      OpDecorate %415 RelaxedPrecision 
                                                      OpDecorate %416 RelaxedPrecision 
                                                      OpDecorate %417 RelaxedPrecision 
                                                      OpDecorate %418 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 4 
                                              %11 = OpTypeInt 32 0 
                                          u32 %12 = OpConstant 4 
                                              %13 = OpTypeArray %10 %12 
                                              %14 = OpTypeArray %10 %12 
                                              %15 = OpTypeStruct %10 %10 %10 %13 %7 %7 %10 %14 %6 %10 %6 %6 %10 %6 %6 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32_4; f32; f32; f32_4; f32; f32;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 0 
                                          u32 %20 = OpConstant 0 
                                              %21 = OpTypePointer Uniform %6 
                                          i32 %24 = OpConstant 11 
                                              %28 = OpTypePointer Private %6 
                                              %30 = OpTypeVector %6 2 
                                              %31 = OpTypePointer Private %30 
                               Private f32_2* %32 = OpVariable Private 
                                              %33 = OpTypePointer Input %7 
                                 Input f32_3* %34 = OpVariable Input 
                                          u32 %35 = OpConstant 1 
                                              %36 = OpTypePointer Input %6 
                                              %52 = OpTypePointer Private %10 
                               Private f32_4* %53 = OpVariable Private 
                               Private f32_4* %58 = OpVariable Private 
                                          f32 %65 = OpConstant 3.67402E-40 
                                          f32 %70 = OpConstant 3.67402E-40 
                                          i32 %79 = OpConstant 8 
                                          f32 %85 = OpConstant 3.67402E-40 
                                        f32_2 %86 = OpConstantComposite %85 %85 
                                          f32 %90 = OpConstant 3.67402E-40 
                                          f32 %91 = OpConstant 3.67402E-40 
                                        f32_2 %92 = OpConstantComposite %90 %91 
                               Private f32_3* %98 = OpVariable Private 
                                              %99 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %100 = OpTypeSampledImage %99 
                                             %101 = OpTypePointer UniformConstant %100 
 UniformConstant read_only Texture2DSampled* %102 = OpVariable UniformConstant 
                                Private f32* %108 = OpVariable Private 
                                             %109 = OpTypePointer Input %10 
                                Input f32_4* %110 = OpVariable Input 
                                         f32 %113 = OpConstant 3.67402E-40 
                                         u32 %115 = OpConstant 2 
                                         f32 %118 = OpConstant 3.67402E-40 
                                         f32 %125 = OpConstant 3.67402E-40 
                                         f32 %128 = OpConstant 3.67402E-40 
                              Private f32_4* %137 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %138 = OpVariable UniformConstant 
                                         i32 %144 = OpConstant 13 
                                         i32 %150 = OpConstant 12 
                                             %151 = OpTypePointer Uniform %10 
                                         i32 %156 = OpConstant 9 
                              Private f32_3* %161 = OpVariable Private 
                                       f32_3 %163 = OpConstantComposite %90 %90 %90 
                                         f32 %165 = OpConstant 3.67402E-40 
                                       f32_3 %166 = OpConstantComposite %165 %165 %165 
                              Private f32_3* %168 = OpVariable Private 
                                         f32 %170 = OpConstant 3.67402E-40 
                                       f32_3 %171 = OpConstantComposite %170 %170 %170 
                                         u32 %176 = OpConstant 3 
                                         i32 %179 = OpConstant 10 
                                         i32 %186 = OpConstant 14 
                              Private f32_3* %191 = OpVariable Private 
                                         i32 %204 = OpConstant 7 
                                         i32 %205 = OpConstant 1 
                                         i32 %216 = OpConstant 2 
                                         i32 %225 = OpConstant 3 
                                             %229 = OpTypeBool 
                                             %230 = OpTypePointer Private %229 
                               Private bool* %231 = OpVariable Private 
                                         f32 %234 = OpConstant 3.67402E-40 
                                        bool %236 = OpConstantFalse 
                                        bool %242 = OpSpecConstantFalse 
                                             %286 = OpTypePointer Function %7 
                                         i32 %300 = OpConstant 5 
                                             %301 = OpTypePointer Uniform %7 
                                         i32 %310 = OpConstant 4 
                                         f32 %318 = OpConstant 3.67402E-40 
                                Private f32* %321 = OpVariable Private 
                                             %330 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %331 = OpTypeSampledImage %330 
                                             %332 = OpTypePointer UniformConstant %331 
 UniformConstant read_only Texture3DSampled* %333 = OpVariable UniformConstant 
                              Private f32_4* %338 = OpVariable Private 
                              Private f32_3* %357 = OpVariable Private 
                                             %358 = OpTypePointer Function %6 
                              Private f32_2* %366 = OpVariable Private 
                                       f32_2 %373 = OpConstantComposite %90 %90 
 UniformConstant read_only Texture2DSampled* %375 = OpVariable UniformConstant 
 UniformConstant read_only Texture2DSampled* %390 = OpVariable UniformConstant 
                                         i32 %408 = OpConstant 6 
                                             %413 = OpTypePointer Output %10 
                               Output f32_4* %414 = OpVariable Output 
                                             %423 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %287 = OpVariable Function 
                               Function f32* %359 = OpVariable Function 
                                 Uniform f32* %22 = OpAccessChain %17 %19 %20 
                                          f32 %23 = OpLoad %22 
                                 Uniform f32* %25 = OpAccessChain %17 %24 
                                          f32 %26 = OpLoad %25 
                                          f32 %27 = OpFMul %23 %26 
                                 Private f32* %29 = OpAccessChain %9 %20 
                                                      OpStore %29 %27 
                                   Input f32* %37 = OpAccessChain %34 %35 
                                          f32 %38 = OpLoad %37 
                                   Input f32* %39 = OpAccessChain %34 %20 
                                          f32 %40 = OpLoad %39 
                                          f32 %41 = OpFAdd %38 %40 
                                 Private f32* %42 = OpAccessChain %32 %20 
                                                      OpStore %42 %41 
                                 Uniform f32* %43 = OpAccessChain %17 %19 %35 
                                          f32 %44 = OpLoad %43 
                                 Uniform f32* %45 = OpAccessChain %17 %24 
                                          f32 %46 = OpLoad %45 
                                          f32 %47 = OpFMul %44 %46 
                                 Private f32* %48 = OpAccessChain %32 %20 
                                          f32 %49 = OpLoad %48 
                                          f32 %50 = OpFAdd %47 %49 
                                 Private f32* %51 = OpAccessChain %32 %20 
                                                      OpStore %51 %50 
                                 Private f32* %54 = OpAccessChain %32 %20 
                                          f32 %55 = OpLoad %54 
                                          f32 %56 = OpExtInst %1 13 %55 
                                 Private f32* %57 = OpAccessChain %53 %20 
                                                      OpStore %57 %56 
                                 Private f32* %59 = OpAccessChain %32 %20 
                                          f32 %60 = OpLoad %59 
                                          f32 %61 = OpExtInst %1 14 %60 
                                 Private f32* %62 = OpAccessChain %58 %20 
                                                      OpStore %62 %61 
                                 Private f32* %63 = OpAccessChain %58 %20 
                                          f32 %64 = OpLoad %63 
                                          f32 %66 = OpFMul %64 %65 
                                 Private f32* %67 = OpAccessChain %58 %20 
                                                      OpStore %67 %66 
                                 Private f32* %68 = OpAccessChain %53 %20 
                                          f32 %69 = OpLoad %68 
                                          f32 %71 = OpFMul %69 %70 
                                 Private f32* %72 = OpAccessChain %58 %35 
                                                      OpStore %72 %71 
                                        f32_4 %73 = OpLoad %58 
                                        f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                                        f32_3 %75 = OpLoad %34 
                                        f32_2 %76 = OpVectorShuffle %75 %75 0 1 
                                        f32_2 %77 = OpFAdd %74 %76 
                                                      OpStore %32 %77 
                                        f32_2 %78 = OpLoad %32 
                                 Uniform f32* %80 = OpAccessChain %17 %79 
                                          f32 %81 = OpLoad %80 
                                        f32_2 %82 = OpCompositeConstruct %81 %81 
                                        f32_2 %83 = OpFMul %78 %82 
                                                      OpStore %32 %83 
                                        f32_2 %84 = OpLoad %32 
                                        f32_2 %87 = OpFMul %84 %86 
                                                      OpStore %32 %87 
                                        f32_3 %88 = OpLoad %9 
                                        f32_2 %89 = OpVectorShuffle %88 %88 0 0 
                                        f32_2 %93 = OpFMul %89 %92 
                                        f32_2 %94 = OpLoad %32 
                                        f32_2 %95 = OpFAdd %93 %94 
                                        f32_3 %96 = OpLoad %9 
                                        f32_3 %97 = OpVectorShuffle %96 %95 3 4 2 
                                                      OpStore %9 %97 
                  read_only Texture2DSampled %103 = OpLoad %102 
                                       f32_3 %104 = OpLoad %9 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_4 %106 = OpImageSampleImplicitLod %103 %105 
                                       f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                                                      OpStore %98 %107 
                                  Input f32* %111 = OpAccessChain %110 %35 
                                         f32 %112 = OpLoad %111 
                                         f32 %114 = OpFMul %112 %113 
                                                      OpStore %108 %114 
                                Uniform f32* %116 = OpAccessChain %17 %19 %115 
                                         f32 %117 = OpLoad %116 
                                         f32 %119 = OpFMul %117 %118 
                                         f32 %120 = OpLoad %108 
                                         f32 %121 = OpFAdd %119 %120 
                                                      OpStore %108 %121 
                                         f32 %122 = OpLoad %108 
                                         f32 %123 = OpExtInst %1 13 %122 
                                                      OpStore %108 %123 
                                         f32 %124 = OpLoad %108 
                                         f32 %126 = OpFMul %124 %125 
                                Private f32* %127 = OpAccessChain %53 %20 
                                                      OpStore %127 %126 
                                Private f32* %129 = OpAccessChain %53 %35 
                                                      OpStore %129 %128 
                                       f32_4 %130 = OpLoad %53 
                                       f32_2 %131 = OpVectorShuffle %130 %130 0 1 
                                       f32_4 %132 = OpLoad %110 
                                       f32_2 %133 = OpVectorShuffle %132 %132 0 1 
                                       f32_2 %134 = OpFAdd %131 %133 
                                       f32_4 %135 = OpLoad %53 
                                       f32_4 %136 = OpVectorShuffle %135 %134 4 5 2 3 
                                                      OpStore %53 %136 
                  read_only Texture2DSampled %139 = OpLoad %138 
                                       f32_4 %140 = OpLoad %53 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                                       f32_4 %142 = OpImageSampleImplicitLod %139 %141 
                                                      OpStore %137 %142 
                                       f32_3 %143 = OpLoad %98 
                                Uniform f32* %145 = OpAccessChain %17 %144 
                                         f32 %146 = OpLoad %145 
                                       f32_3 %147 = OpCompositeConstruct %146 %146 %146 
                                       f32_3 %148 = OpFMul %143 %147 
                                                      OpStore %9 %148 
                                       f32_3 %149 = OpLoad %9 
                              Uniform f32_4* %152 = OpAccessChain %17 %150 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                       f32_3 %155 = OpFMul %149 %154 
                              Uniform f32_4* %157 = OpAccessChain %17 %156 
                                       f32_4 %158 = OpLoad %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                       f32_3 %160 = OpFAdd %155 %159 
                                                      OpStore %9 %160 
                                       f32_3 %162 = OpLoad %9 
                                       f32_3 %164 = OpFMul %162 %163 
                                       f32_3 %167 = OpFAdd %164 %166 
                                                      OpStore %161 %167 
                                       f32_3 %169 = OpLoad %9 
                                       f32_3 %172 = OpFMul %169 %171 
                                       f32_4 %173 = OpLoad %137 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                                       f32_3 %175 = OpFAdd %172 %174 
                                                      OpStore %168 %175 
                                Private f32* %177 = OpAccessChain %137 %176 
                                         f32 %178 = OpLoad %177 
                                Uniform f32* %180 = OpAccessChain %17 %179 
                                         f32 %181 = OpLoad %180 
                                         f32 %182 = OpFMul %178 %181 
                                Private f32* %183 = OpAccessChain %9 %20 
                                                      OpStore %183 %182 
                                Private f32* %184 = OpAccessChain %9 %20 
                                         f32 %185 = OpLoad %184 
                                Uniform f32* %187 = OpAccessChain %17 %186 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpFMul %185 %188 
                                Private f32* %190 = OpAccessChain %9 %20 
                                                      OpStore %190 %189 
                                       f32_3 %192 = OpLoad %161 
                                       f32_3 %193 = OpFNegate %192 
                                       f32_3 %194 = OpLoad %168 
                                       f32_3 %195 = OpFAdd %193 %194 
                                                      OpStore %191 %195 
                                       f32_3 %196 = OpLoad %9 
                                       f32_3 %197 = OpVectorShuffle %196 %196 0 0 0 
                                       f32_3 %198 = OpLoad %191 
                                       f32_3 %199 = OpFMul %197 %198 
                                       f32_3 %200 = OpLoad %161 
                                       f32_3 %201 = OpFAdd %199 %200 
                                                      OpStore %9 %201 
                                       f32_3 %202 = OpLoad %34 
                                       f32_4 %203 = OpVectorShuffle %202 %202 1 1 1 1 
                              Uniform f32_4* %206 = OpAccessChain %17 %204 %205 
                                       f32_4 %207 = OpLoad %206 
                                       f32_4 %208 = OpFMul %203 %207 
                                                      OpStore %53 %208 
                              Uniform f32_4* %209 = OpAccessChain %17 %204 %19 
                                       f32_4 %210 = OpLoad %209 
                                       f32_3 %211 = OpLoad %34 
                                       f32_4 %212 = OpVectorShuffle %211 %211 0 0 0 0 
                                       f32_4 %213 = OpFMul %210 %212 
                                       f32_4 %214 = OpLoad %53 
                                       f32_4 %215 = OpFAdd %213 %214 
                                                      OpStore %53 %215 
                              Uniform f32_4* %217 = OpAccessChain %17 %204 %216 
                                       f32_4 %218 = OpLoad %217 
                                       f32_3 %219 = OpLoad %34 
                                       f32_4 %220 = OpVectorShuffle %219 %219 2 2 2 2 
                                       f32_4 %221 = OpFMul %218 %220 
                                       f32_4 %222 = OpLoad %53 
                                       f32_4 %223 = OpFAdd %221 %222 
                                                      OpStore %53 %223 
                                       f32_4 %224 = OpLoad %53 
                              Uniform f32_4* %226 = OpAccessChain %17 %204 %225 
                                       f32_4 %227 = OpLoad %226 
                                       f32_4 %228 = OpFAdd %224 %227 
                                                      OpStore %53 %228 
                                Uniform f32* %232 = OpAccessChain %17 %216 %20 
                                         f32 %233 = OpLoad %232 
                                        bool %235 = OpFOrdEqual %233 %234 
                                                      OpStore %231 %235 
                                                      OpSelectionMerge %238 None 
                                                      OpBranchConditional %236 %237 %238 
                                             %237 = OpLabel 
                                        bool %239 = OpLoad %231 
                                                      OpSelectionMerge %241 None 
                                                      OpBranchConditional %239 %240 %241 
                                             %240 = OpLabel 
                                                      OpBranch %241 
                                             %241 = OpLabel 
                                                      OpBranch %238 
                                             %238 = OpLabel 
                                                      OpSelectionMerge %244 None 
                                                      OpBranchConditional %242 %243 %340 
                                             %243 = OpLabel 
                                Uniform f32* %245 = OpAccessChain %17 %216 %35 
                                         f32 %246 = OpLoad %245 
                                        bool %247 = OpFOrdEqual %246 %234 
                                                      OpStore %231 %247 
                                       f32_3 %248 = OpLoad %34 
                                       f32_3 %249 = OpVectorShuffle %248 %248 1 1 1 
                              Uniform f32_4* %250 = OpAccessChain %17 %225 %205 
                                       f32_4 %251 = OpLoad %250 
                                       f32_3 %252 = OpVectorShuffle %251 %251 0 1 2 
                                       f32_3 %253 = OpFMul %249 %252 
                                       f32_4 %254 = OpLoad %58 
                                       f32_4 %255 = OpVectorShuffle %254 %253 4 5 6 3 
                                                      OpStore %58 %255 
                              Uniform f32_4* %256 = OpAccessChain %17 %225 %19 
                                       f32_4 %257 = OpLoad %256 
                                       f32_3 %258 = OpVectorShuffle %257 %257 0 1 2 
                                       f32_3 %259 = OpLoad %34 
                                       f32_3 %260 = OpVectorShuffle %259 %259 0 0 0 
                                       f32_3 %261 = OpFMul %258 %260 
                                       f32_4 %262 = OpLoad %58 
                                       f32_3 %263 = OpVectorShuffle %262 %262 0 1 2 
                                       f32_3 %264 = OpFAdd %261 %263 
                                       f32_4 %265 = OpLoad %58 
                                       f32_4 %266 = OpVectorShuffle %265 %264 4 5 6 3 
                                                      OpStore %58 %266 
                              Uniform f32_4* %267 = OpAccessChain %17 %225 %216 
                                       f32_4 %268 = OpLoad %267 
                                       f32_3 %269 = OpVectorShuffle %268 %268 0 1 2 
                                       f32_3 %270 = OpLoad %34 
                                       f32_3 %271 = OpVectorShuffle %270 %270 2 2 2 
                                       f32_3 %272 = OpFMul %269 %271 
                                       f32_4 %273 = OpLoad %58 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                                       f32_3 %275 = OpFAdd %272 %274 
                                       f32_4 %276 = OpLoad %58 
                                       f32_4 %277 = OpVectorShuffle %276 %275 4 5 6 3 
                                                      OpStore %58 %277 
                                       f32_4 %278 = OpLoad %58 
                                       f32_3 %279 = OpVectorShuffle %278 %278 0 1 2 
                              Uniform f32_4* %280 = OpAccessChain %17 %225 %225 
                                       f32_4 %281 = OpLoad %280 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 1 2 
                                       f32_3 %283 = OpFAdd %279 %282 
                                       f32_4 %284 = OpLoad %58 
                                       f32_4 %285 = OpVectorShuffle %284 %283 4 5 6 3 
                                                      OpStore %58 %285 
                                        bool %288 = OpLoad %231 
                                                      OpSelectionMerge %290 None 
                                                      OpBranchConditional %288 %289 %293 
                                             %289 = OpLabel 
                                       f32_4 %291 = OpLoad %58 
                                       f32_3 %292 = OpVectorShuffle %291 %291 0 1 2 
                                                      OpStore %287 %292 
                                                      OpBranch %290 
                                             %293 = OpLabel 
                                       f32_3 %294 = OpLoad %34 
                                                      OpStore %287 %294 
                                                      OpBranch %290 
                                             %290 = OpLabel 
                                       f32_3 %295 = OpLoad %287 
                                       f32_4 %296 = OpLoad %58 
                                       f32_4 %297 = OpVectorShuffle %296 %295 4 5 6 3 
                                                      OpStore %58 %297 
                                       f32_4 %298 = OpLoad %58 
                                       f32_3 %299 = OpVectorShuffle %298 %298 0 1 2 
                              Uniform f32_3* %302 = OpAccessChain %17 %300 
                                       f32_3 %303 = OpLoad %302 
                                       f32_3 %304 = OpFNegate %303 
                                       f32_3 %305 = OpFAdd %299 %304 
                                       f32_4 %306 = OpLoad %58 
                                       f32_4 %307 = OpVectorShuffle %306 %305 4 5 6 3 
                                                      OpStore %58 %307 
                                       f32_4 %308 = OpLoad %58 
                                       f32_3 %309 = OpVectorShuffle %308 %308 0 1 2 
                              Uniform f32_3* %311 = OpAccessChain %17 %310 
                                       f32_3 %312 = OpLoad %311 
                                       f32_3 %313 = OpFMul %309 %312 
                                       f32_4 %314 = OpLoad %58 
                                       f32_4 %315 = OpVectorShuffle %314 %313 0 4 5 6 
                                                      OpStore %58 %315 
                                Private f32* %316 = OpAccessChain %58 %35 
                                         f32 %317 = OpLoad %316 
                                         f32 %319 = OpFMul %317 %318 
                                         f32 %320 = OpFAdd %319 %170 
                                                      OpStore %108 %320 
                                Uniform f32* %322 = OpAccessChain %17 %216 %115 
                                         f32 %323 = OpLoad %322 
                                         f32 %324 = OpFMul %323 %90 
                                         f32 %325 = OpFAdd %324 %170 
                                                      OpStore %321 %325 
                                         f32 %326 = OpLoad %108 
                                         f32 %327 = OpLoad %321 
                                         f32 %328 = OpExtInst %1 40 %326 %327 
                                Private f32* %329 = OpAccessChain %58 %20 
                                                      OpStore %329 %328 
                  read_only Texture3DSampled %334 = OpLoad %333 
                                       f32_4 %335 = OpLoad %58 
                                       f32_3 %336 = OpVectorShuffle %335 %335 0 2 3 
                                       f32_4 %337 = OpImageSampleImplicitLod %334 %336 
                                                      OpStore %58 %337 
                                       f32_4 %339 = OpLoad %58 
                                                      OpStore %338 %339 
                                                      OpBranch %244 
                                             %340 = OpLabel 
                                Private f32* %341 = OpAccessChain %338 %20 
                                                      OpStore %341 %234 
                                Private f32* %342 = OpAccessChain %338 %35 
                                                      OpStore %342 %234 
                                Private f32* %343 = OpAccessChain %338 %115 
                                                      OpStore %343 %234 
                                Private f32* %344 = OpAccessChain %338 %176 
                                                      OpStore %344 %234 
                                                      OpBranch %244 
                                             %244 = OpLabel 
                                       f32_4 %345 = OpLoad %338 
                              Uniform f32_4* %346 = OpAccessChain %17 %205 
                                       f32_4 %347 = OpLoad %346 
                                         f32 %348 = OpDot %345 %347 
                                Private f32* %349 = OpAccessChain %161 %20 
                                                      OpStore %349 %348 
                                Private f32* %350 = OpAccessChain %161 %20 
                                         f32 %351 = OpLoad %350 
                                         f32 %352 = OpExtInst %1 43 %351 %128 %234 
                                Private f32* %353 = OpAccessChain %161 %20 
                                                      OpStore %353 %352 
                                Private f32* %354 = OpAccessChain %53 %115 
                                         f32 %355 = OpLoad %354 
                                        bool %356 = OpFOrdLessThan %128 %355 
                                                      OpStore %231 %356 
                                        bool %360 = OpLoad %231 
                                                      OpSelectionMerge %362 None 
                                                      OpBranchConditional %360 %361 %363 
                                             %361 = OpLabel 
                                                      OpStore %359 %234 
                                                      OpBranch %362 
                                             %363 = OpLabel 
                                                      OpStore %359 %128 
                                                      OpBranch %362 
                                             %362 = OpLabel 
                                         f32 %364 = OpLoad %359 
                                Private f32* %365 = OpAccessChain %357 %20 
                                                      OpStore %365 %364 
                                       f32_4 %367 = OpLoad %53 
                                       f32_2 %368 = OpVectorShuffle %367 %367 0 1 
                                       f32_4 %369 = OpLoad %53 
                                       f32_2 %370 = OpVectorShuffle %369 %369 3 3 
                                       f32_2 %371 = OpFDiv %368 %370 
                                                      OpStore %366 %371 
                                       f32_2 %372 = OpLoad %366 
                                       f32_2 %374 = OpFAdd %372 %373 
                                                      OpStore %366 %374 
                  read_only Texture2DSampled %376 = OpLoad %375 
                                       f32_2 %377 = OpLoad %366 
                                       f32_4 %378 = OpImageSampleImplicitLod %376 %377 
                                         f32 %379 = OpCompositeExtract %378 3 
                                                      OpStore %108 %379 
                                         f32 %380 = OpLoad %108 
                                Private f32* %381 = OpAccessChain %357 %20 
                                         f32 %382 = OpLoad %381 
                                         f32 %383 = OpFMul %380 %382 
                                Private f32* %384 = OpAccessChain %357 %20 
                                                      OpStore %384 %383 
                                       f32_4 %385 = OpLoad %53 
                                       f32_3 %386 = OpVectorShuffle %385 %385 0 1 2 
                                       f32_4 %387 = OpLoad %53 
                                       f32_3 %388 = OpVectorShuffle %387 %387 0 1 2 
                                         f32 %389 = OpDot %386 %388 
                                                      OpStore %108 %389 
                  read_only Texture2DSampled %391 = OpLoad %390 
                                         f32 %392 = OpLoad %108 
                                       f32_2 %393 = OpCompositeConstruct %392 %392 
                                       f32_4 %394 = OpImageSampleImplicitLod %391 %393 
                                         f32 %395 = OpCompositeExtract %394 3 
                                                      OpStore %108 %395 
                                         f32 %396 = OpLoad %108 
                                Private f32* %397 = OpAccessChain %357 %20 
                                         f32 %398 = OpLoad %397 
                                         f32 %399 = OpFMul %396 %398 
                                Private f32* %400 = OpAccessChain %357 %20 
                                                      OpStore %400 %399 
                                Private f32* %401 = OpAccessChain %161 %20 
                                         f32 %402 = OpLoad %401 
                                Private f32* %403 = OpAccessChain %357 %20 
                                         f32 %404 = OpLoad %403 
                                         f32 %405 = OpFMul %402 %404 
                                Private f32* %406 = OpAccessChain %161 %20 
                                                      OpStore %406 %405 
                                       f32_3 %407 = OpLoad %9 
                              Uniform f32_4* %409 = OpAccessChain %17 %408 
                                       f32_4 %410 = OpLoad %409 
                                       f32_3 %411 = OpVectorShuffle %410 %410 0 1 2 
                                       f32_3 %412 = OpFMul %407 %411 
                                                      OpStore %357 %412 
                                       f32_3 %415 = OpLoad %161 
                                       f32_3 %416 = OpVectorShuffle %415 %415 0 0 0 
                                       f32_3 %417 = OpLoad %357 
                                       f32_3 %418 = OpFMul %416 %417 
                                       f32_4 %419 = OpLoad %414 
                                       f32_4 %420 = OpVectorShuffle %419 %418 4 5 6 3 
                                                      OpStore %414 %420 
                                Uniform f32* %421 = OpAccessChain %17 %156 %176 
                                         f32 %422 = OpLoad %421 
                                 Output f32* %424 = OpAccessChain %414 %176 
                                                      OpStore %424 %422 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _CausticScale;
uniform 	vec4 _CausticColor;
uniform 	float _ReflPower;
uniform 	float _TimeScale;
uniform 	vec4 _LightCausticColor;
uniform 	float _LightCausticPower;
uniform 	float _GlobalReflectionsEnabled;
uniform  sampler2D _CausticTex;
uniform  sampler2D _ReflMapFromPixelator;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
float u_xlat16_1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec2 u_xlat3;
float u_xlat9;
bool u_xlatb9;
float u_xlat10;
void main()
{
    u_xlat0.x = _Time.x * _TimeScale;
    u_xlat3.x = vs_TEXCOORD1.y + vs_TEXCOORD1.x;
    u_xlat3.x = _Time.y * _TimeScale + u_xlat3.x;
    u_xlat1.x = sin(u_xlat3.x);
    u_xlat2.x = cos(u_xlat3.x);
    u_xlat2.x = u_xlat2.x * 0.111111112;
    u_xlat2.y = u_xlat1.x * 0.166666672;
    u_xlat3.xy = u_xlat2.xy + vs_TEXCOORD1.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(_CausticScale);
    u_xlat3.xy = u_xlat3.xy * vec2(0.200000003, 0.200000003);
    u_xlat0.xy = u_xlat0.xx * vec2(0.5, 0.125) + u_xlat3.xy;
    u_xlat10_0 = texture(_CausticTex, u_xlat0.xy);
    u_xlat9 = vs_TEXCOORD2.y * 500.0;
    u_xlat9 = _Time.z * 5.0 + u_xlat9;
    u_xlat9 = sin(u_xlat9);
    u_xlat1.x = u_xlat9 * 0.00150000001;
    u_xlat1.y = 0.0;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD2.xy;
    u_xlat10_1 = texture(_ReflMapFromPixelator, u_xlat1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_LightCausticPower);
    u_xlat0.xyz = u_xlat0.xyz * _LightCausticColor.xyz + _CausticColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.0500000007, 0.0500000007, 0.0500000007);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.75, 0.75, 0.75) + u_xlat10_1.xyz;
    u_xlat9 = u_xlat10_1.w * _ReflPower;
    u_xlat9 = u_xlat9 * _GlobalReflectionsEnabled;
    u_xlat0.xyz = (-u_xlat2.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1.xyz = vs_TEXCOORD1.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD1.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD1.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb9 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb9){
        u_xlatb9 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD1.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD1.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb9)) ? u_xlat2.xyz : vs_TEXCOORD1.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat9 = u_xlat2.y * 0.25 + 0.75;
        u_xlat10 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat9, u_xlat10);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat9 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10_2 = texture(_LightTextureB0, vec2(u_xlat10));
    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xyz);
    u_xlat16_1 = u_xlat10_1.w * u_xlat10_2.w;
    u_xlat9 = u_xlat9 * u_xlat16_1;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    SV_Target0.w = _CausticColor.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "POINT_COOKIE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 166
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %92 %97 %127 %147 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %52 Location 52 
                                                      OpMemberDecorate %90 0 BuiltIn 90 
                                                      OpMemberDecorate %90 1 BuiltIn 90 
                                                      OpMemberDecorate %90 2 BuiltIn 90 
                                                      OpDecorate %90 Block 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate %127 Location 127 
                                                      OpDecorate %147 Location 147 
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
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %16 %17 %18 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4];}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                                              %50 = OpTypeVector %6 3 
                                              %51 = OpTypePointer Output %50 
                                Output f32_3* %52 = OpVariable Output 
                                          u32 %88 = OpConstant 1 
                                              %89 = OpTypeArray %6 %88 
                                              %90 = OpTypeStruct %7 %6 %89 
                                              %91 = OpTypePointer Output %90 
         Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                                              %94 = OpTypePointer Output %7 
                                              %96 = OpTypePointer Input %50 
                                 Input f32_3* %97 = OpVariable Input 
                                         u32 %103 = OpConstant 0 
                                             %104 = OpTypePointer Private %6 
                                         u32 %117 = OpConstant 2 
                                Private f32* %119 = OpVariable Private 
                               Output f32_3* %127 = OpVariable Output 
                                             %135 = OpTypePointer Uniform %6 
                                         f32 %142 = OpConstant 3.67402E-40 
                                       f32_3 %143 = OpConstantComposite %142 %142 %142 
                               Output f32_4* %147 = OpVariable Output 
                                             %148 = OpTypeVector %6 2 
                                             %160 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %53 = OpAccessChain %21 %23 %46 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %56 = OpLoad %11 
                                        f32_3 %57 = OpVectorShuffle %56 %56 3 3 3 
                                        f32_3 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                                      OpStore %52 %61 
                                        f32_4 %62 = OpLoad %44 
                                        f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %21 %46 %23 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %63 %65 
                                                      OpStore %9 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %46 %28 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %44 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %74 = OpAccessChain %21 %46 %36 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %44 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                               Uniform f32_4* %81 = OpAccessChain %21 %46 %46 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %44 
                                        f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %9 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %9 %87 
                                        f32_4 %93 = OpLoad %9 
                                Output f32_4* %95 = OpAccessChain %92 %28 
                                                      OpStore %95 %93 
                                        f32_3 %98 = OpLoad %97 
                               Uniform f32_4* %99 = OpAccessChain %21 %36 %28 
                                       f32_4 %100 = OpLoad %99 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                                         f32 %102 = OpDot %98 %101 
                                Private f32* %105 = OpAccessChain %44 %103 
                                                      OpStore %105 %102 
                                       f32_3 %106 = OpLoad %97 
                              Uniform f32_4* %107 = OpAccessChain %21 %36 %23 
                                       f32_4 %108 = OpLoad %107 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                         f32 %110 = OpDot %106 %109 
                                Private f32* %111 = OpAccessChain %44 %88 
                                                      OpStore %111 %110 
                                       f32_3 %112 = OpLoad %97 
                              Uniform f32_4* %113 = OpAccessChain %21 %36 %36 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                         f32 %116 = OpDot %112 %115 
                                Private f32* %118 = OpAccessChain %44 %117 
                                                      OpStore %118 %116 
                                       f32_4 %120 = OpLoad %44 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                                       f32_4 %122 = OpLoad %44 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                         f32 %124 = OpDot %121 %123 
                                                      OpStore %119 %124 
                                         f32 %125 = OpLoad %119 
                                         f32 %126 = OpExtInst %1 32 %125 
                                                      OpStore %119 %126 
                                         f32 %128 = OpLoad %119 
                                       f32_3 %129 = OpCompositeConstruct %128 %128 %128 
                                       f32_4 %130 = OpLoad %44 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_3 %132 = OpFMul %129 %131 
                                                      OpStore %127 %132 
                                Private f32* %133 = OpAccessChain %9 %88 
                                         f32 %134 = OpLoad %133 
                                Uniform f32* %136 = OpAccessChain %21 %28 %103 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFMul %134 %137 
                                Private f32* %139 = OpAccessChain %9 %88 
                                                      OpStore %139 %138 
                                       f32_4 %140 = OpLoad %9 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 3 1 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %44 
                                       f32_4 %146 = OpVectorShuffle %145 %144 4 1 5 6 
                                                      OpStore %44 %146 
                                       f32_4 %149 = OpLoad %9 
                                       f32_2 %150 = OpVectorShuffle %149 %149 2 3 
                                       f32_4 %151 = OpLoad %147 
                                       f32_4 %152 = OpVectorShuffle %151 %150 0 1 4 5 
                                                      OpStore %147 %152 
                                       f32_4 %153 = OpLoad %44 
                                       f32_2 %154 = OpVectorShuffle %153 %153 2 2 
                                       f32_4 %155 = OpLoad %44 
                                       f32_2 %156 = OpVectorShuffle %155 %155 0 3 
                                       f32_2 %157 = OpFAdd %154 %156 
                                       f32_4 %158 = OpLoad %147 
                                       f32_4 %159 = OpVectorShuffle %158 %157 4 5 2 3 
                                                      OpStore %147 %159 
                                 Output f32* %161 = OpAccessChain %92 %28 %88 
                                         f32 %162 = OpLoad %161 
                                         f32 %163 = OpFNegate %162 
                                 Output f32* %164 = OpAccessChain %92 %28 %88 
                                                      OpStore %164 %163 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 403
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %34 %110 %391 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 RelaxedPrecision 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpMemberDecorate %15 6 RelaxedPrecision 
                                                      OpMemberDecorate %15 6 Offset 15 
                                                      OpMemberDecorate %15 7 Offset 15 
                                                      OpMemberDecorate %15 8 Offset 15 
                                                      OpMemberDecorate %15 9 Offset 15 
                                                      OpMemberDecorate %15 10 Offset 15 
                                                      OpMemberDecorate %15 11 Offset 15 
                                                      OpMemberDecorate %15 12 Offset 15 
                                                      OpMemberDecorate %15 13 Offset 15 
                                                      OpMemberDecorate %15 14 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %34 Location 34 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %102 DescriptorSet 102 
                                                      OpDecorate %102 Binding 102 
                                                      OpDecorate %103 RelaxedPrecision 
                                                      OpDecorate %107 RelaxedPrecision 
                                                      OpDecorate %110 Location 110 
                                                      OpDecorate %137 RelaxedPrecision 
                                                      OpDecorate %138 RelaxedPrecision 
                                                      OpDecorate %138 DescriptorSet 138 
                                                      OpDecorate %138 Binding 138 
                                                      OpDecorate %139 RelaxedPrecision 
                                                      OpDecorate %143 RelaxedPrecision 
                                                      OpDecorate %147 RelaxedPrecision 
                                                      OpDecorate %148 RelaxedPrecision 
                                                      OpDecorate %161 RelaxedPrecision 
                                                      OpDecorate %168 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %246 SpecId 246 
                                                      OpDecorate %337 DescriptorSet 337 
                                                      OpDecorate %337 Binding 337 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %349 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %352 RelaxedPrecision 
                                                      OpDecorate %355 RelaxedPrecision 
                                                      OpDecorate %356 RelaxedPrecision 
                                                      OpDecorate %361 DescriptorSet 361 
                                                      OpDecorate %361 Binding 361 
                                                      OpDecorate %370 DescriptorSet 370 
                                                      OpDecorate %370 Binding 370 
                                                      OpDecorate %381 RelaxedPrecision 
                                                      OpDecorate %387 RelaxedPrecision 
                                                      OpDecorate %388 RelaxedPrecision 
                                                      OpDecorate %391 RelaxedPrecision 
                                                      OpDecorate %391 Location 391 
                                                      OpDecorate %393 RelaxedPrecision 
                                                      OpDecorate %394 RelaxedPrecision 
                                                      OpDecorate %395 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 4 
                                              %11 = OpTypeInt 32 0 
                                          u32 %12 = OpConstant 4 
                                              %13 = OpTypeArray %10 %12 
                                              %14 = OpTypeArray %10 %12 
                                              %15 = OpTypeStruct %10 %10 %10 %13 %7 %7 %10 %14 %6 %10 %6 %6 %10 %6 %6 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32_4; f32; f32; f32_4; f32; f32;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 0 
                                          u32 %20 = OpConstant 0 
                                              %21 = OpTypePointer Uniform %6 
                                          i32 %24 = OpConstant 11 
                                              %28 = OpTypePointer Private %6 
                                              %30 = OpTypeVector %6 2 
                                              %31 = OpTypePointer Private %30 
                               Private f32_2* %32 = OpVariable Private 
                                              %33 = OpTypePointer Input %7 
                                 Input f32_3* %34 = OpVariable Input 
                                          u32 %35 = OpConstant 1 
                                              %36 = OpTypePointer Input %6 
                               Private f32_3* %52 = OpVariable Private 
                                              %57 = OpTypePointer Private %10 
                               Private f32_4* %58 = OpVariable Private 
                                          f32 %65 = OpConstant 3.67402E-40 
                                          f32 %70 = OpConstant 3.67402E-40 
                                          i32 %79 = OpConstant 8 
                                          f32 %85 = OpConstant 3.67402E-40 
                                        f32_2 %86 = OpConstantComposite %85 %85 
                                          f32 %90 = OpConstant 3.67402E-40 
                                          f32 %91 = OpConstant 3.67402E-40 
                                        f32_2 %92 = OpConstantComposite %90 %91 
                               Private f32_3* %98 = OpVariable Private 
                                              %99 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %100 = OpTypeSampledImage %99 
                                             %101 = OpTypePointer UniformConstant %100 
 UniformConstant read_only Texture2DSampled* %102 = OpVariable UniformConstant 
                                Private f32* %108 = OpVariable Private 
                                             %109 = OpTypePointer Input %10 
                                Input f32_4* %110 = OpVariable Input 
                                         f32 %113 = OpConstant 3.67402E-40 
                                         u32 %115 = OpConstant 2 
                                         f32 %118 = OpConstant 3.67402E-40 
                                         f32 %125 = OpConstant 3.67402E-40 
                                         f32 %128 = OpConstant 3.67402E-40 
                              Private f32_4* %137 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %138 = OpVariable UniformConstant 
                                         i32 %144 = OpConstant 13 
                                         i32 %150 = OpConstant 12 
                                             %151 = OpTypePointer Uniform %10 
                                         i32 %156 = OpConstant 9 
                              Private f32_3* %161 = OpVariable Private 
                                       f32_3 %163 = OpConstantComposite %90 %90 %90 
                                         f32 %165 = OpConstant 3.67402E-40 
                                       f32_3 %166 = OpConstantComposite %165 %165 %165 
                              Private f32_3* %168 = OpVariable Private 
                                         f32 %170 = OpConstant 3.67402E-40 
                                       f32_3 %171 = OpConstantComposite %170 %170 %170 
                                         u32 %176 = OpConstant 3 
                                         i32 %179 = OpConstant 10 
                                         i32 %186 = OpConstant 14 
                              Private f32_3* %191 = OpVariable Private 
                                         i32 %204 = OpConstant 7 
                                         i32 %205 = OpConstant 1 
                                         i32 %218 = OpConstant 2 
                                         i32 %228 = OpConstant 3 
                                             %233 = OpTypeBool 
                                             %234 = OpTypePointer Private %233 
                               Private bool* %235 = OpVariable Private 
                                         f32 %238 = OpConstant 3.67402E-40 
                                        bool %240 = OpConstantFalse 
                                        bool %246 = OpSpecConstantFalse 
                                             %290 = OpTypePointer Function %7 
                                         i32 %304 = OpConstant 5 
                                             %305 = OpTypePointer Uniform %7 
                                         i32 %314 = OpConstant 4 
                                         f32 %322 = OpConstant 3.67402E-40 
                                Private f32* %325 = OpVariable Private 
                                             %334 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %335 = OpTypeSampledImage %334 
                                             %336 = OpTypePointer UniformConstant %335 
 UniformConstant read_only Texture3DSampled* %337 = OpVariable UniformConstant 
                              Private f32_4* %342 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %361 = OpVariable UniformConstant 
                                             %367 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                             %368 = OpTypeSampledImage %367 
                                             %369 = OpTypePointer UniformConstant %368 
UniformConstant read_only TextureCubeSampled* %370 = OpVariable UniformConstant 
                                         i32 %385 = OpConstant 6 
                                             %390 = OpTypePointer Output %10 
                               Output f32_4* %391 = OpVariable Output 
                                             %400 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %291 = OpVariable Function 
                                 Uniform f32* %22 = OpAccessChain %17 %19 %20 
                                          f32 %23 = OpLoad %22 
                                 Uniform f32* %25 = OpAccessChain %17 %24 
                                          f32 %26 = OpLoad %25 
                                          f32 %27 = OpFMul %23 %26 
                                 Private f32* %29 = OpAccessChain %9 %20 
                                                      OpStore %29 %27 
                                   Input f32* %37 = OpAccessChain %34 %35 
                                          f32 %38 = OpLoad %37 
                                   Input f32* %39 = OpAccessChain %34 %20 
                                          f32 %40 = OpLoad %39 
                                          f32 %41 = OpFAdd %38 %40 
                                 Private f32* %42 = OpAccessChain %32 %20 
                                                      OpStore %42 %41 
                                 Uniform f32* %43 = OpAccessChain %17 %19 %35 
                                          f32 %44 = OpLoad %43 
                                 Uniform f32* %45 = OpAccessChain %17 %24 
                                          f32 %46 = OpLoad %45 
                                          f32 %47 = OpFMul %44 %46 
                                 Private f32* %48 = OpAccessChain %32 %20 
                                          f32 %49 = OpLoad %48 
                                          f32 %50 = OpFAdd %47 %49 
                                 Private f32* %51 = OpAccessChain %32 %20 
                                                      OpStore %51 %50 
                                 Private f32* %53 = OpAccessChain %32 %20 
                                          f32 %54 = OpLoad %53 
                                          f32 %55 = OpExtInst %1 13 %54 
                                 Private f32* %56 = OpAccessChain %52 %20 
                                                      OpStore %56 %55 
                                 Private f32* %59 = OpAccessChain %32 %20 
                                          f32 %60 = OpLoad %59 
                                          f32 %61 = OpExtInst %1 14 %60 
                                 Private f32* %62 = OpAccessChain %58 %20 
                                                      OpStore %62 %61 
                                 Private f32* %63 = OpAccessChain %58 %20 
                                          f32 %64 = OpLoad %63 
                                          f32 %66 = OpFMul %64 %65 
                                 Private f32* %67 = OpAccessChain %58 %20 
                                                      OpStore %67 %66 
                                 Private f32* %68 = OpAccessChain %52 %20 
                                          f32 %69 = OpLoad %68 
                                          f32 %71 = OpFMul %69 %70 
                                 Private f32* %72 = OpAccessChain %58 %35 
                                                      OpStore %72 %71 
                                        f32_4 %73 = OpLoad %58 
                                        f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                                        f32_3 %75 = OpLoad %34 
                                        f32_2 %76 = OpVectorShuffle %75 %75 0 1 
                                        f32_2 %77 = OpFAdd %74 %76 
                                                      OpStore %32 %77 
                                        f32_2 %78 = OpLoad %32 
                                 Uniform f32* %80 = OpAccessChain %17 %79 
                                          f32 %81 = OpLoad %80 
                                        f32_2 %82 = OpCompositeConstruct %81 %81 
                                        f32_2 %83 = OpFMul %78 %82 
                                                      OpStore %32 %83 
                                        f32_2 %84 = OpLoad %32 
                                        f32_2 %87 = OpFMul %84 %86 
                                                      OpStore %32 %87 
                                        f32_3 %88 = OpLoad %9 
                                        f32_2 %89 = OpVectorShuffle %88 %88 0 0 
                                        f32_2 %93 = OpFMul %89 %92 
                                        f32_2 %94 = OpLoad %32 
                                        f32_2 %95 = OpFAdd %93 %94 
                                        f32_3 %96 = OpLoad %9 
                                        f32_3 %97 = OpVectorShuffle %96 %95 3 4 2 
                                                      OpStore %9 %97 
                  read_only Texture2DSampled %103 = OpLoad %102 
                                       f32_3 %104 = OpLoad %9 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_4 %106 = OpImageSampleImplicitLod %103 %105 
                                       f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                                                      OpStore %98 %107 
                                  Input f32* %111 = OpAccessChain %110 %35 
                                         f32 %112 = OpLoad %111 
                                         f32 %114 = OpFMul %112 %113 
                                                      OpStore %108 %114 
                                Uniform f32* %116 = OpAccessChain %17 %19 %115 
                                         f32 %117 = OpLoad %116 
                                         f32 %119 = OpFMul %117 %118 
                                         f32 %120 = OpLoad %108 
                                         f32 %121 = OpFAdd %119 %120 
                                                      OpStore %108 %121 
                                         f32 %122 = OpLoad %108 
                                         f32 %123 = OpExtInst %1 13 %122 
                                                      OpStore %108 %123 
                                         f32 %124 = OpLoad %108 
                                         f32 %126 = OpFMul %124 %125 
                                Private f32* %127 = OpAccessChain %52 %20 
                                                      OpStore %127 %126 
                                Private f32* %129 = OpAccessChain %52 %35 
                                                      OpStore %129 %128 
                                       f32_3 %130 = OpLoad %52 
                                       f32_2 %131 = OpVectorShuffle %130 %130 0 1 
                                       f32_4 %132 = OpLoad %110 
                                       f32_2 %133 = OpVectorShuffle %132 %132 0 1 
                                       f32_2 %134 = OpFAdd %131 %133 
                                       f32_3 %135 = OpLoad %52 
                                       f32_3 %136 = OpVectorShuffle %135 %134 3 4 2 
                                                      OpStore %52 %136 
                  read_only Texture2DSampled %139 = OpLoad %138 
                                       f32_3 %140 = OpLoad %52 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                                       f32_4 %142 = OpImageSampleImplicitLod %139 %141 
                                                      OpStore %137 %142 
                                       f32_3 %143 = OpLoad %98 
                                Uniform f32* %145 = OpAccessChain %17 %144 
                                         f32 %146 = OpLoad %145 
                                       f32_3 %147 = OpCompositeConstruct %146 %146 %146 
                                       f32_3 %148 = OpFMul %143 %147 
                                                      OpStore %9 %148 
                                       f32_3 %149 = OpLoad %9 
                              Uniform f32_4* %152 = OpAccessChain %17 %150 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                       f32_3 %155 = OpFMul %149 %154 
                              Uniform f32_4* %157 = OpAccessChain %17 %156 
                                       f32_4 %158 = OpLoad %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                       f32_3 %160 = OpFAdd %155 %159 
                                                      OpStore %9 %160 
                                       f32_3 %162 = OpLoad %9 
                                       f32_3 %164 = OpFMul %162 %163 
                                       f32_3 %167 = OpFAdd %164 %166 
                                                      OpStore %161 %167 
                                       f32_3 %169 = OpLoad %9 
                                       f32_3 %172 = OpFMul %169 %171 
                                       f32_4 %173 = OpLoad %137 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                                       f32_3 %175 = OpFAdd %172 %174 
                                                      OpStore %168 %175 
                                Private f32* %177 = OpAccessChain %137 %176 
                                         f32 %178 = OpLoad %177 
                                Uniform f32* %180 = OpAccessChain %17 %179 
                                         f32 %181 = OpLoad %180 
                                         f32 %182 = OpFMul %178 %181 
                                Private f32* %183 = OpAccessChain %9 %20 
                                                      OpStore %183 %182 
                                Private f32* %184 = OpAccessChain %9 %20 
                                         f32 %185 = OpLoad %184 
                                Uniform f32* %187 = OpAccessChain %17 %186 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpFMul %185 %188 
                                Private f32* %190 = OpAccessChain %9 %20 
                                                      OpStore %190 %189 
                                       f32_3 %192 = OpLoad %161 
                                       f32_3 %193 = OpFNegate %192 
                                       f32_3 %194 = OpLoad %168 
                                       f32_3 %195 = OpFAdd %193 %194 
                                                      OpStore %191 %195 
                                       f32_3 %196 = OpLoad %9 
                                       f32_3 %197 = OpVectorShuffle %196 %196 0 0 0 
                                       f32_3 %198 = OpLoad %191 
                                       f32_3 %199 = OpFMul %197 %198 
                                       f32_3 %200 = OpLoad %161 
                                       f32_3 %201 = OpFAdd %199 %200 
                                                      OpStore %9 %201 
                                       f32_3 %202 = OpLoad %34 
                                       f32_3 %203 = OpVectorShuffle %202 %202 1 1 1 
                              Uniform f32_4* %206 = OpAccessChain %17 %204 %205 
                                       f32_4 %207 = OpLoad %206 
                                       f32_3 %208 = OpVectorShuffle %207 %207 0 1 2 
                                       f32_3 %209 = OpFMul %203 %208 
                                                      OpStore %52 %209 
                              Uniform f32_4* %210 = OpAccessChain %17 %204 %19 
                                       f32_4 %211 = OpLoad %210 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 1 2 
                                       f32_3 %213 = OpLoad %34 
                                       f32_3 %214 = OpVectorShuffle %213 %213 0 0 0 
                                       f32_3 %215 = OpFMul %212 %214 
                                       f32_3 %216 = OpLoad %52 
                                       f32_3 %217 = OpFAdd %215 %216 
                                                      OpStore %52 %217 
                              Uniform f32_4* %219 = OpAccessChain %17 %204 %218 
                                       f32_4 %220 = OpLoad %219 
                                       f32_3 %221 = OpVectorShuffle %220 %220 0 1 2 
                                       f32_3 %222 = OpLoad %34 
                                       f32_3 %223 = OpVectorShuffle %222 %222 2 2 2 
                                       f32_3 %224 = OpFMul %221 %223 
                                       f32_3 %225 = OpLoad %52 
                                       f32_3 %226 = OpFAdd %224 %225 
                                                      OpStore %52 %226 
                                       f32_3 %227 = OpLoad %52 
                              Uniform f32_4* %229 = OpAccessChain %17 %204 %228 
                                       f32_4 %230 = OpLoad %229 
                                       f32_3 %231 = OpVectorShuffle %230 %230 0 1 2 
                                       f32_3 %232 = OpFAdd %227 %231 
                                                      OpStore %52 %232 
                                Uniform f32* %236 = OpAccessChain %17 %218 %20 
                                         f32 %237 = OpLoad %236 
                                        bool %239 = OpFOrdEqual %237 %238 
                                                      OpStore %235 %239 
                                                      OpSelectionMerge %242 None 
                                                      OpBranchConditional %240 %241 %242 
                                             %241 = OpLabel 
                                        bool %243 = OpLoad %235 
                                                      OpSelectionMerge %245 None 
                                                      OpBranchConditional %243 %244 %245 
                                             %244 = OpLabel 
                                                      OpBranch %245 
                                             %245 = OpLabel 
                                                      OpBranch %242 
                                             %242 = OpLabel 
                                                      OpSelectionMerge %248 None 
                                                      OpBranchConditional %246 %247 %344 
                                             %247 = OpLabel 
                                Uniform f32* %249 = OpAccessChain %17 %218 %35 
                                         f32 %250 = OpLoad %249 
                                        bool %251 = OpFOrdEqual %250 %238 
                                                      OpStore %235 %251 
                                       f32_3 %252 = OpLoad %34 
                                       f32_3 %253 = OpVectorShuffle %252 %252 1 1 1 
                              Uniform f32_4* %254 = OpAccessChain %17 %228 %205 
                                       f32_4 %255 = OpLoad %254 
                                       f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
                                       f32_3 %257 = OpFMul %253 %256 
                                       f32_4 %258 = OpLoad %58 
                                       f32_4 %259 = OpVectorShuffle %258 %257 4 5 6 3 
                                                      OpStore %58 %259 
                              Uniform f32_4* %260 = OpAccessChain %17 %228 %19 
                                       f32_4 %261 = OpLoad %260 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                                       f32_3 %263 = OpLoad %34 
                                       f32_3 %264 = OpVectorShuffle %263 %263 0 0 0 
                                       f32_3 %265 = OpFMul %262 %264 
                                       f32_4 %266 = OpLoad %58 
                                       f32_3 %267 = OpVectorShuffle %266 %266 0 1 2 
                                       f32_3 %268 = OpFAdd %265 %267 
                                       f32_4 %269 = OpLoad %58 
                                       f32_4 %270 = OpVectorShuffle %269 %268 4 5 6 3 
                                                      OpStore %58 %270 
                              Uniform f32_4* %271 = OpAccessChain %17 %228 %218 
                                       f32_4 %272 = OpLoad %271 
                                       f32_3 %273 = OpVectorShuffle %272 %272 0 1 2 
                                       f32_3 %274 = OpLoad %34 
                                       f32_3 %275 = OpVectorShuffle %274 %274 2 2 2 
                                       f32_3 %276 = OpFMul %273 %275 
                                       f32_4 %277 = OpLoad %58 
                                       f32_3 %278 = OpVectorShuffle %277 %277 0 1 2 
                                       f32_3 %279 = OpFAdd %276 %278 
                                       f32_4 %280 = OpLoad %58 
                                       f32_4 %281 = OpVectorShuffle %280 %279 4 5 6 3 
                                                      OpStore %58 %281 
                                       f32_4 %282 = OpLoad %58 
                                       f32_3 %283 = OpVectorShuffle %282 %282 0 1 2 
                              Uniform f32_4* %284 = OpAccessChain %17 %228 %228 
                                       f32_4 %285 = OpLoad %284 
                                       f32_3 %286 = OpVectorShuffle %285 %285 0 1 2 
                                       f32_3 %287 = OpFAdd %283 %286 
                                       f32_4 %288 = OpLoad %58 
                                       f32_4 %289 = OpVectorShuffle %288 %287 4 5 6 3 
                                                      OpStore %58 %289 
                                        bool %292 = OpLoad %235 
                                                      OpSelectionMerge %294 None 
                                                      OpBranchConditional %292 %293 %297 
                                             %293 = OpLabel 
                                       f32_4 %295 = OpLoad %58 
                                       f32_3 %296 = OpVectorShuffle %295 %295 0 1 2 
                                                      OpStore %291 %296 
                                                      OpBranch %294 
                                             %297 = OpLabel 
                                       f32_3 %298 = OpLoad %34 
                                                      OpStore %291 %298 
                                                      OpBranch %294 
                                             %294 = OpLabel 
                                       f32_3 %299 = OpLoad %291 
                                       f32_4 %300 = OpLoad %58 
                                       f32_4 %301 = OpVectorShuffle %300 %299 4 5 6 3 
                                                      OpStore %58 %301 
                                       f32_4 %302 = OpLoad %58 
                                       f32_3 %303 = OpVectorShuffle %302 %302 0 1 2 
                              Uniform f32_3* %306 = OpAccessChain %17 %304 
                                       f32_3 %307 = OpLoad %306 
                                       f32_3 %308 = OpFNegate %307 
                                       f32_3 %309 = OpFAdd %303 %308 
                                       f32_4 %310 = OpLoad %58 
                                       f32_4 %311 = OpVectorShuffle %310 %309 4 5 6 3 
                                                      OpStore %58 %311 
                                       f32_4 %312 = OpLoad %58 
                                       f32_3 %313 = OpVectorShuffle %312 %312 0 1 2 
                              Uniform f32_3* %315 = OpAccessChain %17 %314 
                                       f32_3 %316 = OpLoad %315 
                                       f32_3 %317 = OpFMul %313 %316 
                                       f32_4 %318 = OpLoad %58 
                                       f32_4 %319 = OpVectorShuffle %318 %317 0 4 5 6 
                                                      OpStore %58 %319 
                                Private f32* %320 = OpAccessChain %58 %35 
                                         f32 %321 = OpLoad %320 
                                         f32 %323 = OpFMul %321 %322 
                                         f32 %324 = OpFAdd %323 %170 
                                                      OpStore %108 %324 
                                Uniform f32* %326 = OpAccessChain %17 %218 %115 
                                         f32 %327 = OpLoad %326 
                                         f32 %328 = OpFMul %327 %90 
                                         f32 %329 = OpFAdd %328 %170 
                                                      OpStore %325 %329 
                                         f32 %330 = OpLoad %108 
                                         f32 %331 = OpLoad %325 
                                         f32 %332 = OpExtInst %1 40 %330 %331 
                                Private f32* %333 = OpAccessChain %58 %20 
                                                      OpStore %333 %332 
                  read_only Texture3DSampled %338 = OpLoad %337 
                                       f32_4 %339 = OpLoad %58 
                                       f32_3 %340 = OpVectorShuffle %339 %339 0 2 3 
                                       f32_4 %341 = OpImageSampleImplicitLod %338 %340 
                                                      OpStore %58 %341 
                                       f32_4 %343 = OpLoad %58 
                                                      OpStore %342 %343 
                                                      OpBranch %248 
                                             %344 = OpLabel 
                                Private f32* %345 = OpAccessChain %342 %20 
                                                      OpStore %345 %238 
                                Private f32* %346 = OpAccessChain %342 %35 
                                                      OpStore %346 %238 
                                Private f32* %347 = OpAccessChain %342 %115 
                                                      OpStore %347 %238 
                                Private f32* %348 = OpAccessChain %342 %176 
                                                      OpStore %348 %238 
                                                      OpBranch %248 
                                             %248 = OpLabel 
                                       f32_4 %349 = OpLoad %342 
                              Uniform f32_4* %350 = OpAccessChain %17 %205 
                                       f32_4 %351 = OpLoad %350 
                                         f32 %352 = OpDot %349 %351 
                                Private f32* %353 = OpAccessChain %161 %20 
                                                      OpStore %353 %352 
                                Private f32* %354 = OpAccessChain %161 %20 
                                         f32 %355 = OpLoad %354 
                                         f32 %356 = OpExtInst %1 43 %355 %128 %238 
                                Private f32* %357 = OpAccessChain %161 %20 
                                                      OpStore %357 %356 
                                       f32_3 %358 = OpLoad %52 
                                       f32_3 %359 = OpLoad %52 
                                         f32 %360 = OpDot %358 %359 
                                                      OpStore %108 %360 
                  read_only Texture2DSampled %362 = OpLoad %361 
                                         f32 %363 = OpLoad %108 
                                       f32_2 %364 = OpCompositeConstruct %363 %363 
                                       f32_4 %365 = OpImageSampleImplicitLod %362 %364 
                                         f32 %366 = OpCompositeExtract %365 3 
                                                      OpStore %108 %366 
                read_only TextureCubeSampled %371 = OpLoad %370 
                                       f32_3 %372 = OpLoad %52 
                                       f32_4 %373 = OpImageSampleImplicitLod %371 %372 
                                         f32 %374 = OpCompositeExtract %373 3 
                                Private f32* %375 = OpAccessChain %52 %20 
                                                      OpStore %375 %374 
                                         f32 %376 = OpLoad %108 
                                Private f32* %377 = OpAccessChain %52 %20 
                                         f32 %378 = OpLoad %377 
                                         f32 %379 = OpFMul %376 %378 
                                                      OpStore %108 %379 
                                Private f32* %380 = OpAccessChain %161 %20 
                                         f32 %381 = OpLoad %380 
                                         f32 %382 = OpLoad %108 
                                         f32 %383 = OpFMul %381 %382 
                                                      OpStore %108 %383 
                                       f32_3 %384 = OpLoad %9 
                              Uniform f32_4* %386 = OpAccessChain %17 %385 
                                       f32_4 %387 = OpLoad %386 
                                       f32_3 %388 = OpVectorShuffle %387 %387 0 1 2 
                                       f32_3 %389 = OpFMul %384 %388 
                                                      OpStore %161 %389 
                                         f32 %392 = OpLoad %108 
                                       f32_3 %393 = OpCompositeConstruct %392 %392 %392 
                                       f32_3 %394 = OpLoad %161 
                                       f32_3 %395 = OpFMul %393 %394 
                                       f32_4 %396 = OpLoad %391 
                                       f32_4 %397 = OpVectorShuffle %396 %395 4 5 6 3 
                                                      OpStore %391 %397 
                                Uniform f32* %398 = OpAccessChain %17 %156 %176 
                                         f32 %399 = OpLoad %398 
                                 Output f32* %401 = OpAccessChain %391 %176 
                                                      OpStore %401 %399 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _CausticScale;
uniform 	vec4 _CausticColor;
uniform 	float _ReflPower;
uniform 	float _TimeScale;
uniform 	vec4 _LightCausticColor;
uniform 	float _LightCausticPower;
uniform 	float _GlobalReflectionsEnabled;
uniform  sampler2D _CausticTex;
uniform  sampler2D _ReflMapFromPixelator;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec2 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec2 u_xlat3;
float u_xlat7;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = _Time.x * _TimeScale;
    u_xlat3.x = vs_TEXCOORD1.y + vs_TEXCOORD1.x;
    u_xlat3.x = _Time.y * _TimeScale + u_xlat3.x;
    u_xlat1.x = sin(u_xlat3.x);
    u_xlat2.x = cos(u_xlat3.x);
    u_xlat2.x = u_xlat2.x * 0.111111112;
    u_xlat2.y = u_xlat1.x * 0.166666672;
    u_xlat3.xy = u_xlat2.xy + vs_TEXCOORD1.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(_CausticScale);
    u_xlat3.xy = u_xlat3.xy * vec2(0.200000003, 0.200000003);
    u_xlat0.xy = u_xlat0.xx * vec2(0.5, 0.125) + u_xlat3.xy;
    u_xlat10_0 = texture(_CausticTex, u_xlat0.xy);
    u_xlat9 = vs_TEXCOORD2.y * 500.0;
    u_xlat9 = _Time.z * 5.0 + u_xlat9;
    u_xlat9 = sin(u_xlat9);
    u_xlat1.x = u_xlat9 * 0.00150000001;
    u_xlat1.y = 0.0;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD2.xy;
    u_xlat10_1 = texture(_ReflMapFromPixelator, u_xlat1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_LightCausticPower);
    u_xlat0.xyz = u_xlat0.xyz * _LightCausticColor.xyz + _CausticColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.0500000007, 0.0500000007, 0.0500000007);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.75, 0.75, 0.75) + u_xlat10_1.xyz;
    u_xlat9 = u_xlat10_1.w * _ReflPower;
    u_xlat9 = u_xlat9 * _GlobalReflectionsEnabled;
    u_xlat0.xyz = (-u_xlat2.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1.xy = vs_TEXCOORD1.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD1.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD1.zz + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlatb9 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb9){
        u_xlatb9 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD1.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD1.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb9)) ? u_xlat2.xyz : vs_TEXCOORD1.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat9 = u_xlat2.y * 0.25 + 0.75;
        u_xlat7 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat9, u_xlat7);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat9 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xy);
    u_xlat9 = u_xlat9 * u_xlat10_1.w;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    SV_Target0.w = _CausticColor.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL_COOKIE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 166
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %92 %97 %127 %147 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %52 Location 52 
                                                      OpMemberDecorate %90 0 BuiltIn 90 
                                                      OpMemberDecorate %90 1 BuiltIn 90 
                                                      OpMemberDecorate %90 2 BuiltIn 90 
                                                      OpDecorate %90 Block 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate %127 Location 127 
                                                      OpDecorate %147 Location 147 
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
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %16 %17 %18 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4];}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                                              %50 = OpTypeVector %6 3 
                                              %51 = OpTypePointer Output %50 
                                Output f32_3* %52 = OpVariable Output 
                                          u32 %88 = OpConstant 1 
                                              %89 = OpTypeArray %6 %88 
                                              %90 = OpTypeStruct %7 %6 %89 
                                              %91 = OpTypePointer Output %90 
         Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                                              %94 = OpTypePointer Output %7 
                                              %96 = OpTypePointer Input %50 
                                 Input f32_3* %97 = OpVariable Input 
                                         u32 %103 = OpConstant 0 
                                             %104 = OpTypePointer Private %6 
                                         u32 %117 = OpConstant 2 
                                Private f32* %119 = OpVariable Private 
                               Output f32_3* %127 = OpVariable Output 
                                             %135 = OpTypePointer Uniform %6 
                                         f32 %142 = OpConstant 3.67402E-40 
                                       f32_3 %143 = OpConstantComposite %142 %142 %142 
                               Output f32_4* %147 = OpVariable Output 
                                             %148 = OpTypeVector %6 2 
                                             %160 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %53 = OpAccessChain %21 %23 %46 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %56 = OpLoad %11 
                                        f32_3 %57 = OpVectorShuffle %56 %56 3 3 3 
                                        f32_3 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                                      OpStore %52 %61 
                                        f32_4 %62 = OpLoad %44 
                                        f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %21 %46 %23 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %63 %65 
                                                      OpStore %9 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %46 %28 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %44 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %74 = OpAccessChain %21 %46 %36 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %44 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                               Uniform f32_4* %81 = OpAccessChain %21 %46 %46 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %44 
                                        f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %9 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %9 %87 
                                        f32_4 %93 = OpLoad %9 
                                Output f32_4* %95 = OpAccessChain %92 %28 
                                                      OpStore %95 %93 
                                        f32_3 %98 = OpLoad %97 
                               Uniform f32_4* %99 = OpAccessChain %21 %36 %28 
                                       f32_4 %100 = OpLoad %99 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                                         f32 %102 = OpDot %98 %101 
                                Private f32* %105 = OpAccessChain %44 %103 
                                                      OpStore %105 %102 
                                       f32_3 %106 = OpLoad %97 
                              Uniform f32_4* %107 = OpAccessChain %21 %36 %23 
                                       f32_4 %108 = OpLoad %107 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                         f32 %110 = OpDot %106 %109 
                                Private f32* %111 = OpAccessChain %44 %88 
                                                      OpStore %111 %110 
                                       f32_3 %112 = OpLoad %97 
                              Uniform f32_4* %113 = OpAccessChain %21 %36 %36 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                         f32 %116 = OpDot %112 %115 
                                Private f32* %118 = OpAccessChain %44 %117 
                                                      OpStore %118 %116 
                                       f32_4 %120 = OpLoad %44 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                                       f32_4 %122 = OpLoad %44 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                         f32 %124 = OpDot %121 %123 
                                                      OpStore %119 %124 
                                         f32 %125 = OpLoad %119 
                                         f32 %126 = OpExtInst %1 32 %125 
                                                      OpStore %119 %126 
                                         f32 %128 = OpLoad %119 
                                       f32_3 %129 = OpCompositeConstruct %128 %128 %128 
                                       f32_4 %130 = OpLoad %44 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_3 %132 = OpFMul %129 %131 
                                                      OpStore %127 %132 
                                Private f32* %133 = OpAccessChain %9 %88 
                                         f32 %134 = OpLoad %133 
                                Uniform f32* %136 = OpAccessChain %21 %28 %103 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFMul %134 %137 
                                Private f32* %139 = OpAccessChain %9 %88 
                                                      OpStore %139 %138 
                                       f32_4 %140 = OpLoad %9 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 3 1 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %44 
                                       f32_4 %146 = OpVectorShuffle %145 %144 4 1 5 6 
                                                      OpStore %44 %146 
                                       f32_4 %149 = OpLoad %9 
                                       f32_2 %150 = OpVectorShuffle %149 %149 2 3 
                                       f32_4 %151 = OpLoad %147 
                                       f32_4 %152 = OpVectorShuffle %151 %150 0 1 4 5 
                                                      OpStore %147 %152 
                                       f32_4 %153 = OpLoad %44 
                                       f32_2 %154 = OpVectorShuffle %153 %153 2 2 
                                       f32_4 %155 = OpLoad %44 
                                       f32_2 %156 = OpVectorShuffle %155 %155 0 3 
                                       f32_2 %157 = OpFAdd %154 %156 
                                       f32_4 %158 = OpLoad %147 
                                       f32_4 %159 = OpVectorShuffle %158 %157 4 5 2 3 
                                                      OpStore %147 %159 
                                 Output f32* %161 = OpAccessChain %92 %28 %88 
                                         f32 %162 = OpLoad %161 
                                         f32 %163 = OpFNegate %162 
                                 Output f32* %164 = OpAccessChain %92 %28 %88 
                                                      OpStore %164 %163 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 382
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %34 %110 %370 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 RelaxedPrecision 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpMemberDecorate %15 6 RelaxedPrecision 
                                                      OpMemberDecorate %15 6 Offset 15 
                                                      OpMemberDecorate %15 7 Offset 15 
                                                      OpMemberDecorate %15 8 Offset 15 
                                                      OpMemberDecorate %15 9 Offset 15 
                                                      OpMemberDecorate %15 10 Offset 15 
                                                      OpMemberDecorate %15 11 Offset 15 
                                                      OpMemberDecorate %15 12 Offset 15 
                                                      OpMemberDecorate %15 13 Offset 15 
                                                      OpMemberDecorate %15 14 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %34 Location 34 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %102 DescriptorSet 102 
                                                      OpDecorate %102 Binding 102 
                                                      OpDecorate %103 RelaxedPrecision 
                                                      OpDecorate %107 RelaxedPrecision 
                                                      OpDecorate %110 Location 110 
                                                      OpDecorate %134 RelaxedPrecision 
                                                      OpDecorate %135 RelaxedPrecision 
                                                      OpDecorate %135 DescriptorSet 135 
                                                      OpDecorate %135 Binding 135 
                                                      OpDecorate %136 RelaxedPrecision 
                                                      OpDecorate %139 RelaxedPrecision 
                                                      OpDecorate %143 RelaxedPrecision 
                                                      OpDecorate %144 RelaxedPrecision 
                                                      OpDecorate %157 RelaxedPrecision 
                                                      OpDecorate %164 RelaxedPrecision 
                                                      OpDecorate %169 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %242 SpecId 242 
                                                      OpDecorate %333 DescriptorSet 333 
                                                      OpDecorate %333 Binding 333 
                                                      OpDecorate %338 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %348 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %352 RelaxedPrecision 
                                                      OpDecorate %354 DescriptorSet 354 
                                                      OpDecorate %354 Binding 354 
                                                      OpDecorate %360 RelaxedPrecision 
                                                      OpDecorate %366 RelaxedPrecision 
                                                      OpDecorate %367 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %370 Location 370 
                                                      OpDecorate %372 RelaxedPrecision 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %374 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 4 
                                              %11 = OpTypeInt 32 0 
                                          u32 %12 = OpConstant 4 
                                              %13 = OpTypeArray %10 %12 
                                              %14 = OpTypeArray %10 %12 
                                              %15 = OpTypeStruct %10 %10 %10 %13 %7 %7 %10 %14 %6 %10 %6 %6 %10 %6 %6 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32_4; f32; f32; f32_4; f32; f32;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 0 
                                          u32 %20 = OpConstant 0 
                                              %21 = OpTypePointer Uniform %6 
                                          i32 %24 = OpConstant 11 
                                              %28 = OpTypePointer Private %6 
                                              %30 = OpTypeVector %6 2 
                                              %31 = OpTypePointer Private %30 
                               Private f32_2* %32 = OpVariable Private 
                                              %33 = OpTypePointer Input %7 
                                 Input f32_3* %34 = OpVariable Input 
                                          u32 %35 = OpConstant 1 
                                              %36 = OpTypePointer Input %6 
                               Private f32_2* %52 = OpVariable Private 
                                              %57 = OpTypePointer Private %10 
                               Private f32_4* %58 = OpVariable Private 
                                          f32 %65 = OpConstant 3.67402E-40 
                                          f32 %70 = OpConstant 3.67402E-40 
                                          i32 %79 = OpConstant 8 
                                          f32 %85 = OpConstant 3.67402E-40 
                                        f32_2 %86 = OpConstantComposite %85 %85 
                                          f32 %90 = OpConstant 3.67402E-40 
                                          f32 %91 = OpConstant 3.67402E-40 
                                        f32_2 %92 = OpConstantComposite %90 %91 
                               Private f32_3* %98 = OpVariable Private 
                                              %99 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %100 = OpTypeSampledImage %99 
                                             %101 = OpTypePointer UniformConstant %100 
 UniformConstant read_only Texture2DSampled* %102 = OpVariable UniformConstant 
                                Private f32* %108 = OpVariable Private 
                                             %109 = OpTypePointer Input %10 
                                Input f32_4* %110 = OpVariable Input 
                                         f32 %113 = OpConstant 3.67402E-40 
                                         u32 %115 = OpConstant 2 
                                         f32 %118 = OpConstant 3.67402E-40 
                                         f32 %125 = OpConstant 3.67402E-40 
                                         f32 %128 = OpConstant 3.67402E-40 
                              Private f32_4* %134 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %135 = OpVariable UniformConstant 
                                         i32 %140 = OpConstant 13 
                                         i32 %146 = OpConstant 12 
                                             %147 = OpTypePointer Uniform %10 
                                         i32 %152 = OpConstant 9 
                              Private f32_3* %157 = OpVariable Private 
                                       f32_3 %159 = OpConstantComposite %90 %90 %90 
                                         f32 %161 = OpConstant 3.67402E-40 
                                       f32_3 %162 = OpConstantComposite %161 %161 %161 
                              Private f32_3* %164 = OpVariable Private 
                                         f32 %166 = OpConstant 3.67402E-40 
                                       f32_3 %167 = OpConstantComposite %166 %166 %166 
                                         u32 %172 = OpConstant 3 
                                         i32 %175 = OpConstant 10 
                                         i32 %182 = OpConstant 14 
                              Private f32_3* %187 = OpVariable Private 
                                         i32 %200 = OpConstant 7 
                                         i32 %201 = OpConstant 1 
                                         i32 %214 = OpConstant 2 
                                         i32 %224 = OpConstant 3 
                                             %229 = OpTypeBool 
                                             %230 = OpTypePointer Private %229 
                               Private bool* %231 = OpVariable Private 
                                         f32 %234 = OpConstant 3.67402E-40 
                                        bool %236 = OpConstantFalse 
                                        bool %242 = OpSpecConstantFalse 
                                             %286 = OpTypePointer Function %7 
                                         i32 %300 = OpConstant 5 
                                             %301 = OpTypePointer Uniform %7 
                                         i32 %310 = OpConstant 4 
                                         f32 %318 = OpConstant 3.67402E-40 
                                Private f32* %321 = OpVariable Private 
                                             %330 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %331 = OpTypeSampledImage %330 
                                             %332 = OpTypePointer UniformConstant %331 
 UniformConstant read_only Texture3DSampled* %333 = OpVariable UniformConstant 
                              Private f32_4* %338 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %354 = OpVariable UniformConstant 
                                         i32 %364 = OpConstant 6 
                                             %369 = OpTypePointer Output %10 
                               Output f32_4* %370 = OpVariable Output 
                                             %379 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %287 = OpVariable Function 
                                 Uniform f32* %22 = OpAccessChain %17 %19 %20 
                                          f32 %23 = OpLoad %22 
                                 Uniform f32* %25 = OpAccessChain %17 %24 
                                          f32 %26 = OpLoad %25 
                                          f32 %27 = OpFMul %23 %26 
                                 Private f32* %29 = OpAccessChain %9 %20 
                                                      OpStore %29 %27 
                                   Input f32* %37 = OpAccessChain %34 %35 
                                          f32 %38 = OpLoad %37 
                                   Input f32* %39 = OpAccessChain %34 %20 
                                          f32 %40 = OpLoad %39 
                                          f32 %41 = OpFAdd %38 %40 
                                 Private f32* %42 = OpAccessChain %32 %20 
                                                      OpStore %42 %41 
                                 Uniform f32* %43 = OpAccessChain %17 %19 %35 
                                          f32 %44 = OpLoad %43 
                                 Uniform f32* %45 = OpAccessChain %17 %24 
                                          f32 %46 = OpLoad %45 
                                          f32 %47 = OpFMul %44 %46 
                                 Private f32* %48 = OpAccessChain %32 %20 
                                          f32 %49 = OpLoad %48 
                                          f32 %50 = OpFAdd %47 %49 
                                 Private f32* %51 = OpAccessChain %32 %20 
                                                      OpStore %51 %50 
                                 Private f32* %53 = OpAccessChain %32 %20 
                                          f32 %54 = OpLoad %53 
                                          f32 %55 = OpExtInst %1 13 %54 
                                 Private f32* %56 = OpAccessChain %52 %20 
                                                      OpStore %56 %55 
                                 Private f32* %59 = OpAccessChain %32 %20 
                                          f32 %60 = OpLoad %59 
                                          f32 %61 = OpExtInst %1 14 %60 
                                 Private f32* %62 = OpAccessChain %58 %20 
                                                      OpStore %62 %61 
                                 Private f32* %63 = OpAccessChain %58 %20 
                                          f32 %64 = OpLoad %63 
                                          f32 %66 = OpFMul %64 %65 
                                 Private f32* %67 = OpAccessChain %58 %20 
                                                      OpStore %67 %66 
                                 Private f32* %68 = OpAccessChain %52 %20 
                                          f32 %69 = OpLoad %68 
                                          f32 %71 = OpFMul %69 %70 
                                 Private f32* %72 = OpAccessChain %58 %35 
                                                      OpStore %72 %71 
                                        f32_4 %73 = OpLoad %58 
                                        f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                                        f32_3 %75 = OpLoad %34 
                                        f32_2 %76 = OpVectorShuffle %75 %75 0 1 
                                        f32_2 %77 = OpFAdd %74 %76 
                                                      OpStore %32 %77 
                                        f32_2 %78 = OpLoad %32 
                                 Uniform f32* %80 = OpAccessChain %17 %79 
                                          f32 %81 = OpLoad %80 
                                        f32_2 %82 = OpCompositeConstruct %81 %81 
                                        f32_2 %83 = OpFMul %78 %82 
                                                      OpStore %32 %83 
                                        f32_2 %84 = OpLoad %32 
                                        f32_2 %87 = OpFMul %84 %86 
                                                      OpStore %32 %87 
                                        f32_3 %88 = OpLoad %9 
                                        f32_2 %89 = OpVectorShuffle %88 %88 0 0 
                                        f32_2 %93 = OpFMul %89 %92 
                                        f32_2 %94 = OpLoad %32 
                                        f32_2 %95 = OpFAdd %93 %94 
                                        f32_3 %96 = OpLoad %9 
                                        f32_3 %97 = OpVectorShuffle %96 %95 3 4 2 
                                                      OpStore %9 %97 
                  read_only Texture2DSampled %103 = OpLoad %102 
                                       f32_3 %104 = OpLoad %9 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_4 %106 = OpImageSampleImplicitLod %103 %105 
                                       f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                                                      OpStore %98 %107 
                                  Input f32* %111 = OpAccessChain %110 %35 
                                         f32 %112 = OpLoad %111 
                                         f32 %114 = OpFMul %112 %113 
                                                      OpStore %108 %114 
                                Uniform f32* %116 = OpAccessChain %17 %19 %115 
                                         f32 %117 = OpLoad %116 
                                         f32 %119 = OpFMul %117 %118 
                                         f32 %120 = OpLoad %108 
                                         f32 %121 = OpFAdd %119 %120 
                                                      OpStore %108 %121 
                                         f32 %122 = OpLoad %108 
                                         f32 %123 = OpExtInst %1 13 %122 
                                                      OpStore %108 %123 
                                         f32 %124 = OpLoad %108 
                                         f32 %126 = OpFMul %124 %125 
                                Private f32* %127 = OpAccessChain %52 %20 
                                                      OpStore %127 %126 
                                Private f32* %129 = OpAccessChain %52 %35 
                                                      OpStore %129 %128 
                                       f32_2 %130 = OpLoad %52 
                                       f32_4 %131 = OpLoad %110 
                                       f32_2 %132 = OpVectorShuffle %131 %131 0 1 
                                       f32_2 %133 = OpFAdd %130 %132 
                                                      OpStore %52 %133 
                  read_only Texture2DSampled %136 = OpLoad %135 
                                       f32_2 %137 = OpLoad %52 
                                       f32_4 %138 = OpImageSampleImplicitLod %136 %137 
                                                      OpStore %134 %138 
                                       f32_3 %139 = OpLoad %98 
                                Uniform f32* %141 = OpAccessChain %17 %140 
                                         f32 %142 = OpLoad %141 
                                       f32_3 %143 = OpCompositeConstruct %142 %142 %142 
                                       f32_3 %144 = OpFMul %139 %143 
                                                      OpStore %9 %144 
                                       f32_3 %145 = OpLoad %9 
                              Uniform f32_4* %148 = OpAccessChain %17 %146 
                                       f32_4 %149 = OpLoad %148 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                                       f32_3 %151 = OpFMul %145 %150 
                              Uniform f32_4* %153 = OpAccessChain %17 %152 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                       f32_3 %156 = OpFAdd %151 %155 
                                                      OpStore %9 %156 
                                       f32_3 %158 = OpLoad %9 
                                       f32_3 %160 = OpFMul %158 %159 
                                       f32_3 %163 = OpFAdd %160 %162 
                                                      OpStore %157 %163 
                                       f32_3 %165 = OpLoad %9 
                                       f32_3 %168 = OpFMul %165 %167 
                                       f32_4 %169 = OpLoad %134 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                                       f32_3 %171 = OpFAdd %168 %170 
                                                      OpStore %164 %171 
                                Private f32* %173 = OpAccessChain %134 %172 
                                         f32 %174 = OpLoad %173 
                                Uniform f32* %176 = OpAccessChain %17 %175 
                                         f32 %177 = OpLoad %176 
                                         f32 %178 = OpFMul %174 %177 
                                Private f32* %179 = OpAccessChain %9 %20 
                                                      OpStore %179 %178 
                                Private f32* %180 = OpAccessChain %9 %20 
                                         f32 %181 = OpLoad %180 
                                Uniform f32* %183 = OpAccessChain %17 %182 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFMul %181 %184 
                                Private f32* %186 = OpAccessChain %9 %20 
                                                      OpStore %186 %185 
                                       f32_3 %188 = OpLoad %157 
                                       f32_3 %189 = OpFNegate %188 
                                       f32_3 %190 = OpLoad %164 
                                       f32_3 %191 = OpFAdd %189 %190 
                                                      OpStore %187 %191 
                                       f32_3 %192 = OpLoad %9 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 0 0 
                                       f32_3 %194 = OpLoad %187 
                                       f32_3 %195 = OpFMul %193 %194 
                                       f32_3 %196 = OpLoad %157 
                                       f32_3 %197 = OpFAdd %195 %196 
                                                      OpStore %9 %197 
                                       f32_3 %198 = OpLoad %34 
                                       f32_2 %199 = OpVectorShuffle %198 %198 1 1 
                              Uniform f32_4* %202 = OpAccessChain %17 %200 %201 
                                       f32_4 %203 = OpLoad %202 
                                       f32_2 %204 = OpVectorShuffle %203 %203 0 1 
                                       f32_2 %205 = OpFMul %199 %204 
                                                      OpStore %52 %205 
                              Uniform f32_4* %206 = OpAccessChain %17 %200 %19 
                                       f32_4 %207 = OpLoad %206 
                                       f32_2 %208 = OpVectorShuffle %207 %207 0 1 
                                       f32_3 %209 = OpLoad %34 
                                       f32_2 %210 = OpVectorShuffle %209 %209 0 0 
                                       f32_2 %211 = OpFMul %208 %210 
                                       f32_2 %212 = OpLoad %52 
                                       f32_2 %213 = OpFAdd %211 %212 
                                                      OpStore %52 %213 
                              Uniform f32_4* %215 = OpAccessChain %17 %200 %214 
                                       f32_4 %216 = OpLoad %215 
                                       f32_2 %217 = OpVectorShuffle %216 %216 0 1 
                                       f32_3 %218 = OpLoad %34 
                                       f32_2 %219 = OpVectorShuffle %218 %218 2 2 
                                       f32_2 %220 = OpFMul %217 %219 
                                       f32_2 %221 = OpLoad %52 
                                       f32_2 %222 = OpFAdd %220 %221 
                                                      OpStore %52 %222 
                                       f32_2 %223 = OpLoad %52 
                              Uniform f32_4* %225 = OpAccessChain %17 %200 %224 
                                       f32_4 %226 = OpLoad %225 
                                       f32_2 %227 = OpVectorShuffle %226 %226 0 1 
                                       f32_2 %228 = OpFAdd %223 %227 
                                                      OpStore %52 %228 
                                Uniform f32* %232 = OpAccessChain %17 %214 %20 
                                         f32 %233 = OpLoad %232 
                                        bool %235 = OpFOrdEqual %233 %234 
                                                      OpStore %231 %235 
                                                      OpSelectionMerge %238 None 
                                                      OpBranchConditional %236 %237 %238 
                                             %237 = OpLabel 
                                        bool %239 = OpLoad %231 
                                                      OpSelectionMerge %241 None 
                                                      OpBranchConditional %239 %240 %241 
                                             %240 = OpLabel 
                                                      OpBranch %241 
                                             %241 = OpLabel 
                                                      OpBranch %238 
                                             %238 = OpLabel 
                                                      OpSelectionMerge %244 None 
                                                      OpBranchConditional %242 %243 %340 
                                             %243 = OpLabel 
                                Uniform f32* %245 = OpAccessChain %17 %214 %35 
                                         f32 %246 = OpLoad %245 
                                        bool %247 = OpFOrdEqual %246 %234 
                                                      OpStore %231 %247 
                                       f32_3 %248 = OpLoad %34 
                                       f32_3 %249 = OpVectorShuffle %248 %248 1 1 1 
                              Uniform f32_4* %250 = OpAccessChain %17 %224 %201 
                                       f32_4 %251 = OpLoad %250 
                                       f32_3 %252 = OpVectorShuffle %251 %251 0 1 2 
                                       f32_3 %253 = OpFMul %249 %252 
                                       f32_4 %254 = OpLoad %58 
                                       f32_4 %255 = OpVectorShuffle %254 %253 4 5 6 3 
                                                      OpStore %58 %255 
                              Uniform f32_4* %256 = OpAccessChain %17 %224 %19 
                                       f32_4 %257 = OpLoad %256 
                                       f32_3 %258 = OpVectorShuffle %257 %257 0 1 2 
                                       f32_3 %259 = OpLoad %34 
                                       f32_3 %260 = OpVectorShuffle %259 %259 0 0 0 
                                       f32_3 %261 = OpFMul %258 %260 
                                       f32_4 %262 = OpLoad %58 
                                       f32_3 %263 = OpVectorShuffle %262 %262 0 1 2 
                                       f32_3 %264 = OpFAdd %261 %263 
                                       f32_4 %265 = OpLoad %58 
                                       f32_4 %266 = OpVectorShuffle %265 %264 4 5 6 3 
                                                      OpStore %58 %266 
                              Uniform f32_4* %267 = OpAccessChain %17 %224 %214 
                                       f32_4 %268 = OpLoad %267 
                                       f32_3 %269 = OpVectorShuffle %268 %268 0 1 2 
                                       f32_3 %270 = OpLoad %34 
                                       f32_3 %271 = OpVectorShuffle %270 %270 2 2 2 
                                       f32_3 %272 = OpFMul %269 %271 
                                       f32_4 %273 = OpLoad %58 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                                       f32_3 %275 = OpFAdd %272 %274 
                                       f32_4 %276 = OpLoad %58 
                                       f32_4 %277 = OpVectorShuffle %276 %275 4 5 6 3 
                                                      OpStore %58 %277 
                                       f32_4 %278 = OpLoad %58 
                                       f32_3 %279 = OpVectorShuffle %278 %278 0 1 2 
                              Uniform f32_4* %280 = OpAccessChain %17 %224 %224 
                                       f32_4 %281 = OpLoad %280 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 1 2 
                                       f32_3 %283 = OpFAdd %279 %282 
                                       f32_4 %284 = OpLoad %58 
                                       f32_4 %285 = OpVectorShuffle %284 %283 4 5 6 3 
                                                      OpStore %58 %285 
                                        bool %288 = OpLoad %231 
                                                      OpSelectionMerge %290 None 
                                                      OpBranchConditional %288 %289 %293 
                                             %289 = OpLabel 
                                       f32_4 %291 = OpLoad %58 
                                       f32_3 %292 = OpVectorShuffle %291 %291 0 1 2 
                                                      OpStore %287 %292 
                                                      OpBranch %290 
                                             %293 = OpLabel 
                                       f32_3 %294 = OpLoad %34 
                                                      OpStore %287 %294 
                                                      OpBranch %290 
                                             %290 = OpLabel 
                                       f32_3 %295 = OpLoad %287 
                                       f32_4 %296 = OpLoad %58 
                                       f32_4 %297 = OpVectorShuffle %296 %295 4 5 6 3 
                                                      OpStore %58 %297 
                                       f32_4 %298 = OpLoad %58 
                                       f32_3 %299 = OpVectorShuffle %298 %298 0 1 2 
                              Uniform f32_3* %302 = OpAccessChain %17 %300 
                                       f32_3 %303 = OpLoad %302 
                                       f32_3 %304 = OpFNegate %303 
                                       f32_3 %305 = OpFAdd %299 %304 
                                       f32_4 %306 = OpLoad %58 
                                       f32_4 %307 = OpVectorShuffle %306 %305 4 5 6 3 
                                                      OpStore %58 %307 
                                       f32_4 %308 = OpLoad %58 
                                       f32_3 %309 = OpVectorShuffle %308 %308 0 1 2 
                              Uniform f32_3* %311 = OpAccessChain %17 %310 
                                       f32_3 %312 = OpLoad %311 
                                       f32_3 %313 = OpFMul %309 %312 
                                       f32_4 %314 = OpLoad %58 
                                       f32_4 %315 = OpVectorShuffle %314 %313 0 4 5 6 
                                                      OpStore %58 %315 
                                Private f32* %316 = OpAccessChain %58 %35 
                                         f32 %317 = OpLoad %316 
                                         f32 %319 = OpFMul %317 %318 
                                         f32 %320 = OpFAdd %319 %166 
                                                      OpStore %108 %320 
                                Uniform f32* %322 = OpAccessChain %17 %214 %115 
                                         f32 %323 = OpLoad %322 
                                         f32 %324 = OpFMul %323 %90 
                                         f32 %325 = OpFAdd %324 %166 
                                                      OpStore %321 %325 
                                         f32 %326 = OpLoad %108 
                                         f32 %327 = OpLoad %321 
                                         f32 %328 = OpExtInst %1 40 %326 %327 
                                Private f32* %329 = OpAccessChain %58 %20 
                                                      OpStore %329 %328 
                  read_only Texture3DSampled %334 = OpLoad %333 
                                       f32_4 %335 = OpLoad %58 
                                       f32_3 %336 = OpVectorShuffle %335 %335 0 2 3 
                                       f32_4 %337 = OpImageSampleImplicitLod %334 %336 
                                                      OpStore %58 %337 
                                       f32_4 %339 = OpLoad %58 
                                                      OpStore %338 %339 
                                                      OpBranch %244 
                                             %340 = OpLabel 
                                Private f32* %341 = OpAccessChain %338 %20 
                                                      OpStore %341 %234 
                                Private f32* %342 = OpAccessChain %338 %35 
                                                      OpStore %342 %234 
                                Private f32* %343 = OpAccessChain %338 %115 
                                                      OpStore %343 %234 
                                Private f32* %344 = OpAccessChain %338 %172 
                                                      OpStore %344 %234 
                                                      OpBranch %244 
                                             %244 = OpLabel 
                                       f32_4 %345 = OpLoad %338 
                              Uniform f32_4* %346 = OpAccessChain %17 %201 
                                       f32_4 %347 = OpLoad %346 
                                         f32 %348 = OpDot %345 %347 
                                Private f32* %349 = OpAccessChain %157 %20 
                                                      OpStore %349 %348 
                                Private f32* %350 = OpAccessChain %157 %20 
                                         f32 %351 = OpLoad %350 
                                         f32 %352 = OpExtInst %1 43 %351 %128 %234 
                                Private f32* %353 = OpAccessChain %157 %20 
                                                      OpStore %353 %352 
                  read_only Texture2DSampled %355 = OpLoad %354 
                                       f32_2 %356 = OpLoad %52 
                                       f32_4 %357 = OpImageSampleImplicitLod %355 %356 
                                         f32 %358 = OpCompositeExtract %357 3 
                                                      OpStore %108 %358 
                                Private f32* %359 = OpAccessChain %157 %20 
                                         f32 %360 = OpLoad %359 
                                         f32 %361 = OpLoad %108 
                                         f32 %362 = OpFMul %360 %361 
                                                      OpStore %108 %362 
                                       f32_3 %363 = OpLoad %9 
                              Uniform f32_4* %365 = OpAccessChain %17 %364 
                                       f32_4 %366 = OpLoad %365 
                                       f32_3 %367 = OpVectorShuffle %366 %366 0 1 2 
                                       f32_3 %368 = OpFMul %363 %367 
                                                      OpStore %157 %368 
                                         f32 %371 = OpLoad %108 
                                       f32_3 %372 = OpCompositeConstruct %371 %371 %371 
                                       f32_3 %373 = OpLoad %157 
                                       f32_3 %374 = OpFMul %372 %373 
                                       f32_4 %375 = OpLoad %370 
                                       f32_4 %376 = OpVectorShuffle %375 %374 4 5 6 3 
                                                      OpStore %370 %376 
                                Uniform f32* %377 = OpAccessChain %17 %152 %172 
                                         f32 %378 = OpLoad %377 
                                 Output f32* %380 = OpAccessChain %370 %172 
                                                      OpStore %380 %378 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" }
""
}
SubProgram "vulkan " {
Keywords { "POINT" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" }
""
}
SubProgram "vulkan " {
Keywords { "SPOT" }
""
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "vulkan " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
}
}
 Pass {
  Name "META"
  LOD 110
  Tags { "IGNOREPROJECTOR" = "False" "LIGHTMODE" = "META" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" "UnlitTilted" = "UnlitTilted" }
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  Lighting On
  GpuProgramID 145051
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "EDITOR_VISUALIZATION" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_DynamicLightmapST;
uniform 	bvec4 unity_MetaVertexControl;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD1;
in  vec4 in_TEXCOORD2;
out vec3 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb6;
void main()
{
    u_xlatb0 = 0.0<in_POSITION0.z;
    u_xlat0.z = u_xlatb0 ? 9.99999975e-005 : float(0.0);
    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    u_xlat0.xyz = (unity_MetaVertexControl.x) ? u_xlat0.xyz : in_POSITION0.xyz;
    u_xlatb6 = 0.0<u_xlat0.z;
    u_xlat1.z = u_xlatb6 ? 9.99999975e-005 : float(0.0);
    u_xlat1.xy = in_TEXCOORD2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
    u_xlat0.xyz = (unity_MetaVertexControl.y) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	float _CausticScale;
uniform 	vec4 _CausticColor;
uniform 	float _ReflPower;
uniform 	float _TimeScale;
uniform 	vec4 _LightCausticColor;
uniform 	float _LightCausticPower;
uniform 	float _GlobalReflectionsEnabled;
uniform 	int unity_VisualizationMode;
uniform 	int _CheckAlbedo;
uniform 	vec4 _AlbedoCompareColor;
uniform 	float _AlbedoMinLuminance;
uniform 	float _AlbedoMaxLuminance;
uniform 	float _AlbedoHueTolerance;
uniform 	float _AlbedoSaturationTolerance;
uniform 	vec4 unity_MaterialValidateLowColor;
uniform 	vec4 unity_MaterialValidateHighColor;
uniform  sampler2D _CausticTex;
uniform  sampler2D _ReflMapFromPixelator;
in  vec3 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat10_1;
bvec3 u_xlatb1;
vec3 u_xlat2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec2 u_xlat6;
bool u_xlatb6;
float u_xlat7;
bvec3 u_xlatb7;
float u_xlat8;
vec2 u_xlat9;
vec2 u_xlat10;
vec2 u_xlat12;
bool u_xlatb12;
bool u_xlatb13;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
void main()
{
    if(unity_VisualizationMode == 0) {
        u_xlat0.x = _Time.x * _TimeScale;
        u_xlat6.x = vs_TEXCOORD0.y + vs_TEXCOORD0.x;
        u_xlat6.x = _Time.y * _TimeScale + u_xlat6.x;
        u_xlat1.x = sin(u_xlat6.x);
        u_xlat2.x = cos(u_xlat6.x);
        u_xlat2.x = u_xlat2.x * 0.111111112;
        u_xlat2.y = u_xlat1.x * 0.166666672;
        u_xlat6.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat6.xy = u_xlat6.xy * vec2(_CausticScale);
        u_xlat6.xy = u_xlat6.xy * vec2(0.200000003, 0.200000003);
        u_xlat0.xy = u_xlat0.xx * vec2(0.5, 0.125) + u_xlat6.xy;
        u_xlat10_0 = texture(_CausticTex, u_xlat0.xy);
        u_xlat18 = vs_TEXCOORD1.y * 500.0;
        u_xlat18 = _Time.z * 5.0 + u_xlat18;
        u_xlat18 = sin(u_xlat18);
        u_xlat1.x = u_xlat18 * 0.00150000001;
        u_xlat1.y = 0.0;
        u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD1.xy;
        u_xlat10_1 = texture(_ReflMapFromPixelator, u_xlat1.xy);
        u_xlat0.xyz = u_xlat10_0.xyz * vec3(_LightCausticPower);
        u_xlat0.xyz = u_xlat0.xyz * _LightCausticColor.xyz + _CausticColor.xyz;
        u_xlat2.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.0500000007, 0.0500000007, 0.0500000007);
        u_xlat0.xyz = u_xlat0.xyz * vec3(0.75, 0.75, 0.75) + u_xlat10_1.xyz;
        u_xlat18 = u_xlat10_1.w * _ReflPower;
        u_xlat18 = u_xlat18 * _GlobalReflectionsEnabled;
        u_xlat0.xyz = (-u_xlat2.xyz) + u_xlat0.xyz;
        u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz + u_xlat2.xyz;
        u_xlatb1.xyz = greaterThanEqual(vec4(0.0404499993, 0.0404499993, 0.0404499993, 0.0), u_xlat0.xyzx).xyz;
        u_xlat2.xyz = u_xlat0.xyz * vec3(0.0773993805, 0.0773993805, 0.0773993805);
        u_xlatb3.xyz = lessThan(u_xlat0.xyzx, vec4(1.0, 1.0, 1.0, 0.0)).xyz;
        u_xlat4.xyz = u_xlat0.xyz + vec3(0.0549999997, 0.0549999997, 0.0549999997);
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.947867334, 0.947867334, 0.947867334);
        u_xlat4.xyz = log2(u_xlat4.xyz);
        u_xlat4.xyz = u_xlat4.xyz * vec3(2.4000001, 2.4000001, 2.4000001);
        u_xlat4.xyz = exp2(u_xlat4.xyz);
        u_xlat5.xyz = log2(u_xlat0.xyz);
        u_xlat5.xyz = u_xlat5.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat5.xyz = exp2(u_xlat5.xyz);
        u_xlat3.x = (u_xlatb3.x) ? u_xlat4.x : u_xlat5.x;
        u_xlat3.y = (u_xlatb3.y) ? u_xlat4.y : u_xlat5.y;
        u_xlat3.z = (u_xlatb3.z) ? u_xlat4.z : u_xlat5.z;
        u_xlat1.x = (u_xlatb1.x) ? u_xlat2.x : u_xlat3.x;
        u_xlat1.y = (u_xlatb1.y) ? u_xlat2.y : u_xlat3.y;
        u_xlat1.z = (u_xlatb1.z) ? u_xlat2.z : u_xlat3.z;
        u_xlat2.x = dot(u_xlat1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat18 = dot(u_xlat1.xyz, vec3(0.333299994, 0.333299994, 0.333299994));
        u_xlat18 = (_CheckAlbedo != 0) ? u_xlat2.x : u_xlat18;
        if(_CheckAlbedo == 0) {
            u_xlatb1.x = u_xlat18<0.0120000001;
            u_xlatb7.x = 0.899999976<u_xlat18;
            u_xlat2.y = 0.0;
            u_xlat3 = (u_xlatb7.x) ? unity_MaterialValidateHighColor : u_xlat2.xxxy;
            SV_Target0 = (u_xlatb1.x) ? unity_MaterialValidateLowColor : u_xlat3;
        } else {
            u_xlatb1.x = u_xlat18<_AlbedoMinLuminance;
            if(u_xlatb1.x){
                SV_Target0 = unity_MaterialValidateLowColor;
            } else {
                u_xlatb18 = _AlbedoMaxLuminance<u_xlat18;
                if(u_xlatb18){
                    SV_Target0 = unity_MaterialValidateHighColor;
                } else {
                    u_xlatb1.xy = lessThan(u_xlat0.yxyy, u_xlat0.zzzz).xy;
                    u_xlatb18 = u_xlatb1.y && u_xlatb1.x;
                    if(u_xlatb18){
                        u_xlatb18 = u_xlat0.z!=0.0;
                        u_xlatb1.x = u_xlat0.y<u_xlat0.x;
                        u_xlat1.x = (u_xlatb1.x) ? u_xlat0.y : u_xlat0.x;
                        u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
                        u_xlatb13 = u_xlat1.x!=0.0;
                        u_xlat9.y = u_xlat1.x / u_xlat0.z;
                        u_xlat19 = (-u_xlat0.y) + u_xlat0.x;
                        u_xlat1.x = u_xlat19 / u_xlat1.x;
                        u_xlat9.x = u_xlat1.x + 4.0;
                        u_xlat10.x = u_xlat19 + 4.0;
                        u_xlat10.y = 0.0;
                        u_xlat3.yz = (bool(u_xlatb13)) ? u_xlat9.xy : u_xlat10.xy;
                        u_xlat1.x = u_xlat3.y * 0.166666672;
                        u_xlatb13 = u_xlat3.y<36.0;
                        u_xlat19 = u_xlat3.y * 0.166666672 + 1.0;
                        u_xlat3.x = (u_xlatb13) ? u_xlat19 : u_xlat1.x;
                        u_xlat1.xz = mix(vec2(0.0, 0.0), u_xlat3.xz, vec2(bvec2(u_xlatb18)));
                    } else {
                        u_xlatb18 = u_xlat0.x<u_xlat0.y;
                        if(u_xlatb18){
                            u_xlatb18 = u_xlat0.y!=0.0;
                            u_xlat7 = (u_xlatb1.y) ? u_xlat0.x : u_xlat0.z;
                            u_xlat7 = u_xlat0.y + (-u_xlat7);
                            u_xlatb19 = u_xlat7!=0.0;
                            u_xlat9.y = u_xlat7 / u_xlat0.y;
                            u_xlat8 = (-u_xlat0.x) + u_xlat0.z;
                            u_xlat7 = u_xlat8 / u_xlat7;
                            u_xlat9.x = u_xlat7 + 2.0;
                            u_xlat10.x = u_xlat8 + 2.0;
                            u_xlat10.y = 0.0;
                            u_xlat3.yz = (bool(u_xlatb19)) ? u_xlat9.xy : u_xlat10.xy;
                            u_xlat7 = u_xlat3.y * 0.166666672;
                            u_xlatb19 = u_xlat3.y<36.0;
                            u_xlat8 = u_xlat3.y * 0.166666672 + 1.0;
                            u_xlat3.x = (u_xlatb19) ? u_xlat8 : u_xlat7;
                            u_xlat1.xz = mix(vec2(0.0, 0.0), u_xlat3.xz, vec2(bvec2(u_xlatb18)));
                        } else {
                            u_xlatb18 = u_xlat0.x!=0.0;
                            u_xlatb7.x = u_xlat0.z<u_xlat0.y;
                            u_xlat7 = (u_xlatb7.x) ? u_xlat0.z : u_xlat0.y;
                            u_xlat7 = u_xlat0.x + (-u_xlat7);
                            u_xlatb19 = u_xlat7!=0.0;
                            u_xlat9.y = u_xlat7 / u_xlat0.x;
                            u_xlat6.x = (-u_xlat0.z) + u_xlat0.y;
                            u_xlat9.x = u_xlat6.x / u_xlat7;
                            u_xlat6.y = 0.0;
                            u_xlat0.yz = (bool(u_xlatb19)) ? u_xlat9.xy : u_xlat6.xy;
                            u_xlat7 = u_xlat0.y * 0.166666672;
                            u_xlatb19 = u_xlat0.y<36.0;
                            u_xlat6.x = u_xlat0.y * 0.166666672 + 1.0;
                            u_xlat0.x = (u_xlatb19) ? u_xlat6.x : u_xlat7;
                            u_xlat1.xz = mix(vec2(0.0, 0.0), u_xlat0.xz, vec2(bvec2(u_xlatb18)));
                        //ENDIF
                        }
                    //ENDIF
                    }
                    u_xlatb0.xy = lessThan(_AlbedoCompareColor.yxyy, _AlbedoCompareColor.zzzz).xy;
                    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
                    if(u_xlatb0.x){
                        u_xlatb0.x = _AlbedoCompareColor.z!=0.0;
                        u_xlat6.x = min(_AlbedoCompareColor.y, _AlbedoCompareColor.x);
                        u_xlat6.x = (-u_xlat6.x) + _AlbedoCompareColor.z;
                        u_xlatb12 = u_xlat6.x!=0.0;
                        u_xlat9.y = u_xlat6.x / _AlbedoCompareColor.z;
                        u_xlat18 = (-_AlbedoCompareColor.y) + _AlbedoCompareColor.x;
                        u_xlat6.x = u_xlat18 / u_xlat6.x;
                        u_xlat9.x = u_xlat6.x + 4.0;
                        u_xlat10.x = u_xlat18 + 4.0;
                        u_xlat10.y = 0.0;
                        u_xlat3.yz = (bool(u_xlatb12)) ? u_xlat9.xy : u_xlat10.xy;
                        u_xlat6.x = u_xlat3.y * 0.166666672;
                        u_xlatb12 = u_xlat3.y<36.0;
                        u_xlat18 = u_xlat3.y * 0.166666672 + 1.0;
                        u_xlat3.x = (u_xlatb12) ? u_xlat18 : u_xlat6.x;
                        u_xlat0.xy = mix(vec2(0.0, 0.0), u_xlat3.xz, vec2(u_xlatb0.xx));
                    } else {
                        u_xlatb12 = _AlbedoCompareColor.x<_AlbedoCompareColor.y;
                        if(u_xlatb12){
                            u_xlatb12 = _AlbedoCompareColor.y!=0.0;
                            u_xlat18 = min(_AlbedoCompareColor.x, _AlbedoCompareColor.z);
                            u_xlat18 = (-u_xlat18) + _AlbedoCompareColor.y;
                            u_xlatb7.x = u_xlat18!=0.0;
                            u_xlat9.y = u_xlat18 / _AlbedoCompareColor.y;
                            u_xlat19 = (-_AlbedoCompareColor.x) + _AlbedoCompareColor.z;
                            u_xlat18 = u_xlat19 / u_xlat18;
                            u_xlat9.x = u_xlat18 + 2.0;
                            u_xlat10.x = u_xlat19 + 2.0;
                            u_xlat10.y = 0.0;
                            u_xlat3.yz = (u_xlatb7.x) ? u_xlat9.xy : u_xlat10.xy;
                            u_xlat18 = u_xlat3.y * 0.166666672;
                            u_xlatb7.x = u_xlat3.y<36.0;
                            u_xlat19 = u_xlat3.y * 0.166666672 + 1.0;
                            u_xlat3.x = (u_xlatb7.x) ? u_xlat19 : u_xlat18;
                            u_xlat0.xy = mix(vec2(0.0, 0.0), u_xlat3.xz, vec2(bvec2(u_xlatb12)));
                        } else {
                            u_xlatb12 = _AlbedoCompareColor.x!=0.0;
                            u_xlat18 = min(_AlbedoCompareColor.z, _AlbedoCompareColor.y);
                            u_xlat18 = (-u_xlat18) + _AlbedoCompareColor.x;
                            u_xlatb7.x = u_xlat18!=0.0;
                            u_xlat9.y = u_xlat18 / _AlbedoCompareColor.x;
                            u_xlat10.x = (-_AlbedoCompareColor.z) + _AlbedoCompareColor.y;
                            u_xlat9.x = u_xlat10.x / u_xlat18;
                            u_xlat10.y = 0.0;
                            u_xlat3.yz = (u_xlatb7.x) ? u_xlat9.xy : u_xlat10.xy;
                            u_xlat18 = u_xlat3.y * 0.166666672;
                            u_xlatb7.x = u_xlat3.y<36.0;
                            u_xlat19 = u_xlat3.y * 0.166666672 + 1.0;
                            u_xlat3.x = (u_xlatb7.x) ? u_xlat19 : u_xlat18;
                            u_xlat0.xy = mix(vec2(0.0, 0.0), u_xlat3.xz, vec2(bvec2(u_xlatb12)));
                        //ENDIF
                        }
                    //ENDIF
                    }
                    u_xlat12.xy = u_xlat0.yx + (-vec2(_AlbedoSaturationTolerance, _AlbedoHueTolerance));
                    u_xlatb7.xz = lessThan(u_xlat1.zzxx, u_xlat12.xxyy).xz;
                    u_xlat12.x = u_xlat12.y + 1.0;
                    u_xlatb12 = u_xlat1.x<u_xlat12.x;
                    u_xlatb12 = u_xlatb12 && u_xlatb7.z;
                    u_xlatb12 = u_xlatb12 || u_xlatb7.x;
                    u_xlat0.xy = u_xlat0.yx + vec2(_AlbedoSaturationTolerance, _AlbedoHueTolerance);
                    u_xlatb0.xw = lessThan(u_xlat0.xxxy, u_xlat1.zzzx).xw;
                    u_xlat6.x = u_xlat0.y + -1.0;
                    u_xlatb6 = u_xlat6.x<u_xlat1.x;
                    u_xlatb6 = u_xlatb6 && u_xlatb0.w;
                    u_xlatb0.x = u_xlatb6 || u_xlatb0.x;
                    u_xlat2.z = 0.0;
                    u_xlat1 = (u_xlatb0.x) ? unity_MaterialValidateHighColor : u_xlat2.xxxz;
                    SV_Target0 = (bool(u_xlatb12)) ? unity_MaterialValidateLowColor : u_xlat1;
                //ENDIF
                }
            //ENDIF
            }
        //ENDIF
        }
    } else {
        u_xlatb0.x = unity_VisualizationMode==1;
        SV_Target0 = mix(vec4(0.0, 0.0, 0.0, 0.0), unity_MaterialValidateLowColor, vec4(u_xlatb0.xxxx));
    //ENDIF
    }
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "EDITOR_VISUALIZATION" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 251
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %13 %32 %89 %174 %209 %233 
                                                      OpDecorate %13 Location 13 
                                                      OpDecorate %32 Location 32 
                                                      OpDecorate %37 ArrayStride 37 
                                                      OpDecorate %38 ArrayStride 38 
                                                      OpMemberDecorate %40 0 Offset 40 
                                                      OpMemberDecorate %40 1 Offset 40 
                                                      OpMemberDecorate %40 2 Offset 40 
                                                      OpMemberDecorate %40 3 Offset 40 
                                                      OpMemberDecorate %40 4 Offset 40 
                                                      OpMemberDecorate %40 5 Offset 40 
                                                      OpDecorate %40 Block 
                                                      OpDecorate %42 DescriptorSet 42 
                                                      OpDecorate %42 Binding 42 
                                                      OpDecorate %89 Location 89 
                                                      OpMemberDecorate %172 0 BuiltIn 172 
                                                      OpMemberDecorate %172 1 BuiltIn 172 
                                                      OpMemberDecorate %172 2 BuiltIn 172 
                                                      OpDecorate %172 Block 
                                                      OpDecorate %209 Location 209 
                                                      OpDecorate %233 Location 233 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeBool 
                                               %7 = OpTypePointer Private %6 
                                 Private bool* %8 = OpVariable Private 
                                               %9 = OpTypeFloat 32 
                                          f32 %10 = OpConstant 3.67402E-40 
                                              %11 = OpTypeVector %9 4 
                                              %12 = OpTypePointer Input %11 
                                 Input f32_4* %13 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 2 
                                              %16 = OpTypePointer Input %9 
                                              %20 = OpTypePointer Private %11 
                               Private f32_4* %21 = OpVariable Private 
                                              %22 = OpTypePointer Function %9 
                                          f32 %27 = OpConstant 3.67402E-40 
                                              %30 = OpTypePointer Private %9 
                                 Input f32_4* %32 = OpVariable Input 
                                              %33 = OpTypeVector %9 2 
                                          u32 %36 = OpConstant 4 
                                              %37 = OpTypeArray %11 %36 
                                              %38 = OpTypeArray %11 %36 
                                              %39 = OpTypeVector %14 4 
                                              %40 = OpTypeStruct %11 %37 %38 %11 %11 %39 
                                              %41 = OpTypePointer Uniform %40 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4; f32_4; u32_4;}* %42 = OpVariable Uniform 
                                              %43 = OpTypeInt 32 1 
                                          i32 %44 = OpConstant 3 
                                              %45 = OpTypePointer Uniform %11 
                                              %56 = OpTypeVector %9 3 
                                              %57 = OpTypePointer Function %56 
                                          i32 %59 = OpConstant 5 
                                              %60 = OpTypeVector %6 4 
                                              %61 = OpTypePointer Uniform %39 
                                          u32 %65 = OpConstant 0 
                                Private bool* %77 = OpVariable Private 
                               Private f32_4* %81 = OpVariable Private 
                                 Input f32_4* %89 = OpVariable Input 
                                          i32 %92 = OpConstant 4 
                                         i32 %120 = OpConstant 1 
                                         i32 %124 = OpConstant 0 
                                         i32 %132 = OpConstant 2 
                                         u32 %170 = OpConstant 1 
                                             %171 = OpTypeArray %9 %170 
                                             %172 = OpTypeStruct %11 %9 %171 
                                             %173 = OpTypePointer Output %172 
        Output struct {f32_4; f32; f32[1];}* %174 = OpVariable Output 
                                             %176 = OpTypePointer Output %11 
                                             %208 = OpTypePointer Output %56 
                               Output f32_3* %209 = OpVariable Output 
                                             %221 = OpTypePointer Uniform %9 
                                         f32 %228 = OpConstant 3.67402E-40 
                                       f32_3 %229 = OpConstantComposite %228 %228 %228 
                               Output f32_4* %233 = OpVariable Output 
                                             %245 = OpTypePointer Output %9 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function f32* %23 = OpVariable Function 
                              Function f32_3* %58 = OpVariable Function 
                                Function f32* %82 = OpVariable Function 
                             Function f32_3* %103 = OpVariable Function 
                                   Input f32* %17 = OpAccessChain %13 %15 
                                          f32 %18 = OpLoad %17 
                                         bool %19 = OpFOrdLessThan %10 %18 
                                                      OpStore %8 %19 
                                         bool %24 = OpLoad %8 
                                                      OpSelectionMerge %26 None 
                                                      OpBranchConditional %24 %25 %28 
                                              %25 = OpLabel 
                                                      OpStore %23 %27 
                                                      OpBranch %26 
                                              %28 = OpLabel 
                                                      OpStore %23 %10 
                                                      OpBranch %26 
                                              %26 = OpLabel 
                                          f32 %29 = OpLoad %23 
                                 Private f32* %31 = OpAccessChain %21 %15 
                                                      OpStore %31 %29 
                                        f32_4 %34 = OpLoad %32 
                                        f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               Uniform f32_4* %46 = OpAccessChain %42 %44 
                                        f32_4 %47 = OpLoad %46 
                                        f32_2 %48 = OpVectorShuffle %47 %47 0 1 
                                        f32_2 %49 = OpFMul %35 %48 
                               Uniform f32_4* %50 = OpAccessChain %42 %44 
                                        f32_4 %51 = OpLoad %50 
                                        f32_2 %52 = OpVectorShuffle %51 %51 2 3 
                                        f32_2 %53 = OpFAdd %49 %52 
                                        f32_4 %54 = OpLoad %21 
                                        f32_4 %55 = OpVectorShuffle %54 %53 4 5 2 3 
                                                      OpStore %21 %55 
                               Uniform u32_4* %62 = OpAccessChain %42 %59 
                                        u32_4 %63 = OpLoad %62 
                                          u32 %64 = OpCompositeExtract %63 0 
                                         bool %66 = OpINotEqual %64 %65 
                                                      OpSelectionMerge %68 None 
                                                      OpBranchConditional %66 %67 %71 
                                              %67 = OpLabel 
                                        f32_4 %69 = OpLoad %21 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                                                      OpStore %58 %70 
                                                      OpBranch %68 
                                              %71 = OpLabel 
                                        f32_4 %72 = OpLoad %13 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                                      OpStore %58 %73 
                                                      OpBranch %68 
                                              %68 = OpLabel 
                                        f32_3 %74 = OpLoad %58 
                                        f32_4 %75 = OpLoad %21 
                                        f32_4 %76 = OpVectorShuffle %75 %74 4 5 6 3 
                                                      OpStore %21 %76 
                                 Private f32* %78 = OpAccessChain %21 %15 
                                          f32 %79 = OpLoad %78 
                                         bool %80 = OpFOrdLessThan %10 %79 
                                                      OpStore %77 %80 
                                         bool %83 = OpLoad %77 
                                                      OpSelectionMerge %85 None 
                                                      OpBranchConditional %83 %84 %86 
                                              %84 = OpLabel 
                                                      OpStore %82 %27 
                                                      OpBranch %85 
                                              %86 = OpLabel 
                                                      OpStore %82 %10 
                                                      OpBranch %85 
                                              %85 = OpLabel 
                                          f32 %87 = OpLoad %82 
                                 Private f32* %88 = OpAccessChain %81 %15 
                                                      OpStore %88 %87 
                                        f32_4 %90 = OpLoad %89 
                                        f32_2 %91 = OpVectorShuffle %90 %90 0 1 
                               Uniform f32_4* %93 = OpAccessChain %42 %92 
                                        f32_4 %94 = OpLoad %93 
                                        f32_2 %95 = OpVectorShuffle %94 %94 0 1 
                                        f32_2 %96 = OpFMul %91 %95 
                               Uniform f32_4* %97 = OpAccessChain %42 %92 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 2 3 
                                       f32_2 %100 = OpFAdd %96 %99 
                                       f32_4 %101 = OpLoad %81 
                                       f32_4 %102 = OpVectorShuffle %101 %100 4 5 2 3 
                                                      OpStore %81 %102 
                              Uniform u32_4* %104 = OpAccessChain %42 %59 
                                       u32_4 %105 = OpLoad %104 
                                         u32 %106 = OpCompositeExtract %105 1 
                                        bool %107 = OpINotEqual %106 %65 
                                                      OpSelectionMerge %109 None 
                                                      OpBranchConditional %107 %108 %112 
                                             %108 = OpLabel 
                                       f32_4 %110 = OpLoad %81 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                                      OpStore %103 %111 
                                                      OpBranch %109 
                                             %112 = OpLabel 
                                       f32_4 %113 = OpLoad %21 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                                      OpStore %103 %114 
                                                      OpBranch %109 
                                             %109 = OpLabel 
                                       f32_3 %115 = OpLoad %103 
                                       f32_4 %116 = OpLoad %21 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 6 3 
                                                      OpStore %21 %117 
                                       f32_4 %118 = OpLoad %21 
                                       f32_4 %119 = OpVectorShuffle %118 %118 1 1 1 1 
                              Uniform f32_4* %121 = OpAccessChain %42 %120 %120 
                                       f32_4 %122 = OpLoad %121 
                                       f32_4 %123 = OpFMul %119 %122 
                                                      OpStore %81 %123 
                              Uniform f32_4* %125 = OpAccessChain %42 %120 %124 
                                       f32_4 %126 = OpLoad %125 
                                       f32_4 %127 = OpLoad %21 
                                       f32_4 %128 = OpVectorShuffle %127 %127 0 0 0 0 
                                       f32_4 %129 = OpFMul %126 %128 
                                       f32_4 %130 = OpLoad %81 
                                       f32_4 %131 = OpFAdd %129 %130 
                                                      OpStore %81 %131 
                              Uniform f32_4* %133 = OpAccessChain %42 %120 %132 
                                       f32_4 %134 = OpLoad %133 
                                       f32_4 %135 = OpLoad %21 
                                       f32_4 %136 = OpVectorShuffle %135 %135 2 2 2 2 
                                       f32_4 %137 = OpFMul %134 %136 
                                       f32_4 %138 = OpLoad %81 
                                       f32_4 %139 = OpFAdd %137 %138 
                                                      OpStore %21 %139 
                                       f32_4 %140 = OpLoad %21 
                              Uniform f32_4* %141 = OpAccessChain %42 %120 %44 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpFAdd %140 %142 
                                                      OpStore %21 %143 
                                       f32_4 %144 = OpLoad %21 
                                       f32_4 %145 = OpVectorShuffle %144 %144 1 1 1 1 
                              Uniform f32_4* %146 = OpAccessChain %42 %132 %120 
                                       f32_4 %147 = OpLoad %146 
                                       f32_4 %148 = OpFMul %145 %147 
                                                      OpStore %81 %148 
                              Uniform f32_4* %149 = OpAccessChain %42 %132 %124 
                                       f32_4 %150 = OpLoad %149 
                                       f32_4 %151 = OpLoad %21 
                                       f32_4 %152 = OpVectorShuffle %151 %151 0 0 0 0 
                                       f32_4 %153 = OpFMul %150 %152 
                                       f32_4 %154 = OpLoad %81 
                                       f32_4 %155 = OpFAdd %153 %154 
                                                      OpStore %81 %155 
                              Uniform f32_4* %156 = OpAccessChain %42 %132 %132 
                                       f32_4 %157 = OpLoad %156 
                                       f32_4 %158 = OpLoad %21 
                                       f32_4 %159 = OpVectorShuffle %158 %158 2 2 2 2 
                                       f32_4 %160 = OpFMul %157 %159 
                                       f32_4 %161 = OpLoad %81 
                                       f32_4 %162 = OpFAdd %160 %161 
                                                      OpStore %81 %162 
                              Uniform f32_4* %163 = OpAccessChain %42 %132 %44 
                                       f32_4 %164 = OpLoad %163 
                                       f32_4 %165 = OpLoad %21 
                                       f32_4 %166 = OpVectorShuffle %165 %165 3 3 3 3 
                                       f32_4 %167 = OpFMul %164 %166 
                                       f32_4 %168 = OpLoad %81 
                                       f32_4 %169 = OpFAdd %167 %168 
                                                      OpStore %21 %169 
                                       f32_4 %175 = OpLoad %21 
                               Output f32_4* %177 = OpAccessChain %174 %124 
                                                      OpStore %177 %175 
                                       f32_4 %178 = OpLoad %13 
                                       f32_3 %179 = OpVectorShuffle %178 %178 1 1 1 
                              Uniform f32_4* %180 = OpAccessChain %42 %120 %120 
                                       f32_4 %181 = OpLoad %180 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
                                       f32_3 %183 = OpFMul %179 %182 
                                       f32_4 %184 = OpLoad %81 
                                       f32_4 %185 = OpVectorShuffle %184 %183 4 5 6 3 
                                                      OpStore %81 %185 
                              Uniform f32_4* %186 = OpAccessChain %42 %120 %124 
                                       f32_4 %187 = OpLoad %186 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                                       f32_4 %189 = OpLoad %13 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 0 0 
                                       f32_3 %191 = OpFMul %188 %190 
                                       f32_4 %192 = OpLoad %81 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                                       f32_3 %194 = OpFAdd %191 %193 
                                       f32_4 %195 = OpLoad %81 
                                       f32_4 %196 = OpVectorShuffle %195 %194 4 5 6 3 
                                                      OpStore %81 %196 
                              Uniform f32_4* %197 = OpAccessChain %42 %120 %132 
                                       f32_4 %198 = OpLoad %197 
                                       f32_3 %199 = OpVectorShuffle %198 %198 0 1 2 
                                       f32_4 %200 = OpLoad %13 
                                       f32_3 %201 = OpVectorShuffle %200 %200 2 2 2 
                                       f32_3 %202 = OpFMul %199 %201 
                                       f32_4 %203 = OpLoad %81 
                                       f32_3 %204 = OpVectorShuffle %203 %203 0 1 2 
                                       f32_3 %205 = OpFAdd %202 %204 
                                       f32_4 %206 = OpLoad %81 
                                       f32_4 %207 = OpVectorShuffle %206 %205 4 5 6 3 
                                                      OpStore %81 %207 
                              Uniform f32_4* %210 = OpAccessChain %42 %120 %44 
                                       f32_4 %211 = OpLoad %210 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 1 2 
                                       f32_4 %213 = OpLoad %13 
                                       f32_3 %214 = OpVectorShuffle %213 %213 3 3 3 
                                       f32_3 %215 = OpFMul %212 %214 
                                       f32_4 %216 = OpLoad %81 
                                       f32_3 %217 = OpVectorShuffle %216 %216 0 1 2 
                                       f32_3 %218 = OpFAdd %215 %217 
                                                      OpStore %209 %218 
                                Private f32* %219 = OpAccessChain %21 %170 
                                         f32 %220 = OpLoad %219 
                                Uniform f32* %222 = OpAccessChain %42 %124 %65 
                                         f32 %223 = OpLoad %222 
                                         f32 %224 = OpFMul %220 %223 
                                Private f32* %225 = OpAccessChain %21 %170 
                                                      OpStore %225 %224 
                                       f32_4 %226 = OpLoad %21 
                                       f32_3 %227 = OpVectorShuffle %226 %226 0 3 1 
                                       f32_3 %230 = OpFMul %227 %229 
                                       f32_4 %231 = OpLoad %81 
                                       f32_4 %232 = OpVectorShuffle %231 %230 4 1 5 6 
                                                      OpStore %81 %232 
                                       f32_4 %234 = OpLoad %21 
                                       f32_2 %235 = OpVectorShuffle %234 %234 2 3 
                                       f32_4 %236 = OpLoad %233 
                                       f32_4 %237 = OpVectorShuffle %236 %235 0 1 4 5 
                                                      OpStore %233 %237 
                                       f32_4 %238 = OpLoad %81 
                                       f32_2 %239 = OpVectorShuffle %238 %238 2 2 
                                       f32_4 %240 = OpLoad %81 
                                       f32_2 %241 = OpVectorShuffle %240 %240 0 3 
                                       f32_2 %242 = OpFAdd %239 %241 
                                       f32_4 %243 = OpLoad %233 
                                       f32_4 %244 = OpVectorShuffle %243 %242 4 5 2 3 
                                                      OpStore %233 %244 
                                 Output f32* %246 = OpAccessChain %174 %124 %170 
                                         f32 %247 = OpLoad %246 
                                         f32 %248 = OpFNegate %247 
                                 Output f32* %249 = OpAccessChain %174 %124 %170 
                                                      OpStore %249 %248 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 1241
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %46 %121 %396 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpMemberDecorate %13 0 Offset 13 
                                                      OpMemberDecorate %13 1 Offset 13 
                                                      OpMemberDecorate %13 2 Offset 13 
                                                      OpMemberDecorate %13 3 Offset 13 
                                                      OpMemberDecorate %13 4 Offset 13 
                                                      OpMemberDecorate %13 5 Offset 13 
                                                      OpMemberDecorate %13 6 Offset 13 
                                                      OpMemberDecorate %13 7 Offset 13 
                                                      OpMemberDecorate %13 8 Offset 13 
                                                      OpMemberDecorate %13 9 Offset 13 
                                                      OpMemberDecorate %13 10 RelaxedPrecision 
                                                      OpMemberDecorate %13 10 Offset 13 
                                                      OpMemberDecorate %13 11 RelaxedPrecision 
                                                      OpMemberDecorate %13 11 Offset 13 
                                                      OpMemberDecorate %13 12 RelaxedPrecision 
                                                      OpMemberDecorate %13 12 Offset 13 
                                                      OpMemberDecorate %13 13 RelaxedPrecision 
                                                      OpMemberDecorate %13 13 Offset 13 
                                                      OpMemberDecorate %13 14 RelaxedPrecision 
                                                      OpMemberDecorate %13 14 Offset 13 
                                                      OpMemberDecorate %13 15 RelaxedPrecision 
                                                      OpMemberDecorate %13 15 Offset 13 
                                                      OpMemberDecorate %13 16 RelaxedPrecision 
                                                      OpMemberDecorate %13 16 Offset 13 
                                                      OpDecorate %13 Block 
                                                      OpDecorate %15 DescriptorSet 15 
                                                      OpDecorate %15 Binding 15 
                                                      OpDecorate %24 SpecId 24 
                                                      OpDecorate %46 Location 46 
                                                      OpDecorate %109 RelaxedPrecision 
                                                      OpDecorate %113 RelaxedPrecision 
                                                      OpDecorate %113 DescriptorSet 113 
                                                      OpDecorate %113 Binding 113 
                                                      OpDecorate %114 RelaxedPrecision 
                                                      OpDecorate %118 RelaxedPrecision 
                                                      OpDecorate %121 Location 121 
                                                      OpDecorate %149 RelaxedPrecision 
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %150 DescriptorSet 150 
                                                      OpDecorate %150 Binding 150 
                                                      OpDecorate %151 RelaxedPrecision 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %160 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %355 RelaxedPrecision 
                                                      OpDecorate %357 RelaxedPrecision 
                                                      OpDecorate %358 RelaxedPrecision 
                                                      OpDecorate %366 SpecId 366 
                                                      OpDecorate %372 RelaxedPrecision 
                                                      OpDecorate %376 RelaxedPrecision 
                                                      OpDecorate %381 RelaxedPrecision 
                                                      OpDecorate %390 RelaxedPrecision 
                                                      OpDecorate %392 RelaxedPrecision 
                                                      OpDecorate %393 RelaxedPrecision 
                                                      OpDecorate %394 RelaxedPrecision 
                                                      OpDecorate %396 RelaxedPrecision 
                                                      OpDecorate %396 Location 396 
                                                      OpDecorate %403 RelaxedPrecision 
                                                      OpDecorate %405 RelaxedPrecision 
                                                      OpDecorate %406 RelaxedPrecision 
                                                      OpDecorate %408 RelaxedPrecision 
                                                      OpDecorate %411 RelaxedPrecision 
                                                      OpDecorate %417 RelaxedPrecision 
                                                      OpDecorate %421 RelaxedPrecision 
                                                      OpDecorate %422 RelaxedPrecision 
                                                      OpDecorate %428 RelaxedPrecision 
                                                      OpDecorate %457 RelaxedPrecision 
                                                      OpDecorate %473 RelaxedPrecision 
                                                      OpDecorate %474 RelaxedPrecision 
                                                      OpDecorate %478 RelaxedPrecision 
                                                      OpDecorate %483 RelaxedPrecision 
                                                      OpDecorate %495 RelaxedPrecision 
                                                      OpDecorate %497 RelaxedPrecision 
                                                      OpDecorate %498 RelaxedPrecision 
                                                      OpDecorate %502 RelaxedPrecision 
                                                      OpDecorate %504 RelaxedPrecision 
                                                      OpDecorate %507 RelaxedPrecision 
                                                      OpDecorate %508 RelaxedPrecision 
                                                      OpDecorate %524 RelaxedPrecision 
                                                      OpDecorate %526 RelaxedPrecision 
                                                      OpDecorate %529 RelaxedPrecision 
                                                      OpDecorate %530 RelaxedPrecision 
                                                      OpDecorate %532 RelaxedPrecision 
                                                      OpDecorate %538 RelaxedPrecision 
                                                      OpDecorate %539 RelaxedPrecision 
                                                      OpDecorate %540 RelaxedPrecision 
                                                      OpDecorate %548 RelaxedPrecision 
                                                      OpDecorate %550 RelaxedPrecision 
                                                      OpDecorate %551 RelaxedPrecision 
                                                      OpDecorate %558 RelaxedPrecision 
                                                      OpDecorate %559 RelaxedPrecision 
                                                      OpDecorate %562 RelaxedPrecision 
                                                      OpDecorate %592 RelaxedPrecision 
                                                      OpDecorate %593 RelaxedPrecision 
                                                      OpDecorate %597 RelaxedPrecision 
                                                      OpDecorate %601 RelaxedPrecision 
                                                      OpDecorate %603 RelaxedPrecision 
                                                      OpDecorate %616 RelaxedPrecision 
                                                      OpDecorate %618 RelaxedPrecision 
                                                      OpDecorate %619 RelaxedPrecision 
                                                      OpDecorate %622 RelaxedPrecision 
                                                      OpDecorate %623 RelaxedPrecision 
                                                      OpDecorate %626 RelaxedPrecision 
                                                      OpDecorate %639 RelaxedPrecision 
                                                      OpDecorate %646 RelaxedPrecision 
                                                      OpDecorate %648 RelaxedPrecision 
                                                      OpDecorate %651 RelaxedPrecision 
                                                      OpDecorate %652 RelaxedPrecision 
                                                      OpDecorate %655 RelaxedPrecision 
                                                      OpDecorate %660 RelaxedPrecision 
                                                      OpDecorate %661 RelaxedPrecision 
                                                      OpDecorate %662 RelaxedPrecision 
                                                      OpDecorate %670 RelaxedPrecision 
                                                      OpDecorate %673 RelaxedPrecision 
                                                      OpDecorate %674 RelaxedPrecision 
                                                      OpDecorate %680 RelaxedPrecision 
                                                      OpDecorate %681 RelaxedPrecision 
                                                      OpDecorate %683 RelaxedPrecision 
                                                      OpDecorate %712 RelaxedPrecision 
                                                      OpDecorate %713 RelaxedPrecision 
                                                      OpDecorate %717 RelaxedPrecision 
                                                      OpDecorate %722 RelaxedPrecision 
                                                      OpDecorate %727 RelaxedPrecision 
                                                      OpDecorate %736 RelaxedPrecision 
                                                      OpDecorate %738 RelaxedPrecision 
                                                      OpDecorate %739 RelaxedPrecision 
                                                      OpDecorate %747 RelaxedPrecision 
                                                      OpDecorate %749 RelaxedPrecision 
                                                      OpDecorate %750 RelaxedPrecision 
                                                      OpDecorate %753 RelaxedPrecision 
                                                      OpDecorate %755 RelaxedPrecision 
                                                      OpDecorate %756 RelaxedPrecision 
                                                      OpDecorate %759 RelaxedPrecision 
                                                      OpDecorate %764 RelaxedPrecision 
                                                      OpDecorate %765 RelaxedPrecision 
                                                      OpDecorate %766 RelaxedPrecision 
                                                      OpDecorate %774 RelaxedPrecision 
                                                      OpDecorate %776 RelaxedPrecision 
                                                      OpDecorate %777 RelaxedPrecision 
                                                      OpDecorate %783 RelaxedPrecision 
                                                      OpDecorate %784 RelaxedPrecision 
                                                      OpDecorate %786 RelaxedPrecision 
                                                      OpDecorate %791 RelaxedPrecision 
                                                      OpDecorate %792 RelaxedPrecision 
                                                      OpDecorate %794 RelaxedPrecision 
                                                      OpDecorate %795 RelaxedPrecision 
                                                      OpDecorate %796 RelaxedPrecision 
                                                      OpDecorate %810 RelaxedPrecision 
                                                      OpDecorate %815 RelaxedPrecision 
                                                      OpDecorate %817 RelaxedPrecision 
                                                      OpDecorate %818 RelaxedPrecision 
                                                      OpDecorate %821 RelaxedPrecision 
                                                      OpDecorate %822 RelaxedPrecision 
                                                      OpDecorate %824 RelaxedPrecision 
                                                      OpDecorate %825 RelaxedPrecision 
                                                      OpDecorate %829 RelaxedPrecision 
                                                      OpDecorate %834 RelaxedPrecision 
                                                      OpDecorate %836 RelaxedPrecision 
                                                      OpDecorate %837 RelaxedPrecision 
                                                      OpDecorate %840 RelaxedPrecision 
                                                      OpDecorate %841 RelaxedPrecision 
                                                      OpDecorate %843 RelaxedPrecision 
                                                      OpDecorate %844 RelaxedPrecision 
                                                      OpDecorate %847 RelaxedPrecision 
                                                      OpDecorate %849 RelaxedPrecision 
                                                      OpDecorate %850 RelaxedPrecision 
                                                      OpDecorate %853 RelaxedPrecision 
                                                      OpDecorate %854 RelaxedPrecision 
                                                      OpDecorate %856 RelaxedPrecision 
                                                      OpDecorate %875 RelaxedPrecision 
                                                      OpDecorate %877 RelaxedPrecision 
                                                      OpDecorate %880 RelaxedPrecision 
                                                      OpDecorate %881 RelaxedPrecision 
                                                      OpDecorate %884 RelaxedPrecision 
                                                      OpDecorate %889 RelaxedPrecision 
                                                      OpDecorate %890 RelaxedPrecision 
                                                      OpDecorate %891 RelaxedPrecision 
                                                      OpDecorate %899 RelaxedPrecision 
                                                      OpDecorate %902 RelaxedPrecision 
                                                      OpDecorate %903 RelaxedPrecision 
                                                      OpDecorate %910 RelaxedPrecision 
                                                      OpDecorate %911 RelaxedPrecision 
                                                      OpDecorate %913 RelaxedPrecision 
                                                      OpDecorate %918 RelaxedPrecision 
                                                      OpDecorate %920 RelaxedPrecision 
                                                      OpDecorate %930 SpecId 930 
                                                      OpDecorate %934 RelaxedPrecision 
                                                      OpDecorate %938 RelaxedPrecision 
                                                      OpDecorate %940 RelaxedPrecision 
                                                      OpDecorate %942 RelaxedPrecision 
                                                      OpDecorate %943 RelaxedPrecision 
                                                      OpDecorate %946 RelaxedPrecision 
                                                      OpDecorate %947 RelaxedPrecision 
                                                      OpDecorate %949 RelaxedPrecision 
                                                      OpDecorate %950 RelaxedPrecision 
                                                      OpDecorate %953 RelaxedPrecision 
                                                      OpDecorate %958 RelaxedPrecision 
                                                      OpDecorate %960 RelaxedPrecision 
                                                      OpDecorate %961 RelaxedPrecision 
                                                      OpDecorate %963 RelaxedPrecision 
                                                      OpDecorate %964 RelaxedPrecision 
                                                      OpDecorate %966 RelaxedPrecision 
                                                      OpDecorate %967 RelaxedPrecision 
                                                      OpDecorate %970 RelaxedPrecision 
                                                      OpDecorate %972 RelaxedPrecision 
                                                      OpDecorate %973 RelaxedPrecision 
                                                      OpDecorate %976 RelaxedPrecision 
                                                      OpDecorate %977 RelaxedPrecision 
                                                      OpDecorate %980 RelaxedPrecision 
                                                      OpDecorate %981 RelaxedPrecision 
                                                      OpDecorate %998 RelaxedPrecision 
                                                      OpDecorate %1000 RelaxedPrecision 
                                                      OpDecorate %1003 RelaxedPrecision 
                                                      OpDecorate %1004 RelaxedPrecision 
                                                      OpDecorate %1006 RelaxedPrecision 
                                                      OpDecorate %1011 RelaxedPrecision 
                                                      OpDecorate %1012 RelaxedPrecision 
                                                      OpDecorate %1013 RelaxedPrecision 
                                                      OpDecorate %1021 RelaxedPrecision 
                                                      OpDecorate %1023 RelaxedPrecision 
                                                      OpDecorate %1024 RelaxedPrecision 
                                                      OpDecorate %1031 RelaxedPrecision 
                                                      OpDecorate %1032 RelaxedPrecision 
                                                      OpDecorate %1034 RelaxedPrecision 
                                                      OpDecorate %1039 RelaxedPrecision 
                                                      OpDecorate %1044 RelaxedPrecision 
                                                      OpDecorate %1046 RelaxedPrecision 
                                                      OpDecorate %1047 RelaxedPrecision 
                                                      OpDecorate %1050 RelaxedPrecision 
                                                      OpDecorate %1051 RelaxedPrecision 
                                                      OpDecorate %1053 RelaxedPrecision 
                                                      OpDecorate %1054 RelaxedPrecision 
                                                      OpDecorate %1057 RelaxedPrecision 
                                                      OpDecorate %1062 RelaxedPrecision 
                                                      OpDecorate %1064 RelaxedPrecision 
                                                      OpDecorate %1065 RelaxedPrecision 
                                                      OpDecorate %1067 RelaxedPrecision 
                                                      OpDecorate %1069 RelaxedPrecision 
                                                      OpDecorate %1070 RelaxedPrecision 
                                                      OpDecorate %1072 RelaxedPrecision 
                                                      OpDecorate %1073 RelaxedPrecision 
                                                      OpDecorate %1076 RelaxedPrecision 
                                                      OpDecorate %1078 RelaxedPrecision 
                                                      OpDecorate %1079 RelaxedPrecision 
                                                      OpDecorate %1087 RelaxedPrecision 
                                                      OpDecorate %1089 RelaxedPrecision 
                                                      OpDecorate %1090 RelaxedPrecision 
                                                      OpDecorate %1094 RelaxedPrecision 
                                                      OpDecorate %1095 RelaxedPrecision 
                                                      OpDecorate %1098 RelaxedPrecision 
                                                      OpDecorate %1103 RelaxedPrecision 
                                                      OpDecorate %1104 RelaxedPrecision 
                                                      OpDecorate %1105 RelaxedPrecision 
                                                      OpDecorate %1111 RelaxedPrecision 
                                                      OpDecorate %1114 RelaxedPrecision 
                                                      OpDecorate %1115 RelaxedPrecision 
                                                      OpDecorate %1122 RelaxedPrecision 
                                                      OpDecorate %1123 RelaxedPrecision 
                                                      OpDecorate %1125 RelaxedPrecision 
                                                      OpDecorate %1128 RelaxedPrecision 
                                                      OpDecorate %1129 RelaxedPrecision 
                                                      OpDecorate %1132 RelaxedPrecision 
                                                      OpDecorate %1135 RelaxedPrecision 
                                                      OpDecorate %1136 RelaxedPrecision 
                                                      OpDecorate %1137 RelaxedPrecision 
                                                      OpDecorate %1138 RelaxedPrecision 
                                                      OpDecorate %1139 RelaxedPrecision 
                                                      OpDecorate %1140 RelaxedPrecision 
                                                      OpDecorate %1141 RelaxedPrecision 
                                                      OpDecorate %1142 RelaxedPrecision 
                                                      OpDecorate %1143 RelaxedPrecision 
                                                      OpDecorate %1146 RelaxedPrecision 
                                                      OpDecorate %1147 RelaxedPrecision 
                                                      OpDecorate %1151 RelaxedPrecision 
                                                      OpDecorate %1153 RelaxedPrecision 
                                                      OpDecorate %1168 RelaxedPrecision 
                                                      OpDecorate %1169 RelaxedPrecision 
                                                      OpDecorate %1171 RelaxedPrecision 
                                                      OpDecorate %1173 RelaxedPrecision 
                                                      OpDecorate %1174 RelaxedPrecision 
                                                      OpDecorate %1175 RelaxedPrecision 
                                                      OpDecorate %1178 RelaxedPrecision 
                                                      OpDecorate %1179 RelaxedPrecision 
                                                      OpDecorate %1180 RelaxedPrecision 
                                                      OpDecorate %1181 RelaxedPrecision 
                                                      OpDecorate %1182 RelaxedPrecision 
                                                      OpDecorate %1185 RelaxedPrecision 
                                                      OpDecorate %1187 RelaxedPrecision 
                                                      OpDecorate %1188 RelaxedPrecision 
                                                      OpDecorate %1190 RelaxedPrecision 
                                                      OpDecorate %1209 RelaxedPrecision 
                                                      OpDecorate %1211 RelaxedPrecision 
                                                      OpDecorate %1212 RelaxedPrecision 
                                                      OpDecorate %1213 RelaxedPrecision 
                                                      OpDecorate %1220 RelaxedPrecision 
                                                      OpDecorate %1222 RelaxedPrecision 
                                                      OpDecorate %1223 RelaxedPrecision 
                                                      OpDecorate %1236 RelaxedPrecision 
                                                      OpDecorate %1239 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeBool 
                                          bool %7 = OpConstantFalse 
                                              %10 = OpTypeFloat 32 
                                              %11 = OpTypeVector %10 4 
                                              %12 = OpTypeInt 32 1 
                                              %13 = OpTypeStruct %11 %10 %11 %10 %10 %11 %10 %10 %12 %12 %11 %10 %10 %10 %10 %11 %11 
                                              %14 = OpTypePointer Uniform %13 
Uniform struct {f32_4; f32; f32_4; f32; f32; f32_4; f32; f32; i32; i32; f32_4; f32; f32; f32; f32; f32_4; f32_4;}* %15 = OpVariable Uniform 
                                          i32 %16 = OpConstant 8 
                                              %17 = OpTypePointer Uniform %12 
                                          i32 %20 = OpConstant 0 
                                         bool %24 = OpSpecConstantFalse 
                                         bool %25 = OpSpecConstantOp System.Collections.Generic.List`1[SpirV.ObjectReference] 
                                              %28 = OpTypeVector %10 3 
                                              %29 = OpTypePointer Private %28 
                               Private f32_3* %30 = OpVariable Private 
                                              %31 = OpTypeInt 32 0 
                                          u32 %32 = OpConstant 0 
                                              %33 = OpTypePointer Uniform %10 
                                          i32 %36 = OpConstant 4 
                                              %40 = OpTypePointer Private %10 
                                              %42 = OpTypeVector %10 2 
                                              %43 = OpTypePointer Private %42 
                               Private f32_2* %44 = OpVariable Private 
                                              %45 = OpTypePointer Input %28 
                                 Input f32_3* %46 = OpVariable Input 
                                          u32 %47 = OpConstant 1 
                                              %48 = OpTypePointer Input %10 
                               Private f32_3* %64 = OpVariable Private 
                               Private f32_3* %69 = OpVariable Private 
                                          f32 %76 = OpConstant 3.67402E-40 
                                          f32 %81 = OpConstant 3.67402E-40 
                                          i32 %90 = OpConstant 1 
                                          f32 %96 = OpConstant 3.67402E-40 
                                        f32_2 %97 = OpConstantComposite %96 %96 
                                         f32 %101 = OpConstant 3.67402E-40 
                                         f32 %102 = OpConstant 3.67402E-40 
                                       f32_2 %103 = OpConstantComposite %101 %102 
                              Private f32_3* %109 = OpVariable Private 
                                             %110 = OpTypeImage %10 Dim2D 0 0 0 1 Unknown 
                                             %111 = OpTypeSampledImage %110 
                                             %112 = OpTypePointer UniformConstant %111 
 UniformConstant read_only Texture2DSampled* %113 = OpVariable UniformConstant 
                                Private f32* %119 = OpVariable Private 
                                             %120 = OpTypePointer Input %11 
                                Input f32_4* %121 = OpVariable Input 
                                         f32 %124 = OpConstant 3.67402E-40 
                                         u32 %126 = OpConstant 2 
                                         f32 %129 = OpConstant 3.67402E-40 
                                         f32 %136 = OpConstant 3.67402E-40 
                                         f32 %139 = OpConstant 3.67402E-40 
                                             %148 = OpTypePointer Private %11 
                              Private f32_4* %149 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %150 = OpVariable UniformConstant 
                                         i32 %156 = OpConstant 6 
                                         i32 %162 = OpConstant 5 
                                             %163 = OpTypePointer Uniform %11 
                                         i32 %168 = OpConstant 2 
                              Private f32_3* %173 = OpVariable Private 
                                       f32_3 %175 = OpConstantComposite %101 %101 %101 
                                         f32 %177 = OpConstant 3.67402E-40 
                                       f32_3 %178 = OpConstantComposite %177 %177 %177 
                              Private f32_3* %180 = OpVariable Private 
                                         f32 %182 = OpConstant 3.67402E-40 
                                       f32_3 %183 = OpConstantComposite %182 %182 %182 
                                         u32 %188 = OpConstant 3 
                                         i32 %191 = OpConstant 3 
                                         i32 %198 = OpConstant 7 
                              Private f32_3* %203 = OpVariable Private 
                                             %214 = OpTypeVector %6 3 
                                             %215 = OpTypePointer Private %214 
                             Private bool_3* %216 = OpVariable Private 
                                         f32 %217 = OpConstant 3.67402E-40 
                                       f32_4 %218 = OpConstantComposite %217 %217 %217 %139 
                                             %221 = OpTypeVector %6 4 
                                         f32 %225 = OpConstant 3.67402E-40 
                                       f32_3 %226 = OpConstantComposite %225 %225 %225 
                             Private bool_3* %228 = OpVariable Private 
                                         f32 %231 = OpConstant 3.67402E-40 
                                       f32_4 %232 = OpConstantComposite %231 %231 %231 %139 
                              Private f32_3* %235 = OpVariable Private 
                                         f32 %237 = OpConstant 3.67402E-40 
                                       f32_3 %238 = OpConstantComposite %237 %237 %237 
                                         f32 %241 = OpConstant 3.67402E-40 
                                       f32_3 %242 = OpConstantComposite %241 %241 %241 
                                         f32 %247 = OpConstant 3.67402E-40 
                                       f32_3 %248 = OpConstantComposite %247 %247 %247 
                              Private f32_3* %252 = OpVariable Private 
                                         f32 %256 = OpConstant 3.67402E-40 
                                       f32_3 %257 = OpConstantComposite %256 %256 %256 
                              Private f32_3* %261 = OpVariable Private 
                                             %262 = OpTypePointer Function %10 
                                         f32 %336 = OpConstant 3.67402E-40 
                                         f32 %337 = OpConstant 3.67402E-40 
                                         f32 %338 = OpConstant 3.67402E-40 
                                       f32_3 %339 = OpConstantComposite %336 %337 %338 
                                Private f32* %342 = OpVariable Private 
                                         f32 %344 = OpConstant 3.67402E-40 
                                       f32_3 %345 = OpConstantComposite %344 %344 %344 
                                         i32 %348 = OpConstant 9 
                                        bool %366 = OpSpecConstantFalse 
                                        bool %367 = OpSpecConstantOp System.Collections.Generic.List`1[SpirV.ObjectReference] 
                                             %370 = OpTypePointer Private %6 
                               Private bool* %371 = OpVariable Private 
                                         f32 %373 = OpConstant 3.67402E-40 
                                         f32 %375 = OpConstant 3.67402E-40 
                              Private f32_4* %381 = OpVariable Private 
                                             %382 = OpTypePointer Function %11 
                                         i32 %388 = OpConstant 16 
                                             %395 = OpTypePointer Output %11 
                               Output f32_4* %396 = OpVariable Output 
                                         i32 %401 = OpConstant 15 
                                         i32 %409 = OpConstant 11 
                                         i32 %419 = OpConstant 12 
                                             %430 = OpTypeVector %6 2 
                                             %431 = OpTypePointer Private %430 
                             Private bool_2* %432 = OpVariable Private 
                              Private f32_3* %457 = OpVariable Private 
                                Private f32* %500 = OpVariable Private 
                                         f32 %503 = OpConstant 3.67402E-40 
                                Private f32* %505 = OpVariable Private 
                                         f32 %533 = OpConstant 3.67402E-40 
                                             %553 = OpTypePointer Function %42 
                                       f32_2 %561 = OpConstantComposite %139 %139 
                              Private f32_2* %601 = OpVariable Private 
                              Private f32_2* %621 = OpVariable Private 
                                         f32 %624 = OpConstant 3.67402E-40 
                                       f32_2 %625 = OpConstantComposite %624 %624 
                              Private f32_3* %639 = OpVariable Private 
                              Private f32_2* %727 = OpVariable Private 
                                Private f32* %753 = OpVariable Private 
                             Private bool_2* %757 = OpVariable Private 
                                         i32 %789 = OpConstant 10 
                             Private bool_2* %827 = OpVariable Private 
                              Private f32_2* %852 = OpVariable Private 
                                       f32_2 %855 = OpConstantComposite %503 %503 
                                        bool %930 = OpSpecConstantFalse 
                              Private f32_2* %938 = OpVariable Private 
                             Private f32_2* %1067 = OpVariable Private 
                                        i32 %1130 = OpConstant 14 
                                        i32 %1133 = OpConstant 13 
                              Private bool* %1149 = OpVariable Private 
                                        f32 %1186 = OpConstant 3.67402E-40 
                                      f32_4 %1238 = OpConstantComposite %139 %139 %139 %139 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %263 = OpVariable Function 
                               Function f32* %275 = OpVariable Function 
                               Function f32* %287 = OpVariable Function 
                               Function f32* %299 = OpVariable Function 
                               Function f32* %311 = OpVariable Function 
                               Function f32* %323 = OpVariable Function 
                               Function f32* %347 = OpVariable Function 
                             Function f32_4* %383 = OpVariable Function 
                             Function f32_4* %397 = OpVariable Function 
                               Function f32* %458 = OpVariable Function 
                               Function f32* %509 = OpVariable Function 
                               Function f32* %519 = OpVariable Function 
                               Function f32* %542 = OpVariable Function 
                             Function f32_2* %554 = OpVariable Function 
                               Function f32* %577 = OpVariable Function 
                               Function f32* %627 = OpVariable Function 
                               Function f32* %640 = OpVariable Function 
                               Function f32* %664 = OpVariable Function 
                             Function f32_2* %676 = OpVariable Function 
                               Function f32* %697 = OpVariable Function 
                             Function f32_2* %742 = OpVariable Function 
                               Function f32* %768 = OpVariable Function 
                             Function f32_2* %779 = OpVariable Function 
                               Function f32* %857 = OpVariable Function 
                               Function f32* %869 = OpVariable Function 
                               Function f32* %893 = OpVariable Function 
                             Function f32_2* %905 = OpVariable Function 
                               Function f32* %982 = OpVariable Function 
                               Function f32* %993 = OpVariable Function 
                              Function f32* %1015 = OpVariable Function 
                            Function f32_2* %1026 = OpVariable Function 
                            Function f32_2* %1082 = OpVariable Function 
                              Function f32* %1106 = OpVariable Function 
                            Function f32_2* %1117 = OpVariable Function 
                            Function f32_4* %1203 = OpVariable Function 
                            Function f32_4* %1214 = OpVariable Function 
                            Function f32_4* %1230 = OpVariable Function 
                                                      OpSelectionMerge %9 None 
                                                      OpBranchConditional %7 %8 %9 
                                               %8 = OpLabel 
                                 Uniform i32* %18 = OpAccessChain %15 %16 
                                          i32 %19 = OpLoad %18 
                                         bool %21 = OpIEqual %19 %20 
                                                      OpSelectionMerge %23 None 
                                                      OpBranchConditional %21 %22 %23 
                                              %22 = OpLabel 
                                                      OpBranch %23 
                                              %23 = OpLabel 
                                                      OpBranch %9 
                                               %9 = OpLabel 
                                                      OpSelectionMerge %27 None 
                                                      OpBranchConditional %25 %26 %1224 
                                              %26 = OpLabel 
                                 Uniform f32* %34 = OpAccessChain %15 %20 %32 
                                          f32 %35 = OpLoad %34 
                                 Uniform f32* %37 = OpAccessChain %15 %36 
                                          f32 %38 = OpLoad %37 
                                          f32 %39 = OpFMul %35 %38 
                                 Private f32* %41 = OpAccessChain %30 %32 
                                                      OpStore %41 %39 
                                   Input f32* %49 = OpAccessChain %46 %47 
                                          f32 %50 = OpLoad %49 
                                   Input f32* %51 = OpAccessChain %46 %32 
                                          f32 %52 = OpLoad %51 
                                          f32 %53 = OpFAdd %50 %52 
                                 Private f32* %54 = OpAccessChain %44 %32 
                                                      OpStore %54 %53 
                                 Uniform f32* %55 = OpAccessChain %15 %20 %47 
                                          f32 %56 = OpLoad %55 
                                 Uniform f32* %57 = OpAccessChain %15 %36 
                                          f32 %58 = OpLoad %57 
                                          f32 %59 = OpFMul %56 %58 
                                 Private f32* %60 = OpAccessChain %44 %32 
                                          f32 %61 = OpLoad %60 
                                          f32 %62 = OpFAdd %59 %61 
                                 Private f32* %63 = OpAccessChain %44 %32 
                                                      OpStore %63 %62 
                                 Private f32* %65 = OpAccessChain %44 %32 
                                          f32 %66 = OpLoad %65 
                                          f32 %67 = OpExtInst %1 13 %66 
                                 Private f32* %68 = OpAccessChain %64 %32 
                                                      OpStore %68 %67 
                                 Private f32* %70 = OpAccessChain %44 %32 
                                          f32 %71 = OpLoad %70 
                                          f32 %72 = OpExtInst %1 14 %71 
                                 Private f32* %73 = OpAccessChain %69 %32 
                                                      OpStore %73 %72 
                                 Private f32* %74 = OpAccessChain %69 %32 
                                          f32 %75 = OpLoad %74 
                                          f32 %77 = OpFMul %75 %76 
                                 Private f32* %78 = OpAccessChain %69 %32 
                                                      OpStore %78 %77 
                                 Private f32* %79 = OpAccessChain %64 %32 
                                          f32 %80 = OpLoad %79 
                                          f32 %82 = OpFMul %80 %81 
                                 Private f32* %83 = OpAccessChain %69 %47 
                                                      OpStore %83 %82 
                                        f32_3 %84 = OpLoad %69 
                                        f32_2 %85 = OpVectorShuffle %84 %84 0 1 
                                        f32_3 %86 = OpLoad %46 
                                        f32_2 %87 = OpVectorShuffle %86 %86 0 1 
                                        f32_2 %88 = OpFAdd %85 %87 
                                                      OpStore %44 %88 
                                        f32_2 %89 = OpLoad %44 
                                 Uniform f32* %91 = OpAccessChain %15 %90 
                                          f32 %92 = OpLoad %91 
                                        f32_2 %93 = OpCompositeConstruct %92 %92 
                                        f32_2 %94 = OpFMul %89 %93 
                                                      OpStore %44 %94 
                                        f32_2 %95 = OpLoad %44 
                                        f32_2 %98 = OpFMul %95 %97 
                                                      OpStore %44 %98 
                                        f32_3 %99 = OpLoad %30 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 0 
                                       f32_2 %104 = OpFMul %100 %103 
                                       f32_2 %105 = OpLoad %44 
                                       f32_2 %106 = OpFAdd %104 %105 
                                       f32_3 %107 = OpLoad %30 
                                       f32_3 %108 = OpVectorShuffle %107 %106 3 4 2 
                                                      OpStore %30 %108 
                  read_only Texture2DSampled %114 = OpLoad %113 
                                       f32_3 %115 = OpLoad %30 
                                       f32_2 %116 = OpVectorShuffle %115 %115 0 1 
                                       f32_4 %117 = OpImageSampleImplicitLod %114 %116 
                                       f32_3 %118 = OpVectorShuffle %117 %117 0 1 2 
                                                      OpStore %109 %118 
                                  Input f32* %122 = OpAccessChain %121 %47 
                                         f32 %123 = OpLoad %122 
                                         f32 %125 = OpFMul %123 %124 
                                                      OpStore %119 %125 
                                Uniform f32* %127 = OpAccessChain %15 %20 %126 
                                         f32 %128 = OpLoad %127 
                                         f32 %130 = OpFMul %128 %129 
                                         f32 %131 = OpLoad %119 
                                         f32 %132 = OpFAdd %130 %131 
                                                      OpStore %119 %132 
                                         f32 %133 = OpLoad %119 
                                         f32 %134 = OpExtInst %1 13 %133 
                                                      OpStore %119 %134 
                                         f32 %135 = OpLoad %119 
                                         f32 %137 = OpFMul %135 %136 
                                Private f32* %138 = OpAccessChain %64 %32 
                                                      OpStore %138 %137 
                                Private f32* %140 = OpAccessChain %64 %47 
                                                      OpStore %140 %139 
                                       f32_3 %141 = OpLoad %64 
                                       f32_2 %142 = OpVectorShuffle %141 %141 0 1 
                                       f32_4 %143 = OpLoad %121 
                                       f32_2 %144 = OpVectorShuffle %143 %143 0 1 
                                       f32_2 %145 = OpFAdd %142 %144 
                                       f32_3 %146 = OpLoad %64 
                                       f32_3 %147 = OpVectorShuffle %146 %145 3 4 2 
                                                      OpStore %64 %147 
                  read_only Texture2DSampled %151 = OpLoad %150 
                                       f32_3 %152 = OpLoad %64 
                                       f32_2 %153 = OpVectorShuffle %152 %152 0 1 
                                       f32_4 %154 = OpImageSampleImplicitLod %151 %153 
                                                      OpStore %149 %154 
                                       f32_3 %155 = OpLoad %109 
                                Uniform f32* %157 = OpAccessChain %15 %156 
                                         f32 %158 = OpLoad %157 
                                       f32_3 %159 = OpCompositeConstruct %158 %158 %158 
                                       f32_3 %160 = OpFMul %155 %159 
                                                      OpStore %30 %160 
                                       f32_3 %161 = OpLoad %30 
                              Uniform f32_4* %164 = OpAccessChain %15 %162 
                                       f32_4 %165 = OpLoad %164 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                       f32_3 %167 = OpFMul %161 %166 
                              Uniform f32_4* %169 = OpAccessChain %15 %168 
                                       f32_4 %170 = OpLoad %169 
                                       f32_3 %171 = OpVectorShuffle %170 %170 0 1 2 
                                       f32_3 %172 = OpFAdd %167 %171 
                                                      OpStore %30 %172 
                                       f32_3 %174 = OpLoad %30 
                                       f32_3 %176 = OpFMul %174 %175 
                                       f32_3 %179 = OpFAdd %176 %178 
                                                      OpStore %173 %179 
                                       f32_3 %181 = OpLoad %30 
                                       f32_3 %184 = OpFMul %181 %183 
                                       f32_4 %185 = OpLoad %149 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                                       f32_3 %187 = OpFAdd %184 %186 
                                                      OpStore %180 %187 
                                Private f32* %189 = OpAccessChain %149 %188 
                                         f32 %190 = OpLoad %189 
                                Uniform f32* %192 = OpAccessChain %15 %191 
                                         f32 %193 = OpLoad %192 
                                         f32 %194 = OpFMul %190 %193 
                                Private f32* %195 = OpAccessChain %30 %32 
                                                      OpStore %195 %194 
                                Private f32* %196 = OpAccessChain %30 %32 
                                         f32 %197 = OpLoad %196 
                                Uniform f32* %199 = OpAccessChain %15 %198 
                                         f32 %200 = OpLoad %199 
                                         f32 %201 = OpFMul %197 %200 
                                Private f32* %202 = OpAccessChain %30 %32 
                                                      OpStore %202 %201 
                                       f32_3 %204 = OpLoad %173 
                                       f32_3 %205 = OpFNegate %204 
                                       f32_3 %206 = OpLoad %180 
                                       f32_3 %207 = OpFAdd %205 %206 
                                                      OpStore %203 %207 
                                       f32_3 %208 = OpLoad %30 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 0 0 
                                       f32_3 %210 = OpLoad %203 
                                       f32_3 %211 = OpFMul %209 %210 
                                       f32_3 %212 = OpLoad %173 
                                       f32_3 %213 = OpFAdd %211 %212 
                                                      OpStore %30 %213 
                                       f32_3 %219 = OpLoad %30 
                                       f32_4 %220 = OpVectorShuffle %219 %219 0 1 2 0 
                                      bool_4 %222 = OpFOrdGreaterThanEqual %218 %220 
                                      bool_3 %223 = OpVectorShuffle %222 %222 0 1 2 
                                                      OpStore %216 %223 
                                       f32_3 %224 = OpLoad %30 
                                       f32_3 %227 = OpFMul %224 %226 
                                                      OpStore %69 %227 
                                       f32_3 %229 = OpLoad %30 
                                       f32_4 %230 = OpVectorShuffle %229 %229 0 1 2 0 
                                      bool_4 %233 = OpFOrdLessThan %230 %232 
                                      bool_3 %234 = OpVectorShuffle %233 %233 0 1 2 
                                                      OpStore %228 %234 
                                       f32_3 %236 = OpLoad %30 
                                       f32_3 %239 = OpFAdd %236 %238 
                                                      OpStore %235 %239 
                                       f32_3 %240 = OpLoad %235 
                                       f32_3 %243 = OpFMul %240 %242 
                                                      OpStore %235 %243 
                                       f32_3 %244 = OpLoad %235 
                                       f32_3 %245 = OpExtInst %1 30 %244 
                                                      OpStore %235 %245 
                                       f32_3 %246 = OpLoad %235 
                                       f32_3 %249 = OpFMul %246 %248 
                                                      OpStore %235 %249 
                                       f32_3 %250 = OpLoad %235 
                                       f32_3 %251 = OpExtInst %1 29 %250 
                                                      OpStore %235 %251 
                                       f32_3 %253 = OpLoad %30 
                                       f32_3 %254 = OpExtInst %1 30 %253 
                                                      OpStore %252 %254 
                                       f32_3 %255 = OpLoad %252 
                                       f32_3 %258 = OpFMul %255 %257 
                                                      OpStore %252 %258 
                                       f32_3 %259 = OpLoad %252 
                                       f32_3 %260 = OpExtInst %1 29 %259 
                                                      OpStore %252 %260 
                                      bool_3 %264 = OpLoad %228 
                                        bool %265 = OpCompositeExtract %264 0 
                                                      OpSelectionMerge %267 None 
                                                      OpBranchConditional %265 %266 %270 
                                             %266 = OpLabel 
                                Private f32* %268 = OpAccessChain %235 %32 
                                         f32 %269 = OpLoad %268 
                                                      OpStore %263 %269 
                                                      OpBranch %267 
                                             %270 = OpLabel 
                                Private f32* %271 = OpAccessChain %252 %32 
                                         f32 %272 = OpLoad %271 
                                                      OpStore %263 %272 
                                                      OpBranch %267 
                                             %267 = OpLabel 
                                         f32 %273 = OpLoad %263 
                                Private f32* %274 = OpAccessChain %261 %32 
                                                      OpStore %274 %273 
                                      bool_3 %276 = OpLoad %228 
                                        bool %277 = OpCompositeExtract %276 1 
                                                      OpSelectionMerge %279 None 
                                                      OpBranchConditional %277 %278 %282 
                                             %278 = OpLabel 
                                Private f32* %280 = OpAccessChain %235 %47 
                                         f32 %281 = OpLoad %280 
                                                      OpStore %275 %281 
                                                      OpBranch %279 
                                             %282 = OpLabel 
                                Private f32* %283 = OpAccessChain %252 %47 
                                         f32 %284 = OpLoad %283 
                                                      OpStore %275 %284 
                                                      OpBranch %279 
                                             %279 = OpLabel 
                                         f32 %285 = OpLoad %275 
                                Private f32* %286 = OpAccessChain %261 %47 
                                                      OpStore %286 %285 
                                      bool_3 %288 = OpLoad %228 
                                        bool %289 = OpCompositeExtract %288 2 
                                                      OpSelectionMerge %291 None 
                                                      OpBranchConditional %289 %290 %294 
                                             %290 = OpLabel 
                                Private f32* %292 = OpAccessChain %235 %126 
                                         f32 %293 = OpLoad %292 
                                                      OpStore %287 %293 
                                                      OpBranch %291 
                                             %294 = OpLabel 
                                Private f32* %295 = OpAccessChain %252 %126 
                                         f32 %296 = OpLoad %295 
                                                      OpStore %287 %296 
                                                      OpBranch %291 
                                             %291 = OpLabel 
                                         f32 %297 = OpLoad %287 
                                Private f32* %298 = OpAccessChain %261 %126 
                                                      OpStore %298 %297 
                                      bool_3 %300 = OpLoad %216 
                                        bool %301 = OpCompositeExtract %300 0 
                                                      OpSelectionMerge %303 None 
                                                      OpBranchConditional %301 %302 %306 
                                             %302 = OpLabel 
                                Private f32* %304 = OpAccessChain %69 %32 
                                         f32 %305 = OpLoad %304 
                                                      OpStore %299 %305 
                                                      OpBranch %303 
                                             %306 = OpLabel 
                                Private f32* %307 = OpAccessChain %261 %32 
                                         f32 %308 = OpLoad %307 
                                                      OpStore %299 %308 
                                                      OpBranch %303 
                                             %303 = OpLabel 
                                         f32 %309 = OpLoad %299 
                                Private f32* %310 = OpAccessChain %64 %32 
                                                      OpStore %310 %309 
                                      bool_3 %312 = OpLoad %216 
                                        bool %313 = OpCompositeExtract %312 1 
                                                      OpSelectionMerge %315 None 
                                                      OpBranchConditional %313 %314 %318 
                                             %314 = OpLabel 
                                Private f32* %316 = OpAccessChain %69 %47 
                                         f32 %317 = OpLoad %316 
                                                      OpStore %311 %317 
                                                      OpBranch %315 
                                             %318 = OpLabel 
                                Private f32* %319 = OpAccessChain %261 %47 
                                         f32 %320 = OpLoad %319 
                                                      OpStore %311 %320 
                                                      OpBranch %315 
                                             %315 = OpLabel 
                                         f32 %321 = OpLoad %311 
                                Private f32* %322 = OpAccessChain %64 %47 
                                                      OpStore %322 %321 
                                      bool_3 %324 = OpLoad %216 
                                        bool %325 = OpCompositeExtract %324 2 
                                                      OpSelectionMerge %327 None 
                                                      OpBranchConditional %325 %326 %330 
                                             %326 = OpLabel 
                                Private f32* %328 = OpAccessChain %69 %126 
                                         f32 %329 = OpLoad %328 
                                                      OpStore %323 %329 
                                                      OpBranch %327 
                                             %330 = OpLabel 
                                Private f32* %331 = OpAccessChain %261 %126 
                                         f32 %332 = OpLoad %331 
                                                      OpStore %323 %332 
                                                      OpBranch %327 
                                             %327 = OpLabel 
                                         f32 %333 = OpLoad %323 
                                Private f32* %334 = OpAccessChain %64 %126 
                                                      OpStore %334 %333 
                                       f32_3 %335 = OpLoad %64 
                                         f32 %340 = OpDot %335 %339 
                                Private f32* %341 = OpAccessChain %173 %32 
                                                      OpStore %341 %340 
                                       f32_3 %343 = OpLoad %64 
                                         f32 %346 = OpDot %343 %345 
                                                      OpStore %342 %346 
                                Uniform i32* %349 = OpAccessChain %15 %348 
                                         i32 %350 = OpLoad %349 
                                        bool %351 = OpINotEqual %350 %20 
                                                      OpSelectionMerge %353 None 
                                                      OpBranchConditional %351 %352 %356 
                                             %352 = OpLabel 
                                Private f32* %354 = OpAccessChain %173 %32 
                                         f32 %355 = OpLoad %354 
                                                      OpStore %347 %355 
                                                      OpBranch %353 
                                             %356 = OpLabel 
                                         f32 %357 = OpLoad %342 
                                                      OpStore %347 %357 
                                                      OpBranch %353 
                                             %353 = OpLabel 
                                         f32 %358 = OpLoad %347 
                                                      OpStore %342 %358 
                                                      OpSelectionMerge %360 None 
                                                      OpBranchConditional %7 %359 %360 
                                             %359 = OpLabel 
                                Uniform i32* %361 = OpAccessChain %15 %348 
                                         i32 %362 = OpLoad %361 
                                        bool %363 = OpIEqual %362 %20 
                                                      OpSelectionMerge %365 None 
                                                      OpBranchConditional %363 %364 %365 
                                             %364 = OpLabel 
                                                      OpBranch %365 
                                             %365 = OpLabel 
                                                      OpBranch %360 
                                             %360 = OpLabel 
                                                      OpSelectionMerge %369 None 
                                                      OpBranchConditional %367 %368 %407 
                                             %368 = OpLabel 
                                         f32 %372 = OpLoad %342 
                                        bool %374 = OpFOrdLessThan %372 %373 
                                                      OpStore %371 %374 
                                         f32 %376 = OpLoad %342 
                                        bool %377 = OpFOrdLessThan %375 %376 
                                      bool_3 %378 = OpLoad %216 
                                      bool_3 %379 = OpCompositeInsert %377 %378 0 
                                                      OpStore %216 %379 
                                Private f32* %380 = OpAccessChain %173 %47 
                                                      OpStore %380 %139 
                                      bool_3 %384 = OpLoad %216 
                                        bool %385 = OpCompositeExtract %384 0 
                                                      OpSelectionMerge %387 None 
                                                      OpBranchConditional %385 %386 %391 
                                             %386 = OpLabel 
                              Uniform f32_4* %389 = OpAccessChain %15 %388 
                                       f32_4 %390 = OpLoad %389 
                                                      OpStore %383 %390 
                                                      OpBranch %387 
                                             %391 = OpLabel 
                                       f32_3 %392 = OpLoad %173 
                                       f32_4 %393 = OpVectorShuffle %392 %392 0 0 0 1 
                                                      OpStore %383 %393 
                                                      OpBranch %387 
                                             %387 = OpLabel 
                                       f32_4 %394 = OpLoad %383 
                                                      OpStore %381 %394 
                                        bool %398 = OpLoad %371 
                                                      OpSelectionMerge %400 None 
                                                      OpBranchConditional %398 %399 %404 
                                             %399 = OpLabel 
                              Uniform f32_4* %402 = OpAccessChain %15 %401 
                                       f32_4 %403 = OpLoad %402 
                                                      OpStore %397 %403 
                                                      OpBranch %400 
                                             %404 = OpLabel 
                                       f32_4 %405 = OpLoad %381 
                                                      OpStore %397 %405 
                                                      OpBranch %400 
                                             %400 = OpLabel 
                                       f32_4 %406 = OpLoad %397 
                                                      OpStore %396 %406 
                                                      OpBranch %369 
                                             %407 = OpLabel 
                                         f32 %408 = OpLoad %342 
                                Uniform f32* %410 = OpAccessChain %15 %409 
                                         f32 %411 = OpLoad %410 
                                        bool %412 = OpFOrdLessThan %408 %411 
                                                      OpStore %371 %412 
                                        bool %413 = OpLoad %371 
                                                      OpSelectionMerge %415 None 
                                                      OpBranchConditional %413 %414 %418 
                                             %414 = OpLabel 
                              Uniform f32_4* %416 = OpAccessChain %15 %401 
                                       f32_4 %417 = OpLoad %416 
                                                      OpStore %396 %417 
                                                      OpBranch %415 
                                             %418 = OpLabel 
                                Uniform f32* %420 = OpAccessChain %15 %419 
                                         f32 %421 = OpLoad %420 
                                         f32 %422 = OpLoad %342 
                                        bool %423 = OpFOrdLessThan %421 %422 
                                                      OpStore %371 %423 
                                        bool %424 = OpLoad %371 
                                                      OpSelectionMerge %426 None 
                                                      OpBranchConditional %424 %425 %429 
                                             %425 = OpLabel 
                              Uniform f32_4* %427 = OpAccessChain %15 %388 
                                       f32_4 %428 = OpLoad %427 
                                                      OpStore %396 %428 
                                                      OpBranch %426 
                                             %429 = OpLabel 
                                       f32_3 %433 = OpLoad %30 
                                       f32_4 %434 = OpVectorShuffle %433 %433 1 0 1 1 
                                       f32_3 %435 = OpLoad %30 
                                       f32_4 %436 = OpVectorShuffle %435 %435 2 2 2 2 
                                      bool_4 %437 = OpFOrdLessThan %434 %436 
                                      bool_2 %438 = OpVectorShuffle %437 %437 0 1 
                                                      OpStore %432 %438 
                                      bool_2 %439 = OpLoad %432 
                                        bool %440 = OpCompositeExtract %439 1 
                                      bool_2 %441 = OpLoad %432 
                                        bool %442 = OpCompositeExtract %441 0 
                                        bool %443 = OpLogicalAnd %440 %442 
                                                      OpStore %371 %443 
                                        bool %444 = OpLoad %371 
                                                      OpSelectionMerge %446 None 
                                                      OpBranchConditional %444 %445 %565 
                                             %445 = OpLabel 
                                Private f32* %447 = OpAccessChain %30 %126 
                                         f32 %448 = OpLoad %447 
                                        bool %449 = OpFOrdNotEqual %448 %139 
                                                      OpStore %371 %449 
                                Private f32* %450 = OpAccessChain %30 %47 
                                         f32 %451 = OpLoad %450 
                                Private f32* %452 = OpAccessChain %30 %32 
                                         f32 %453 = OpLoad %452 
                                        bool %454 = OpFOrdLessThan %451 %453 
                                      bool_2 %455 = OpLoad %432 
                                      bool_2 %456 = OpCompositeInsert %454 %455 0 
                                                      OpStore %432 %456 
                                      bool_2 %459 = OpLoad %432 
                                        bool %460 = OpCompositeExtract %459 0 
                                                      OpSelectionMerge %462 None 
                                                      OpBranchConditional %460 %461 %465 
                                             %461 = OpLabel 
                                Private f32* %463 = OpAccessChain %30 %47 
                                         f32 %464 = OpLoad %463 
                                                      OpStore %458 %464 
                                                      OpBranch %462 
                                             %465 = OpLabel 
                                Private f32* %466 = OpAccessChain %30 %32 
                                         f32 %467 = OpLoad %466 
                                                      OpStore %458 %467 
                                                      OpBranch %462 
                                             %462 = OpLabel 
                                         f32 %468 = OpLoad %458 
                                Private f32* %469 = OpAccessChain %457 %32 
                                                      OpStore %469 %468 
                                Private f32* %470 = OpAccessChain %30 %126 
                                         f32 %471 = OpLoad %470 
                                Private f32* %472 = OpAccessChain %457 %32 
                                         f32 %473 = OpLoad %472 
                                         f32 %474 = OpFNegate %473 
                                         f32 %475 = OpFAdd %471 %474 
                                Private f32* %476 = OpAccessChain %457 %32 
                                                      OpStore %476 %475 
                                Private f32* %477 = OpAccessChain %457 %32 
                                         f32 %478 = OpLoad %477 
                                        bool %479 = OpFOrdNotEqual %478 %139 
                                      bool_2 %480 = OpLoad %432 
                                      bool_2 %481 = OpCompositeInsert %479 %480 0 
                                                      OpStore %432 %481 
                                Private f32* %482 = OpAccessChain %457 %32 
                                         f32 %483 = OpLoad %482 
                                Private f32* %484 = OpAccessChain %30 %126 
                                         f32 %485 = OpLoad %484 
                                         f32 %486 = OpFDiv %483 %485 
                                                      OpStore %342 %486 
                                Private f32* %487 = OpAccessChain %30 %47 
                                         f32 %488 = OpLoad %487 
                                         f32 %489 = OpFNegate %488 
                                Private f32* %490 = OpAccessChain %30 %32 
                                         f32 %491 = OpLoad %490 
                                         f32 %492 = OpFAdd %489 %491 
                                Private f32* %493 = OpAccessChain %180 %32 
                                                      OpStore %493 %492 
                                Private f32* %494 = OpAccessChain %180 %32 
                                         f32 %495 = OpLoad %494 
                                Private f32* %496 = OpAccessChain %457 %32 
                                         f32 %497 = OpLoad %496 
                                         f32 %498 = OpFDiv %495 %497 
                                Private f32* %499 = OpAccessChain %457 %32 
                                                      OpStore %499 %498 
                                Private f32* %501 = OpAccessChain %457 %32 
                                         f32 %502 = OpLoad %501 
                                         f32 %504 = OpFAdd %502 %503 
                                                      OpStore %500 %504 
                                Private f32* %506 = OpAccessChain %180 %32 
                                         f32 %507 = OpLoad %506 
                                         f32 %508 = OpFAdd %507 %503 
                                                      OpStore %505 %508 
                                      bool_2 %510 = OpLoad %432 
                                        bool %511 = OpCompositeExtract %510 0 
                                                      OpSelectionMerge %513 None 
                                                      OpBranchConditional %511 %512 %515 
                                             %512 = OpLabel 
                                         f32 %514 = OpLoad %500 
                                                      OpStore %509 %514 
                                                      OpBranch %513 
                                             %515 = OpLabel 
                                         f32 %516 = OpLoad %505 
                                                      OpStore %509 %516 
                                                      OpBranch %513 
                                             %513 = OpLabel 
                                         f32 %517 = OpLoad %509 
                                Private f32* %518 = OpAccessChain %457 %32 
                                                      OpStore %518 %517 
                                      bool_2 %520 = OpLoad %432 
                                        bool %521 = OpCompositeExtract %520 0 
                                                      OpSelectionMerge %523 None 
                                                      OpBranchConditional %521 %522 %525 
                                             %522 = OpLabel 
                                         f32 %524 = OpLoad %342 
                                                      OpStore %519 %524 
                                                      OpBranch %523 
                                             %525 = OpLabel 
                                                      OpStore %519 %139 
                                                      OpBranch %523 
                                             %523 = OpLabel 
                                         f32 %526 = OpLoad %519 
                                Private f32* %527 = OpAccessChain %180 %126 
                                                      OpStore %527 %526 
                                Private f32* %528 = OpAccessChain %457 %32 
                                         f32 %529 = OpLoad %528 
                                         f32 %530 = OpFMul %529 %81 
                                                      OpStore %342 %530 
                                Private f32* %531 = OpAccessChain %457 %32 
                                         f32 %532 = OpLoad %531 
                                        bool %534 = OpFOrdLessThan %532 %533 
                                      bool_2 %535 = OpLoad %432 
                                      bool_2 %536 = OpCompositeInsert %534 %535 0 
                                                      OpStore %432 %536 
                                Private f32* %537 = OpAccessChain %457 %32 
                                         f32 %538 = OpLoad %537 
                                         f32 %539 = OpFMul %538 %81 
                                         f32 %540 = OpFAdd %539 %231 
                                Private f32* %541 = OpAccessChain %457 %32 
                                                      OpStore %541 %540 
                                      bool_2 %543 = OpLoad %432 
                                        bool %544 = OpCompositeExtract %543 0 
                                                      OpSelectionMerge %546 None 
                                                      OpBranchConditional %544 %545 %549 
                                             %545 = OpLabel 
                                Private f32* %547 = OpAccessChain %457 %32 
                                         f32 %548 = OpLoad %547 
                                                      OpStore %542 %548 
                                                      OpBranch %546 
                                             %549 = OpLabel 
                                         f32 %550 = OpLoad %342 
                                                      OpStore %542 %550 
                                                      OpBranch %546 
                                             %546 = OpLabel 
                                         f32 %551 = OpLoad %542 
                                Private f32* %552 = OpAccessChain %180 %32 
                                                      OpStore %552 %551 
                                        bool %555 = OpLoad %371 
                                                      OpSelectionMerge %557 None 
                                                      OpBranchConditional %555 %556 %560 
                                             %556 = OpLabel 
                                       f32_3 %558 = OpLoad %180 
                                       f32_2 %559 = OpVectorShuffle %558 %558 0 2 
                                                      OpStore %554 %559 
                                                      OpBranch %557 
                                             %560 = OpLabel 
                                                      OpStore %554 %561 
                                                      OpBranch %557 
                                             %557 = OpLabel 
                                       f32_2 %562 = OpLoad %554 
                                       f32_3 %563 = OpLoad %457 
                                       f32_3 %564 = OpVectorShuffle %563 %562 3 1 4 
                                                      OpStore %457 %564 
                                                      OpBranch %446 
                                             %565 = OpLabel 
                                Private f32* %566 = OpAccessChain %30 %32 
                                         f32 %567 = OpLoad %566 
                                Private f32* %568 = OpAccessChain %30 %47 
                                         f32 %569 = OpLoad %568 
                                        bool %570 = OpFOrdLessThan %567 %569 
                                                      OpStore %371 %570 
                                        bool %571 = OpLoad %371 
                                                      OpSelectionMerge %573 None 
                                                      OpBranchConditional %571 %572 %686 
                                             %572 = OpLabel 
                                Private f32* %574 = OpAccessChain %30 %47 
                                         f32 %575 = OpLoad %574 
                                        bool %576 = OpFOrdNotEqual %575 %139 
                                                      OpStore %371 %576 
                                      bool_2 %578 = OpLoad %432 
                                        bool %579 = OpCompositeExtract %578 1 
                                                      OpSelectionMerge %581 None 
                                                      OpBranchConditional %579 %580 %584 
                                             %580 = OpLabel 
                                Private f32* %582 = OpAccessChain %30 %32 
                                         f32 %583 = OpLoad %582 
                                                      OpStore %577 %583 
                                                      OpBranch %581 
                                             %584 = OpLabel 
                                Private f32* %585 = OpAccessChain %30 %126 
                                         f32 %586 = OpLoad %585 
                                                      OpStore %577 %586 
                                                      OpBranch %581 
                                             %581 = OpLabel 
                                         f32 %587 = OpLoad %577 
                                Private f32* %588 = OpAccessChain %180 %32 
                                                      OpStore %588 %587 
                                Private f32* %589 = OpAccessChain %30 %47 
                                         f32 %590 = OpLoad %589 
                                Private f32* %591 = OpAccessChain %180 %32 
                                         f32 %592 = OpLoad %591 
                                         f32 %593 = OpFNegate %592 
                                         f32 %594 = OpFAdd %590 %593 
                                Private f32* %595 = OpAccessChain %180 %32 
                                                      OpStore %595 %594 
                                Private f32* %596 = OpAccessChain %180 %32 
                                         f32 %597 = OpLoad %596 
                                        bool %598 = OpFOrdNotEqual %597 %139 
                                      bool_2 %599 = OpLoad %432 
                                      bool_2 %600 = OpCompositeInsert %598 %599 0 
                                                      OpStore %432 %600 
                                Private f32* %602 = OpAccessChain %180 %32 
                                         f32 %603 = OpLoad %602 
                                Private f32* %604 = OpAccessChain %30 %47 
                                         f32 %605 = OpLoad %604 
                                         f32 %606 = OpFDiv %603 %605 
                                Private f32* %607 = OpAccessChain %601 %32 
                                                      OpStore %607 %606 
                                Private f32* %608 = OpAccessChain %30 %32 
                                         f32 %609 = OpLoad %608 
                                         f32 %610 = OpFNegate %609 
                                Private f32* %611 = OpAccessChain %30 %126 
                                         f32 %612 = OpLoad %611 
                                         f32 %613 = OpFAdd %610 %612 
                                Private f32* %614 = OpAccessChain %180 %126 
                                                      OpStore %614 %613 
                                Private f32* %615 = OpAccessChain %180 %126 
                                         f32 %616 = OpLoad %615 
                                Private f32* %617 = OpAccessChain %180 %32 
                                         f32 %618 = OpLoad %617 
                                         f32 %619 = OpFDiv %616 %618 
                                Private f32* %620 = OpAccessChain %180 %32 
                                                      OpStore %620 %619 
                                       f32_3 %622 = OpLoad %180 
                                       f32_2 %623 = OpVectorShuffle %622 %622 0 2 
                                       f32_2 %626 = OpFAdd %623 %625 
                                                      OpStore %621 %626 
                                      bool_2 %628 = OpLoad %432 
                                        bool %629 = OpCompositeExtract %628 0 
                                                      OpSelectionMerge %631 None 
                                                      OpBranchConditional %629 %630 %634 
                                             %630 = OpLabel 
                                Private f32* %632 = OpAccessChain %621 %32 
                                         f32 %633 = OpLoad %632 
                                                      OpStore %627 %633 
                                                      OpBranch %631 
                                             %634 = OpLabel 
                                Private f32* %635 = OpAccessChain %621 %47 
                                         f32 %636 = OpLoad %635 
                                                      OpStore %627 %636 
                                                      OpBranch %631 
                                             %631 = OpLabel 
                                         f32 %637 = OpLoad %627 
                                Private f32* %638 = OpAccessChain %180 %32 
                                                      OpStore %638 %637 
                                      bool_2 %641 = OpLoad %432 
                                        bool %642 = OpCompositeExtract %641 0 
                                                      OpSelectionMerge %644 None 
                                                      OpBranchConditional %642 %643 %647 
                                             %643 = OpLabel 
                                Private f32* %645 = OpAccessChain %601 %32 
                                         f32 %646 = OpLoad %645 
                                                      OpStore %640 %646 
                                                      OpBranch %644 
                                             %647 = OpLabel 
                                                      OpStore %640 %139 
                                                      OpBranch %644 
                                             %644 = OpLabel 
                                         f32 %648 = OpLoad %640 
                                Private f32* %649 = OpAccessChain %639 %126 
                                                      OpStore %649 %648 
                                Private f32* %650 = OpAccessChain %180 %32 
                                         f32 %651 = OpLoad %650 
                                         f32 %652 = OpFMul %651 %81 
                                Private f32* %653 = OpAccessChain %601 %32 
                                                      OpStore %653 %652 
                                Private f32* %654 = OpAccessChain %180 %32 
                                         f32 %655 = OpLoad %654 
                                        bool %656 = OpFOrdLessThan %655 %533 
                                      bool_2 %657 = OpLoad %432 
                                      bool_2 %658 = OpCompositeInsert %656 %657 0 
                                                      OpStore %432 %658 
                                Private f32* %659 = OpAccessChain %180 %32 
                                         f32 %660 = OpLoad %659 
                                         f32 %661 = OpFMul %660 %81 
                                         f32 %662 = OpFAdd %661 %231 
                                Private f32* %663 = OpAccessChain %180 %32 
                                                      OpStore %663 %662 
                                      bool_2 %665 = OpLoad %432 
                                        bool %666 = OpCompositeExtract %665 0 
                                                      OpSelectionMerge %668 None 
                                                      OpBranchConditional %666 %667 %671 
                                             %667 = OpLabel 
                                Private f32* %669 = OpAccessChain %180 %32 
                                         f32 %670 = OpLoad %669 
                                                      OpStore %664 %670 
                                                      OpBranch %668 
                                             %671 = OpLabel 
                                Private f32* %672 = OpAccessChain %601 %32 
                                         f32 %673 = OpLoad %672 
                                                      OpStore %664 %673 
                                                      OpBranch %668 
                                             %668 = OpLabel 
                                         f32 %674 = OpLoad %664 
                                Private f32* %675 = OpAccessChain %639 %32 
                                                      OpStore %675 %674 
                                        bool %677 = OpLoad %371 
                                                      OpSelectionMerge %679 None 
                                                      OpBranchConditional %677 %678 %682 
                                             %678 = OpLabel 
                                       f32_3 %680 = OpLoad %639 
                                       f32_2 %681 = OpVectorShuffle %680 %680 0 2 
                                                      OpStore %676 %681 
                                                      OpBranch %679 
                                             %682 = OpLabel 
                                                      OpStore %676 %561 
                                                      OpBranch %679 
                                             %679 = OpLabel 
                                       f32_2 %683 = OpLoad %676 
                                       f32_3 %684 = OpLoad %457 
                                       f32_3 %685 = OpVectorShuffle %684 %683 3 1 4 
                                                      OpStore %457 %685 
                                                      OpBranch %573 
                                             %686 = OpLabel 
                                Private f32* %687 = OpAccessChain %30 %32 
                                         f32 %688 = OpLoad %687 
                                        bool %689 = OpFOrdNotEqual %688 %139 
                                                      OpStore %371 %689 
                                Private f32* %690 = OpAccessChain %30 %126 
                                         f32 %691 = OpLoad %690 
                                Private f32* %692 = OpAccessChain %30 %47 
                                         f32 %693 = OpLoad %692 
                                        bool %694 = OpFOrdLessThan %691 %693 
                                      bool_2 %695 = OpLoad %432 
                                      bool_2 %696 = OpCompositeInsert %694 %695 0 
                                                      OpStore %432 %696 
                                      bool_2 %698 = OpLoad %432 
                                        bool %699 = OpCompositeExtract %698 0 
                                                      OpSelectionMerge %701 None 
                                                      OpBranchConditional %699 %700 %704 
                                             %700 = OpLabel 
                                Private f32* %702 = OpAccessChain %30 %126 
                                         f32 %703 = OpLoad %702 
                                                      OpStore %697 %703 
                                                      OpBranch %701 
                                             %704 = OpLabel 
                                Private f32* %705 = OpAccessChain %30 %47 
                                         f32 %706 = OpLoad %705 
                                                      OpStore %697 %706 
                                                      OpBranch %701 
                                             %701 = OpLabel 
                                         f32 %707 = OpLoad %697 
                                Private f32* %708 = OpAccessChain %180 %32 
                                                      OpStore %708 %707 
                                Private f32* %709 = OpAccessChain %30 %32 
                                         f32 %710 = OpLoad %709 
                                Private f32* %711 = OpAccessChain %180 %32 
                                         f32 %712 = OpLoad %711 
                                         f32 %713 = OpFNegate %712 
                                         f32 %714 = OpFAdd %710 %713 
                                Private f32* %715 = OpAccessChain %180 %32 
                                                      OpStore %715 %714 
                                Private f32* %716 = OpAccessChain %180 %32 
                                         f32 %717 = OpLoad %716 
                                        bool %718 = OpFOrdNotEqual %717 %139 
                                      bool_2 %719 = OpLoad %432 
                                      bool_2 %720 = OpCompositeInsert %718 %719 0 
                                                      OpStore %432 %720 
                                Private f32* %721 = OpAccessChain %180 %32 
                                         f32 %722 = OpLoad %721 
                                Private f32* %723 = OpAccessChain %30 %32 
                                         f32 %724 = OpLoad %723 
                                         f32 %725 = OpFDiv %722 %724 
                                Private f32* %726 = OpAccessChain %601 %47 
                                                      OpStore %726 %725 
                                Private f32* %728 = OpAccessChain %30 %126 
                                         f32 %729 = OpLoad %728 
                                         f32 %730 = OpFNegate %729 
                                Private f32* %731 = OpAccessChain %30 %47 
                                         f32 %732 = OpLoad %731 
                                         f32 %733 = OpFAdd %730 %732 
                                Private f32* %734 = OpAccessChain %727 %32 
                                                      OpStore %734 %733 
                                Private f32* %735 = OpAccessChain %727 %32 
                                         f32 %736 = OpLoad %735 
                                Private f32* %737 = OpAccessChain %180 %32 
                                         f32 %738 = OpLoad %737 
                                         f32 %739 = OpFDiv %736 %738 
                                Private f32* %740 = OpAccessChain %601 %32 
                                                      OpStore %740 %739 
                                Private f32* %741 = OpAccessChain %727 %47 
                                                      OpStore %741 %139 
                                      bool_2 %743 = OpLoad %432 
                                        bool %744 = OpCompositeExtract %743 0 
                                                      OpSelectionMerge %746 None 
                                                      OpBranchConditional %744 %745 %748 
                                             %745 = OpLabel 
                                       f32_2 %747 = OpLoad %601 
                                                      OpStore %742 %747 
                                                      OpBranch %746 
                                             %748 = OpLabel 
                                       f32_2 %749 = OpLoad %727 
                                                      OpStore %742 %749 
                                                      OpBranch %746 
                                             %746 = OpLabel 
                                       f32_2 %750 = OpLoad %742 
                                       f32_3 %751 = OpLoad %180 
                                       f32_3 %752 = OpVectorShuffle %751 %750 0 3 4 
                                                      OpStore %180 %752 
                                Private f32* %754 = OpAccessChain %180 %47 
                                         f32 %755 = OpLoad %754 
                                         f32 %756 = OpFMul %755 %81 
                                                      OpStore %753 %756 
                                Private f32* %758 = OpAccessChain %180 %47 
                                         f32 %759 = OpLoad %758 
                                        bool %760 = OpFOrdLessThan %759 %533 
                                      bool_2 %761 = OpLoad %757 
                                      bool_2 %762 = OpCompositeInsert %760 %761 0 
                                                      OpStore %757 %762 
                                Private f32* %763 = OpAccessChain %180 %47 
                                         f32 %764 = OpLoad %763 
                                         f32 %765 = OpFMul %764 %81 
                                         f32 %766 = OpFAdd %765 %231 
                                Private f32* %767 = OpAccessChain %601 %32 
                                                      OpStore %767 %766 
                                      bool_2 %769 = OpLoad %757 
                                        bool %770 = OpCompositeExtract %769 0 
                                                      OpSelectionMerge %772 None 
                                                      OpBranchConditional %770 %771 %775 
                                             %771 = OpLabel 
                                Private f32* %773 = OpAccessChain %601 %32 
                                         f32 %774 = OpLoad %773 
                                                      OpStore %768 %774 
                                                      OpBranch %772 
                                             %775 = OpLabel 
                                         f32 %776 = OpLoad %753 
                                                      OpStore %768 %776 
                                                      OpBranch %772 
                                             %772 = OpLabel 
                                         f32 %777 = OpLoad %768 
                                Private f32* %778 = OpAccessChain %180 %32 
                                                      OpStore %778 %777 
                                        bool %780 = OpLoad %371 
                                                      OpSelectionMerge %782 None 
                                                      OpBranchConditional %780 %781 %785 
                                             %781 = OpLabel 
                                       f32_3 %783 = OpLoad %180 
                                       f32_2 %784 = OpVectorShuffle %783 %783 0 2 
                                                      OpStore %779 %784 
                                                      OpBranch %782 
                                             %785 = OpLabel 
                                                      OpStore %779 %561 
                                                      OpBranch %782 
                                             %782 = OpLabel 
                                       f32_2 %786 = OpLoad %779 
                                       f32_3 %787 = OpLoad %457 
                                       f32_3 %788 = OpVectorShuffle %787 %786 3 1 4 
                                                      OpStore %457 %788 
                                                      OpBranch %573 
                                             %573 = OpLabel 
                                                      OpBranch %446 
                                             %446 = OpLabel 
                              Uniform f32_4* %790 = OpAccessChain %15 %789 
                                       f32_4 %791 = OpLoad %790 
                                       f32_4 %792 = OpVectorShuffle %791 %791 1 0 1 1 
                              Uniform f32_4* %793 = OpAccessChain %15 %789 
                                       f32_4 %794 = OpLoad %793 
                                       f32_4 %795 = OpVectorShuffle %794 %794 2 2 2 2 
                                      bool_4 %796 = OpFOrdLessThan %792 %795 
                                      bool_2 %797 = OpVectorShuffle %796 %796 0 1 
                                                      OpStore %757 %797 
                                      bool_2 %798 = OpLoad %757 
                                        bool %799 = OpCompositeExtract %798 1 
                                      bool_2 %800 = OpLoad %757 
                                        bool %801 = OpCompositeExtract %800 0 
                                        bool %802 = OpLogicalAnd %799 %801 
                                      bool_2 %803 = OpLoad %757 
                                      bool_2 %804 = OpCompositeInsert %802 %803 0 
                                                      OpStore %757 %804 
                                      bool_2 %805 = OpLoad %757 
                                        bool %806 = OpCompositeExtract %805 0 
                                                      OpSelectionMerge %808 None 
                                                      OpBranchConditional %806 %807 %916 
                                             %807 = OpLabel 
                                Uniform f32* %809 = OpAccessChain %15 %789 %126 
                                         f32 %810 = OpLoad %809 
                                        bool %811 = OpFOrdNotEqual %810 %139 
                                      bool_2 %812 = OpLoad %757 
                                      bool_2 %813 = OpCompositeInsert %811 %812 0 
                                                      OpStore %757 %813 
                                Uniform f32* %814 = OpAccessChain %15 %789 %47 
                                         f32 %815 = OpLoad %814 
                                Uniform f32* %816 = OpAccessChain %15 %789 %32 
                                         f32 %817 = OpLoad %816 
                                         f32 %818 = OpExtInst %1 37 %815 %817 
                                Private f32* %819 = OpAccessChain %180 %32 
                                                      OpStore %819 %818 
                                Private f32* %820 = OpAccessChain %180 %32 
                                         f32 %821 = OpLoad %820 
                                         f32 %822 = OpFNegate %821 
                                Uniform f32* %823 = OpAccessChain %15 %789 %126 
                                         f32 %824 = OpLoad %823 
                                         f32 %825 = OpFAdd %822 %824 
                                Private f32* %826 = OpAccessChain %180 %32 
                                                      OpStore %826 %825 
                                Private f32* %828 = OpAccessChain %180 %32 
                                         f32 %829 = OpLoad %828 
                                        bool %830 = OpFOrdNotEqual %829 %139 
                                      bool_2 %831 = OpLoad %827 
                                      bool_2 %832 = OpCompositeInsert %830 %831 0 
                                                      OpStore %827 %832 
                                Private f32* %833 = OpAccessChain %180 %32 
                                         f32 %834 = OpLoad %833 
                                Uniform f32* %835 = OpAccessChain %15 %789 %126 
                                         f32 %836 = OpLoad %835 
                                         f32 %837 = OpFDiv %834 %836 
                                Private f32* %838 = OpAccessChain %601 %32 
                                                      OpStore %838 %837 
                                Uniform f32* %839 = OpAccessChain %15 %789 %47 
                                         f32 %840 = OpLoad %839 
                                         f32 %841 = OpFNegate %840 
                                Uniform f32* %842 = OpAccessChain %15 %789 %32 
                                         f32 %843 = OpLoad %842 
                                         f32 %844 = OpFAdd %841 %843 
                                Private f32* %845 = OpAccessChain %180 %126 
                                                      OpStore %845 %844 
                                Private f32* %846 = OpAccessChain %180 %126 
                                         f32 %847 = OpLoad %846 
                                Private f32* %848 = OpAccessChain %180 %32 
                                         f32 %849 = OpLoad %848 
                                         f32 %850 = OpFDiv %847 %849 
                                Private f32* %851 = OpAccessChain %180 %32 
                                                      OpStore %851 %850 
                                       f32_3 %853 = OpLoad %180 
                                       f32_2 %854 = OpVectorShuffle %853 %853 0 2 
                                       f32_2 %856 = OpFAdd %854 %855 
                                                      OpStore %852 %856 
                                      bool_2 %858 = OpLoad %827 
                                        bool %859 = OpCompositeExtract %858 0 
                                                      OpSelectionMerge %861 None 
                                                      OpBranchConditional %859 %860 %864 
                                             %860 = OpLabel 
                                Private f32* %862 = OpAccessChain %852 %32 
                                         f32 %863 = OpLoad %862 
                                                      OpStore %857 %863 
                                                      OpBranch %861 
                                             %864 = OpLabel 
                                Private f32* %865 = OpAccessChain %852 %47 
                                         f32 %866 = OpLoad %865 
                                                      OpStore %857 %866 
                                                      OpBranch %861 
                                             %861 = OpLabel 
                                         f32 %867 = OpLoad %857 
                                Private f32* %868 = OpAccessChain %180 %32 
                                                      OpStore %868 %867 
                                      bool_2 %870 = OpLoad %827 
                                        bool %871 = OpCompositeExtract %870 0 
                                                      OpSelectionMerge %873 None 
                                                      OpBranchConditional %871 %872 %876 
                                             %872 = OpLabel 
                                Private f32* %874 = OpAccessChain %601 %32 
                                         f32 %875 = OpLoad %874 
                                                      OpStore %869 %875 
                                                      OpBranch %873 
                                             %876 = OpLabel 
                                                      OpStore %869 %139 
                                                      OpBranch %873 
                                             %873 = OpLabel 
                                         f32 %877 = OpLoad %869 
                                Private f32* %878 = OpAccessChain %639 %126 
                                                      OpStore %878 %877 
                                Private f32* %879 = OpAccessChain %180 %32 
                                         f32 %880 = OpLoad %879 
                                         f32 %881 = OpFMul %880 %81 
                                Private f32* %882 = OpAccessChain %601 %32 
                                                      OpStore %882 %881 
                                Private f32* %883 = OpAccessChain %180 %32 
                                         f32 %884 = OpLoad %883 
                                        bool %885 = OpFOrdLessThan %884 %533 
                                      bool_2 %886 = OpLoad %827 
                                      bool_2 %887 = OpCompositeInsert %885 %886 0 
                                                      OpStore %827 %887 
                                Private f32* %888 = OpAccessChain %180 %32 
                                         f32 %889 = OpLoad %888 
                                         f32 %890 = OpFMul %889 %81 
                                         f32 %891 = OpFAdd %890 %231 
                                Private f32* %892 = OpAccessChain %180 %32 
                                                      OpStore %892 %891 
                                      bool_2 %894 = OpLoad %827 
                                        bool %895 = OpCompositeExtract %894 0 
                                                      OpSelectionMerge %897 None 
                                                      OpBranchConditional %895 %896 %900 
                                             %896 = OpLabel 
                                Private f32* %898 = OpAccessChain %180 %32 
                                         f32 %899 = OpLoad %898 
                                                      OpStore %893 %899 
                                                      OpBranch %897 
                                             %900 = OpLabel 
                                Private f32* %901 = OpAccessChain %601 %32 
                                         f32 %902 = OpLoad %901 
                                                      OpStore %893 %902 
                                                      OpBranch %897 
                                             %897 = OpLabel 
                                         f32 %903 = OpLoad %893 
                                Private f32* %904 = OpAccessChain %639 %32 
                                                      OpStore %904 %903 
                                      bool_2 %906 = OpLoad %757 
                                        bool %907 = OpCompositeExtract %906 0 
                                                      OpSelectionMerge %909 None 
                                                      OpBranchConditional %907 %908 %912 
                                             %908 = OpLabel 
                                       f32_3 %910 = OpLoad %639 
                                       f32_2 %911 = OpVectorShuffle %910 %910 0 2 
                                                      OpStore %905 %911 
                                                      OpBranch %909 
                                             %912 = OpLabel 
                                                      OpStore %905 %561 
                                                      OpBranch %909 
                                             %909 = OpLabel 
                                       f32_2 %913 = OpLoad %905 
                                       f32_3 %914 = OpLoad %180 
                                       f32_3 %915 = OpVectorShuffle %914 %913 3 4 2 
                                                      OpStore %180 %915 
                                                      OpBranch %808 
                                             %916 = OpLabel 
                                Uniform f32* %917 = OpAccessChain %15 %789 %32 
                                         f32 %918 = OpLoad %917 
                                Uniform f32* %919 = OpAccessChain %15 %789 %47 
                                         f32 %920 = OpLoad %919 
                                        bool %921 = OpFOrdLessThan %918 %920 
                                      bool_2 %922 = OpLoad %757 
                                      bool_2 %923 = OpCompositeInsert %921 %922 0 
                                                      OpStore %757 %923 
                                                      OpSelectionMerge %925 None 
                                                      OpBranchConditional %7 %924 %925 
                                             %924 = OpLabel 
                                      bool_2 %926 = OpLoad %757 
                                        bool %927 = OpCompositeExtract %926 0 
                                                      OpSelectionMerge %929 None 
                                                      OpBranchConditional %927 %928 %929 
                                             %928 = OpLabel 
                                                      OpBranch %929 
                                             %929 = OpLabel 
                                                      OpBranch %925 
                                             %925 = OpLabel 
                                                      OpSelectionMerge %932 None 
                                                      OpBranchConditional %930 %931 %1037 
                                             %931 = OpLabel 
                                Uniform f32* %933 = OpAccessChain %15 %789 %47 
                                         f32 %934 = OpLoad %933 
                                        bool %935 = OpFOrdNotEqual %934 %139 
                                      bool_2 %936 = OpLoad %757 
                                      bool_2 %937 = OpCompositeInsert %935 %936 0 
                                                      OpStore %757 %937 
                                Uniform f32* %939 = OpAccessChain %15 %789 %32 
                                         f32 %940 = OpLoad %939 
                                Uniform f32* %941 = OpAccessChain %15 %789 %126 
                                         f32 %942 = OpLoad %941 
                                         f32 %943 = OpExtInst %1 37 %940 %942 
                                Private f32* %944 = OpAccessChain %938 %32 
                                                      OpStore %944 %943 
                                Private f32* %945 = OpAccessChain %938 %32 
                                         f32 %946 = OpLoad %945 
                                         f32 %947 = OpFNegate %946 
                                Uniform f32* %948 = OpAccessChain %15 %789 %47 
                                         f32 %949 = OpLoad %948 
                                         f32 %950 = OpFAdd %947 %949 
                                Private f32* %951 = OpAccessChain %938 %32 
                                                      OpStore %951 %950 
                                Private f32* %952 = OpAccessChain %938 %32 
                                         f32 %953 = OpLoad %952 
                                        bool %954 = OpFOrdNotEqual %953 %139 
                                      bool_2 %955 = OpLoad %827 
                                      bool_2 %956 = OpCompositeInsert %954 %955 0 
                                                      OpStore %827 %956 
                                Private f32* %957 = OpAccessChain %938 %32 
                                         f32 %958 = OpLoad %957 
                                Uniform f32* %959 = OpAccessChain %15 %789 %47 
                                         f32 %960 = OpLoad %959 
                                         f32 %961 = OpFDiv %958 %960 
                                                      OpStore %753 %961 
                                Uniform f32* %962 = OpAccessChain %15 %789 %32 
                                         f32 %963 = OpLoad %962 
                                         f32 %964 = OpFNegate %963 
                                Uniform f32* %965 = OpAccessChain %15 %789 %126 
                                         f32 %966 = OpLoad %965 
                                         f32 %967 = OpFAdd %964 %966 
                                Private f32* %968 = OpAccessChain %639 %32 
                                                      OpStore %968 %967 
                                Private f32* %969 = OpAccessChain %639 %32 
                                         f32 %970 = OpLoad %969 
                                Private f32* %971 = OpAccessChain %938 %32 
                                         f32 %972 = OpLoad %971 
                                         f32 %973 = OpFDiv %970 %972 
                                Private f32* %974 = OpAccessChain %938 %32 
                                                      OpStore %974 %973 
                                Private f32* %975 = OpAccessChain %938 %32 
                                         f32 %976 = OpLoad %975 
                                         f32 %977 = OpFAdd %976 %624 
                                Private f32* %978 = OpAccessChain %852 %32 
                                                      OpStore %978 %977 
                                Private f32* %979 = OpAccessChain %639 %32 
                                         f32 %980 = OpLoad %979 
                                         f32 %981 = OpFAdd %980 %624 
                                                      OpStore %119 %981 
                                      bool_2 %983 = OpLoad %827 
                                        bool %984 = OpCompositeExtract %983 0 
                                                      OpSelectionMerge %986 None 
                                                      OpBranchConditional %984 %985 %989 
                                             %985 = OpLabel 
                                Private f32* %987 = OpAccessChain %852 %32 
                                         f32 %988 = OpLoad %987 
                                                      OpStore %982 %988 
                                                      OpBranch %986 
                                             %989 = OpLabel 
                                         f32 %990 = OpLoad %119 
                                                      OpStore %982 %990 
                                                      OpBranch %986 
                                             %986 = OpLabel 
                                         f32 %991 = OpLoad %982 
                                Private f32* %992 = OpAccessChain %938 %32 
                                                      OpStore %992 %991 
                                      bool_2 %994 = OpLoad %827 
                                        bool %995 = OpCompositeExtract %994 0 
                                                      OpSelectionMerge %997 None 
                                                      OpBranchConditional %995 %996 %999 
                                             %996 = OpLabel 
                                         f32 %998 = OpLoad %753 
                                                      OpStore %993 %998 
                                                      OpBranch %997 
                                             %999 = OpLabel 
                                                      OpStore %993 %139 
                                                      OpBranch %997 
                                             %997 = OpLabel 
                                        f32 %1000 = OpLoad %993 
                               Private f32* %1001 = OpAccessChain %639 %126 
                                                      OpStore %1001 %1000 
                               Private f32* %1002 = OpAccessChain %938 %32 
                                        f32 %1003 = OpLoad %1002 
                                        f32 %1004 = OpFMul %1003 %81 
                                                      OpStore %753 %1004 
                               Private f32* %1005 = OpAccessChain %938 %32 
                                        f32 %1006 = OpLoad %1005 
                                       bool %1007 = OpFOrdLessThan %1006 %533 
                                     bool_2 %1008 = OpLoad %827 
                                     bool_2 %1009 = OpCompositeInsert %1007 %1008 0 
                                                      OpStore %827 %1009 
                               Private f32* %1010 = OpAccessChain %938 %32 
                                        f32 %1011 = OpLoad %1010 
                                        f32 %1012 = OpFMul %1011 %81 
                                        f32 %1013 = OpFAdd %1012 %231 
                               Private f32* %1014 = OpAccessChain %938 %32 
                                                      OpStore %1014 %1013 
                                     bool_2 %1016 = OpLoad %827 
                                       bool %1017 = OpCompositeExtract %1016 0 
                                                      OpSelectionMerge %1019 None 
                                                      OpBranchConditional %1017 %1018 %1022 
                                            %1018 = OpLabel 
                               Private f32* %1020 = OpAccessChain %938 %32 
                                        f32 %1021 = OpLoad %1020 
                                                      OpStore %1015 %1021 
                                                      OpBranch %1019 
                                            %1022 = OpLabel 
                                        f32 %1023 = OpLoad %753 
                                                      OpStore %1015 %1023 
                                                      OpBranch %1019 
                                            %1019 = OpLabel 
                                        f32 %1024 = OpLoad %1015 
                               Private f32* %1025 = OpAccessChain %639 %32 
                                                      OpStore %1025 %1024 
                                     bool_2 %1027 = OpLoad %757 
                                       bool %1028 = OpCompositeExtract %1027 0 
                                                      OpSelectionMerge %1030 None 
                                                      OpBranchConditional %1028 %1029 %1033 
                                            %1029 = OpLabel 
                                      f32_3 %1031 = OpLoad %639 
                                      f32_2 %1032 = OpVectorShuffle %1031 %1031 0 2 
                                                      OpStore %1026 %1032 
                                                      OpBranch %1030 
                                            %1033 = OpLabel 
                                                      OpStore %1026 %561 
                                                      OpBranch %1030 
                                            %1030 = OpLabel 
                                      f32_2 %1034 = OpLoad %1026 
                                      f32_3 %1035 = OpLoad %180 
                                      f32_3 %1036 = OpVectorShuffle %1035 %1034 3 4 2 
                                                      OpStore %180 %1036 
                                                      OpBranch %932 
                                            %1037 = OpLabel 
                               Uniform f32* %1038 = OpAccessChain %15 %789 %32 
                                        f32 %1039 = OpLoad %1038 
                                       bool %1040 = OpFOrdNotEqual %1039 %139 
                                     bool_2 %1041 = OpLoad %757 
                                     bool_2 %1042 = OpCompositeInsert %1040 %1041 0 
                                                      OpStore %757 %1042 
                               Uniform f32* %1043 = OpAccessChain %15 %789 %126 
                                        f32 %1044 = OpLoad %1043 
                               Uniform f32* %1045 = OpAccessChain %15 %789 %47 
                                        f32 %1046 = OpLoad %1045 
                                        f32 %1047 = OpExtInst %1 37 %1044 %1046 
                               Private f32* %1048 = OpAccessChain %938 %32 
                                                      OpStore %1048 %1047 
                               Private f32* %1049 = OpAccessChain %938 %32 
                                        f32 %1050 = OpLoad %1049 
                                        f32 %1051 = OpFNegate %1050 
                               Uniform f32* %1052 = OpAccessChain %15 %789 %32 
                                        f32 %1053 = OpLoad %1052 
                                        f32 %1054 = OpFAdd %1051 %1053 
                               Private f32* %1055 = OpAccessChain %938 %32 
                                                      OpStore %1055 %1054 
                               Private f32* %1056 = OpAccessChain %938 %32 
                                        f32 %1057 = OpLoad %1056 
                                       bool %1058 = OpFOrdNotEqual %1057 %139 
                                     bool_2 %1059 = OpLoad %827 
                                     bool_2 %1060 = OpCompositeInsert %1058 %1059 0 
                                                      OpStore %827 %1060 
                               Private f32* %1061 = OpAccessChain %938 %32 
                                        f32 %1062 = OpLoad %1061 
                               Uniform f32* %1063 = OpAccessChain %15 %789 %32 
                                        f32 %1064 = OpLoad %1063 
                                        f32 %1065 = OpFDiv %1062 %1064 
                               Private f32* %1066 = OpAccessChain %727 %47 
                                                      OpStore %1066 %1065 
                               Uniform f32* %1068 = OpAccessChain %15 %789 %126 
                                        f32 %1069 = OpLoad %1068 
                                        f32 %1070 = OpFNegate %1069 
                               Uniform f32* %1071 = OpAccessChain %15 %789 %47 
                                        f32 %1072 = OpLoad %1071 
                                        f32 %1073 = OpFAdd %1070 %1072 
                               Private f32* %1074 = OpAccessChain %1067 %32 
                                                      OpStore %1074 %1073 
                               Private f32* %1075 = OpAccessChain %1067 %32 
                                        f32 %1076 = OpLoad %1075 
                               Private f32* %1077 = OpAccessChain %938 %32 
                                        f32 %1078 = OpLoad %1077 
                                        f32 %1079 = OpFDiv %1076 %1078 
                               Private f32* %1080 = OpAccessChain %727 %32 
                                                      OpStore %1080 %1079 
                               Private f32* %1081 = OpAccessChain %1067 %47 
                                                      OpStore %1081 %139 
                                     bool_2 %1083 = OpLoad %827 
                                       bool %1084 = OpCompositeExtract %1083 0 
                                                      OpSelectionMerge %1086 None 
                                                      OpBranchConditional %1084 %1085 %1088 
                                            %1085 = OpLabel 
                                      f32_2 %1087 = OpLoad %727 
                                                      OpStore %1082 %1087 
                                                      OpBranch %1086 
                                            %1088 = OpLabel 
                                      f32_2 %1089 = OpLoad %1067 
                                                      OpStore %1082 %1089 
                                                      OpBranch %1086 
                                            %1086 = OpLabel 
                                      f32_2 %1090 = OpLoad %1082 
                                      f32_3 %1091 = OpLoad %639 
                                      f32_3 %1092 = OpVectorShuffle %1091 %1090 0 3 4 
                                                      OpStore %639 %1092 
                               Private f32* %1093 = OpAccessChain %639 %47 
                                        f32 %1094 = OpLoad %1093 
                                        f32 %1095 = OpFMul %1094 %81 
                               Private f32* %1096 = OpAccessChain %938 %32 
                                                      OpStore %1096 %1095 
                               Private f32* %1097 = OpAccessChain %639 %47 
                                        f32 %1098 = OpLoad %1097 
                                       bool %1099 = OpFOrdLessThan %1098 %533 
                                     bool_2 %1100 = OpLoad %827 
                                     bool_2 %1101 = OpCompositeInsert %1099 %1100 0 
                                                      OpStore %827 %1101 
                               Private f32* %1102 = OpAccessChain %639 %47 
                                        f32 %1103 = OpLoad %1102 
                                        f32 %1104 = OpFMul %1103 %81 
                                        f32 %1105 = OpFAdd %1104 %231 
                                                      OpStore %753 %1105 
                                     bool_2 %1107 = OpLoad %827 
                                       bool %1108 = OpCompositeExtract %1107 0 
                                                      OpSelectionMerge %1110 None 
                                                      OpBranchConditional %1108 %1109 %1112 
                                            %1109 = OpLabel 
                                        f32 %1111 = OpLoad %753 
                                                      OpStore %1106 %1111 
                                                      OpBranch %1110 
                                            %1112 = OpLabel 
                               Private f32* %1113 = OpAccessChain %938 %32 
                                        f32 %1114 = OpLoad %1113 
                                                      OpStore %1106 %1114 
                                                      OpBranch %1110 
                                            %1110 = OpLabel 
                                        f32 %1115 = OpLoad %1106 
                               Private f32* %1116 = OpAccessChain %639 %32 
                                                      OpStore %1116 %1115 
                                     bool_2 %1118 = OpLoad %757 
                                       bool %1119 = OpCompositeExtract %1118 0 
                                                      OpSelectionMerge %1121 None 
                                                      OpBranchConditional %1119 %1120 %1124 
                                            %1120 = OpLabel 
                                      f32_3 %1122 = OpLoad %639 
                                      f32_2 %1123 = OpVectorShuffle %1122 %1122 0 2 
                                                      OpStore %1117 %1123 
                                                      OpBranch %1121 
                                            %1124 = OpLabel 
                                                      OpStore %1117 %561 
                                                      OpBranch %1121 
                                            %1121 = OpLabel 
                                      f32_2 %1125 = OpLoad %1117 
                                      f32_3 %1126 = OpLoad %180 
                                      f32_3 %1127 = OpVectorShuffle %1126 %1125 3 4 2 
                                                      OpStore %180 %1127 
                                                      OpBranch %932 
                                             %932 = OpLabel 
                                                      OpBranch %808 
                                             %808 = OpLabel 
                                      f32_3 %1128 = OpLoad %180 
                                      f32_2 %1129 = OpVectorShuffle %1128 %1128 1 0 
                               Uniform f32* %1131 = OpAccessChain %15 %1130 
                                        f32 %1132 = OpLoad %1131 
                               Uniform f32* %1134 = OpAccessChain %15 %1133 
                                        f32 %1135 = OpLoad %1134 
                                      f32_2 %1136 = OpCompositeConstruct %1132 %1135 
                                      f32_2 %1137 = OpFNegate %1136 
                                      f32_2 %1138 = OpFAdd %1129 %1137 
                                                      OpStore %938 %1138 
                                      f32_3 %1139 = OpLoad %457 
                                      f32_4 %1140 = OpVectorShuffle %1139 %1139 2 0 2 2 
                                      f32_2 %1141 = OpLoad %938 
                                      f32_4 %1142 = OpVectorShuffle %1141 %1141 0 1 0 0 
                                     bool_4 %1143 = OpFOrdLessThan %1140 %1142 
                                     bool_2 %1144 = OpVectorShuffle %1143 %1143 0 1 
                                                      OpStore %757 %1144 
                               Private f32* %1145 = OpAccessChain %938 %47 
                                        f32 %1146 = OpLoad %1145 
                                        f32 %1147 = OpFAdd %1146 %231 
                               Private f32* %1148 = OpAccessChain %938 %32 
                                                      OpStore %1148 %1147 
                               Private f32* %1150 = OpAccessChain %457 %32 
                                        f32 %1151 = OpLoad %1150 
                               Private f32* %1152 = OpAccessChain %938 %32 
                                        f32 %1153 = OpLoad %1152 
                                       bool %1154 = OpFOrdLessThan %1151 %1153 
                                                      OpStore %1149 %1154 
                                       bool %1155 = OpLoad %1149 
                                     bool_2 %1156 = OpLoad %757 
                                       bool %1157 = OpCompositeExtract %1156 1 
                                       bool %1158 = OpLogicalAnd %1155 %1157 
                                     bool_2 %1159 = OpLoad %827 
                                     bool_2 %1160 = OpCompositeInsert %1158 %1159 0 
                                                      OpStore %827 %1160 
                                     bool_2 %1161 = OpLoad %827 
                                       bool %1162 = OpCompositeExtract %1161 0 
                                     bool_2 %1163 = OpLoad %757 
                                       bool %1164 = OpCompositeExtract %1163 0 
                                       bool %1165 = OpLogicalOr %1162 %1164 
                                     bool_2 %1166 = OpLoad %757 
                                     bool_2 %1167 = OpCompositeInsert %1165 %1166 0 
                                                      OpStore %757 %1167 
                                      f32_3 %1168 = OpLoad %180 
                                      f32_2 %1169 = OpVectorShuffle %1168 %1168 1 0 
                               Uniform f32* %1170 = OpAccessChain %15 %1130 
                                        f32 %1171 = OpLoad %1170 
                               Uniform f32* %1172 = OpAccessChain %15 %1133 
                                        f32 %1173 = OpLoad %1172 
                                      f32_2 %1174 = OpCompositeConstruct %1171 %1173 
                                      f32_2 %1175 = OpFAdd %1169 %1174 
                                      f32_3 %1176 = OpLoad %180 
                                      f32_3 %1177 = OpVectorShuffle %1176 %1175 3 4 2 
                                                      OpStore %180 %1177 
                                      f32_3 %1178 = OpLoad %180 
                                      f32_4 %1179 = OpVectorShuffle %1178 %1178 0 1 0 0 
                                      f32_3 %1180 = OpLoad %457 
                                      f32_4 %1181 = OpVectorShuffle %1180 %1180 2 0 2 2 
                                     bool_4 %1182 = OpFOrdLessThan %1179 %1181 
                                     bool_2 %1183 = OpVectorShuffle %1182 %1182 0 1 
                                                      OpStore %827 %1183 
                               Private f32* %1184 = OpAccessChain %180 %47 
                                        f32 %1185 = OpLoad %1184 
                                        f32 %1187 = OpFAdd %1185 %1186 
                                                      OpStore %342 %1187 
                                        f32 %1188 = OpLoad %342 
                               Private f32* %1189 = OpAccessChain %457 %32 
                                        f32 %1190 = OpLoad %1189 
                                       bool %1191 = OpFOrdLessThan %1188 %1190 
                                                      OpStore %371 %1191 
                                       bool %1192 = OpLoad %371 
                                     bool_2 %1193 = OpLoad %827 
                                       bool %1194 = OpCompositeExtract %1193 1 
                                       bool %1195 = OpLogicalAnd %1192 %1194 
                                                      OpStore %1149 %1195 
                                       bool %1196 = OpLoad %1149 
                                     bool_2 %1197 = OpLoad %827 
                                       bool %1198 = OpCompositeExtract %1197 0 
                                       bool %1199 = OpLogicalOr %1196 %1198 
                                     bool_2 %1200 = OpLoad %827 
                                     bool_2 %1201 = OpCompositeInsert %1199 %1200 0 
                                                      OpStore %827 %1201 
                               Private f32* %1202 = OpAccessChain %173 %126 
                                                      OpStore %1202 %139 
                                     bool_2 %1204 = OpLoad %827 
                                       bool %1205 = OpCompositeExtract %1204 0 
                                                      OpSelectionMerge %1207 None 
                                                      OpBranchConditional %1205 %1206 %1210 
                                            %1206 = OpLabel 
                             Uniform f32_4* %1208 = OpAccessChain %15 %388 
                                      f32_4 %1209 = OpLoad %1208 
                                                      OpStore %1203 %1209 
                                                      OpBranch %1207 
                                            %1210 = OpLabel 
                                      f32_3 %1211 = OpLoad %173 
                                      f32_4 %1212 = OpVectorShuffle %1211 %1211 0 0 0 2 
                                                      OpStore %1203 %1212 
                                                      OpBranch %1207 
                                            %1207 = OpLabel 
                                      f32_4 %1213 = OpLoad %1203 
                                                      OpStore %381 %1213 
                                     bool_2 %1215 = OpLoad %757 
                                       bool %1216 = OpCompositeExtract %1215 0 
                                                      OpSelectionMerge %1218 None 
                                                      OpBranchConditional %1216 %1217 %1221 
                                            %1217 = OpLabel 
                             Uniform f32_4* %1219 = OpAccessChain %15 %401 
                                      f32_4 %1220 = OpLoad %1219 
                                                      OpStore %1214 %1220 
                                                      OpBranch %1218 
                                            %1221 = OpLabel 
                                      f32_4 %1222 = OpLoad %381 
                                                      OpStore %1214 %1222 
                                                      OpBranch %1218 
                                            %1218 = OpLabel 
                                      f32_4 %1223 = OpLoad %1214 
                                                      OpStore %396 %1223 
                                                      OpBranch %426 
                                             %426 = OpLabel 
                                                      OpBranch %415 
                                             %415 = OpLabel 
                                                      OpBranch %369 
                                             %369 = OpLabel 
                                                      OpBranch %27 
                                            %1224 = OpLabel 
                               Uniform i32* %1225 = OpAccessChain %15 %16 
                                        i32 %1226 = OpLoad %1225 
                                       bool %1227 = OpIEqual %1226 %90 
                                     bool_2 %1228 = OpLoad %757 
                                     bool_2 %1229 = OpCompositeInsert %1227 %1228 0 
                                                      OpStore %757 %1229 
                                     bool_2 %1231 = OpLoad %757 
                                       bool %1232 = OpCompositeExtract %1231 0 
                                                      OpSelectionMerge %1234 None 
                                                      OpBranchConditional %1232 %1233 %1237 
                                            %1233 = OpLabel 
                             Uniform f32_4* %1235 = OpAccessChain %15 %401 
                                      f32_4 %1236 = OpLoad %1235 
                                                      OpStore %1230 %1236 
                                                      OpBranch %1234 
                                            %1237 = OpLabel 
                                                      OpStore %1230 %1238 
                                                      OpBranch %1234 
                                            %1234 = OpLabel 
                                      f32_4 %1239 = OpLoad %1230 
                                                      OpStore %396 %1239 
                                                      OpBranch %27 
                                              %27 = OpLabel 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_DynamicLightmapST;
uniform 	bvec4 unity_MetaVertexControl;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD1;
in  vec4 in_TEXCOORD2;
out vec3 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb6;
void main()
{
    u_xlatb0 = 0.0<in_POSITION0.z;
    u_xlat0.z = u_xlatb0 ? 9.99999975e-005 : float(0.0);
    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    u_xlat0.xyz = (unity_MetaVertexControl.x) ? u_xlat0.xyz : in_POSITION0.xyz;
    u_xlatb6 = 0.0<u_xlat0.z;
    u_xlat1.z = u_xlatb6 ? 9.99999975e-005 : float(0.0);
    u_xlat1.xy = in_TEXCOORD2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
    u_xlat0.xyz = (unity_MetaVertexControl.y) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	float _CausticScale;
uniform 	vec4 _CausticColor;
uniform 	float _ReflPower;
uniform 	float _TimeScale;
uniform 	vec4 _LightCausticColor;
uniform 	float _LightCausticPower;
uniform 	float _GlobalReflectionsEnabled;
uniform 	bvec4 unity_MetaFragmentControl;
uniform 	float unity_OneOverOutputBoost;
uniform 	float unity_MaxOutputValue;
uniform  sampler2D _CausticTex;
uniform  sampler2D _ReflMapFromPixelator;
in  vec3 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
float u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.y + vs_TEXCOORD0.x;
    u_xlat0.x = _Time.y * _TimeScale + u_xlat0.x;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat1.x = u_xlat1.x * 0.111111112;
    u_xlat1.y = u_xlat0.x * 0.166666672;
    u_xlat0.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(_CausticScale);
    u_xlat0.xy = u_xlat0.xy * vec2(0.200000003, 0.200000003);
    u_xlat4 = _Time.x * _TimeScale;
    u_xlat0.xy = vec2(u_xlat4) * vec2(0.5, 0.125) + u_xlat0.xy;
    u_xlat10_0 = texture(_CausticTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_LightCausticPower);
    u_xlat0.xyz = u_xlat0.xyz * _LightCausticColor.xyz + _CausticColor.xyz;
    u_xlat6 = vs_TEXCOORD1.y * 500.0;
    u_xlat6 = _Time.z * 5.0 + u_xlat6;
    u_xlat6 = sin(u_xlat6);
    u_xlat1.x = u_xlat6 * 0.00150000001;
    u_xlat1.y = 0.0;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD1.xy;
    u_xlat10_1 = texture(_ReflMapFromPixelator, u_xlat1.xy);
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.75, 0.75, 0.75) + u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.0500000007, 0.0500000007, 0.0500000007);
    u_xlat6 = u_xlat10_1.w * _ReflPower;
    u_xlat6 = u_xlat6 * _GlobalReflectionsEnabled;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat6 = unity_OneOverOutputBoost;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = min(u_xlat0.xyz, vec3(vec3(unity_MaxOutputValue, unity_MaxOutputValue, unity_MaxOutputValue)));
    u_xlat0.w = 1.0;
    u_xlat0 = (unity_MetaFragmentControl.x) ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    SV_Target0 = (unity_MetaFragmentControl.y) ? vec4(0.0, 0.0, 0.0, 1.0) : u_xlat0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 251
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %13 %32 %89 %174 %209 %233 
                                                      OpDecorate %13 Location 13 
                                                      OpDecorate %32 Location 32 
                                                      OpDecorate %37 ArrayStride 37 
                                                      OpDecorate %38 ArrayStride 38 
                                                      OpMemberDecorate %40 0 Offset 40 
                                                      OpMemberDecorate %40 1 Offset 40 
                                                      OpMemberDecorate %40 2 Offset 40 
                                                      OpMemberDecorate %40 3 Offset 40 
                                                      OpMemberDecorate %40 4 Offset 40 
                                                      OpMemberDecorate %40 5 Offset 40 
                                                      OpDecorate %40 Block 
                                                      OpDecorate %42 DescriptorSet 42 
                                                      OpDecorate %42 Binding 42 
                                                      OpDecorate %89 Location 89 
                                                      OpMemberDecorate %172 0 BuiltIn 172 
                                                      OpMemberDecorate %172 1 BuiltIn 172 
                                                      OpMemberDecorate %172 2 BuiltIn 172 
                                                      OpDecorate %172 Block 
                                                      OpDecorate %209 Location 209 
                                                      OpDecorate %233 Location 233 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeBool 
                                               %7 = OpTypePointer Private %6 
                                 Private bool* %8 = OpVariable Private 
                                               %9 = OpTypeFloat 32 
                                          f32 %10 = OpConstant 3.67402E-40 
                                              %11 = OpTypeVector %9 4 
                                              %12 = OpTypePointer Input %11 
                                 Input f32_4* %13 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 2 
                                              %16 = OpTypePointer Input %9 
                                              %20 = OpTypePointer Private %11 
                               Private f32_4* %21 = OpVariable Private 
                                              %22 = OpTypePointer Function %9 
                                          f32 %27 = OpConstant 3.67402E-40 
                                              %30 = OpTypePointer Private %9 
                                 Input f32_4* %32 = OpVariable Input 
                                              %33 = OpTypeVector %9 2 
                                          u32 %36 = OpConstant 4 
                                              %37 = OpTypeArray %11 %36 
                                              %38 = OpTypeArray %11 %36 
                                              %39 = OpTypeVector %14 4 
                                              %40 = OpTypeStruct %11 %37 %38 %11 %11 %39 
                                              %41 = OpTypePointer Uniform %40 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4; f32_4; u32_4;}* %42 = OpVariable Uniform 
                                              %43 = OpTypeInt 32 1 
                                          i32 %44 = OpConstant 3 
                                              %45 = OpTypePointer Uniform %11 
                                              %56 = OpTypeVector %9 3 
                                              %57 = OpTypePointer Function %56 
                                          i32 %59 = OpConstant 5 
                                              %60 = OpTypeVector %6 4 
                                              %61 = OpTypePointer Uniform %39 
                                          u32 %65 = OpConstant 0 
                                Private bool* %77 = OpVariable Private 
                               Private f32_4* %81 = OpVariable Private 
                                 Input f32_4* %89 = OpVariable Input 
                                          i32 %92 = OpConstant 4 
                                         i32 %120 = OpConstant 1 
                                         i32 %124 = OpConstant 0 
                                         i32 %132 = OpConstant 2 
                                         u32 %170 = OpConstant 1 
                                             %171 = OpTypeArray %9 %170 
                                             %172 = OpTypeStruct %11 %9 %171 
                                             %173 = OpTypePointer Output %172 
        Output struct {f32_4; f32; f32[1];}* %174 = OpVariable Output 
                                             %176 = OpTypePointer Output %11 
                                             %208 = OpTypePointer Output %56 
                               Output f32_3* %209 = OpVariable Output 
                                             %221 = OpTypePointer Uniform %9 
                                         f32 %228 = OpConstant 3.67402E-40 
                                       f32_3 %229 = OpConstantComposite %228 %228 %228 
                               Output f32_4* %233 = OpVariable Output 
                                             %245 = OpTypePointer Output %9 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function f32* %23 = OpVariable Function 
                              Function f32_3* %58 = OpVariable Function 
                                Function f32* %82 = OpVariable Function 
                             Function f32_3* %103 = OpVariable Function 
                                   Input f32* %17 = OpAccessChain %13 %15 
                                          f32 %18 = OpLoad %17 
                                         bool %19 = OpFOrdLessThan %10 %18 
                                                      OpStore %8 %19 
                                         bool %24 = OpLoad %8 
                                                      OpSelectionMerge %26 None 
                                                      OpBranchConditional %24 %25 %28 
                                              %25 = OpLabel 
                                                      OpStore %23 %27 
                                                      OpBranch %26 
                                              %28 = OpLabel 
                                                      OpStore %23 %10 
                                                      OpBranch %26 
                                              %26 = OpLabel 
                                          f32 %29 = OpLoad %23 
                                 Private f32* %31 = OpAccessChain %21 %15 
                                                      OpStore %31 %29 
                                        f32_4 %34 = OpLoad %32 
                                        f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               Uniform f32_4* %46 = OpAccessChain %42 %44 
                                        f32_4 %47 = OpLoad %46 
                                        f32_2 %48 = OpVectorShuffle %47 %47 0 1 
                                        f32_2 %49 = OpFMul %35 %48 
                               Uniform f32_4* %50 = OpAccessChain %42 %44 
                                        f32_4 %51 = OpLoad %50 
                                        f32_2 %52 = OpVectorShuffle %51 %51 2 3 
                                        f32_2 %53 = OpFAdd %49 %52 
                                        f32_4 %54 = OpLoad %21 
                                        f32_4 %55 = OpVectorShuffle %54 %53 4 5 2 3 
                                                      OpStore %21 %55 
                               Uniform u32_4* %62 = OpAccessChain %42 %59 
                                        u32_4 %63 = OpLoad %62 
                                          u32 %64 = OpCompositeExtract %63 0 
                                         bool %66 = OpINotEqual %64 %65 
                                                      OpSelectionMerge %68 None 
                                                      OpBranchConditional %66 %67 %71 
                                              %67 = OpLabel 
                                        f32_4 %69 = OpLoad %21 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                                                      OpStore %58 %70 
                                                      OpBranch %68 
                                              %71 = OpLabel 
                                        f32_4 %72 = OpLoad %13 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                                      OpStore %58 %73 
                                                      OpBranch %68 
                                              %68 = OpLabel 
                                        f32_3 %74 = OpLoad %58 
                                        f32_4 %75 = OpLoad %21 
                                        f32_4 %76 = OpVectorShuffle %75 %74 4 5 6 3 
                                                      OpStore %21 %76 
                                 Private f32* %78 = OpAccessChain %21 %15 
                                          f32 %79 = OpLoad %78 
                                         bool %80 = OpFOrdLessThan %10 %79 
                                                      OpStore %77 %80 
                                         bool %83 = OpLoad %77 
                                                      OpSelectionMerge %85 None 
                                                      OpBranchConditional %83 %84 %86 
                                              %84 = OpLabel 
                                                      OpStore %82 %27 
                                                      OpBranch %85 
                                              %86 = OpLabel 
                                                      OpStore %82 %10 
                                                      OpBranch %85 
                                              %85 = OpLabel 
                                          f32 %87 = OpLoad %82 
                                 Private f32* %88 = OpAccessChain %81 %15 
                                                      OpStore %88 %87 
                                        f32_4 %90 = OpLoad %89 
                                        f32_2 %91 = OpVectorShuffle %90 %90 0 1 
                               Uniform f32_4* %93 = OpAccessChain %42 %92 
                                        f32_4 %94 = OpLoad %93 
                                        f32_2 %95 = OpVectorShuffle %94 %94 0 1 
                                        f32_2 %96 = OpFMul %91 %95 
                               Uniform f32_4* %97 = OpAccessChain %42 %92 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 2 3 
                                       f32_2 %100 = OpFAdd %96 %99 
                                       f32_4 %101 = OpLoad %81 
                                       f32_4 %102 = OpVectorShuffle %101 %100 4 5 2 3 
                                                      OpStore %81 %102 
                              Uniform u32_4* %104 = OpAccessChain %42 %59 
                                       u32_4 %105 = OpLoad %104 
                                         u32 %106 = OpCompositeExtract %105 1 
                                        bool %107 = OpINotEqual %106 %65 
                                                      OpSelectionMerge %109 None 
                                                      OpBranchConditional %107 %108 %112 
                                             %108 = OpLabel 
                                       f32_4 %110 = OpLoad %81 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                                      OpStore %103 %111 
                                                      OpBranch %109 
                                             %112 = OpLabel 
                                       f32_4 %113 = OpLoad %21 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                                      OpStore %103 %114 
                                                      OpBranch %109 
                                             %109 = OpLabel 
                                       f32_3 %115 = OpLoad %103 
                                       f32_4 %116 = OpLoad %21 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 6 3 
                                                      OpStore %21 %117 
                                       f32_4 %118 = OpLoad %21 
                                       f32_4 %119 = OpVectorShuffle %118 %118 1 1 1 1 
                              Uniform f32_4* %121 = OpAccessChain %42 %120 %120 
                                       f32_4 %122 = OpLoad %121 
                                       f32_4 %123 = OpFMul %119 %122 
                                                      OpStore %81 %123 
                              Uniform f32_4* %125 = OpAccessChain %42 %120 %124 
                                       f32_4 %126 = OpLoad %125 
                                       f32_4 %127 = OpLoad %21 
                                       f32_4 %128 = OpVectorShuffle %127 %127 0 0 0 0 
                                       f32_4 %129 = OpFMul %126 %128 
                                       f32_4 %130 = OpLoad %81 
                                       f32_4 %131 = OpFAdd %129 %130 
                                                      OpStore %81 %131 
                              Uniform f32_4* %133 = OpAccessChain %42 %120 %132 
                                       f32_4 %134 = OpLoad %133 
                                       f32_4 %135 = OpLoad %21 
                                       f32_4 %136 = OpVectorShuffle %135 %135 2 2 2 2 
                                       f32_4 %137 = OpFMul %134 %136 
                                       f32_4 %138 = OpLoad %81 
                                       f32_4 %139 = OpFAdd %137 %138 
                                                      OpStore %21 %139 
                                       f32_4 %140 = OpLoad %21 
                              Uniform f32_4* %141 = OpAccessChain %42 %120 %44 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpFAdd %140 %142 
                                                      OpStore %21 %143 
                                       f32_4 %144 = OpLoad %21 
                                       f32_4 %145 = OpVectorShuffle %144 %144 1 1 1 1 
                              Uniform f32_4* %146 = OpAccessChain %42 %132 %120 
                                       f32_4 %147 = OpLoad %146 
                                       f32_4 %148 = OpFMul %145 %147 
                                                      OpStore %81 %148 
                              Uniform f32_4* %149 = OpAccessChain %42 %132 %124 
                                       f32_4 %150 = OpLoad %149 
                                       f32_4 %151 = OpLoad %21 
                                       f32_4 %152 = OpVectorShuffle %151 %151 0 0 0 0 
                                       f32_4 %153 = OpFMul %150 %152 
                                       f32_4 %154 = OpLoad %81 
                                       f32_4 %155 = OpFAdd %153 %154 
                                                      OpStore %81 %155 
                              Uniform f32_4* %156 = OpAccessChain %42 %132 %132 
                                       f32_4 %157 = OpLoad %156 
                                       f32_4 %158 = OpLoad %21 
                                       f32_4 %159 = OpVectorShuffle %158 %158 2 2 2 2 
                                       f32_4 %160 = OpFMul %157 %159 
                                       f32_4 %161 = OpLoad %81 
                                       f32_4 %162 = OpFAdd %160 %161 
                                                      OpStore %81 %162 
                              Uniform f32_4* %163 = OpAccessChain %42 %132 %44 
                                       f32_4 %164 = OpLoad %163 
                                       f32_4 %165 = OpLoad %21 
                                       f32_4 %166 = OpVectorShuffle %165 %165 3 3 3 3 
                                       f32_4 %167 = OpFMul %164 %166 
                                       f32_4 %168 = OpLoad %81 
                                       f32_4 %169 = OpFAdd %167 %168 
                                                      OpStore %21 %169 
                                       f32_4 %175 = OpLoad %21 
                               Output f32_4* %177 = OpAccessChain %174 %124 
                                                      OpStore %177 %175 
                                       f32_4 %178 = OpLoad %13 
                                       f32_3 %179 = OpVectorShuffle %178 %178 1 1 1 
                              Uniform f32_4* %180 = OpAccessChain %42 %120 %120 
                                       f32_4 %181 = OpLoad %180 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
                                       f32_3 %183 = OpFMul %179 %182 
                                       f32_4 %184 = OpLoad %81 
                                       f32_4 %185 = OpVectorShuffle %184 %183 4 5 6 3 
                                                      OpStore %81 %185 
                              Uniform f32_4* %186 = OpAccessChain %42 %120 %124 
                                       f32_4 %187 = OpLoad %186 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                                       f32_4 %189 = OpLoad %13 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 0 0 
                                       f32_3 %191 = OpFMul %188 %190 
                                       f32_4 %192 = OpLoad %81 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                                       f32_3 %194 = OpFAdd %191 %193 
                                       f32_4 %195 = OpLoad %81 
                                       f32_4 %196 = OpVectorShuffle %195 %194 4 5 6 3 
                                                      OpStore %81 %196 
                              Uniform f32_4* %197 = OpAccessChain %42 %120 %132 
                                       f32_4 %198 = OpLoad %197 
                                       f32_3 %199 = OpVectorShuffle %198 %198 0 1 2 
                                       f32_4 %200 = OpLoad %13 
                                       f32_3 %201 = OpVectorShuffle %200 %200 2 2 2 
                                       f32_3 %202 = OpFMul %199 %201 
                                       f32_4 %203 = OpLoad %81 
                                       f32_3 %204 = OpVectorShuffle %203 %203 0 1 2 
                                       f32_3 %205 = OpFAdd %202 %204 
                                       f32_4 %206 = OpLoad %81 
                                       f32_4 %207 = OpVectorShuffle %206 %205 4 5 6 3 
                                                      OpStore %81 %207 
                              Uniform f32_4* %210 = OpAccessChain %42 %120 %44 
                                       f32_4 %211 = OpLoad %210 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 1 2 
                                       f32_4 %213 = OpLoad %13 
                                       f32_3 %214 = OpVectorShuffle %213 %213 3 3 3 
                                       f32_3 %215 = OpFMul %212 %214 
                                       f32_4 %216 = OpLoad %81 
                                       f32_3 %217 = OpVectorShuffle %216 %216 0 1 2 
                                       f32_3 %218 = OpFAdd %215 %217 
                                                      OpStore %209 %218 
                                Private f32* %219 = OpAccessChain %21 %170 
                                         f32 %220 = OpLoad %219 
                                Uniform f32* %222 = OpAccessChain %42 %124 %65 
                                         f32 %223 = OpLoad %222 
                                         f32 %224 = OpFMul %220 %223 
                                Private f32* %225 = OpAccessChain %21 %170 
                                                      OpStore %225 %224 
                                       f32_4 %226 = OpLoad %21 
                                       f32_3 %227 = OpVectorShuffle %226 %226 0 3 1 
                                       f32_3 %230 = OpFMul %227 %229 
                                       f32_4 %231 = OpLoad %81 
                                       f32_4 %232 = OpVectorShuffle %231 %230 4 1 5 6 
                                                      OpStore %81 %232 
                                       f32_4 %234 = OpLoad %21 
                                       f32_2 %235 = OpVectorShuffle %234 %234 2 3 
                                       f32_4 %236 = OpLoad %233 
                                       f32_4 %237 = OpVectorShuffle %236 %235 0 1 4 5 
                                                      OpStore %233 %237 
                                       f32_4 %238 = OpLoad %81 
                                       f32_2 %239 = OpVectorShuffle %238 %238 2 2 
                                       f32_4 %240 = OpLoad %81 
                                       f32_2 %241 = OpVectorShuffle %240 %240 0 3 
                                       f32_2 %242 = OpFAdd %239 %241 
                                       f32_4 %243 = OpLoad %233 
                                       f32_4 %244 = OpVectorShuffle %243 %242 4 5 2 3 
                                                      OpStore %233 %244 
                                 Output f32* %246 = OpAccessChain %174 %124 %170 
                                         f32 %247 = OpLoad %246 
                                         f32 %248 = OpFNegate %247 
                                 Output f32* %249 = OpAccessChain %174 %124 %170 
                                                      OpStore %249 %248 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 275
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %131 %261 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %11 Location 11 
                                                      OpMemberDecorate %25 0 Offset 25 
                                                      OpMemberDecorate %25 1 Offset 25 
                                                      OpMemberDecorate %25 2 Offset 25 
                                                      OpMemberDecorate %25 3 Offset 25 
                                                      OpMemberDecorate %25 4 Offset 25 
                                                      OpMemberDecorate %25 5 Offset 25 
                                                      OpMemberDecorate %25 6 Offset 25 
                                                      OpMemberDecorate %25 7 Offset 25 
                                                      OpMemberDecorate %25 8 Offset 25 
                                                      OpMemberDecorate %25 9 Offset 25 
                                                      OpMemberDecorate %25 10 Offset 25 
                                                      OpDecorate %25 Block 
                                                      OpDecorate %27 DescriptorSet 27 
                                                      OpDecorate %27 Binding 27 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %105 DescriptorSet 105 
                                                      OpDecorate %105 Binding 105 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %110 RelaxedPrecision 
                                                      OpDecorate %111 RelaxedPrecision 
                                                      OpDecorate %115 RelaxedPrecision 
                                                      OpDecorate %116 RelaxedPrecision 
                                                      OpDecorate %131 Location 131 
                                                      OpDecorate %156 RelaxedPrecision 
                                                      OpDecorate %157 RelaxedPrecision 
                                                      OpDecorate %157 DescriptorSet 157 
                                                      OpDecorate %157 Binding 157 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %161 RelaxedPrecision 
                                                      OpDecorate %166 RelaxedPrecision 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %169 RelaxedPrecision 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %261 Location 261 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_3* %11 = OpVariable Input 
                                              %12 = OpTypeInt 32 0 
                                          u32 %13 = OpConstant 1 
                                              %14 = OpTypePointer Input %6 
                                          u32 %17 = OpConstant 0 
                                              %21 = OpTypePointer Private %6 
                                              %23 = OpTypeVector %6 4 
                                              %24 = OpTypeVector %12 4 
                                              %25 = OpTypeStruct %23 %6 %23 %6 %6 %23 %6 %6 %24 %6 %6 
                                              %26 = OpTypePointer Uniform %25 
Uniform struct {f32_4; f32; f32_4; f32; f32; f32_4; f32; f32; u32_4; f32; f32;}* %27 = OpVariable Uniform 
                                              %28 = OpTypeInt 32 1 
                                          i32 %29 = OpConstant 0 
                                              %30 = OpTypePointer Uniform %6 
                                          i32 %33 = OpConstant 4 
                                              %41 = OpTypeVector %6 2 
                                              %42 = OpTypePointer Private %41 
                               Private f32_2* %43 = OpVariable Private 
                                          f32 %54 = OpConstant 3.67402E-40 
                                          f32 %59 = OpConstant 3.67402E-40 
                                          i32 %70 = OpConstant 1 
                                          f32 %79 = OpConstant 3.67402E-40 
                                        f32_2 %80 = OpConstantComposite %79 %79 
                                 Private f32* %84 = OpVariable Private 
                                          f32 %92 = OpConstant 3.67402E-40 
                                          f32 %93 = OpConstant 3.67402E-40 
                                        f32_2 %94 = OpConstantComposite %92 %93 
                              Private f32_3* %101 = OpVariable Private 
                                             %102 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %103 = OpTypeSampledImage %102 
                                             %104 = OpTypePointer UniformConstant %103 
 UniformConstant read_only Texture2DSampled* %105 = OpVariable UniformConstant 
                                         i32 %112 = OpConstant 6 
                                         i32 %118 = OpConstant 5 
                                             %119 = OpTypePointer Uniform %23 
                                         i32 %124 = OpConstant 2 
                                Private f32* %129 = OpVariable Private 
                                             %130 = OpTypePointer Input %23 
                                Input f32_4* %131 = OpVariable Input 
                                         f32 %134 = OpConstant 3.67402E-40 
                                         u32 %136 = OpConstant 2 
                                         f32 %139 = OpConstant 3.67402E-40 
                                         f32 %146 = OpConstant 3.67402E-40 
                                         f32 %149 = OpConstant 3.67402E-40 
                                             %155 = OpTypePointer Private %23 
                              Private f32_4* %156 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %157 = OpVariable UniformConstant 
                              Private f32_3* %161 = OpVariable Private 
                                         f32 %163 = OpConstant 3.67402E-40 
                                       f32_3 %164 = OpConstantComposite %163 %163 %163 
                              Private f32_3* %169 = OpVariable Private 
                                       f32_3 %171 = OpConstantComposite %92 %92 %92 
                                         f32 %173 = OpConstant 3.67402E-40 
                                       f32_3 %174 = OpConstantComposite %173 %173 %173 
                                         u32 %176 = OpConstant 3 
                                         i32 %179 = OpConstant 3 
                                         i32 %186 = OpConstant 7 
                              Private f32_3* %191 = OpVariable Private 
                                         i32 %204 = OpConstant 9 
                                         f32 %208 = OpConstant 3.67402E-40 
                                         i32 %217 = OpConstant 10 
                              Private f32_4* %230 = OpVariable Private 
                                             %231 = OpTypePointer Function %7 
                                         i32 %233 = OpConstant 8 
                                             %234 = OpTypeBool 
                                             %235 = OpTypeVector %234 4 
                                             %236 = OpTypePointer Uniform %24 
                                       f32_3 %245 = OpConstantComposite %149 %149 %149 
                                             %249 = OpTypePointer Function %6 
                                             %260 = OpTypePointer Output %23 
                               Output f32_4* %261 = OpVariable Output 
                                             %262 = OpTypePointer Function %23 
                                       f32_4 %270 = OpConstantComposite %149 %149 %149 %208 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %232 = OpVariable Function 
                               Function f32* %250 = OpVariable Function 
                             Function f32_4* %263 = OpVariable Function 
                                   Input f32* %15 = OpAccessChain %11 %13 
                                          f32 %16 = OpLoad %15 
                                   Input f32* %18 = OpAccessChain %11 %17 
                                          f32 %19 = OpLoad %18 
                                          f32 %20 = OpFAdd %16 %19 
                                 Private f32* %22 = OpAccessChain %9 %17 
                                                      OpStore %22 %20 
                                 Uniform f32* %31 = OpAccessChain %27 %29 %13 
                                          f32 %32 = OpLoad %31 
                                 Uniform f32* %34 = OpAccessChain %27 %33 
                                          f32 %35 = OpLoad %34 
                                          f32 %36 = OpFMul %32 %35 
                                 Private f32* %37 = OpAccessChain %9 %17 
                                          f32 %38 = OpLoad %37 
                                          f32 %39 = OpFAdd %36 %38 
                                 Private f32* %40 = OpAccessChain %9 %17 
                                                      OpStore %40 %39 
                                 Private f32* %44 = OpAccessChain %9 %17 
                                          f32 %45 = OpLoad %44 
                                          f32 %46 = OpExtInst %1 14 %45 
                                 Private f32* %47 = OpAccessChain %43 %17 
                                                      OpStore %47 %46 
                                 Private f32* %48 = OpAccessChain %9 %17 
                                          f32 %49 = OpLoad %48 
                                          f32 %50 = OpExtInst %1 13 %49 
                                 Private f32* %51 = OpAccessChain %9 %17 
                                                      OpStore %51 %50 
                                 Private f32* %52 = OpAccessChain %43 %17 
                                          f32 %53 = OpLoad %52 
                                          f32 %55 = OpFMul %53 %54 
                                 Private f32* %56 = OpAccessChain %43 %17 
                                                      OpStore %56 %55 
                                 Private f32* %57 = OpAccessChain %9 %17 
                                          f32 %58 = OpLoad %57 
                                          f32 %60 = OpFMul %58 %59 
                                 Private f32* %61 = OpAccessChain %43 %13 
                                                      OpStore %61 %60 
                                        f32_2 %62 = OpLoad %43 
                                        f32_3 %63 = OpLoad %11 
                                        f32_2 %64 = OpVectorShuffle %63 %63 0 1 
                                        f32_2 %65 = OpFAdd %62 %64 
                                        f32_3 %66 = OpLoad %9 
                                        f32_3 %67 = OpVectorShuffle %66 %65 3 4 2 
                                                      OpStore %9 %67 
                                        f32_3 %68 = OpLoad %9 
                                        f32_2 %69 = OpVectorShuffle %68 %68 0 1 
                                 Uniform f32* %71 = OpAccessChain %27 %70 
                                          f32 %72 = OpLoad %71 
                                        f32_2 %73 = OpCompositeConstruct %72 %72 
                                        f32_2 %74 = OpFMul %69 %73 
                                        f32_3 %75 = OpLoad %9 
                                        f32_3 %76 = OpVectorShuffle %75 %74 3 4 2 
                                                      OpStore %9 %76 
                                        f32_3 %77 = OpLoad %9 
                                        f32_2 %78 = OpVectorShuffle %77 %77 0 1 
                                        f32_2 %81 = OpFMul %78 %80 
                                        f32_3 %82 = OpLoad %9 
                                        f32_3 %83 = OpVectorShuffle %82 %81 3 4 2 
                                                      OpStore %9 %83 
                                 Uniform f32* %85 = OpAccessChain %27 %29 %17 
                                          f32 %86 = OpLoad %85 
                                 Uniform f32* %87 = OpAccessChain %27 %33 
                                          f32 %88 = OpLoad %87 
                                          f32 %89 = OpFMul %86 %88 
                                                      OpStore %84 %89 
                                          f32 %90 = OpLoad %84 
                                        f32_2 %91 = OpCompositeConstruct %90 %90 
                                        f32_2 %95 = OpFMul %91 %94 
                                        f32_3 %96 = OpLoad %9 
                                        f32_2 %97 = OpVectorShuffle %96 %96 0 1 
                                        f32_2 %98 = OpFAdd %95 %97 
                                        f32_3 %99 = OpLoad %9 
                                       f32_3 %100 = OpVectorShuffle %99 %98 3 4 2 
                                                      OpStore %9 %100 
                  read_only Texture2DSampled %106 = OpLoad %105 
                                       f32_3 %107 = OpLoad %9 
                                       f32_2 %108 = OpVectorShuffle %107 %107 0 1 
                                       f32_4 %109 = OpImageSampleImplicitLod %106 %108 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                                      OpStore %101 %110 
                                       f32_3 %111 = OpLoad %101 
                                Uniform f32* %113 = OpAccessChain %27 %112 
                                         f32 %114 = OpLoad %113 
                                       f32_3 %115 = OpCompositeConstruct %114 %114 %114 
                                       f32_3 %116 = OpFMul %111 %115 
                                                      OpStore %9 %116 
                                       f32_3 %117 = OpLoad %9 
                              Uniform f32_4* %120 = OpAccessChain %27 %118 
                                       f32_4 %121 = OpLoad %120 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_3 %123 = OpFMul %117 %122 
                              Uniform f32_4* %125 = OpAccessChain %27 %124 
                                       f32_4 %126 = OpLoad %125 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                       f32_3 %128 = OpFAdd %123 %127 
                                                      OpStore %9 %128 
                                  Input f32* %132 = OpAccessChain %131 %13 
                                         f32 %133 = OpLoad %132 
                                         f32 %135 = OpFMul %133 %134 
                                                      OpStore %129 %135 
                                Uniform f32* %137 = OpAccessChain %27 %29 %136 
                                         f32 %138 = OpLoad %137 
                                         f32 %140 = OpFMul %138 %139 
                                         f32 %141 = OpLoad %129 
                                         f32 %142 = OpFAdd %140 %141 
                                                      OpStore %129 %142 
                                         f32 %143 = OpLoad %129 
                                         f32 %144 = OpExtInst %1 13 %143 
                                                      OpStore %129 %144 
                                         f32 %145 = OpLoad %129 
                                         f32 %147 = OpFMul %145 %146 
                                Private f32* %148 = OpAccessChain %43 %17 
                                                      OpStore %148 %147 
                                Private f32* %150 = OpAccessChain %43 %13 
                                                      OpStore %150 %149 
                                       f32_2 %151 = OpLoad %43 
                                       f32_4 %152 = OpLoad %131 
                                       f32_2 %153 = OpVectorShuffle %152 %152 0 1 
                                       f32_2 %154 = OpFAdd %151 %153 
                                                      OpStore %43 %154 
                  read_only Texture2DSampled %158 = OpLoad %157 
                                       f32_2 %159 = OpLoad %43 
                                       f32_4 %160 = OpImageSampleImplicitLod %158 %159 
                                                      OpStore %156 %160 
                                       f32_3 %162 = OpLoad %9 
                                       f32_3 %165 = OpFMul %162 %164 
                                       f32_4 %166 = OpLoad %156 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                       f32_3 %168 = OpFAdd %165 %167 
                                                      OpStore %161 %168 
                                       f32_3 %170 = OpLoad %9 
                                       f32_3 %172 = OpFMul %170 %171 
                                       f32_3 %175 = OpFAdd %172 %174 
                                                      OpStore %169 %175 
                                Private f32* %177 = OpAccessChain %156 %176 
                                         f32 %178 = OpLoad %177 
                                Uniform f32* %180 = OpAccessChain %27 %179 
                                         f32 %181 = OpLoad %180 
                                         f32 %182 = OpFMul %178 %181 
                                Private f32* %183 = OpAccessChain %9 %17 
                                                      OpStore %183 %182 
                                Private f32* %184 = OpAccessChain %9 %17 
                                         f32 %185 = OpLoad %184 
                                Uniform f32* %187 = OpAccessChain %27 %186 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpFMul %185 %188 
                                Private f32* %190 = OpAccessChain %9 %17 
                                                      OpStore %190 %189 
                                       f32_3 %192 = OpLoad %161 
                                       f32_3 %193 = OpLoad %169 
                                       f32_3 %194 = OpFNegate %193 
                                       f32_3 %195 = OpFAdd %192 %194 
                                                      OpStore %191 %195 
                                       f32_3 %196 = OpLoad %9 
                                       f32_3 %197 = OpVectorShuffle %196 %196 0 0 0 
                                       f32_3 %198 = OpLoad %191 
                                       f32_3 %199 = OpFMul %197 %198 
                                       f32_3 %200 = OpLoad %169 
                                       f32_3 %201 = OpFAdd %199 %200 
                                                      OpStore %9 %201 
                                       f32_3 %202 = OpLoad %9 
                                       f32_3 %203 = OpExtInst %1 30 %202 
                                                      OpStore %9 %203 
                                Uniform f32* %205 = OpAccessChain %27 %204 
                                         f32 %206 = OpLoad %205 
                                                      OpStore %129 %206 
                                         f32 %207 = OpLoad %129 
                                         f32 %209 = OpExtInst %1 43 %207 %149 %208 
                                                      OpStore %129 %209 
                                       f32_3 %210 = OpLoad %9 
                                         f32 %211 = OpLoad %129 
                                       f32_3 %212 = OpCompositeConstruct %211 %211 %211 
                                       f32_3 %213 = OpFMul %210 %212 
                                                      OpStore %9 %213 
                                       f32_3 %214 = OpLoad %9 
                                       f32_3 %215 = OpExtInst %1 29 %214 
                                                      OpStore %9 %215 
                                       f32_3 %216 = OpLoad %9 
                                Uniform f32* %218 = OpAccessChain %27 %217 
                                         f32 %219 = OpLoad %218 
                                Uniform f32* %220 = OpAccessChain %27 %217 
                                         f32 %221 = OpLoad %220 
                                Uniform f32* %222 = OpAccessChain %27 %217 
                                         f32 %223 = OpLoad %222 
                                       f32_3 %224 = OpCompositeConstruct %219 %221 %223 
                                         f32 %225 = OpCompositeExtract %224 0 
                                         f32 %226 = OpCompositeExtract %224 1 
                                         f32 %227 = OpCompositeExtract %224 2 
                                       f32_3 %228 = OpCompositeConstruct %225 %226 %227 
                                       f32_3 %229 = OpExtInst %1 37 %216 %228 
                                                      OpStore %9 %229 
                              Uniform u32_4* %237 = OpAccessChain %27 %233 
                                       u32_4 %238 = OpLoad %237 
                                         u32 %239 = OpCompositeExtract %238 0 
                                        bool %240 = OpINotEqual %239 %17 
                                                      OpSelectionMerge %242 None 
                                                      OpBranchConditional %240 %241 %244 
                                             %241 = OpLabel 
                                       f32_3 %243 = OpLoad %9 
                                                      OpStore %232 %243 
                                                      OpBranch %242 
                                             %244 = OpLabel 
                                                      OpStore %232 %245 
                                                      OpBranch %242 
                                             %242 = OpLabel 
                                       f32_3 %246 = OpLoad %232 
                                       f32_4 %247 = OpLoad %230 
                                       f32_4 %248 = OpVectorShuffle %247 %246 4 5 6 3 
                                                      OpStore %230 %248 
                              Uniform u32_4* %251 = OpAccessChain %27 %233 
                                       u32_4 %252 = OpLoad %251 
                                         u32 %253 = OpCompositeExtract %252 0 
                                        bool %254 = OpINotEqual %253 %17 
                                                      OpSelectionMerge %256 None 
                                                      OpBranchConditional %254 %255 %257 
                                             %255 = OpLabel 
                                                      OpStore %250 %208 
                                                      OpBranch %256 
                                             %257 = OpLabel 
                                                      OpStore %250 %149 
                                                      OpBranch %256 
                                             %256 = OpLabel 
                                         f32 %258 = OpLoad %250 
                                Private f32* %259 = OpAccessChain %230 %176 
                                                      OpStore %259 %258 
                              Uniform u32_4* %264 = OpAccessChain %27 %233 
                                       u32_4 %265 = OpLoad %264 
                                         u32 %266 = OpCompositeExtract %265 1 
                                        bool %267 = OpINotEqual %266 %17 
                                                      OpSelectionMerge %269 None 
                                                      OpBranchConditional %267 %268 %271 
                                             %268 = OpLabel 
                                                      OpStore %263 %270 
                                                      OpBranch %269 
                                             %271 = OpLabel 
                                       f32_4 %272 = OpLoad %230 
                                                      OpStore %263 %272 
                                                      OpBranch %269 
                                             %269 = OpLabel 
                                       f32_4 %273 = OpLoad %263 
                                                      OpStore %261 %273 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "EDITOR_VISUALIZATION" }
"// shader disassembly not supported on DXBC"
}
}
Program "fp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "EDITOR_VISUALIZATION" }
""
}
SubProgram "vulkan " {
Keywords { "EDITOR_VISUALIZATION" }
""
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
SubProgram "d3d11 " {
Keywords { "EDITOR_VISUALIZATION" }
"// shader disassembly not supported on DXBC"
}
}
}
}
Fallback "Transparent/Cutout/Diffuse"
}